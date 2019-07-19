package com.gobase.web.controller.user;

import com.gobase.component.bean.mall.region.Region;
import com.gobase.component.bean.mall.user.UserAddress;
import com.gobase.component.dao.mall.region.RegionMapper;
import com.gobase.component.dao.mall.user.UserAddressMapper;
import com.gobase.component.vo.UserAddressVo;
import com.gobase.service.dto.user.HostUser;
import com.gobase.tools.response.ResultResponse;
import com.gobase.web.interceptor.host.HostHolder;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * @author mm.sun
 * @date 2019/7/18 12:13
 */

@RequestMapping("user/address")
@RestController
public class UserAddressController {

    @Autowired
    private UserAddressMapper userAddressMapper;
    @Autowired
    private RegionMapper regionMapper;
    @Autowired
    private HostHolder hostHolder;

    /**
     * 新增收件地址
     *
     * @param provinceCode
     * @param cityCode
     * @param countyCode
     * @param address
     * @param phone
     * @param consignee
     * @return com.gobase.tools.response.ResultResponse
     * @date 2019/7/18 21:24
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public ResultResponse saveUserAddress(int provinceCode, int cityCode, int countyCode, String address, String phone, String consignee) {
        HostUser user = hostHolder.getUser();
        try {
            UserAddress userAddress = new UserAddress();
            userAddress.setAddress(address);
            userAddress.setCityCode(cityCode);
            userAddress.setConsignee(consignee);
            userAddress.setCountyCode(countyCode);
            userAddress.setProvinceCode(provinceCode);
            userAddress.setPhone(phone);
            userAddress.setUserId(user.getUserId());
            userAddressMapper.insertSelective(userAddress);
            return ResultResponse.success(null, "保存成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("保存失败", ResultResponse.FAIL + "");
        }
    }

    /**
     * 编辑收件地址
     *
     * @param id
     * @param provinceCode
     * @param cityCode
     * @param countyCode
     * @param address
     * @param phone
     * @param consignee
     * @return com.gobase.tools.response.ResultResponse
     * @date 2019/7/18 21:25
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public ResultResponse updateUserAddress(int id, int provinceCode, int cityCode, int countyCode, String address, String phone, String consignee) {
        try {
            UserAddress userAddress = userAddressMapper.selectByPrimaryKey(id);
            userAddress.setAddress(address);
            userAddress.setCityCode(cityCode);
            userAddress.setConsignee(consignee);
            userAddress.setCountyCode(countyCode);
            userAddress.setProvinceCode(provinceCode);
            userAddress.setPhone(phone);
            userAddressMapper.updateByPrimaryKeySelective(userAddress);
            return ResultResponse.success(null, "编辑成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("编辑失败", ResultResponse.FAIL + "");
        }
    }

    /**
     * 删除收件地址
     *
     * @param id
     * @return com.gobase.tools.response.ResultResponse
     * @date 2019/7/18 21:26
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public ResultResponse deleteUserAddress(int id) {
        try {
            userAddressMapper.updateForSoft(id);
            return ResultResponse.success(null, "删除成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("删除失败", ResultResponse.FAIL + "");
        }
    }

    /**
     * 收件地址列表
     *
     * @param
     * @return com.gobase.tools.response.ResultResponse<java.util.List                               <                               com.gobase.component.vo.UserAddressVo>>
     * @date 2019/7/18 22:22
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ResultResponse<List<UserAddressVo>> userAddressList() {
        List<UserAddress> lists = userAddressMapper.selectAll();
        List<UserAddressVo> vos = new ArrayList<>();
        for (UserAddress address : lists) {
            UserAddressVo uvo = new UserAddressVo();
            BeanUtils.copyProperties(address, uvo);
            Region province = regionMapper.selectByGbCode(address.getProvinceCode());
            uvo.setProvince(province.getName());
            Region city = regionMapper.selectByGbCode(address.getCityCode());
            uvo.setProvince(city.getName());
            Region county = regionMapper.selectByGbCode(address.getCountyCode());
            uvo.setProvince(county.getName());
            vos.add(uvo);
        }
        return ResultResponse.success(vos, "");
    }

    /**
     * 设置默认收件地址
     *
     * @param id
     * @return com.gobase.tools.response.ResultResponse
     * @date 2019/7/19 11:58
     */
    @RequestMapping(value = "default", method = RequestMethod.POST)
    public ResultResponse defaultUserAddress(int id) {
        try {
            userAddressMapper.updateForDefault(id);
            return ResultResponse.success(null, "设置成功");
        } catch (Exception e) {
            e.printStackTrace();
            return ResultResponse.fail("设置失败", ResultResponse.FAIL + "");
        }
    }
}
