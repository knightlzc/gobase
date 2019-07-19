package com.gobase.web.controller.user;

import com.alibaba.fastjson.JSONObject;
import com.gobase.component.annotation.IgnoreToken;
import com.gobase.component.bean.mall.user.User;
import com.gobase.component.constant.GoUserConstant;
import com.gobase.component.dao.mall.user.UserMapper;
import com.gobase.tools.common.WechatUtil;
import com.gobase.tools.redis.JedisUtils;
import com.gobase.tools.response.ResultResponse;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.UUID;

/**
 * @author mm.sun
 * @date 2019/7/19 17:48
 */

@RequestMapping("user")
@RestController
public class UserController {

    @Autowired
    private UserMapper userMapper;

    /**
     * 微信授权接口
     *
     * @param code
     * @param rawData
     * @param signature
     * @param encrypteData
     * @param iv
     * @return com.gobase.tools.response.ResultResponse<java.lang.String>
     * @date 2019/7/19 19:52
     */
    @IgnoreToken
    @PostMapping("auth")
    public ResultResponse<String> wxAuth(String code, String rawData, String signature, String encrypteData, String iv) {

        try {
            // 用户非敏感信息：rawData
            // 签名：signature
            JSONObject rawDataJson = JSONObject.parseObject(rawData);
            // 1.接收小程序发送的code
            // 2.开发者服务器 登录凭证校验接口 appi + appsecret + code
            JSONObject SessionKeyOpenId = WechatUtil.getSessionKeyOrOpenId(code);
            // 3.接收微信接口服务 获取返回的参数
            String openId = SessionKeyOpenId.getString("openid");
            String sessionKey = SessionKeyOpenId.getString("session_key");

            // 4.校验签名 小程序发送的签名signature与服务器端生成的签名signature2 = sha1(rawData + sessionKey)
            String signature2 = DigestUtils.sha1Hex(rawData + sessionKey);
            if (!signature.equals(signature2)) {
                return ResultResponse.fail("签名校验失败", ResultResponse.FAIL + "");
            }
            // 5.根据返回的User实体类，判断用户是否是新用户，是的话，将用户信息存到数据库；不是的话，更新最新登录时间
            User user = userMapper.selectByOpenId(openId);
            // uuid生成唯一key，用于维护微信小程序用户与服务端的会话
            String skey = UUID.randomUUID().toString();
            if (user == null) {
                // 用户信息入库
                String nickName = rawDataJson.getString("nickName");
                String avatarUrl = rawDataJson.getString("avatarUrl");
                String gender = rawDataJson.getString("gender");
                String city = rawDataJson.getString("city");
                String country = rawDataJson.getString("country");
                String province = rawDataJson.getString("province");

                user = new User();
                user.setOpenId(openId);
                user.setSkey(skey);
                user.setSessionKey(sessionKey);
                user.setCity(city);
                user.setProvince(province);
                user.setCountry(country);
                user.setAvatarUrl(avatarUrl);
                user.setGender(Integer.parseInt(gender));
                user.setNickName(nickName);

                userMapper.insertSelective(user);
            } else {
                // 已存在，更新用户登录时间
                user.setLastVisitTime(new Date());
                // 重新设置会话skey
                user.setSkey(skey);
                userMapper.updateByPrimaryKeySelective(user);
            }
            //encrypteData比rowData多了appid和openid
            //JSONObject userInfo = WechatUtil.getUserInfo(encrypteData, sessionKey, iv);
            //6. 把新的skey返回给小程序
            JedisUtils.add(GoUserConstant.TICKET_HEADER_KEY_PREFIX + skey, openId);
            return ResultResponse.success(skey, "签名成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("签名失败", ResultResponse.FAIL + "");
        }
    }
}
