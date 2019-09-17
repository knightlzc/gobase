/*
Navicat MySQL Data Transfer

Source Server         : 10.4.82.150
Source Server Version : 50630
Source Host           : 10.4.82.150:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2019-09-17 20:05:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `activity_manjian`
-- ----------------------------
DROP TABLE IF EXISTS `activity_manjian`;
CREATE TABLE `activity_manjian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `max_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '已满金额',
  `minus_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '装填 0 有效 -1 无效',
  `region_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '作用类型 0 全商城 1 城市 2 店铺',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '作用范围id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of activity_manjian
-- ----------------------------

-- ----------------------------
-- Table structure for `activity_miaosha`
-- ----------------------------
DROP TABLE IF EXISTS `activity_miaosha`;
CREATE TABLE `activity_miaosha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '商品id',
  `apply_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '申请秒杀时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:审核中;1:审核通过等待进行;2:活动进行中；21:活动结束;22:审核拒绝；',
  `audit_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '审核通过时间',
  `operator_id` int(11) NOT NULL DEFAULT '0' COMMENT '审核人员id',
  `start_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '活动开始时间',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品所属店铺id',
  `price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '秒杀价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of activity_miaosha
-- ----------------------------

-- ----------------------------
-- Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_url` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '轮播图url',
  `link_url` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '轮播图跳转地址',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 有效 -1 无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '商品id',
  `tiny_name` varchar(30) NOT NULL DEFAULT '' COMMENT '商品短名称',
  `full_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品长名称',
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '商品创建时间',
  `creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '商品添加者',
  `offline_time` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT '下线时间',
  `online_time` datetime NOT NULL DEFAULT '1970-01-01 00:00:00' COMMENT '商品上线时间',
  `big_img` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '商品大图',
  `small_img` varchar(300) NOT NULL DEFAULT '' COMMENT '商品小图片',
  `category1` varchar(300) NOT NULL DEFAULT '' COMMENT '一级分类',
  `category2` varchar(300) NOT NULL DEFAULT '' COMMENT '二级分类',
  `category3` varchar(50) NOT NULL DEFAULT '' COMMENT '三级分类',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '商品状态 0有效 -1 无效',
  `remark` varchar(300) NOT NULL DEFAULT '' COMMENT '备注',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `audit_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `real_price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '商品销售价格',
  `ori_price` decimal(10,0) NOT NULL DEFAULT '0' COMMENT '原价',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_num` int(11) NOT NULL DEFAULT '0' COMMENT '库存总量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goodsId` (`goods_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1198', '111111', ' mac pro', '苹果 mac pro', '', '2019-07-03 12:48:45', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'shkj', '', '', '0', '', '2', '0', '100', '0', '2019-07-19 20:40:36', '0');
INSERT INTO `goods` VALUES ('1199', '22222', 'iphoneX', '苹果 iphone X', '', '2019-07-03 12:58:48', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'shkj', '', '', '0', '', '2', '0', '200', '0', '2019-07-19 20:40:38', '0');
INSERT INTO `goods` VALUES ('1200', '3', '苹果', '红富士', '', '2019-07-19 17:23:26', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:14', '0');
INSERT INTO `goods` VALUES ('1201', '4', '水果4', '大水果4', '', '2019-07-19 17:23:32', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:15', '0');
INSERT INTO `goods` VALUES ('1202', '5', '水果5', '大水果5', '', '2019-07-19 17:23:35', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:15', '0');
INSERT INTO `goods` VALUES ('1203', '6', '水果6', '大水果6', '', '2019-07-19 17:23:38', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:16', '0');
INSERT INTO `goods` VALUES ('1204', '7', '水果7', '大水果7', '', '2019-07-19 17:23:40', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:16', '0');
INSERT INTO `goods` VALUES ('1205', '8', '水果8', '大水果8', '', '2019-07-19 17:23:43', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:17', '0');
INSERT INTO `goods` VALUES ('1206', '9', '水果9', '大水果9', '', '2019-07-19 17:23:46', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:17', '0');
INSERT INTO `goods` VALUES ('1207', '10', '水果10', '大水果10', '', '2019-07-19 17:23:49', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:18', '0');
INSERT INTO `goods` VALUES ('1208', '11', '水果11', '大水果11', '', '2019-07-19 17:23:55', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:18', '0');
INSERT INTO `goods` VALUES ('1209', '12', '水果12', '大水果12', '', '2019-07-19 17:23:58', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:18', '0');
INSERT INTO `goods` VALUES ('1210', '13', '水果13', '大水果13', '', '2019-07-19 17:24:00', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', 'gpsc', 'shuiguo', '', '0', '', '2', '0', '0', '0', '2019-07-19 20:38:20', '0');
INSERT INTO `goods` VALUES ('1211', 'GBSG0170003190914185644', '', '', '', '2019-09-14 18:56:39', '', '2099-01-01 00:00:00', '1970-01-01 00:00:00', '', '', '', '', '', '0', '', '0', '0', '0', '0', '2019-09-14 18:56:39', '0');

-- ----------------------------
-- Table structure for `goods_category`
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '类别编码',
  `pcode` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '父类编码',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '类名',
  `group_code` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组编码',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='审核节点表';

-- ----------------------------
-- Records of goods_category
-- ----------------------------
INSERT INTO `goods_category` VALUES ('1', 'shkj', '', '生活空间', 'kj', '0');
INSERT INTO `goods_category` VALUES ('2', 'cykj', '', '创意空间', 'kj', '0');
INSERT INTO `goods_category` VALUES ('3', 'jpsg', '', '精品水果', 'sg', '0');
INSERT INTO `goods_category` VALUES ('4', 'jianguo', 'jpsg', '坚果', '', '0');
INSERT INTO `goods_category` VALUES ('5', 'sg', 'jpsg', '新鲜水果', '', '0');
INSERT INTO `goods_category` VALUES ('6', 'shucai', 'jpsg', '蔬菜', '', '0');
INSERT INTO `goods_category` VALUES ('7', 'shushi', 'jpsg', '熟食', '', '0');
INSERT INTO `goods_category` VALUES ('8', 'pg', 'sg', '苹果', '', '0');
INSERT INTO `goods_category` VALUES ('9', 'xj', 'sg', '香蕉', '', '0');
INSERT INTO `goods_category` VALUES ('10', 'ht', 'jianguo', '核桃', '', '0');
INSERT INTO `goods_category` VALUES ('11', 'hs', 'jianguo', '花生', '', '0');

-- ----------------------------
-- Table structure for `goods_manjian_ref`
-- ----------------------------
DROP TABLE IF EXISTS `goods_manjian_ref`;
CREATE TABLE `goods_manjian_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '商品id',
  `mianjian_id` int(11) NOT NULL DEFAULT '0' COMMENT '满减活动id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id` (`goods_id`,`mianjian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of goods_manjian_ref
-- ----------------------------

-- ----------------------------
-- Table structure for `goods_param`
-- ----------------------------
DROP TABLE IF EXISTS `goods_param`;
CREATE TABLE `goods_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(64) NOT NULL COMMENT '商品id',
  `param_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '商品属性名id',
  `param_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '商品属性值id组合',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `goods_id` (`goods_id`,`param_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_param
-- ----------------------------

-- ----------------------------
-- Table structure for `img`
-- ----------------------------
DROP TABLE IF EXISTS `img`;
CREATE TABLE `img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '业务id',
  `biz_type` int(11) NOT NULL DEFAULT '0' COMMENT '业务类型 1 商品',
  `img_url` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 有效 -1 删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `biz_id` (`biz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of img
-- ----------------------------
INSERT INTO `img` VALUES ('1', 'GBSG0170003190914185644', '1', 'https://wx.apricot32.cn/img/2019/09/14/img0170000190914185613.jpg', '0', '2019-09-14 18:56:39', '2019-09-14 18:56:39');
INSERT INTO `img` VALUES ('2', 'GBSG0170003190914185644', '1', 'https://wx.apricot32.cn/img/2019/09/14/img0170001190914185615.jpg', '0', '2019-09-14 18:56:39', '2019-09-14 18:56:39');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `menu_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '菜单名称',
  `menu_code` varchar(250) COLLATE utf8_bin DEFAULT '',
  `p_menu_code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '父菜单编码',
  `sys_code` varchar(50) COLLATE utf8_bin DEFAULT '',
  `menu_url` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '菜单url，菜单跳转的url',
  `menu_logo` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '菜单logo',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '菜单层级',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `load_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '加载类型 0请选择 1 load, 2 iframe ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_menu` (`menu_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2230 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('2219', '主页', 'm_home', '', 'pf', '/', '', '0', '0', '2019-07-26 12:21:43', '2019-07-26 12:21:43', '0');
INSERT INTO `menu` VALUES ('2220', '权限管理', 'm_auth_mgr', '', 'pf', '', '', '0', '4', '2019-07-26 12:22:38', '2019-09-14 13:37:51', '0');
INSERT INTO `menu` VALUES ('2221', '商户管理', 'm_shop_mgr', '', 'pf', '', '', '0', '1', '2019-07-26 12:25:41', '2019-07-26 16:01:14', '0');
INSERT INTO `menu` VALUES ('2222', '商户列表', 'm_shop_list', 'm_shop_mgr', 'pf', '', '', '0', '0', '2019-07-26 12:26:26', '2019-07-26 12:26:39', '0');
INSERT INTO `menu` VALUES ('2223', '订单管理', 'm_order_mgr', '', 'pf', '', '', '0', '3', '2019-07-26 12:27:33', '2019-09-14 13:37:47', '0');
INSERT INTO `menu` VALUES ('2224', '订单列表', 'm_order_list', 'm_order_mgr', 'pf', '/order/listPage', '', '0', '0', '2019-07-26 12:27:50', '2019-09-17 14:32:23', '0');
INSERT INTO `menu` VALUES ('2225', '账号列表', 'm_pfuser_list', 'm_auth_mgr', 'pf', '/pfuser/listPage', '', '0', '0', '2019-07-26 12:42:37', '2019-07-26 19:38:34', '0');
INSERT INTO `menu` VALUES ('2226', '商品管理', 'm_goods_mgr', '', 'pf', '', '', '0', '2', '2019-09-14 13:37:45', '2019-09-14 13:37:45', '0');
INSERT INTO `menu` VALUES ('2227', '全部商品', 'm_goods_list', 'm_goods_mgr', 'pf', '/goods/listPage', '', '0', '1', '2019-09-14 13:38:18', '2019-09-14 18:49:13', '0');
INSERT INTO `menu` VALUES ('2228', '发布商品', 'm_goods_add', 'm_goods_mgr', 'pf', '/goods/editPage', '', '0', '2', '2019-09-14 13:38:49', '2019-09-14 15:08:25', '0');
INSERT INTO `menu` VALUES ('2229', '角色管理', 'm_role_list', 'm_auth_mgr', 'pf', '/role/listPage', '', '0', '2', '2019-09-17 17:03:02', '2019-09-17 17:03:24', '0');

-- ----------------------------
-- Table structure for `order_goods_ref`
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_ref`;
CREATE TABLE `order_goods_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '订单号',
  `sku_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '商品id',
  `sku_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `total_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '总价格',
  `per_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `manjian_id` int(11) NOT NULL DEFAULT '0' COMMENT '满减活动id',
  `porder_id` varchar(64) COLLATE utf8mb4_bin DEFAULT '' COMMENT '父订单id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sku` (`order_id`,`sku_id`) USING BTREE,
  UNIQUE KEY `porder_sku` (`sku_id`,`porder_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of order_goods_ref
-- ----------------------------
INSERT INTO `order_goods_ref` VALUES ('6', 'GO01700011907190039', '111111', '1', '100.00', '100.00', '0', 'GO01700011907190039');
INSERT INTO `order_goods_ref` VALUES ('7', 'GO01700021907190046', '111111', '1', '100.00', '100.00', '0', 'GO01700021907190046');
INSERT INTO `order_goods_ref` VALUES ('8', 'GO01700001907190049', '111111', '3', '300.00', '100.00', '0', 'GO01700001907190049');

-- ----------------------------
-- Table structure for `order_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `region_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `goods_id` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '商品id',
  `remark` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '用户备注信息',
  `address_id` int(11) NOT NULL DEFAULT '0' COMMENT '收货地址id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `kuaidi_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递名称',
  `kuaidi_order` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '快递单号',
  `kuaidi_price` double NOT NULL DEFAULT '0' COMMENT '快递费',
  `manjian_price` double NOT NULL DEFAULT '0' COMMENT '满减金额',
  `user_coupons_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户使用的优惠券的Id',
  `coupons_price` double NOT NULL DEFAULT '0' COMMENT '使用优惠券的价格',
  `coupons_type` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券类型',
  `reduce_intr_rate` double NOT NULL DEFAULT '0' COMMENT '降息比例',
  `deliver_time` datetime DEFAULT '1970-01-01 00:00:00' COMMENT '发货时间',
  `total_price` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '总价格',
  `porder_id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '父订单id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `index_order_user_status` (`order_id`,`user_id`,`status`),
  KEY `index_user_status` (`user_id`,`status`),
  KEY `index_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8015394 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单表,各种类型的订单';

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('8015391', 'GO01700011907190039', '1', '0', '201', '', '', '1', '2019-07-19 00:39:32', '', '', '0', '0', '0', '0', '0', '0', null, '500.00', '');
INSERT INTO `order_info` VALUES ('8015392', 'GO01700021907190046', '1', '0', '0', '', '', '1', '2019-07-19 00:47:31', '', '', '0', '0', '0', '0', '0', '0', null, '0.00', '');
INSERT INTO `order_info` VALUES ('8015393', 'GO01700001907190049', '1', '0', '0', '', '', '1', '2019-07-19 00:49:45', '', '', '0', '0', '0', '0', '0', '0', null, '300.00', '');

-- ----------------------------
-- Table structure for `order_payment`
-- ----------------------------
DROP TABLE IF EXISTS `order_payment`;
CREATE TABLE `order_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_id` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '支付编号',
  `wx_pay_id` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '微信支付编号',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0 待支付 1 支付中 10 支付完成 20 取消支付 21 支付失败 ',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of order_payment
-- ----------------------------
INSERT INTO `order_payment` VALUES ('1', 'GO01700011907190039', '', '', '0.00', '2019-07-19 00:39:32', '0', '2019-07-19 00:39:32');
INSERT INTO `order_payment` VALUES ('2', 'GO01700021907190046', '', '', '0.00', '2019-07-19 00:47:31', '0', '2019-07-19 00:47:31');
INSERT INTO `order_payment` VALUES ('3', 'GO01700001907190049', '', '', '300.00', '2019-07-19 00:49:45', '0', '2019-07-19 00:49:45');

-- ----------------------------
-- Table structure for `pf_user`
-- ----------------------------
DROP TABLE IF EXISTS `pf_user`;
CREATE TABLE `pf_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id，主键，唯一标识一个用户',
  `name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '存储用户英文名',
  `password` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '运营人员密码',
  `nick_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '存储用户中文名',
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pwd_update_time` datetime NOT NULL DEFAULT '2014-01-01 00:00:00',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态',
  `uid` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_name` (`name`),
  KEY `index_user` (`name`,`password`),
  KEY `idx_uid_name_new` (`uid`(20),`name`(20))
) ENGINE=InnoDB AUTO_INCREMENT=1000104138 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of pf_user
-- ----------------------------
INSERT INTO `pf_user` VALUES ('1000104135', 'admin', '123', '超管', '2019-07-26 12:43:37', '2014-01-01 00:00:00', '0', '1');
INSERT INTO `pf_user` VALUES ('1000104136', '5', 'de88e3e4ab202d87754078cbb2df6063', '5', '2019-09-11 17:40:28', '2019-09-11 17:40:31', '0', '5ecf5a2f-da39-445d-880f-a244be322812');
INSERT INTO `pf_user` VALUES ('1000104137', 'sunmm', 'de88e3e4ab202d87754078cbb2df6063', '孙明明', '2019-09-14 13:26:50', '2019-09-14 13:26:56', '0', '0c5cb326-27a3-452d-83bb-7dadcd123f05');

-- ----------------------------
-- Table structure for `pf_user_role_ref`
-- ----------------------------
DROP TABLE IF EXISTS `pf_user_role_ref`;
CREATE TABLE `pf_user_role_ref` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'uid',
  `role_code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '角色编码',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `index_1` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13373 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='ç”¨æˆ·è§’è‰²å…³è”è¡¨';

-- ----------------------------
-- Records of pf_user_role_ref
-- ----------------------------
INSERT INTO `pf_user_role_ref` VALUES ('13372', '1', 'admin', '0', '2019-07-26 12:59:43', '2019-07-26 12:59:43');

-- ----------------------------
-- Table structure for `pf_user_shop_ref`
-- ----------------------------
DROP TABLE IF EXISTS `pf_user_shop_ref`;
CREATE TABLE `pf_user_shop_ref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户id',
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of pf_user_shop_ref
-- ----------------------------
INSERT INTO `pf_user_shop_ref` VALUES ('1', '5ecf5a2f-da39-445d-880f-a244be322812', '5', '2019-09-11 17:40:28');
INSERT INTO `pf_user_shop_ref` VALUES ('2', '0c5cb326-27a3-452d-83bb-7dadcd123f05', '2', '2019-09-14 13:26:50');

-- ----------------------------
-- Table structure for `recommend`
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐类型 1 商品 2 店铺',
  `biz_id` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '推荐id 商品：商品id 店铺：店铺id',
  `group_code` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '分组查询',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 有效 -1 无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of recommend
-- ----------------------------

-- ----------------------------
-- Table structure for `region`
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '名称,比如山东',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级id,比如济南的父级是山东',
  `level` tinyint(4) DEFAULT NULL COMMENT '地址级别,0表示国家,1省,2市,3区县',
  `status` tinyint(4) DEFAULT NULL COMMENT '10表示有效,20表示无效',
  `sort` int(11) DEFAULT NULL COMMENT '排序依据,值小的排列在前',
  `gb_code` int(11) DEFAULT '0',
  `full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '全称,比如克孜勒苏柯尔克孜自治州',
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_id` (`parent_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3452 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('1', '中国', '0', '0', '10', '0', '0', '中国');
INSERT INTO `region` VALUES ('2', '北京', '1', '1', '10', '1', '110000', '北京');
INSERT INTO `region` VALUES ('3', '安徽', '1', '1', '10', '29', '340000', '安徽');
INSERT INTO `region` VALUES ('4', '福建', '1', '1', '10', '11', '350000', '福建');
INSERT INTO `region` VALUES ('5', '甘肃', '1', '1', '10', '10', '620000', '甘肃');
INSERT INTO `region` VALUES ('6', '广东', '1', '1', '10', '31', '440000', '广东');
INSERT INTO `region` VALUES ('7', '广西', '1', '1', '10', '32', '450000', '广西');
INSERT INTO `region` VALUES ('8', '贵州', '1', '1', '10', '13', '520000', '贵州');
INSERT INTO `region` VALUES ('9', '海南', '1', '1', '10', '6', '460100', '海南');
INSERT INTO `region` VALUES ('10', '河北', '1', '1', '10', '20', '130000', '河北');
INSERT INTO `region` VALUES ('11', '河南', '1', '1', '10', '18', '410000', '河南');
INSERT INTO `region` VALUES ('12', '黑龙江', '1', '1', '10', '4', '230000', '黑龙江');
INSERT INTO `region` VALUES ('13', '湖北', '1', '1', '10', '7', '420000', '湖北');
INSERT INTO `region` VALUES ('14', '湖南', '1', '1', '10', '8', '430000', '湖南');
INSERT INTO `region` VALUES ('15', '吉林', '1', '1', '10', '25', '220000', '吉林');
INSERT INTO `region` VALUES ('16', '江西', '1', '1', '10', '21', '360000', '江西');
INSERT INTO `region` VALUES ('17', '江苏', '1', '1', '10', '34', '320000', '江苏');
INSERT INTO `region` VALUES ('18', '内蒙古', '1', '1', '10', '23', '150000', '内蒙古');
INSERT INTO `region` VALUES ('19', '辽宁', '1', '1', '10', '14', '210000', '辽宁');
INSERT INTO `region` VALUES ('20', '青海', '1', '1', '10', '17', '630000', '青海');
INSERT INTO `region` VALUES ('21', '宁夏', '1', '1', '10', '28', '640000', '宁夏');
INSERT INTO `region` VALUES ('22', '山西', '1', '1', '10', '30', '140000', '山西');
INSERT INTO `region` VALUES ('23', '山东', '1', '1', '10', '3', '370000', '山东');
INSERT INTO `region` VALUES ('24', '上海', '1', '1', '10', '2', '310000', '上海');
INSERT INTO `region` VALUES ('25', '陕西', '1', '1', '10', '16', '610000', '陕西');
INSERT INTO `region` VALUES ('26', '天津', '1', '1', '10', '27', '120000', '天津');
INSERT INTO `region` VALUES ('27', '四川', '1', '1', '10', '26', '510000', '四川');
INSERT INTO `region` VALUES ('28', '新疆', '1', '1', '10', '33', '650000', '新疆');
INSERT INTO `region` VALUES ('29', '西藏', '1', '1', '10', '12', '540000', '西藏');
INSERT INTO `region` VALUES ('30', '浙江', '1', '1', '10', '5', '330000', '浙江');
INSERT INTO `region` VALUES ('31', '云南', '1', '1', '10', '22', '530000', '云南');
INSERT INTO `region` VALUES ('32', '澳门', '1', '1', '10', '9', '0', '澳门');
INSERT INTO `region` VALUES ('33', '台湾', '1', '1', '10', '24', '0', '台湾');
INSERT INTO `region` VALUES ('34', '重庆', '1', '1', '10', '15', '500000', '重庆');
INSERT INTO `region` VALUES ('35', '香港', '1', '1', '10', '19', '0', '香港');
INSERT INTO `region` VALUES ('36', '北京', '2', '2', '10', '0', '110000', '北京市');
INSERT INTO `region` VALUES ('37', '合肥', '3', '2', '10', '0', '340100', '合肥市');
INSERT INTO `region` VALUES ('38', '巢湖市', '37', '2', '10', '0', '340181', '巢湖市');
INSERT INTO `region` VALUES ('39', '池州', '3', '2', '10', '0', '341700', '池州市');
INSERT INTO `region` VALUES ('40', '安庆', '3', '2', '10', '0', '340800', '安庆市');
INSERT INTO `region` VALUES ('41', '蚌埠', '3', '2', '10', '0', '340300', '蚌埠市');
INSERT INTO `region` VALUES ('42', '淮北', '3', '2', '10', '0', '340600', '淮北市');
INSERT INTO `region` VALUES ('43', '淮南', '3', '2', '10', '0', '340400', '淮南市');
INSERT INTO `region` VALUES ('44', '滁州', '3', '2', '10', '0', '341100', '滁州市');
INSERT INTO `region` VALUES ('45', '阜阳', '3', '2', '10', '0', '341200', '阜阳市');
INSERT INTO `region` VALUES ('46', '马鞍山', '3', '2', '10', '0', '340500', '马鞍山市');
INSERT INTO `region` VALUES ('47', '宿州', '3', '2', '10', '0', '341300', '宿州市');
INSERT INTO `region` VALUES ('48', '黄山', '3', '2', '10', '0', '341000', '黄山市');
INSERT INTO `region` VALUES ('49', '六安', '3', '2', '10', '0', '341500', '六安市');
INSERT INTO `region` VALUES ('50', '亳州', '3', '2', '10', '0', '341600', '亳州市');
INSERT INTO `region` VALUES ('51', '宣城', '3', '2', '10', '0', '341800', '宣城市');
INSERT INTO `region` VALUES ('52', '芜湖', '3', '2', '10', '0', '340200', '芜湖市');
INSERT INTO `region` VALUES ('53', '铜陵', '3', '2', '10', '0', '340700', '铜陵市');
INSERT INTO `region` VALUES ('54', '南平', '4', '2', '10', '0', '350700', '南平市');
INSERT INTO `region` VALUES ('55', '龙岩', '4', '2', '10', '0', '350800', '龙岩市');
INSERT INTO `region` VALUES ('56', '福州', '4', '2', '10', '0', '350100', '福州市');
INSERT INTO `region` VALUES ('57', '三明', '4', '2', '10', '0', '350400', '三明市');
INSERT INTO `region` VALUES ('58', '泉州', '4', '2', '10', '0', '350500', '泉州市');
INSERT INTO `region` VALUES ('59', '莆田', '4', '2', '10', '0', '350300', '莆田市');
INSERT INTO `region` VALUES ('60', '宁德', '4', '2', '10', '0', '350900', '宁德市');
INSERT INTO `region` VALUES ('61', '漳州', '4', '2', '10', '0', '350600', '漳州市');
INSERT INTO `region` VALUES ('62', '厦门', '4', '2', '10', '0', '350200', '厦门市');
INSERT INTO `region` VALUES ('63', '酒泉', '5', '2', '10', '0', '620900', '酒泉市');
INSERT INTO `region` VALUES ('64', '临夏', '5', '2', '10', '0', '622900', '临夏州');
INSERT INTO `region` VALUES ('65', '陇南', '5', '2', '10', '0', '621200', '陇南市');
INSERT INTO `region` VALUES ('66', '平凉', '5', '2', '10', '0', '620800', '平凉市');
INSERT INTO `region` VALUES ('67', '定西', '5', '2', '10', '0', '621100', '定西市');
INSERT INTO `region` VALUES ('68', '甘南', '5', '2', '10', '0', '623000', '甘南州');
INSERT INTO `region` VALUES ('69', '嘉峪关', '5', '2', '10', '0', '620200', '嘉峪关市');
INSERT INTO `region` VALUES ('70', '金昌', '5', '2', '10', '0', '620300', '金昌市');
INSERT INTO `region` VALUES ('71', '庆阳', '5', '2', '10', '0', '621000', '庆阳市');
INSERT INTO `region` VALUES ('72', '天水', '5', '2', '10', '0', '620500', '天水市');
INSERT INTO `region` VALUES ('73', '武威', '5', '2', '10', '0', '620600', '武威市');
INSERT INTO `region` VALUES ('74', '张掖', '5', '2', '10', '0', '620700', '张掖市');
INSERT INTO `region` VALUES ('75', '白银', '5', '2', '10', '0', '620400', '白银市');
INSERT INTO `region` VALUES ('76', '兰州', '5', '2', '10', '0', '620100', '兰州市');
INSERT INTO `region` VALUES ('77', '广州', '6', '2', '10', '0', '440100', '广州市');
INSERT INTO `region` VALUES ('78', '深圳', '6', '2', '10', '0', '440300', '深圳市');
INSERT INTO `region` VALUES ('79', '潮州', '6', '2', '10', '0', '445100', '潮州市');
INSERT INTO `region` VALUES ('80', '东莞', '6', '2', '10', '0', '441900', '东莞市');
INSERT INTO `region` VALUES ('81', '茂名', '6', '2', '10', '0', '440900', '茂名市');
INSERT INTO `region` VALUES ('82', '揭阳', '6', '2', '10', '0', '445200', '揭阳市');
INSERT INTO `region` VALUES ('83', '清远', '6', '2', '10', '0', '441800', '清远市');
INSERT INTO `region` VALUES ('84', '梅州', '6', '2', '10', '0', '441400', '梅州市');
INSERT INTO `region` VALUES ('85', '河源', '6', '2', '10', '0', '441600', '河源市');
INSERT INTO `region` VALUES ('86', '佛山', '6', '2', '10', '0', '440600', '佛山市');
INSERT INTO `region` VALUES ('87', '江门', '6', '2', '10', '0', '440700', '江门市');
INSERT INTO `region` VALUES ('88', '惠州', '6', '2', '10', '0', '441300', '惠州市');
INSERT INTO `region` VALUES ('89', '湛江', '6', '2', '10', '0', '440800', '湛江市');
INSERT INTO `region` VALUES ('90', '云浮', '6', '2', '10', '0', '445300', '云浮市');
INSERT INTO `region` VALUES ('91', '中山', '6', '2', '10', '0', '442000', '中山市');
INSERT INTO `region` VALUES ('92', '肇庆', '6', '2', '10', '0', '441200', '肇庆市');
INSERT INTO `region` VALUES ('93', '汕尾', '6', '2', '10', '0', '441500', '汕尾市');
INSERT INTO `region` VALUES ('94', '汕头', '6', '2', '10', '0', '440500', '汕头市');
INSERT INTO `region` VALUES ('95', '阳江', '6', '2', '10', '0', '441700', '阳江市');
INSERT INTO `region` VALUES ('96', '韶关', '6', '2', '10', '0', '440200', '韶关市');
INSERT INTO `region` VALUES ('97', '珠海', '6', '2', '10', '0', '440400', '珠海市');
INSERT INTO `region` VALUES ('98', '防城港', '7', '2', '10', '0', '450600', '防城港市');
INSERT INTO `region` VALUES ('99', '贵港', '7', '2', '10', '0', '450800', '贵港市');
INSERT INTO `region` VALUES ('100', '北海', '7', '2', '10', '0', '450500', '北海市');
INSERT INTO `region` VALUES ('101', '崇左', '7', '2', '10', '0', '451400', '崇左市');
INSERT INTO `region` VALUES ('102', '桂林', '7', '2', '10', '0', '450300', '桂林市');
INSERT INTO `region` VALUES ('103', '百色', '7', '2', '10', '0', '451000', '百色市');
INSERT INTO `region` VALUES ('104', '南宁', '7', '2', '10', '0', '450100', '南宁市');
INSERT INTO `region` VALUES ('105', '玉林', '7', '2', '10', '0', '450900', '玉林市');
INSERT INTO `region` VALUES ('106', '钦州', '7', '2', '10', '0', '450700', '钦州市');
INSERT INTO `region` VALUES ('107', '梧州', '7', '2', '10', '0', '450400', '梧州市');
INSERT INTO `region` VALUES ('108', '来宾', '7', '2', '10', '0', '451300', '来宾市');
INSERT INTO `region` VALUES ('109', '柳州', '7', '2', '10', '0', '450200', '柳州市');
INSERT INTO `region` VALUES ('110', '河池', '7', '2', '10', '0', '451200', '河池市');
INSERT INTO `region` VALUES ('111', '贺州', '7', '2', '10', '0', '451100', '贺州市');
INSERT INTO `region` VALUES ('112', '贵阳', '8', '2', '10', '0', '520100', '贵阳市');
INSERT INTO `region` VALUES ('113', '遵义', '8', '2', '10', '0', '520300', '遵义市');
INSERT INTO `region` VALUES ('114', '铜仁', '8', '2', '10', '0', '520600', '铜仁地区');
INSERT INTO `region` VALUES ('115', '黔西南', '8', '2', '10', '0', '522300', '黔西南州');
INSERT INTO `region` VALUES ('116', '黔南', '8', '2', '10', '0', '522700', '黔南州');
INSERT INTO `region` VALUES ('117', '黔东南', '8', '2', '10', '0', '522600', '黔东南州');
INSERT INTO `region` VALUES ('118', '六盘水', '8', '2', '10', '0', '520200', '六盘水市');
INSERT INTO `region` VALUES ('119', '毕节', '8', '2', '10', '0', '520500', '毕节地区');
INSERT INTO `region` VALUES ('120', '安顺', '8', '2', '10', '0', '520400', '安顺市');
INSERT INTO `region` VALUES ('121', '儋州', '3399', '3', '10', '0', '469003', '儋州市');
INSERT INTO `region` VALUES ('122', '五指山', '3399', '3', '10', '0', '469001', '五指山市');
INSERT INTO `region` VALUES ('123', '临高县', '3399', '3', '10', '0', '469024', '临高县市');
INSERT INTO `region` VALUES ('124', '乐东', '3399', '3', '10', '0', '469027', '乐东市');
INSERT INTO `region` VALUES ('125', '琼海', '3399', '3', '10', '0', '469002', '琼海市');
INSERT INTO `region` VALUES ('126', '陵水', '3399', '3', '10', '0', '469028', '陵水市');
INSERT INTO `region` VALUES ('127', '屯昌县', '3399', '3', '10', '0', '469022', '屯昌县市');
INSERT INTO `region` VALUES ('128', '琼中', '3399', '3', '10', '0', '469030', '琼中市');
INSERT INTO `region` VALUES ('129', '文昌', '3399', '3', '10', '0', '469005', '文昌市');
INSERT INTO `region` VALUES ('130', '万宁', '3399', '3', '10', '0', '469006', '万宁市');
INSERT INTO `region` VALUES ('131', '东方', '3399', '3', '10', '0', '469007', '东方市');
INSERT INTO `region` VALUES ('132', '定安县', '3399', '3', '10', '0', '469021', '定安县市');
INSERT INTO `region` VALUES ('133', '澄迈县', '3399', '3', '10', '0', '469023', '澄迈县市');
INSERT INTO `region` VALUES ('134', '昌江', '3399', '3', '10', '0', '469026', '昌江市');
INSERT INTO `region` VALUES ('135', '保亭', '3399', '3', '10', '0', '469029', '保亭市');
INSERT INTO `region` VALUES ('136', '白沙', '3399', '3', '10', '0', '469025', '白沙市');
INSERT INTO `region` VALUES ('137', '三亚', '9', '2', '10', '0', '460200', '三亚市');
INSERT INTO `region` VALUES ('138', '海口', '9', '2', '10', '0', '460100', '海口市');
INSERT INTO `region` VALUES ('139', '保定', '10', '2', '10', '0', '130600', '保定市');
INSERT INTO `region` VALUES ('140', '石家庄', '10', '2', '10', '0', '130100', '石家庄市');
INSERT INTO `region` VALUES ('141', '承德', '10', '2', '10', '0', '130800', '承德市');
INSERT INTO `region` VALUES ('142', '沧州', '10', '2', '10', '0', '130900', '沧州市');
INSERT INTO `region` VALUES ('143', '衡水', '10', '2', '10', '0', '131100', '衡水市');
INSERT INTO `region` VALUES ('144', '邯郸', '10', '2', '10', '0', '130400', '邯郸市');
INSERT INTO `region` VALUES ('145', '廊坊', '10', '2', '10', '0', '131000', '廊坊市');
INSERT INTO `region` VALUES ('146', '秦皇岛', '10', '2', '10', '0', '130300', '秦皇岛市');
INSERT INTO `region` VALUES ('147', '唐山', '10', '2', '10', '0', '130200', '唐山市');
INSERT INTO `region` VALUES ('148', '邢台', '10', '2', '10', '0', '130500', '邢台市');
INSERT INTO `region` VALUES ('149', '张家口', '10', '2', '10', '0', '130700', '张家口市');
INSERT INTO `region` VALUES ('150', '安阳', '11', '2', '10', '0', '410500', '安阳市');
INSERT INTO `region` VALUES ('151', '鹤壁', '11', '2', '10', '0', '410600', '鹤壁市');
INSERT INTO `region` VALUES ('152', '济源', '11', '2', '10', '0', '419001', '济源市');
INSERT INTO `region` VALUES ('153', '焦作', '11', '2', '10', '0', '410800', '焦作市');
INSERT INTO `region` VALUES ('154', '南阳', '11', '2', '10', '0', '411300', '南阳市');
INSERT INTO `region` VALUES ('155', '平顶山', '11', '2', '10', '0', '410400', '平顶山市');
INSERT INTO `region` VALUES ('156', '三门峡', '11', '2', '10', '0', '411200', '三门峡市');
INSERT INTO `region` VALUES ('157', '商丘', '11', '2', '10', '0', '411400', '商丘市');
INSERT INTO `region` VALUES ('158', '郑州', '11', '2', '10', '0', '410100', '郑州市');
INSERT INTO `region` VALUES ('159', '洛阳', '11', '2', '10', '0', '410300', '洛阳市');
INSERT INTO `region` VALUES ('160', '开封', '11', '2', '10', '0', '410200', '开封市');
INSERT INTO `region` VALUES ('161', '周口', '11', '2', '10', '0', '411600', '周口市');
INSERT INTO `region` VALUES ('162', '许昌', '11', '2', '10', '0', '411000', '许昌市');
INSERT INTO `region` VALUES ('163', '信阳', '11', '2', '10', '0', '411500', '信阳市');
INSERT INTO `region` VALUES ('164', '新乡', '11', '2', '10', '0', '410700', '新乡市');
INSERT INTO `region` VALUES ('165', '濮阳', '11', '2', '10', '0', '410900', '濮阳市');
INSERT INTO `region` VALUES ('166', '漯河', '11', '2', '10', '0', '411100', '漯河市');
INSERT INTO `region` VALUES ('167', '驻马店', '11', '2', '10', '0', '411700', '驻马店市');
INSERT INTO `region` VALUES ('168', '黑河', '12', '2', '10', '0', '231100', '黑河市');
INSERT INTO `region` VALUES ('169', '鹤岗', '12', '2', '10', '0', '230400', '鹤岗市');
INSERT INTO `region` VALUES ('170', '大兴安岭', '12', '2', '10', '0', '232700', '大兴安岭地区');
INSERT INTO `region` VALUES ('171', '大庆', '12', '2', '10', '0', '230600', '大庆市');
INSERT INTO `region` VALUES ('172', '七台河', '12', '2', '10', '0', '230900', '七台河市');
INSERT INTO `region` VALUES ('173', '牡丹江', '12', '2', '10', '0', '231000', '牡丹江市');
INSERT INTO `region` VALUES ('174', '佳木斯', '12', '2', '10', '0', '230800', '佳木斯市');
INSERT INTO `region` VALUES ('175', '鸡西', '12', '2', '10', '0', '230300', '鸡西市');
INSERT INTO `region` VALUES ('176', '哈尔滨', '12', '2', '10', '0', '230100', '哈尔滨市');
INSERT INTO `region` VALUES ('177', '绥化', '12', '2', '10', '0', '231200', '绥化市');
INSERT INTO `region` VALUES ('178', '伊春', '12', '2', '10', '0', '230700', '伊春市');
INSERT INTO `region` VALUES ('179', '齐齐哈尔', '12', '2', '10', '0', '230200', '齐齐哈尔市');
INSERT INTO `region` VALUES ('180', '双鸭山', '12', '2', '10', '0', '230500', '双鸭山市');
INSERT INTO `region` VALUES ('181', '恩施', '13', '2', '10', '0', '422800', '恩施市');
INSERT INTO `region` VALUES ('182', '襄樊', '13', '2', '10', '0', '0', '襄樊市');
INSERT INTO `region` VALUES ('183', '咸宁', '13', '2', '10', '0', '421200', '咸宁市');
INSERT INTO `region` VALUES ('184', '宜昌', '13', '2', '10', '0', '420500', '宜昌市');
INSERT INTO `region` VALUES ('185', '孝感', '13', '2', '10', '0', '420900', '孝感市');
INSERT INTO `region` VALUES ('186', '荆州', '13', '2', '10', '0', '421000', '荆州市');
INSERT INTO `region` VALUES ('187', '潜江', '3439', '3', '10', '0', '429005', '潜江市');
INSERT INTO `region` VALUES ('188', '黄石', '13', '2', '10', '0', '420200', '黄石市');
INSERT INTO `region` VALUES ('189', '荆门', '13', '2', '10', '0', '420800', '荆门市');
INSERT INTO `region` VALUES ('190', '随州', '13', '2', '10', '0', '421300', '随州市');
INSERT INTO `region` VALUES ('191', '天门', '3439', '3', '10', '0', '429006', '天门市');
INSERT INTO `region` VALUES ('192', '神农架林区', '3439', '3', '10', '0', '429021', '神农架林区市');
INSERT INTO `region` VALUES ('193', '十堰', '13', '2', '10', '0', '420300', '十堰市');
INSERT INTO `region` VALUES ('194', '鄂州', '13', '2', '10', '0', '420700', '鄂州市');
INSERT INTO `region` VALUES ('195', '黄冈', '13', '2', '10', '0', '421100', '黄冈市');
INSERT INTO `region` VALUES ('196', '武汉', '13', '2', '10', '0', '420100', '武汉市');
INSERT INTO `region` VALUES ('197', '仙桃', '3439', '3', '10', '0', '429004', '仙桃市');
INSERT INTO `region` VALUES ('198', '湘潭', '14', '2', '10', '0', '430300', '湘潭市');
INSERT INTO `region` VALUES ('199', '邵阳', '14', '2', '10', '0', '430500', '邵阳市');
INSERT INTO `region` VALUES ('200', '益阳', '14', '2', '10', '0', '430900', '益阳市');
INSERT INTO `region` VALUES ('201', '湘西', '14', '2', '10', '0', '433100', '湘西市');
INSERT INTO `region` VALUES ('202', '衡阳', '14', '2', '10', '0', '430400', '衡阳市');
INSERT INTO `region` VALUES ('203', '郴州', '14', '2', '10', '0', '431000', '郴州市');
INSERT INTO `region` VALUES ('204', '娄底', '14', '2', '10', '0', '431300', '娄底市');
INSERT INTO `region` VALUES ('205', '怀化', '14', '2', '10', '0', '431200', '怀化市');
INSERT INTO `region` VALUES ('206', '长沙', '14', '2', '10', '0', '430100', '长沙市');
INSERT INTO `region` VALUES ('207', '常德', '14', '2', '10', '0', '430700', '常德市');
INSERT INTO `region` VALUES ('208', '张家界', '14', '2', '10', '0', '430800', '张家界市');
INSERT INTO `region` VALUES ('209', '永州', '14', '2', '10', '0', '431100', '永州市');
INSERT INTO `region` VALUES ('210', '岳阳', '14', '2', '10', '0', '430600', '岳阳市');
INSERT INTO `region` VALUES ('211', '株洲', '14', '2', '10', '0', '430200', '株洲市');
INSERT INTO `region` VALUES ('212', '四平', '15', '2', '10', '0', '220300', '四平市');
INSERT INTO `region` VALUES ('213', '松原', '15', '2', '10', '0', '220700', '松原市');
INSERT INTO `region` VALUES ('214', '通化', '15', '2', '10', '0', '220500', '通化市');
INSERT INTO `region` VALUES ('215', '延边', '15', '2', '10', '0', '222400', '延边州');
INSERT INTO `region` VALUES ('216', '吉林', '15', '2', '10', '0', '220200', '吉林市');
INSERT INTO `region` VALUES ('217', '白城', '15', '2', '10', '0', '220800', '白城市');
INSERT INTO `region` VALUES ('218', '白山', '15', '2', '10', '0', '220600', '白山市');
INSERT INTO `region` VALUES ('219', '辽源', '15', '2', '10', '0', '220400', '辽源市');
INSERT INTO `region` VALUES ('220', '长春', '15', '2', '10', '0', '220100', '长春市');
INSERT INTO `region` VALUES ('221', '萍乡', '16', '2', '10', '0', '360300', '萍乡市');
INSERT INTO `region` VALUES ('222', '九江', '16', '2', '10', '0', '360400', '九江市');
INSERT INTO `region` VALUES ('223', '景德镇', '16', '2', '10', '0', '360200', '景德镇市');
INSERT INTO `region` VALUES ('224', '吉安', '16', '2', '10', '0', '360800', '吉安市');
INSERT INTO `region` VALUES ('225', '赣州', '16', '2', '10', '0', '360700', '赣州市');
INSERT INTO `region` VALUES ('226', '抚州', '16', '2', '10', '0', '361000', '抚州市');
INSERT INTO `region` VALUES ('227', '南昌', '16', '2', '10', '0', '360100', '南昌市');
INSERT INTO `region` VALUES ('228', '宜春', '16', '2', '10', '0', '360900', '宜春市');
INSERT INTO `region` VALUES ('229', '鹰潭', '16', '2', '10', '0', '360600', '鹰潭市');
INSERT INTO `region` VALUES ('230', '上饶', '16', '2', '10', '0', '361100', '上饶市');
INSERT INTO `region` VALUES ('231', '新余', '16', '2', '10', '0', '360500', '新余市');
INSERT INTO `region` VALUES ('232', '镇江', '17', '2', '10', '0', '321100', '镇江市');
INSERT INTO `region` VALUES ('233', '扬州', '17', '2', '10', '0', '321000', '扬州市');
INSERT INTO `region` VALUES ('234', '盐城', '17', '2', '10', '0', '320900', '盐城市');
INSERT INTO `region` VALUES ('235', '徐州', '17', '2', '10', '0', '320300', '徐州市');
INSERT INTO `region` VALUES ('236', '泰州', '17', '2', '10', '0', '321200', '泰州市');
INSERT INTO `region` VALUES ('237', '宿迁', '17', '2', '10', '0', '321300', '宿迁市');
INSERT INTO `region` VALUES ('238', '南通', '17', '2', '10', '0', '320600', '南通市');
INSERT INTO `region` VALUES ('239', '连云港', '17', '2', '10', '0', '320700', '连云港市');
INSERT INTO `region` VALUES ('240', '淮安', '17', '2', '10', '0', '320800', '淮安市');
INSERT INTO `region` VALUES ('241', '南京', '17', '2', '10', '0', '320100', '南京市');
INSERT INTO `region` VALUES ('242', '苏州', '17', '2', '10', '0', '320500', '苏州市');
INSERT INTO `region` VALUES ('243', '无锡', '17', '2', '10', '0', '320200', '无锡市');
INSERT INTO `region` VALUES ('244', '常州', '17', '2', '10', '0', '320400', '常州市');
INSERT INTO `region` VALUES ('245', '呼和浩特', '18', '2', '10', '0', '150100', '呼和浩特市');
INSERT INTO `region` VALUES ('246', '阿拉善盟', '18', '2', '10', '0', '152900', '阿拉善盟市');
INSERT INTO `region` VALUES ('247', '赤峰', '18', '2', '10', '0', '150400', '赤峰市');
INSERT INTO `region` VALUES ('248', '鄂尔多斯', '18', '2', '10', '0', '150600', '鄂尔多斯市');
INSERT INTO `region` VALUES ('249', '巴彦淖尔', '18', '2', '10', '0', '150800', '巴彦淖尔市');
INSERT INTO `region` VALUES ('250', '包头', '18', '2', '10', '0', '150200', '包头市');
INSERT INTO `region` VALUES ('251', '乌海', '18', '2', '10', '0', '150300', '乌海市');
INSERT INTO `region` VALUES ('252', '乌兰察布市', '18', '2', '10', '0', '150900', '乌兰察布市市');
INSERT INTO `region` VALUES ('253', '呼伦贝尔', '18', '2', '10', '0', '150700', '呼伦贝尔市');
INSERT INTO `region` VALUES ('254', '通辽', '18', '2', '10', '0', '150500', '通辽市');
INSERT INTO `region` VALUES ('255', '锡林郭勒', '18', '2', '10', '0', '152500', '锡林郭勒市');
INSERT INTO `region` VALUES ('256', '兴安盟', '18', '2', '10', '0', '152200', '兴安盟市');
INSERT INTO `region` VALUES ('257', '辽阳', '19', '2', '10', '0', '211000', '辽阳市');
INSERT INTO `region` VALUES ('258', '盘锦', '19', '2', '10', '0', '211100', '盘锦市');
INSERT INTO `region` VALUES ('259', '铁岭', '19', '2', '10', '0', '211200', '铁岭市');
INSERT INTO `region` VALUES ('260', '葫芦岛', '19', '2', '10', '0', '211400', '葫芦岛市');
INSERT INTO `region` VALUES ('261', '营口', '19', '2', '10', '0', '210800', '营口市');
INSERT INTO `region` VALUES ('262', '锦州', '19', '2', '10', '0', '210700', '锦州市');
INSERT INTO `region` VALUES ('263', '抚顺', '19', '2', '10', '0', '210400', '抚顺市');
INSERT INTO `region` VALUES ('264', '阜新', '19', '2', '10', '0', '210900', '阜新市');
INSERT INTO `region` VALUES ('265', '朝阳', '19', '2', '10', '0', '211300', '朝阳市');
INSERT INTO `region` VALUES ('266', '丹东', '19', '2', '10', '0', '210600', '丹东市');
INSERT INTO `region` VALUES ('267', '鞍山', '19', '2', '10', '0', '210300', '鞍山市');
INSERT INTO `region` VALUES ('268', '本溪', '19', '2', '10', '0', '210500', '本溪市');
INSERT INTO `region` VALUES ('269', '沈阳', '19', '2', '10', '0', '210100', '沈阳市');
INSERT INTO `region` VALUES ('270', '大连', '19', '2', '10', '0', '210200', '大连市');
INSERT INTO `region` VALUES ('271', '西宁', '20', '2', '10', '0', '630100', '西宁市');
INSERT INTO `region` VALUES ('272', '海南', '20', '2', '10', '0', '632500', '海南');
INSERT INTO `region` VALUES ('273', '海东', '20', '2', '10', '0', '630200', '海东地区');
INSERT INTO `region` VALUES ('274', '海北', '20', '2', '10', '0', '632200', '海北');
INSERT INTO `region` VALUES ('275', '果洛', '20', '2', '10', '0', '632600', '果洛');
INSERT INTO `region` VALUES ('276', '玉树', '20', '2', '10', '0', '632700', '玉树');
INSERT INTO `region` VALUES ('277', '黄南', '20', '2', '10', '0', '632300', '黄南');
INSERT INTO `region` VALUES ('278', '海西', '20', '2', '10', '0', '632800', '海西');
INSERT INTO `region` VALUES ('279', '中卫', '21', '2', '10', '0', '640500', '中卫市');
INSERT INTO `region` VALUES ('280', '吴忠', '21', '2', '10', '0', '640300', '吴忠市');
INSERT INTO `region` VALUES ('281', '石嘴山', '21', '2', '10', '0', '640200', '石嘴山市');
INSERT INTO `region` VALUES ('282', '银川', '21', '2', '10', '0', '640100', '银川市');
INSERT INTO `region` VALUES ('283', '固原', '21', '2', '10', '0', '640400', '固原市');
INSERT INTO `region` VALUES ('284', '临汾', '22', '2', '10', '0', '141000', '临汾市');
INSERT INTO `region` VALUES ('285', '晋中', '22', '2', '10', '0', '140700', '晋中市');
INSERT INTO `region` VALUES ('286', '朔州', '22', '2', '10', '0', '140600', '朔州市');
INSERT INTO `region` VALUES ('287', '吕梁', '22', '2', '10', '0', '141100', '吕梁市');
INSERT INTO `region` VALUES ('288', '阳泉', '22', '2', '10', '0', '140300', '阳泉市');
INSERT INTO `region` VALUES ('289', '忻州', '22', '2', '10', '0', '140900', '忻州市');
INSERT INTO `region` VALUES ('290', '运城', '22', '2', '10', '0', '140800', '运城市');
INSERT INTO `region` VALUES ('291', '太原', '22', '2', '10', '0', '140100', '太原市');
INSERT INTO `region` VALUES ('292', '长治', '22', '2', '10', '0', '140400', '长治市');
INSERT INTO `region` VALUES ('293', '大同', '22', '2', '10', '0', '140200', '大同市');
INSERT INTO `region` VALUES ('294', '晋城', '22', '2', '10', '0', '140500', '晋城市');
INSERT INTO `region` VALUES ('295', '济南', '23', '2', '10', '1', '370100', '济南市');
INSERT INTO `region` VALUES ('296', '东营', '23', '2', '10', '3', '370500', '东营市');
INSERT INTO `region` VALUES ('297', '德州', '23', '2', '10', '15', '371400', '德州市');
INSERT INTO `region` VALUES ('298', '滨州', '23', '2', '10', '9', '371600', '滨州市');
INSERT INTO `region` VALUES ('299', '青岛', '23', '2', '10', '2', '370200', '青岛市');
INSERT INTO `region` VALUES ('300', '菏泽', '23', '2', '10', '4', '371700', '菏泽市');
INSERT INTO `region` VALUES ('301', '济宁', '23', '2', '10', '11', '370800', '济宁市');
INSERT INTO `region` VALUES ('302', '莱芜', '23', '2', '10', '5', '371200', '莱芜市');
INSERT INTO `region` VALUES ('303', '聊城', '23', '2', '10', '6', '371500', '聊城市');
INSERT INTO `region` VALUES ('304', '临沂', '23', '2', '10', '17', '371300', '临沂市');
INSERT INTO `region` VALUES ('305', '日照', '23', '2', '10', '14', '371100', '日照市');
INSERT INTO `region` VALUES ('306', '泰安', '23', '2', '10', '12', '370900', '泰安市');
INSERT INTO `region` VALUES ('307', '威海', '23', '2', '10', '16', '371000', '威海市');
INSERT INTO `region` VALUES ('308', '潍坊', '23', '2', '10', '8', '370700', '潍坊市');
INSERT INTO `region` VALUES ('309', '烟台', '23', '2', '10', '7', '370600', '烟台市');
INSERT INTO `region` VALUES ('310', '枣庄', '23', '2', '10', '13', '370400', '枣庄市');
INSERT INTO `region` VALUES ('311', '淄博', '23', '2', '10', '10', '370300', '淄博市');
INSERT INTO `region` VALUES ('312', '上海', '24', '2', '10', '0', '310000', '上海市');
INSERT INTO `region` VALUES ('313', '西安', '25', '2', '10', '0', '610100', '西安市');
INSERT INTO `region` VALUES ('314', '宝鸡', '25', '2', '10', '0', '610300', '宝鸡市');
INSERT INTO `region` VALUES ('315', '安康', '25', '2', '10', '0', '610900', '安康市');
INSERT INTO `region` VALUES ('316', '商洛', '25', '2', '10', '0', '611000', '商洛市');
INSERT INTO `region` VALUES ('317', '汉中', '25', '2', '10', '0', '610700', '汉中市');
INSERT INTO `region` VALUES ('318', '渭南', '25', '2', '10', '0', '610500', '渭南市');
INSERT INTO `region` VALUES ('319', '铜川', '25', '2', '10', '0', '610200', '铜川市');
INSERT INTO `region` VALUES ('320', '延安', '25', '2', '10', '0', '610600', '延安市');
INSERT INTO `region` VALUES ('321', '咸阳', '25', '2', '10', '0', '610400', '咸阳市');
INSERT INTO `region` VALUES ('322', '榆林', '25', '2', '10', '0', '610800', '榆林市');
INSERT INTO `region` VALUES ('323', '天津', '26', '2', '10', '0', '120000', '天津市');
INSERT INTO `region` VALUES ('324', '泸州', '27', '2', '10', '0', '510500', '泸州市');
INSERT INTO `region` VALUES ('325', '自贡', '27', '2', '10', '0', '510300', '自贡市');
INSERT INTO `region` VALUES ('326', '资阳', '27', '2', '10', '0', '512000', '资阳市');
INSERT INTO `region` VALUES ('327', '宜宾', '27', '2', '10', '0', '511500', '宜宾市');
INSERT INTO `region` VALUES ('328', '雅安', '27', '2', '10', '0', '511800', '雅安市');
INSERT INTO `region` VALUES ('329', '遂宁', '27', '2', '10', '0', '510900', '遂宁市');
INSERT INTO `region` VALUES ('330', '攀枝花', '27', '2', '10', '0', '510400', '攀枝花市');
INSERT INTO `region` VALUES ('331', '达州', '27', '2', '10', '0', '511700', '达州市');
INSERT INTO `region` VALUES ('332', '德阳', '27', '2', '10', '0', '510600', '德阳市');
INSERT INTO `region` VALUES ('333', '阿坝', '27', '2', '10', '0', '513200', '阿坝州');
INSERT INTO `region` VALUES ('334', '巴中', '27', '2', '10', '0', '511900', '巴中市');
INSERT INTO `region` VALUES ('335', '成都', '27', '2', '10', '0', '510100', '成都市');
INSERT INTO `region` VALUES ('336', '绵阳', '27', '2', '10', '0', '510700', '绵阳市');
INSERT INTO `region` VALUES ('337', '南充', '27', '2', '10', '0', '511300', '南充市');
INSERT INTO `region` VALUES ('338', '内江', '27', '2', '10', '0', '511000', '内江市');
INSERT INTO `region` VALUES ('339', '凉山', '27', '2', '10', '0', '513400', '凉山州');
INSERT INTO `region` VALUES ('340', '眉山', '27', '2', '10', '0', '511400', '眉山市');
INSERT INTO `region` VALUES ('341', '广元', '27', '2', '10', '0', '510800', '广元市');
INSERT INTO `region` VALUES ('342', '乐山', '27', '2', '10', '0', '511100', '乐山市');
INSERT INTO `region` VALUES ('343', '甘孜', '27', '2', '10', '0', '513300', '甘孜州');
INSERT INTO `region` VALUES ('344', '广安', '27', '2', '10', '0', '511600', '广安市');
INSERT INTO `region` VALUES ('345', '乌鲁木齐', '28', '2', '10', '0', '650100', '乌鲁木齐市');
INSERT INTO `region` VALUES ('346', '昌吉', '28', '2', '10', '0', '652300', '昌吉');
INSERT INTO `region` VALUES ('347', '哈密', '28', '2', '10', '0', '652200', '哈密地区');
INSERT INTO `region` VALUES ('348', '和田', '28', '2', '10', '0', '653200', '和田地区');
INSERT INTO `region` VALUES ('349', '喀什', '28', '2', '10', '0', '653100', '喀什地区');
INSERT INTO `region` VALUES ('350', '阿克苏', '28', '2', '10', '0', '652900', '阿克苏地区');
INSERT INTO `region` VALUES ('351', '阿拉尔', '3420', '3', '10', '0', '659002', '阿拉尔市');
INSERT INTO `region` VALUES ('352', '巴音郭楞', '28', '2', '10', '0', '652800', '巴音郭楞');
INSERT INTO `region` VALUES ('353', '博尔塔拉', '28', '2', '10', '0', '652700', '博尔塔拉');
INSERT INTO `region` VALUES ('354', '吐鲁番', '28', '2', '10', '0', '652100', '吐鲁番地区');
INSERT INTO `region` VALUES ('355', '五家渠', '3420', '3', '10', '0', '659004', '五家渠市');
INSERT INTO `region` VALUES ('356', '伊犁', '28', '2', '10', '0', '654000', '伊犁市');
INSERT INTO `region` VALUES ('357', '克拉玛依', '28', '2', '10', '0', '650200', '克拉玛依市');
INSERT INTO `region` VALUES ('358', '克孜勒苏', '28', '2', '10', '0', '653000', '克孜勒苏市');
INSERT INTO `region` VALUES ('359', '石河子', '3420', '3', '10', '0', '659001', '石河子市');
INSERT INTO `region` VALUES ('360', '图木舒克', '3420', '3', '10', '0', '659003', '图木舒克市');
INSERT INTO `region` VALUES ('361', '山南', '29', '2', '10', '0', '542200', '山南地区');
INSERT INTO `region` VALUES ('362', '日喀则', '29', '2', '10', '0', '542300', '日喀则地区');
INSERT INTO `region` VALUES ('363', '那曲', '29', '2', '10', '0', '542400', '那曲地区');
INSERT INTO `region` VALUES ('364', '林芝', '29', '2', '10', '0', '542600', '林芝地区');
INSERT INTO `region` VALUES ('365', '昌都', '29', '2', '10', '0', '542100', '昌都地区');
INSERT INTO `region` VALUES ('366', '阿里', '29', '2', '10', '0', '542500', '阿里地区');
INSERT INTO `region` VALUES ('367', '拉萨', '29', '2', '10', '0', '540100', '拉萨市');
INSERT INTO `region` VALUES ('368', '杭州', '30', '2', '10', '0', '330100', '杭州市');
INSERT INTO `region` VALUES ('369', '衢州', '30', '2', '10', '0', '330800', '衢州市');
INSERT INTO `region` VALUES ('370', '舟山', '30', '2', '10', '0', '330900', '舟山市');
INSERT INTO `region` VALUES ('371', '丽水', '30', '2', '10', '0', '331100', '丽水市');
INSERT INTO `region` VALUES ('372', '金华', '30', '2', '10', '0', '330700', '金华市');
INSERT INTO `region` VALUES ('373', '嘉兴', '30', '2', '10', '0', '330400', '嘉兴市');
INSERT INTO `region` VALUES ('374', '湖州', '30', '2', '10', '0', '330500', '湖州市');
INSERT INTO `region` VALUES ('375', '温州', '30', '2', '10', '0', '330300', '温州市');
INSERT INTO `region` VALUES ('376', '台州', '30', '2', '10', '0', '331000', '台州市');
INSERT INTO `region` VALUES ('377', '绍兴', '30', '2', '10', '0', '330600', '绍兴市');
INSERT INTO `region` VALUES ('378', '宁波', '30', '2', '10', '0', '330200', '宁波市');
INSERT INTO `region` VALUES ('379', '大理', '31', '2', '10', '0', '532900', '大理州');
INSERT INTO `region` VALUES ('380', '楚雄', '31', '2', '10', '0', '532300', '楚雄州');
INSERT INTO `region` VALUES ('381', '迪庆', '31', '2', '10', '0', '533400', '迪庆州');
INSERT INTO `region` VALUES ('382', '德宏', '31', '2', '10', '0', '533100', '德宏州');
INSERT INTO `region` VALUES ('383', '普洱', '31', '2', '10', '0', '530800', '普洱市');
INSERT INTO `region` VALUES ('384', '怒江', '31', '2', '10', '0', '533300', '怒江州');
INSERT INTO `region` VALUES ('385', '保山', '31', '2', '10', '0', '530500', '保山市');
INSERT INTO `region` VALUES ('386', '丽江', '31', '2', '10', '0', '530700', '丽江市');
INSERT INTO `region` VALUES ('387', '玉溪', '31', '2', '10', '0', '530400', '玉溪市');
INSERT INTO `region` VALUES ('388', '西双版纳', '31', '2', '10', '0', '532800', '西双版纳州');
INSERT INTO `region` VALUES ('389', '昭通', '31', '2', '10', '0', '530600', '昭通市');
INSERT INTO `region` VALUES ('390', '临沧', '31', '2', '10', '0', '530900', '临沧市');
INSERT INTO `region` VALUES ('391', '红河', '31', '2', '10', '0', '532500', '红河州');
INSERT INTO `region` VALUES ('392', '文山', '31', '2', '10', '0', '532600', '文山州');
INSERT INTO `region` VALUES ('393', '曲靖', '31', '2', '10', '0', '530300', '曲靖市');
INSERT INTO `region` VALUES ('394', '昆明', '31', '2', '10', '0', '530100', '昆明市');
INSERT INTO `region` VALUES ('395', '澳门', '32', '2', '10', '0', '0', '澳门市');
INSERT INTO `region` VALUES ('396', '台湾', '33', '2', '10', '0', '0', '台湾市');
INSERT INTO `region` VALUES ('397', '重庆', '34', '2', '10', '0', '500000', '重庆市');
INSERT INTO `region` VALUES ('398', '香港', '35', '2', '10', '0', '0', '香港市');
INSERT INTO `region` VALUES ('399', '东城区', '36', '3', '10', '3', '110101', '东城区');
INSERT INTO `region` VALUES ('400', '西城区', '36', '3', '10', '6', '110102', '西城区');
INSERT INTO `region` VALUES ('401', '海淀区', '36', '3', '10', '1', '110108', '海淀区');
INSERT INTO `region` VALUES ('402', '朝阳区', '36', '3', '10', '2', '110105', '朝阳区');
INSERT INTO `region` VALUES ('403', '崇文区', '36', '3', '10', '13', '0', '崇文区');
INSERT INTO `region` VALUES ('404', '宣武区', '36', '3', '10', '15', '0', '宣武区');
INSERT INTO `region` VALUES ('405', '丰台区', '36', '3', '10', '17', '110106', '丰台区');
INSERT INTO `region` VALUES ('406', '石景山区', '36', '3', '10', '7', '110107', '石景山区');
INSERT INTO `region` VALUES ('407', '房山区', '36', '3', '10', '9', '110111', '房山区');
INSERT INTO `region` VALUES ('408', '门头沟区', '36', '3', '10', '4', '110109', '门头沟区');
INSERT INTO `region` VALUES ('409', '通州区', '36', '3', '10', '5', '110112', '通州区');
INSERT INTO `region` VALUES ('410', '顺义区', '36', '3', '10', '18', '110113', '顺义区');
INSERT INTO `region` VALUES ('411', '昌平区', '36', '3', '10', '8', '110114', '昌平区');
INSERT INTO `region` VALUES ('412', '怀柔区', '36', '3', '10', '10', '110116', '怀柔区');
INSERT INTO `region` VALUES ('413', '平谷区', '36', '3', '10', '12', '110117', '平谷区');
INSERT INTO `region` VALUES ('414', '大兴区', '36', '3', '10', '16', '110115', '大兴区');
INSERT INTO `region` VALUES ('415', '密云县', '36', '3', '10', '14', '110228', '密云县');
INSERT INTO `region` VALUES ('416', '延庆县', '36', '3', '10', '11', '110229', '延庆县');
INSERT INTO `region` VALUES ('417', '庐阳区', '37', '3', '10', '0', '340103', '庐阳区');
INSERT INTO `region` VALUES ('418', '瑶海区', '37', '3', '10', '0', '340102', '瑶海区');
INSERT INTO `region` VALUES ('419', '蜀山区', '37', '3', '10', '0', '340104', '蜀山区');
INSERT INTO `region` VALUES ('420', '包河区', '37', '3', '10', '0', '340111', '包河区');
INSERT INTO `region` VALUES ('421', '长丰县', '37', '3', '10', '0', '340121', '长丰县');
INSERT INTO `region` VALUES ('422', '肥东县', '37', '3', '10', '0', '340122', '肥东县');
INSERT INTO `region` VALUES ('423', '肥西县', '37', '3', '10', '0', '340123', '肥西县');
INSERT INTO `region` VALUES ('424', '居巢区', '38', '3', '10', '0', '0', '居巢区');
INSERT INTO `region` VALUES ('425', '庐江县', '38', '3', '10', '0', '0', '庐江县');
INSERT INTO `region` VALUES ('426', '无为县', '52', '3', '10', '0', '340225', '无为县');
INSERT INTO `region` VALUES ('427', '含山县', '46', '3', '10', '0', '340522', '含山县');
INSERT INTO `region` VALUES ('428', '和县', '46', '3', '10', '0', '340523', '和县');
INSERT INTO `region` VALUES ('429', '贵池区', '39', '3', '10', '0', '341702', '贵池区');
INSERT INTO `region` VALUES ('430', '东至县', '39', '3', '10', '0', '341721', '东至县');
INSERT INTO `region` VALUES ('431', '石台县', '39', '3', '10', '0', '341722', '石台县');
INSERT INTO `region` VALUES ('432', '青阳县', '39', '3', '10', '0', '341723', '青阳县');
INSERT INTO `region` VALUES ('433', '迎江区', '40', '3', '10', '0', '340802', '迎江区');
INSERT INTO `region` VALUES ('434', '大观区', '40', '3', '10', '0', '340803', '大观区');
INSERT INTO `region` VALUES ('435', '宜秀区', '40', '3', '10', '0', '340811', '宜秀区');
INSERT INTO `region` VALUES ('436', '桐城市', '40', '3', '10', '0', '340881', '桐城市');
INSERT INTO `region` VALUES ('437', '怀宁县', '40', '3', '10', '0', '340822', '怀宁县');
INSERT INTO `region` VALUES ('438', '枞阳县', '40', '3', '10', '0', '340823', '枞阳县');
INSERT INTO `region` VALUES ('439', '潜山县', '40', '3', '10', '0', '340824', '潜山县');
INSERT INTO `region` VALUES ('440', '太湖县', '40', '3', '10', '0', '340825', '太湖县');
INSERT INTO `region` VALUES ('441', '宿松县', '40', '3', '10', '0', '340826', '宿松县');
INSERT INTO `region` VALUES ('442', '望江县', '40', '3', '10', '0', '340827', '望江县');
INSERT INTO `region` VALUES ('443', '岳西县', '40', '3', '10', '0', '340828', '岳西县');
INSERT INTO `region` VALUES ('444', '中市区', '41', '3', '10', '0', '0', '中市区');
INSERT INTO `region` VALUES ('445', '东市区', '41', '3', '10', '0', '0', '东市区');
INSERT INTO `region` VALUES ('446', '西市区', '41', '3', '10', '0', '0', '西市区');
INSERT INTO `region` VALUES ('447', '郊区', '41', '3', '10', '0', '0', '郊区');
INSERT INTO `region` VALUES ('448', '怀远县', '41', '3', '10', '0', '340321', '怀远县');
INSERT INTO `region` VALUES ('449', '五河县', '41', '3', '10', '0', '340322', '五河县');
INSERT INTO `region` VALUES ('450', '固镇县', '41', '3', '10', '0', '340323', '固镇县');
INSERT INTO `region` VALUES ('451', '相山区', '42', '3', '10', '0', '340603', '相山区');
INSERT INTO `region` VALUES ('452', '杜集区', '42', '3', '10', '0', '340602', '杜集区');
INSERT INTO `region` VALUES ('453', '烈山区', '42', '3', '10', '0', '340604', '烈山区');
INSERT INTO `region` VALUES ('454', '濉溪县', '42', '3', '10', '0', '340621', '濉溪县');
INSERT INTO `region` VALUES ('455', '田家庵区', '43', '3', '10', '0', '340403', '田家庵区');
INSERT INTO `region` VALUES ('456', '大通区', '43', '3', '10', '0', '340402', '大通区');
INSERT INTO `region` VALUES ('457', '谢家集区', '43', '3', '10', '0', '340404', '谢家集区');
INSERT INTO `region` VALUES ('458', '八公山区', '43', '3', '10', '0', '340405', '八公山区');
INSERT INTO `region` VALUES ('459', '潘集区', '43', '3', '10', '0', '340406', '潘集区');
INSERT INTO `region` VALUES ('460', '凤台县', '43', '3', '10', '0', '340421', '凤台县');
INSERT INTO `region` VALUES ('461', '琅琊区', '44', '3', '10', '0', '341102', '琅琊区');
INSERT INTO `region` VALUES ('462', '南谯区', '44', '3', '10', '0', '341103', '南谯区');
INSERT INTO `region` VALUES ('463', '天长市', '44', '3', '10', '0', '341181', '天长市');
INSERT INTO `region` VALUES ('464', '明光市', '44', '3', '10', '0', '341182', '明光市');
INSERT INTO `region` VALUES ('465', '来安县', '44', '3', '10', '0', '341122', '来安县');
INSERT INTO `region` VALUES ('466', '全椒县', '44', '3', '10', '0', '341124', '全椒县');
INSERT INTO `region` VALUES ('467', '定远县', '44', '3', '10', '0', '341125', '定远县');
INSERT INTO `region` VALUES ('468', '凤阳县', '44', '3', '10', '0', '341126', '凤阳县');
INSERT INTO `region` VALUES ('469', '蚌山区', '41', '3', '10', '0', '340303', '蚌山区');
INSERT INTO `region` VALUES ('470', '龙子湖区', '41', '3', '10', '0', '340302', '龙子湖区');
INSERT INTO `region` VALUES ('471', '禹会区', '41', '3', '10', '0', '340304', '禹会区');
INSERT INTO `region` VALUES ('472', '淮上区', '41', '3', '10', '0', '340311', '淮上区');
INSERT INTO `region` VALUES ('473', '颍州区', '45', '3', '10', '0', '341202', '颍州区');
INSERT INTO `region` VALUES ('474', '颍东区', '45', '3', '10', '0', '341203', '颍东区');
INSERT INTO `region` VALUES ('475', '颍泉区', '45', '3', '10', '0', '341204', '颍泉区');
INSERT INTO `region` VALUES ('476', '界首市', '45', '3', '10', '0', '341282', '界首市');
INSERT INTO `region` VALUES ('477', '临泉县', '45', '3', '10', '0', '341221', '临泉县');
INSERT INTO `region` VALUES ('478', '太和县', '45', '3', '10', '0', '341222', '太和县');
INSERT INTO `region` VALUES ('479', '阜南县', '45', '3', '10', '0', '341225', '阜南县');
INSERT INTO `region` VALUES ('480', '颖上县', '45', '3', '10', '0', '0', '颖上县');
INSERT INTO `region` VALUES ('481', '雨山区', '46', '3', '10', '0', '340504', '雨山区');
INSERT INTO `region` VALUES ('482', '花山区', '46', '3', '10', '0', '340503', '花山区');
INSERT INTO `region` VALUES ('483', '金家庄区', '46', '3', '10', '0', '0', '金家庄区');
INSERT INTO `region` VALUES ('484', '当涂县', '46', '3', '10', '0', '340521', '当涂县');
INSERT INTO `region` VALUES ('485', '埇桥区', '47', '3', '10', '0', '341302', '埇桥区');
INSERT INTO `region` VALUES ('486', '砀山县', '47', '3', '10', '0', '341321', '砀山县');
INSERT INTO `region` VALUES ('487', '萧县', '47', '3', '10', '0', '341322', '萧县');
INSERT INTO `region` VALUES ('488', '灵璧县', '47', '3', '10', '0', '341323', '灵璧县');
INSERT INTO `region` VALUES ('489', '泗县', '47', '3', '10', '0', '341324', '泗县');
INSERT INTO `region` VALUES ('490', '屯溪区', '48', '3', '10', '0', '341002', '屯溪区');
INSERT INTO `region` VALUES ('491', '黄山区', '48', '3', '10', '0', '341000', '黄山区');
INSERT INTO `region` VALUES ('492', '徽州区', '48', '3', '10', '0', '341004', '徽州区');
INSERT INTO `region` VALUES ('493', '歙县', '48', '3', '10', '0', '341021', '歙县');
INSERT INTO `region` VALUES ('494', '休宁县', '48', '3', '10', '0', '341022', '休宁县');
INSERT INTO `region` VALUES ('495', '黟县', '48', '3', '10', '0', '341023', '黟县');
INSERT INTO `region` VALUES ('496', '祁门县', '48', '3', '10', '0', '341024', '祁门县');
INSERT INTO `region` VALUES ('497', '金安区', '49', '3', '10', '0', '341502', '金安区');
INSERT INTO `region` VALUES ('498', '裕安区', '49', '3', '10', '0', '341503', '裕安区');
INSERT INTO `region` VALUES ('499', '寿县', '49', '3', '10', '0', '341521', '寿县');
INSERT INTO `region` VALUES ('500', '霍邱县', '49', '3', '10', '0', '341522', '霍邱县');
INSERT INTO `region` VALUES ('501', '舒城县', '49', '3', '10', '0', '341523', '舒城县');
INSERT INTO `region` VALUES ('502', '金寨县', '49', '3', '10', '0', '341524', '金寨县');
INSERT INTO `region` VALUES ('503', '霍山县', '49', '3', '10', '0', '341525', '霍山县');
INSERT INTO `region` VALUES ('504', '涡阳县', '50', '3', '10', '0', '341621', '涡阳县');
INSERT INTO `region` VALUES ('505', '蒙城县', '50', '3', '10', '0', '341622', '蒙城县');
INSERT INTO `region` VALUES ('506', '利辛县', '50', '3', '10', '0', '341623', '利辛县');
INSERT INTO `region` VALUES ('507', '谯城区', '50', '3', '10', '0', '341602', '谯城区');
INSERT INTO `region` VALUES ('508', '宣州区', '51', '3', '10', '0', '341802', '宣州区');
INSERT INTO `region` VALUES ('509', '宁国市', '51', '3', '10', '0', '341881', '宁国市');
INSERT INTO `region` VALUES ('510', '郎溪县', '51', '3', '10', '0', '341821', '郎溪县');
INSERT INTO `region` VALUES ('511', '广德县', '51', '3', '10', '0', '341822', '广德县');
INSERT INTO `region` VALUES ('512', '泾县', '51', '3', '10', '0', '341823', '泾县');
INSERT INTO `region` VALUES ('513', '绩溪县', '51', '3', '10', '0', '341824', '绩溪县');
INSERT INTO `region` VALUES ('514', '旌德县', '51', '3', '10', '0', '341825', '旌德县');
INSERT INTO `region` VALUES ('515', '镜湖区', '52', '3', '10', '0', '340202', '镜湖区');
INSERT INTO `region` VALUES ('516', '弋江区', '52', '3', '10', '0', '340203', '弋江区');
INSERT INTO `region` VALUES ('517', '鸠江区', '52', '3', '10', '0', '340207', '鸠江区');
INSERT INTO `region` VALUES ('518', '三山区', '52', '3', '10', '0', '340208', '三山区');
INSERT INTO `region` VALUES ('519', '芜湖县', '52', '3', '10', '0', '340200', '芜湖县');
INSERT INTO `region` VALUES ('520', '繁昌县', '52', '3', '10', '0', '340222', '繁昌县');
INSERT INTO `region` VALUES ('521', '南陵县', '52', '3', '10', '0', '340223', '南陵县');
INSERT INTO `region` VALUES ('522', '铜官山区', '53', '3', '10', '0', '340702', '铜官山区');
INSERT INTO `region` VALUES ('523', '狮子山区', '53', '3', '10', '0', '340703', '狮子山区');
INSERT INTO `region` VALUES ('524', '郊区', '53', '3', '10', '0', '340711', '郊区');
INSERT INTO `region` VALUES ('525', '铜陵县', '53', '3', '10', '0', '340721', '铜陵县');
INSERT INTO `region` VALUES ('526', '延平区', '54', '3', '10', '0', '350702', '延平区');
INSERT INTO `region` VALUES ('527', '邵武市', '54', '3', '10', '0', '350781', '邵武市');
INSERT INTO `region` VALUES ('528', '武夷山市', '54', '3', '10', '0', '350782', '武夷山市');
INSERT INTO `region` VALUES ('529', '建瓯市', '54', '3', '10', '0', '350783', '建瓯市');
INSERT INTO `region` VALUES ('530', '建阳市', '54', '3', '10', '0', '350784', '建阳市');
INSERT INTO `region` VALUES ('531', '顺昌县', '54', '3', '10', '0', '350721', '顺昌县');
INSERT INTO `region` VALUES ('532', '浦城县', '54', '3', '10', '0', '350722', '浦城县');
INSERT INTO `region` VALUES ('533', '光泽县', '54', '3', '10', '0', '350723', '光泽县');
INSERT INTO `region` VALUES ('534', '松溪县', '54', '3', '10', '0', '350724', '松溪县');
INSERT INTO `region` VALUES ('535', '政和县', '54', '3', '10', '0', '350725', '政和县');
INSERT INTO `region` VALUES ('536', '新罗区', '55', '3', '10', '0', '350802', '新罗区');
INSERT INTO `region` VALUES ('537', '漳平市', '55', '3', '10', '0', '350881', '漳平市');
INSERT INTO `region` VALUES ('538', '长汀县', '55', '3', '10', '0', '350821', '长汀县');
INSERT INTO `region` VALUES ('539', '永定县', '55', '3', '10', '0', '350822', '永定县');
INSERT INTO `region` VALUES ('540', '上杭县', '55', '3', '10', '0', '350823', '上杭县');
INSERT INTO `region` VALUES ('541', '武平县', '55', '3', '10', '0', '350824', '武平县');
INSERT INTO `region` VALUES ('542', '连城县', '55', '3', '10', '0', '350825', '连城县');
INSERT INTO `region` VALUES ('543', '鼓楼区', '56', '3', '10', '0', '350102', '鼓楼区');
INSERT INTO `region` VALUES ('544', '台江区', '56', '3', '10', '0', '350103', '台江区');
INSERT INTO `region` VALUES ('545', '仓山区', '56', '3', '10', '0', '350104', '仓山区');
INSERT INTO `region` VALUES ('546', '马尾区', '56', '3', '10', '0', '350105', '马尾区');
INSERT INTO `region` VALUES ('547', '晋安区', '56', '3', '10', '0', '350111', '晋安区');
INSERT INTO `region` VALUES ('548', '福清市', '56', '3', '10', '0', '350181', '福清市');
INSERT INTO `region` VALUES ('549', '长乐市', '56', '3', '10', '0', '350182', '长乐市');
INSERT INTO `region` VALUES ('550', '闽侯县', '56', '3', '10', '0', '350121', '闽侯县');
INSERT INTO `region` VALUES ('551', '连江县', '56', '3', '10', '0', '350122', '连江县');
INSERT INTO `region` VALUES ('552', '罗源县', '56', '3', '10', '0', '350123', '罗源县');
INSERT INTO `region` VALUES ('553', '闽清县', '56', '3', '10', '0', '350124', '闽清县');
INSERT INTO `region` VALUES ('554', '永泰县', '56', '3', '10', '0', '350125', '永泰县');
INSERT INTO `region` VALUES ('555', '平潭县', '56', '3', '10', '0', '350128', '平潭县');
INSERT INTO `region` VALUES ('556', '梅列区', '57', '3', '10', '0', '350402', '梅列区');
INSERT INTO `region` VALUES ('557', '三元区', '57', '3', '10', '0', '350403', '三元区');
INSERT INTO `region` VALUES ('558', '永安市', '57', '3', '10', '0', '350481', '永安市');
INSERT INTO `region` VALUES ('559', '明溪县', '57', '3', '10', '0', '350421', '明溪县');
INSERT INTO `region` VALUES ('560', '清流县', '57', '3', '10', '0', '350423', '清流县');
INSERT INTO `region` VALUES ('561', '宁化县', '57', '3', '10', '0', '350424', '宁化县');
INSERT INTO `region` VALUES ('562', '大田县', '57', '3', '10', '0', '350425', '大田县');
INSERT INTO `region` VALUES ('563', '尤溪县', '57', '3', '10', '0', '350426', '尤溪县');
INSERT INTO `region` VALUES ('564', '沙县', '57', '3', '10', '0', '350427', '沙县');
INSERT INTO `region` VALUES ('565', '将乐县', '57', '3', '10', '0', '350428', '将乐县');
INSERT INTO `region` VALUES ('566', '泰宁县', '57', '3', '10', '0', '350429', '泰宁县');
INSERT INTO `region` VALUES ('567', '建宁县', '57', '3', '10', '0', '350430', '建宁县');
INSERT INTO `region` VALUES ('568', '鲤城区', '58', '3', '10', '0', '350502', '鲤城区');
INSERT INTO `region` VALUES ('569', '丰泽区', '58', '3', '10', '0', '350503', '丰泽区');
INSERT INTO `region` VALUES ('570', '洛江区', '58', '3', '10', '0', '350504', '洛江区');
INSERT INTO `region` VALUES ('571', '清濛开发区', '58', '3', '10', '0', '0', '清濛开发区');
INSERT INTO `region` VALUES ('572', '泉港区', '58', '3', '10', '0', '350505', '泉港区');
INSERT INTO `region` VALUES ('573', '石狮市', '58', '3', '10', '0', '350581', '石狮市');
INSERT INTO `region` VALUES ('574', '晋江市', '58', '3', '10', '0', '350582', '晋江市');
INSERT INTO `region` VALUES ('575', '南安市', '58', '3', '10', '0', '350583', '南安市');
INSERT INTO `region` VALUES ('576', '惠安县', '58', '3', '10', '0', '350521', '惠安县');
INSERT INTO `region` VALUES ('577', '安溪县', '58', '3', '10', '0', '350524', '安溪县');
INSERT INTO `region` VALUES ('578', '永春县', '58', '3', '10', '0', '350525', '永春县');
INSERT INTO `region` VALUES ('579', '德化县', '58', '3', '10', '0', '350526', '德化县');
INSERT INTO `region` VALUES ('580', '金门县', '58', '3', '10', '0', '350527', '金门县');
INSERT INTO `region` VALUES ('581', '城厢区', '59', '3', '10', '0', '350302', '城厢区');
INSERT INTO `region` VALUES ('582', '涵江区', '59', '3', '10', '0', '350303', '涵江区');
INSERT INTO `region` VALUES ('583', '荔城区', '59', '3', '10', '0', '350304', '荔城区');
INSERT INTO `region` VALUES ('584', '秀屿区', '59', '3', '10', '0', '350305', '秀屿区');
INSERT INTO `region` VALUES ('585', '仙游县', '59', '3', '10', '0', '350322', '仙游县');
INSERT INTO `region` VALUES ('586', '蕉城区', '60', '3', '10', '0', '350902', '蕉城区');
INSERT INTO `region` VALUES ('587', '福安市', '60', '3', '10', '0', '350981', '福安市');
INSERT INTO `region` VALUES ('588', '福鼎市', '60', '3', '10', '0', '350982', '福鼎市');
INSERT INTO `region` VALUES ('589', '霞浦县', '60', '3', '10', '0', '350921', '霞浦县');
INSERT INTO `region` VALUES ('590', '古田县', '60', '3', '10', '0', '350922', '古田县');
INSERT INTO `region` VALUES ('591', '屏南县', '60', '3', '10', '0', '350923', '屏南县');
INSERT INTO `region` VALUES ('592', '寿宁县', '60', '3', '10', '0', '350924', '寿宁县');
INSERT INTO `region` VALUES ('593', '周宁县', '60', '3', '10', '0', '350925', '周宁县');
INSERT INTO `region` VALUES ('594', '柘荣县', '60', '3', '10', '0', '350926', '柘荣县');
INSERT INTO `region` VALUES ('595', '芗城区', '61', '3', '10', '0', '350602', '芗城区');
INSERT INTO `region` VALUES ('596', '龙文区', '61', '3', '10', '0', '350603', '龙文区');
INSERT INTO `region` VALUES ('597', '龙海市', '61', '3', '10', '0', '350681', '龙海市');
INSERT INTO `region` VALUES ('598', '云霄县', '61', '3', '10', '0', '350622', '云霄县');
INSERT INTO `region` VALUES ('599', '漳浦县', '61', '3', '10', '0', '350623', '漳浦县');
INSERT INTO `region` VALUES ('600', '诏安县', '61', '3', '10', '0', '350624', '诏安县');
INSERT INTO `region` VALUES ('601', '长泰县', '61', '3', '10', '0', '350625', '长泰县');
INSERT INTO `region` VALUES ('602', '东山县', '61', '3', '10', '0', '350626', '东山县');
INSERT INTO `region` VALUES ('603', '南靖县', '61', '3', '10', '0', '350627', '南靖县');
INSERT INTO `region` VALUES ('604', '平和县', '61', '3', '10', '0', '350628', '平和县');
INSERT INTO `region` VALUES ('605', '华安县', '61', '3', '10', '0', '350629', '华安县');
INSERT INTO `region` VALUES ('606', '思明区', '62', '3', '10', '0', '350203', '思明区');
INSERT INTO `region` VALUES ('607', '海沧区', '62', '3', '10', '0', '350205', '海沧区');
INSERT INTO `region` VALUES ('608', '湖里区', '62', '3', '10', '0', '350206', '湖里区');
INSERT INTO `region` VALUES ('609', '集美区', '62', '3', '10', '0', '350211', '集美区');
INSERT INTO `region` VALUES ('610', '同安区', '62', '3', '10', '0', '350212', '同安区');
INSERT INTO `region` VALUES ('611', '翔安区', '62', '3', '10', '0', '350213', '翔安区');
INSERT INTO `region` VALUES ('612', '肃州区', '63', '3', '10', '0', '620902', '肃州区');
INSERT INTO `region` VALUES ('613', '玉门市', '63', '3', '10', '0', '620981', '玉门市');
INSERT INTO `region` VALUES ('614', '敦煌市', '63', '3', '10', '0', '620982', '敦煌市');
INSERT INTO `region` VALUES ('615', '金塔县', '63', '3', '10', '0', '620921', '金塔县');
INSERT INTO `region` VALUES ('616', '瓜州县', '63', '3', '10', '0', '620922', '瓜州县');
INSERT INTO `region` VALUES ('617', '肃北', '63', '3', '10', '0', '620923', '肃北');
INSERT INTO `region` VALUES ('618', '阿克塞', '63', '3', '10', '0', '620924', '阿克塞');
INSERT INTO `region` VALUES ('619', '临夏市', '64', '3', '10', '0', '622900', '临夏市');
INSERT INTO `region` VALUES ('620', '临夏县', '64', '3', '10', '0', '622900', '临夏县');
INSERT INTO `region` VALUES ('621', '康乐县', '64', '3', '10', '0', '622922', '康乐县');
INSERT INTO `region` VALUES ('622', '永靖县', '64', '3', '10', '0', '622923', '永靖县');
INSERT INTO `region` VALUES ('623', '广河县', '64', '3', '10', '0', '622924', '广河县');
INSERT INTO `region` VALUES ('624', '和政县', '64', '3', '10', '0', '622925', '和政县');
INSERT INTO `region` VALUES ('625', '东乡族自治县', '64', '3', '10', '0', '622926', '东乡族自治县');
INSERT INTO `region` VALUES ('626', '积石山', '64', '3', '10', '0', '622927', '积石山');
INSERT INTO `region` VALUES ('627', '成县', '65', '3', '10', '0', '621221', '成县');
INSERT INTO `region` VALUES ('628', '徽县', '65', '3', '10', '0', '621227', '徽县');
INSERT INTO `region` VALUES ('629', '康县', '65', '3', '10', '0', '621224', '康县');
INSERT INTO `region` VALUES ('630', '礼县', '65', '3', '10', '0', '621226', '礼县');
INSERT INTO `region` VALUES ('631', '两当县', '65', '3', '10', '0', '621228', '两当县');
INSERT INTO `region` VALUES ('632', '文县', '65', '3', '10', '0', '621222', '文县');
INSERT INTO `region` VALUES ('633', '西和县', '65', '3', '10', '0', '621225', '西和县');
INSERT INTO `region` VALUES ('634', '宕昌县', '65', '3', '10', '0', '621223', '宕昌县');
INSERT INTO `region` VALUES ('635', '武都区', '65', '3', '10', '0', '621202', '武都区');
INSERT INTO `region` VALUES ('636', '崇信县', '66', '3', '10', '0', '620823', '崇信县');
INSERT INTO `region` VALUES ('637', '华亭县', '66', '3', '10', '0', '620824', '华亭县');
INSERT INTO `region` VALUES ('638', '静宁县', '66', '3', '10', '0', '620826', '静宁县');
INSERT INTO `region` VALUES ('639', '灵台县', '66', '3', '10', '0', '620822', '灵台县');
INSERT INTO `region` VALUES ('640', '崆峒区', '66', '3', '10', '0', '620802', '崆峒区');
INSERT INTO `region` VALUES ('641', '庄浪县', '66', '3', '10', '0', '620825', '庄浪县');
INSERT INTO `region` VALUES ('642', '泾川县', '66', '3', '10', '0', '620821', '泾川县');
INSERT INTO `region` VALUES ('643', '临洮县', '67', '3', '10', '0', '621124', '临洮县');
INSERT INTO `region` VALUES ('644', '陇西县', '67', '3', '10', '0', '621122', '陇西县');
INSERT INTO `region` VALUES ('645', '通渭县', '67', '3', '10', '0', '621121', '通渭县');
INSERT INTO `region` VALUES ('646', '渭源县', '67', '3', '10', '0', '621123', '渭源县');
INSERT INTO `region` VALUES ('647', '漳县', '67', '3', '10', '0', '621125', '漳县');
INSERT INTO `region` VALUES ('648', '岷县', '67', '3', '10', '0', '621126', '岷县');
INSERT INTO `region` VALUES ('649', '安定区', '67', '3', '10', '0', '621102', '安定区');
INSERT INTO `region` VALUES ('650', '合作市', '68', '3', '10', '0', '623001', '合作市');
INSERT INTO `region` VALUES ('651', '临潭县', '68', '3', '10', '0', '623021', '临潭县');
INSERT INTO `region` VALUES ('652', '卓尼县', '68', '3', '10', '0', '623022', '卓尼县');
INSERT INTO `region` VALUES ('653', '舟曲县', '68', '3', '10', '0', '623023', '舟曲县');
INSERT INTO `region` VALUES ('654', '迭部县', '68', '3', '10', '0', '623024', '迭部县');
INSERT INTO `region` VALUES ('655', '玛曲县', '68', '3', '10', '0', '623025', '玛曲县');
INSERT INTO `region` VALUES ('656', '碌曲县', '68', '3', '10', '0', '623026', '碌曲县');
INSERT INTO `region` VALUES ('657', '夏河县', '68', '3', '10', '0', '623027', '夏河县');
INSERT INTO `region` VALUES ('658', '嘉峪关市', '69', '3', '10', '0', '620200', '嘉峪关市');
INSERT INTO `region` VALUES ('659', '金川区', '70', '3', '10', '0', '620302', '金川区');
INSERT INTO `region` VALUES ('660', '永昌县', '70', '3', '10', '0', '620321', '永昌县');
INSERT INTO `region` VALUES ('661', '合水县', '71', '3', '10', '0', '621024', '合水县');
INSERT INTO `region` VALUES ('662', '华池县', '71', '3', '10', '0', '621023', '华池县');
INSERT INTO `region` VALUES ('663', '环县', '71', '3', '10', '0', '621022', '环县');
INSERT INTO `region` VALUES ('664', '宁县', '71', '3', '10', '0', '621026', '宁县');
INSERT INTO `region` VALUES ('665', '庆城县', '71', '3', '10', '0', '621021', '庆城县');
INSERT INTO `region` VALUES ('666', '西峰区', '71', '3', '10', '0', '621002', '西峰区');
INSERT INTO `region` VALUES ('667', '镇原县', '71', '3', '10', '0', '621027', '镇原县');
INSERT INTO `region` VALUES ('668', '正宁县', '71', '3', '10', '0', '621025', '正宁县');
INSERT INTO `region` VALUES ('669', '甘谷县', '72', '3', '10', '0', '620523', '甘谷县');
INSERT INTO `region` VALUES ('670', '秦安县', '72', '3', '10', '0', '620522', '秦安县');
INSERT INTO `region` VALUES ('671', '清水县', '72', '3', '10', '0', '620521', '清水县');
INSERT INTO `region` VALUES ('672', '秦州区', '72', '3', '10', '0', '620502', '秦州区');
INSERT INTO `region` VALUES ('673', '麦积区', '72', '3', '10', '0', '620503', '麦积区');
INSERT INTO `region` VALUES ('674', '武山县', '72', '3', '10', '0', '620524', '武山县');
INSERT INTO `region` VALUES ('675', '张家川', '72', '3', '10', '0', '620525', '张家川');
INSERT INTO `region` VALUES ('676', '古浪县', '73', '3', '10', '0', '620622', '古浪县');
INSERT INTO `region` VALUES ('677', '民勤县', '73', '3', '10', '0', '620621', '民勤县');
INSERT INTO `region` VALUES ('678', '天祝', '73', '3', '10', '0', '620623', '天祝');
INSERT INTO `region` VALUES ('679', '凉州区', '73', '3', '10', '0', '620602', '凉州区');
INSERT INTO `region` VALUES ('680', '高台县', '74', '3', '10', '0', '620724', '高台县');
INSERT INTO `region` VALUES ('681', '临泽县', '74', '3', '10', '0', '620723', '临泽县');
INSERT INTO `region` VALUES ('682', '民乐县', '74', '3', '10', '0', '620722', '民乐县');
INSERT INTO `region` VALUES ('683', '山丹县', '74', '3', '10', '0', '620725', '山丹县');
INSERT INTO `region` VALUES ('684', '肃南', '74', '3', '10', '0', '620721', '肃南');
INSERT INTO `region` VALUES ('685', '甘州区', '74', '3', '10', '0', '620702', '甘州区');
INSERT INTO `region` VALUES ('686', '白银区', '75', '3', '10', '0', '620400', '白银区');
INSERT INTO `region` VALUES ('687', '平川区', '75', '3', '10', '0', '620403', '平川区');
INSERT INTO `region` VALUES ('688', '会宁县', '75', '3', '10', '0', '620422', '会宁县');
INSERT INTO `region` VALUES ('689', '景泰县', '75', '3', '10', '0', '620423', '景泰县');
INSERT INTO `region` VALUES ('690', '靖远县', '75', '3', '10', '0', '620421', '靖远县');
INSERT INTO `region` VALUES ('691', '皋兰县', '76', '3', '10', '0', '620122', '皋兰县');
INSERT INTO `region` VALUES ('692', '城关区', '76', '3', '10', '0', '620102', '城关区');
INSERT INTO `region` VALUES ('693', '七里河区', '76', '3', '10', '0', '620103', '七里河区');
INSERT INTO `region` VALUES ('694', '西固区', '76', '3', '10', '0', '620104', '西固区');
INSERT INTO `region` VALUES ('695', '安宁区', '76', '3', '10', '0', '620105', '安宁区');
INSERT INTO `region` VALUES ('696', '红古区', '76', '3', '10', '0', '620111', '红古区');
INSERT INTO `region` VALUES ('697', '永登县', '76', '3', '10', '0', '620121', '永登县');
INSERT INTO `region` VALUES ('698', '榆中县', '76', '3', '10', '0', '620123', '榆中县');
INSERT INTO `region` VALUES ('699', '从化市', '77', '3', '10', '0', '440184', '从化市');
INSERT INTO `region` VALUES ('700', '天河区', '77', '3', '10', '0', '440106', '天河区');
INSERT INTO `region` VALUES ('701', '东山区', '77', '3', '10', '0', '0', '东山区');
INSERT INTO `region` VALUES ('702', '白云区', '77', '3', '10', '0', '440111', '白云区');
INSERT INTO `region` VALUES ('703', '海珠区', '77', '3', '10', '0', '440105', '海珠区');
INSERT INTO `region` VALUES ('704', '荔湾区', '77', '3', '10', '0', '440103', '荔湾区');
INSERT INTO `region` VALUES ('705', '越秀区', '77', '3', '10', '0', '440104', '越秀区');
INSERT INTO `region` VALUES ('706', '黄埔区', '77', '3', '10', '0', '440112', '黄埔区');
INSERT INTO `region` VALUES ('707', '番禺区', '77', '3', '10', '0', '440113', '番禺区');
INSERT INTO `region` VALUES ('708', '花都区', '77', '3', '10', '0', '440114', '花都区');
INSERT INTO `region` VALUES ('709', '增城区', '77', '3', '10', '0', '440183', '增城区');
INSERT INTO `region` VALUES ('710', '从化区', '77', '3', '10', '0', '440184', '从化区');
INSERT INTO `region` VALUES ('711', '市郊', '77', '3', '10', '0', '0', '市郊');
INSERT INTO `region` VALUES ('712', '福田区', '78', '3', '10', '0', '440304', '福田区');
INSERT INTO `region` VALUES ('713', '罗湖区', '78', '3', '10', '0', '440303', '罗湖区');
INSERT INTO `region` VALUES ('714', '南山区', '78', '3', '10', '0', '440305', '南山区');
INSERT INTO `region` VALUES ('715', '宝安区', '78', '3', '10', '0', '440306', '宝安区');
INSERT INTO `region` VALUES ('716', '龙岗区', '78', '3', '10', '0', '440307', '龙岗区');
INSERT INTO `region` VALUES ('717', '盐田区', '78', '3', '10', '0', '440308', '盐田区');
INSERT INTO `region` VALUES ('718', '湘桥区', '79', '3', '10', '0', '445102', '湘桥区');
INSERT INTO `region` VALUES ('719', '潮安县', '79', '3', '10', '0', '445103', '潮安县');
INSERT INTO `region` VALUES ('720', '饶平县', '79', '3', '10', '0', '445122', '饶平县');
INSERT INTO `region` VALUES ('721', '南城区', '226', '3', '10', '0', '361021', '南城区');
INSERT INTO `region` VALUES ('722', '东城区', '80', '3', '10', '0', '441931', '东城区');
INSERT INTO `region` VALUES ('723', '万江区', '80', '3', '10', '0', '441924', '万江区');
INSERT INTO `region` VALUES ('724', '莞城区', '80', '3', '10', '0', '441917', '莞城区');
INSERT INTO `region` VALUES ('725', '石龙镇', '155', '3', '10', '0', '410404', '石龙镇');
INSERT INTO `region` VALUES ('726', '虎门镇', '80', '3', '10', '0', '441933', '虎门镇');
INSERT INTO `region` VALUES ('727', '麻涌镇', '80', '3', '10', '0', '441911', '麻涌镇');
INSERT INTO `region` VALUES ('728', '道滘镇', '80', '3', '10', '0', '441903', '道滘镇');
INSERT INTO `region` VALUES ('729', '石碣镇', '80', '3', '10', '0', '441909', '石碣镇');
INSERT INTO `region` VALUES ('730', '沙田镇', '80', '3', '10', '0', '441904', '沙田镇');
INSERT INTO `region` VALUES ('731', '望牛墩镇', '80', '3', '10', '0', '441913', '望牛墩镇');
INSERT INTO `region` VALUES ('732', '洪梅镇', '80', '3', '10', '0', '441910', '洪梅镇');
INSERT INTO `region` VALUES ('733', '茶山镇', '80', '3', '10', '0', '441914', '茶山镇');
INSERT INTO `region` VALUES ('734', '寮步镇', '80', '3', '10', '0', '441920', '寮步镇');
INSERT INTO `region` VALUES ('735', '大岭山镇', '80', '3', '10', '0', '441921', '大岭山镇');
INSERT INTO `region` VALUES ('736', '大朗镇', '80', '3', '10', '0', '441926', '大朗镇');
INSERT INTO `region` VALUES ('737', '黄江镇', '80', '3', '10', '0', '441932', '黄江镇');
INSERT INTO `region` VALUES ('738', '樟木头', '80', '3', '10', '0', '441925', '樟木头');
INSERT INTO `region` VALUES ('739', '凤岗镇', '80', '3', '10', '0', '441928', '凤岗镇');
INSERT INTO `region` VALUES ('740', '塘厦镇', '80', '3', '10', '0', '441927', '塘厦镇');
INSERT INTO `region` VALUES ('741', '谢岗镇', '80', '3', '10', '0', '441915', '谢岗镇');
INSERT INTO `region` VALUES ('742', '厚街镇', '80', '3', '10', '0', '441923', '厚街镇');
INSERT INTO `region` VALUES ('743', '清溪镇', '80', '3', '10', '0', '441929', '清溪镇');
INSERT INTO `region` VALUES ('744', '常平镇', '80', '3', '10', '0', '441922', '常平镇');
INSERT INTO `region` VALUES ('745', '桥头镇', '80', '3', '10', '0', '441912', '桥头镇');
INSERT INTO `region` VALUES ('746', '横沥镇', '80', '3', '10', '0', '441930', '横沥镇');
INSERT INTO `region` VALUES ('747', '东坑镇', '80', '3', '10', '0', '441902', '东坑镇');
INSERT INTO `region` VALUES ('748', '企石镇', '80', '3', '10', '0', '441908', '企石镇');
INSERT INTO `region` VALUES ('749', '石排镇', '80', '3', '10', '0', '441907', '石排镇');
INSERT INTO `region` VALUES ('750', '长安镇', '80', '3', '10', '0', '441919', '长安镇');
INSERT INTO `region` VALUES ('751', '中堂镇', '80', '3', '10', '0', '441901', '中堂镇');
INSERT INTO `region` VALUES ('752', '高埗镇', '80', '3', '10', '0', '441905', '高埗镇');
INSERT INTO `region` VALUES ('753', '茂南区', '81', '3', '10', '0', '440902', '茂南区');
INSERT INTO `region` VALUES ('754', '茂港区', '81', '3', '10', '0', '440903', '茂港区');
INSERT INTO `region` VALUES ('755', '高州市', '81', '3', '10', '0', '440981', '高州市');
INSERT INTO `region` VALUES ('756', '化州市', '81', '3', '10', '0', '440982', '化州市');
INSERT INTO `region` VALUES ('757', '信宜市', '81', '3', '10', '0', '440983', '信宜市');
INSERT INTO `region` VALUES ('758', '电白县', '81', '3', '10', '0', '440923', '电白县');
INSERT INTO `region` VALUES ('759', '榕城区', '82', '3', '10', '0', '445202', '榕城区');
INSERT INTO `region` VALUES ('760', '普宁市', '82', '3', '10', '0', '445281', '普宁市');
INSERT INTO `region` VALUES ('761', '揭东县', '82', '3', '10', '0', '445203', '揭东县');
INSERT INTO `region` VALUES ('762', '揭西县', '82', '3', '10', '0', '445222', '揭西县');
INSERT INTO `region` VALUES ('763', '惠来县', '82', '3', '10', '0', '445224', '惠来县');
INSERT INTO `region` VALUES ('764', '清城区', '83', '3', '10', '0', '441802', '清城区');
INSERT INTO `region` VALUES ('765', '英德市', '83', '3', '10', '0', '441881', '英德市');
INSERT INTO `region` VALUES ('766', '连州市', '83', '3', '10', '0', '441882', '连州市');
INSERT INTO `region` VALUES ('767', '佛冈县', '83', '3', '10', '0', '441821', '佛冈县');
INSERT INTO `region` VALUES ('768', '阳山县', '83', '3', '10', '0', '441823', '阳山县');
INSERT INTO `region` VALUES ('769', '清新县', '83', '3', '10', '0', '441803', '清新县');
INSERT INTO `region` VALUES ('770', '连山', '83', '3', '10', '0', '441825', '连山');
INSERT INTO `region` VALUES ('771', '连南', '83', '3', '10', '0', '441826', '连南');
INSERT INTO `region` VALUES ('772', '梅县', '84', '3', '10', '0', '441421', '梅县');
INSERT INTO `region` VALUES ('773', '梅江区', '84', '3', '10', '0', '441402', '梅江区');
INSERT INTO `region` VALUES ('774', '兴宁市', '84', '3', '10', '0', '441481', '兴宁市');
INSERT INTO `region` VALUES ('775', '大埔县', '84', '3', '10', '0', '441422', '大埔县');
INSERT INTO `region` VALUES ('776', '丰顺县', '84', '3', '10', '0', '441423', '丰顺县');
INSERT INTO `region` VALUES ('777', '五华县', '84', '3', '10', '0', '441424', '五华县');
INSERT INTO `region` VALUES ('778', '平远县', '84', '3', '10', '0', '441426', '平远县');
INSERT INTO `region` VALUES ('779', '蕉岭县', '84', '3', '10', '0', '441427', '蕉岭县');
INSERT INTO `region` VALUES ('780', '东源县', '85', '3', '10', '0', '441625', '东源县');
INSERT INTO `region` VALUES ('781', '和平县', '85', '3', '10', '0', '441624', '和平县');
INSERT INTO `region` VALUES ('782', '源城区', '85', '3', '10', '0', '441602', '源城区');
INSERT INTO `region` VALUES ('783', '连平县', '85', '3', '10', '0', '441623', '连平县');
INSERT INTO `region` VALUES ('784', '龙川县', '85', '3', '10', '0', '441622', '龙川县');
INSERT INTO `region` VALUES ('785', '紫金县', '85', '3', '10', '0', '441621', '紫金县');
INSERT INTO `region` VALUES ('786', '禅城区', '86', '3', '10', '0', '440604', '禅城区');
INSERT INTO `region` VALUES ('787', '南海区', '86', '3', '10', '0', '440605', '南海区');
INSERT INTO `region` VALUES ('788', '顺德区', '86', '3', '10', '0', '440606', '顺德区');
INSERT INTO `region` VALUES ('789', '三水区', '86', '3', '10', '0', '440607', '三水区');
INSERT INTO `region` VALUES ('790', '高明区', '86', '3', '10', '0', '440608', '高明区');
INSERT INTO `region` VALUES ('791', '江海区', '87', '3', '10', '0', '440704', '江海区');
INSERT INTO `region` VALUES ('792', '蓬江区', '87', '3', '10', '0', '440703', '蓬江区');
INSERT INTO `region` VALUES ('793', '新会区', '87', '3', '10', '0', '440705', '新会区');
INSERT INTO `region` VALUES ('794', '台山市', '87', '3', '10', '0', '440781', '台山市');
INSERT INTO `region` VALUES ('795', '开平市', '87', '3', '10', '0', '440783', '开平市');
INSERT INTO `region` VALUES ('796', '鹤山市', '87', '3', '10', '0', '440784', '鹤山市');
INSERT INTO `region` VALUES ('797', '恩平市', '87', '3', '10', '0', '440785', '恩平市');
INSERT INTO `region` VALUES ('798', '惠阳区', '88', '3', '10', '0', '441303', '惠阳区');
INSERT INTO `region` VALUES ('799', '惠城区', '88', '3', '10', '0', '441302', '惠城区');
INSERT INTO `region` VALUES ('800', '大亚湾', '88', '3', '10', '0', '0', '大亚湾');
INSERT INTO `region` VALUES ('801', '博罗县', '88', '3', '10', '0', '441322', '博罗县');
INSERT INTO `region` VALUES ('802', '惠东县', '88', '3', '10', '0', '441323', '惠东县');
INSERT INTO `region` VALUES ('803', '龙门县', '88', '3', '10', '0', '441324', '龙门县');
INSERT INTO `region` VALUES ('804', '赤坎区', '89', '3', '10', '0', '440802', '赤坎区');
INSERT INTO `region` VALUES ('805', '霞山区', '89', '3', '10', '0', '440803', '霞山区');
INSERT INTO `region` VALUES ('806', '坡头区', '89', '3', '10', '0', '440804', '坡头区');
INSERT INTO `region` VALUES ('807', '麻章区', '89', '3', '10', '0', '440811', '麻章区');
INSERT INTO `region` VALUES ('808', '廉江市', '89', '3', '10', '0', '440881', '廉江市');
INSERT INTO `region` VALUES ('809', '雷州市', '89', '3', '10', '0', '440882', '雷州市');
INSERT INTO `region` VALUES ('810', '吴川市', '89', '3', '10', '0', '440883', '吴川市');
INSERT INTO `region` VALUES ('811', '遂溪县', '89', '3', '10', '0', '440823', '遂溪县');
INSERT INTO `region` VALUES ('812', '徐闻县', '89', '3', '10', '0', '440825', '徐闻县');
INSERT INTO `region` VALUES ('813', '云城区', '90', '3', '10', '0', '445302', '云城区');
INSERT INTO `region` VALUES ('814', '罗定市', '90', '3', '10', '0', '445381', '罗定市');
INSERT INTO `region` VALUES ('815', '新兴县', '90', '3', '10', '0', '445321', '新兴县');
INSERT INTO `region` VALUES ('816', '郁南县', '90', '3', '10', '0', '445322', '郁南县');
INSERT INTO `region` VALUES ('817', '云安县', '90', '3', '10', '0', '445323', '云安县');
INSERT INTO `region` VALUES ('818', '石岐街道', '91', '3', '10', '0', '0', '石岐街道');
INSERT INTO `region` VALUES ('819', '东区街道', '91', '3', '10', '0', '442021', '东区街道');
INSERT INTO `region` VALUES ('820', '西区街道', '91', '3', '10', '0', '442022', '西区街道');
INSERT INTO `region` VALUES ('821', '环城街道', '91', '3', '10', '0', '0', '环城街道');
INSERT INTO `region` VALUES ('822', '中山港街道', '91', '3', '10', '0', '0', '中山港街道');
INSERT INTO `region` VALUES ('823', '五桂山街道', '91', '3', '10', '0', '0', '五桂山街道');
INSERT INTO `region` VALUES ('824', '肇庆市', '92', '3', '10', '0', '0', '肇庆市');
INSERT INTO `region` VALUES ('825', '高要市', '92', '3', '10', '0', '441283', '高要市');
INSERT INTO `region` VALUES ('826', '四会市', '92', '3', '10', '0', '441284', '四会市');
INSERT INTO `region` VALUES ('827', '广宁县', '92', '3', '10', '0', '441223', '广宁县');
INSERT INTO `region` VALUES ('828', '怀集县', '92', '3', '10', '0', '441224', '怀集县');
INSERT INTO `region` VALUES ('829', '封开县', '92', '3', '10', '0', '441225', '封开县');
INSERT INTO `region` VALUES ('830', '德庆县', '92', '3', '10', '0', '441226', '德庆县');
INSERT INTO `region` VALUES ('831', '城区', '93', '3', '10', '0', '441502', '城区');
INSERT INTO `region` VALUES ('832', '陆丰市', '93', '3', '10', '0', '441581', '陆丰市');
INSERT INTO `region` VALUES ('833', '海丰县', '93', '3', '10', '0', '441521', '海丰县');
INSERT INTO `region` VALUES ('834', '陆河县', '93', '3', '10', '0', '441523', '陆河县');
INSERT INTO `region` VALUES ('835', '南澳县', '94', '3', '10', '0', '440523', '南澳县');
INSERT INTO `region` VALUES ('836', '潮阳区', '94', '3', '10', '0', '440513', '潮阳区');
INSERT INTO `region` VALUES ('837', '澄海区', '94', '3', '10', '0', '440515', '澄海区');
INSERT INTO `region` VALUES ('838', '龙湖区', '94', '3', '10', '0', '440507', '龙湖区');
INSERT INTO `region` VALUES ('839', '金平区', '94', '3', '10', '0', '440511', '金平区');
INSERT INTO `region` VALUES ('840', '濠江区', '94', '3', '10', '0', '440512', '濠江区');
INSERT INTO `region` VALUES ('841', '潮南区', '94', '3', '10', '0', '440514', '潮南区');
INSERT INTO `region` VALUES ('842', '江城区', '95', '3', '10', '0', '441702', '江城区');
INSERT INTO `region` VALUES ('843', '阳春市', '95', '3', '10', '0', '441781', '阳春市');
INSERT INTO `region` VALUES ('844', '阳西县', '95', '3', '10', '0', '441721', '阳西县');
INSERT INTO `region` VALUES ('845', '阳东县', '95', '3', '10', '0', '441723', '阳东县');
INSERT INTO `region` VALUES ('846', '曲江县', '96', '3', '10', '0', '440205', '曲江县');
INSERT INTO `region` VALUES ('847', '浈江区', '96', '3', '10', '0', '440204', '浈江区');
INSERT INTO `region` VALUES ('848', '武江区', '96', '3', '10', '0', '440203', '武江区');
INSERT INTO `region` VALUES ('849', '曲江区', '96', '3', '10', '0', '440205', '曲江区');
INSERT INTO `region` VALUES ('850', '乐昌市', '96', '3', '10', '0', '440281', '乐昌市');
INSERT INTO `region` VALUES ('851', '南雄市', '96', '3', '10', '0', '440282', '南雄市');
INSERT INTO `region` VALUES ('852', '始兴县', '96', '3', '10', '0', '440222', '始兴县');
INSERT INTO `region` VALUES ('853', '仁化县', '96', '3', '10', '0', '440224', '仁化县');
INSERT INTO `region` VALUES ('854', '翁源县', '96', '3', '10', '0', '440229', '翁源县');
INSERT INTO `region` VALUES ('855', '新丰县', '96', '3', '10', '0', '440233', '新丰县');
INSERT INTO `region` VALUES ('856', '乳源', '96', '3', '10', '0', '440232', '乳源');
INSERT INTO `region` VALUES ('857', '香洲区', '97', '3', '10', '0', '440402', '香洲区');
INSERT INTO `region` VALUES ('858', '斗门区', '97', '3', '10', '0', '440403', '斗门区');
INSERT INTO `region` VALUES ('859', '金湾区', '97', '3', '10', '0', '440404', '金湾区');
INSERT INTO `region` VALUES ('860', '港口区', '98', '3', '10', '0', '450602', '港口区');
INSERT INTO `region` VALUES ('861', '防城区', '98', '3', '10', '0', '450603', '防城区');
INSERT INTO `region` VALUES ('862', '东兴市', '98', '3', '10', '0', '450681', '东兴市');
INSERT INTO `region` VALUES ('863', '上思县', '98', '3', '10', '0', '450621', '上思县');
INSERT INTO `region` VALUES ('864', '港北区', '99', '3', '10', '0', '450802', '港北区');
INSERT INTO `region` VALUES ('865', '港南区', '99', '3', '10', '0', '450803', '港南区');
INSERT INTO `region` VALUES ('866', '覃塘区', '99', '3', '10', '0', '450804', '覃塘区');
INSERT INTO `region` VALUES ('867', '桂平市', '99', '3', '10', '0', '450881', '桂平市');
INSERT INTO `region` VALUES ('868', '平南县', '99', '3', '10', '0', '450821', '平南县');
INSERT INTO `region` VALUES ('869', '海城区', '100', '3', '10', '0', '450502', '海城区');
INSERT INTO `region` VALUES ('870', '银海区', '100', '3', '10', '0', '450503', '银海区');
INSERT INTO `region` VALUES ('871', '铁山港区', '100', '3', '10', '0', '450512', '铁山港区');
INSERT INTO `region` VALUES ('872', '合浦县', '100', '3', '10', '0', '450521', '合浦县');
INSERT INTO `region` VALUES ('873', '江州区', '101', '3', '10', '0', '451402', '江州区');
INSERT INTO `region` VALUES ('874', '凭祥市', '101', '3', '10', '0', '451481', '凭祥市');
INSERT INTO `region` VALUES ('875', '宁明县', '101', '3', '10', '0', '451422', '宁明县');
INSERT INTO `region` VALUES ('876', '扶绥县', '101', '3', '10', '0', '451421', '扶绥县');
INSERT INTO `region` VALUES ('877', '龙州县', '101', '3', '10', '0', '451423', '龙州县');
INSERT INTO `region` VALUES ('878', '大新县', '101', '3', '10', '0', '451424', '大新县');
INSERT INTO `region` VALUES ('879', '天等县', '101', '3', '10', '0', '451425', '天等县');
INSERT INTO `region` VALUES ('880', '秀峰区', '102', '3', '10', '0', '450302', '秀峰区');
INSERT INTO `region` VALUES ('881', '叠彩区', '102', '3', '10', '0', '450303', '叠彩区');
INSERT INTO `region` VALUES ('882', '象山区', '102', '3', '10', '0', '450304', '象山区');
INSERT INTO `region` VALUES ('883', '七星区', '102', '3', '10', '0', '450305', '七星区');
INSERT INTO `region` VALUES ('884', '雁山区', '102', '3', '10', '0', '450311', '雁山区');
INSERT INTO `region` VALUES ('885', '阳朔县', '102', '3', '10', '0', '450321', '阳朔县');
INSERT INTO `region` VALUES ('886', '临桂县', '102', '3', '10', '0', '450312', '临桂县');
INSERT INTO `region` VALUES ('887', '灵川县', '102', '3', '10', '0', '450323', '灵川县');
INSERT INTO `region` VALUES ('888', '全州县', '102', '3', '10', '0', '450324', '全州县');
INSERT INTO `region` VALUES ('889', '平乐县', '102', '3', '10', '0', '450330', '平乐县');
INSERT INTO `region` VALUES ('890', '兴安县', '102', '3', '10', '0', '450325', '兴安县');
INSERT INTO `region` VALUES ('891', '灌阳县', '102', '3', '10', '0', '450327', '灌阳县');
INSERT INTO `region` VALUES ('892', '荔浦县', '102', '3', '10', '0', '450331', '荔浦县');
INSERT INTO `region` VALUES ('893', '资源县', '102', '3', '10', '0', '450329', '资源县');
INSERT INTO `region` VALUES ('894', '永福县', '102', '3', '10', '0', '450326', '永福县');
INSERT INTO `region` VALUES ('895', '龙胜', '102', '3', '10', '0', '450328', '龙胜');
INSERT INTO `region` VALUES ('896', '恭城', '102', '3', '10', '0', '450332', '恭城');
INSERT INTO `region` VALUES ('897', '右江区', '103', '3', '10', '0', '451002', '右江区');
INSERT INTO `region` VALUES ('898', '凌云县', '103', '3', '10', '0', '451027', '凌云县');
INSERT INTO `region` VALUES ('899', '平果县', '103', '3', '10', '0', '451023', '平果县');
INSERT INTO `region` VALUES ('900', '西林县', '103', '3', '10', '0', '451030', '西林县');
INSERT INTO `region` VALUES ('901', '乐业县', '103', '3', '10', '0', '451028', '乐业县');
INSERT INTO `region` VALUES ('902', '德保县', '103', '3', '10', '0', '451024', '德保县');
INSERT INTO `region` VALUES ('903', '田林县', '103', '3', '10', '0', '451029', '田林县');
INSERT INTO `region` VALUES ('904', '田阳县', '103', '3', '10', '0', '451021', '田阳县');
INSERT INTO `region` VALUES ('905', '靖西县', '103', '3', '10', '0', '451025', '靖西县');
INSERT INTO `region` VALUES ('906', '田东县', '103', '3', '10', '0', '451022', '田东县');
INSERT INTO `region` VALUES ('907', '那坡县', '103', '3', '10', '0', '451026', '那坡县');
INSERT INTO `region` VALUES ('908', '隆林', '103', '3', '10', '0', '451031', '隆林');
INSERT INTO `region` VALUES ('909', '邕宁区', '104', '3', '10', '0', '450109', '邕宁区');
INSERT INTO `region` VALUES ('910', '青秀区', '104', '3', '10', '0', '450103', '青秀区');
INSERT INTO `region` VALUES ('911', '兴宁区', '104', '3', '10', '0', '450102', '兴宁区');
INSERT INTO `region` VALUES ('912', '良庆区', '104', '3', '10', '0', '450108', '良庆区');
INSERT INTO `region` VALUES ('913', '西乡塘区', '104', '3', '10', '0', '450107', '西乡塘区');
INSERT INTO `region` VALUES ('914', '江南区', '104', '3', '10', '0', '450105', '江南区');
INSERT INTO `region` VALUES ('915', '武鸣县', '104', '3', '10', '0', '450122', '武鸣县');
INSERT INTO `region` VALUES ('916', '隆安县', '104', '3', '10', '0', '450123', '隆安县');
INSERT INTO `region` VALUES ('917', '马山县', '104', '3', '10', '0', '450124', '马山县');
INSERT INTO `region` VALUES ('918', '上林县', '104', '3', '10', '0', '450125', '上林县');
INSERT INTO `region` VALUES ('919', '宾阳县', '104', '3', '10', '0', '450126', '宾阳县');
INSERT INTO `region` VALUES ('920', '横县', '104', '3', '10', '0', '450127', '横县');
INSERT INTO `region` VALUES ('921', '玉州区', '105', '3', '10', '0', '450902', '玉州区');
INSERT INTO `region` VALUES ('922', '北流市', '105', '3', '10', '0', '450981', '北流市');
INSERT INTO `region` VALUES ('923', '容县', '105', '3', '10', '0', '450921', '容县');
INSERT INTO `region` VALUES ('924', '陆川县', '105', '3', '10', '0', '450922', '陆川县');
INSERT INTO `region` VALUES ('925', '博白县', '105', '3', '10', '0', '450923', '博白县');
INSERT INTO `region` VALUES ('926', '兴业县', '105', '3', '10', '0', '450924', '兴业县');
INSERT INTO `region` VALUES ('927', '钦南区', '106', '3', '10', '0', '450702', '钦南区');
INSERT INTO `region` VALUES ('928', '钦北区', '106', '3', '10', '0', '450703', '钦北区');
INSERT INTO `region` VALUES ('929', '灵山县', '106', '3', '10', '0', '450721', '灵山县');
INSERT INTO `region` VALUES ('930', '浦北县', '106', '3', '10', '0', '450722', '浦北县');
INSERT INTO `region` VALUES ('931', '万秀区', '107', '3', '10', '0', '450403', '万秀区');
INSERT INTO `region` VALUES ('932', '蝶山区', '107', '3', '10', '0', '0', '蝶山区');
INSERT INTO `region` VALUES ('933', '长洲区', '107', '3', '10', '0', '450405', '长洲区');
INSERT INTO `region` VALUES ('934', '岑溪市', '107', '3', '10', '0', '450481', '岑溪市');
INSERT INTO `region` VALUES ('935', '苍梧县', '107', '3', '10', '0', '450421', '苍梧县');
INSERT INTO `region` VALUES ('936', '藤县', '107', '3', '10', '0', '450422', '藤县');
INSERT INTO `region` VALUES ('937', '蒙山县', '107', '3', '10', '0', '450423', '蒙山县');
INSERT INTO `region` VALUES ('938', '兴宾区', '108', '3', '10', '0', '451302', '兴宾区');
INSERT INTO `region` VALUES ('939', '合山市', '108', '3', '10', '0', '451381', '合山市');
INSERT INTO `region` VALUES ('940', '象州县', '108', '3', '10', '0', '451322', '象州县');
INSERT INTO `region` VALUES ('941', '武宣县', '108', '3', '10', '0', '451323', '武宣县');
INSERT INTO `region` VALUES ('942', '忻城县', '108', '3', '10', '0', '451321', '忻城县');
INSERT INTO `region` VALUES ('943', '金秀', '108', '3', '10', '0', '451324', '金秀');
INSERT INTO `region` VALUES ('944', '城中区', '109', '3', '10', '0', '450202', '城中区');
INSERT INTO `region` VALUES ('945', '鱼峰区', '109', '3', '10', '0', '450203', '鱼峰区');
INSERT INTO `region` VALUES ('946', '柳北区', '109', '3', '10', '0', '450205', '柳北区');
INSERT INTO `region` VALUES ('947', '柳南区', '109', '3', '10', '0', '450204', '柳南区');
INSERT INTO `region` VALUES ('948', '柳江县', '109', '3', '10', '0', '450221', '柳江县');
INSERT INTO `region` VALUES ('949', '柳城县', '109', '3', '10', '0', '450222', '柳城县');
INSERT INTO `region` VALUES ('950', '鹿寨县', '109', '3', '10', '0', '450223', '鹿寨县');
INSERT INTO `region` VALUES ('951', '融安县', '109', '3', '10', '0', '450224', '融安县');
INSERT INTO `region` VALUES ('952', '融水', '109', '3', '10', '0', '450225', '融水');
INSERT INTO `region` VALUES ('953', '三江', '109', '3', '10', '0', '450226', '三江');
INSERT INTO `region` VALUES ('954', '金城江区', '110', '3', '10', '0', '451202', '金城江区');
INSERT INTO `region` VALUES ('955', '宜州市', '110', '3', '10', '0', '451281', '宜州市');
INSERT INTO `region` VALUES ('956', '天峨县', '110', '3', '10', '0', '451222', '天峨县');
INSERT INTO `region` VALUES ('957', '凤山县', '110', '3', '10', '0', '451223', '凤山县');
INSERT INTO `region` VALUES ('958', '南丹县', '110', '3', '10', '0', '451221', '南丹县');
INSERT INTO `region` VALUES ('959', '东兰县', '110', '3', '10', '0', '451224', '东兰县');
INSERT INTO `region` VALUES ('960', '都安', '110', '3', '10', '0', '451228', '都安');
INSERT INTO `region` VALUES ('961', '罗城', '110', '3', '10', '0', '451225', '罗城');
INSERT INTO `region` VALUES ('962', '巴马', '110', '3', '10', '0', '451227', '巴马');
INSERT INTO `region` VALUES ('963', '环江', '110', '3', '10', '0', '451226', '环江');
INSERT INTO `region` VALUES ('964', '大化', '110', '3', '10', '0', '451229', '大化');
INSERT INTO `region` VALUES ('965', '八步区', '111', '3', '10', '0', '451102', '八步区');
INSERT INTO `region` VALUES ('966', '钟山县', '111', '3', '10', '0', '451122', '钟山县');
INSERT INTO `region` VALUES ('967', '昭平县', '111', '3', '10', '0', '451121', '昭平县');
INSERT INTO `region` VALUES ('968', '富川', '111', '3', '10', '0', '451123', '富川');
INSERT INTO `region` VALUES ('969', '南明区', '112', '3', '10', '0', '520102', '南明区');
INSERT INTO `region` VALUES ('970', '云岩区', '112', '3', '10', '0', '520103', '云岩区');
INSERT INTO `region` VALUES ('971', '花溪区', '112', '3', '10', '0', '520111', '花溪区');
INSERT INTO `region` VALUES ('972', '乌当区', '112', '3', '10', '0', '520112', '乌当区');
INSERT INTO `region` VALUES ('973', '白云区', '112', '3', '10', '0', '520113', '白云区');
INSERT INTO `region` VALUES ('974', '小河区', '112', '3', '10', '0', '0', '小河区');
INSERT INTO `region` VALUES ('975', '金阳新区', '112', '3', '10', '0', '0', '金阳新区');
INSERT INTO `region` VALUES ('976', '新天园区', '112', '3', '10', '0', '0', '新天园区');
INSERT INTO `region` VALUES ('977', '清镇市', '112', '3', '10', '0', '520181', '清镇市');
INSERT INTO `region` VALUES ('978', '开阳县', '112', '3', '10', '0', '520121', '开阳县');
INSERT INTO `region` VALUES ('979', '修文县', '112', '3', '10', '0', '520123', '修文县');
INSERT INTO `region` VALUES ('980', '息烽县', '112', '3', '10', '0', '520122', '息烽县');
INSERT INTO `region` VALUES ('981', '红花岗区', '113', '3', '10', '0', '520302', '红花岗区');
INSERT INTO `region` VALUES ('982', '务川县', '113', '3', '10', '0', '520326', '务川县');
INSERT INTO `region` VALUES ('983', '道真县', '113', '3', '10', '0', '520325', '道真县');
INSERT INTO `region` VALUES ('984', '汇川区', '113', '3', '10', '0', '520303', '汇川区');
INSERT INTO `region` VALUES ('985', '赤水市', '113', '3', '10', '0', '520381', '赤水市');
INSERT INTO `region` VALUES ('986', '仁怀市', '113', '3', '10', '0', '520382', '仁怀市');
INSERT INTO `region` VALUES ('987', '遵义县', '113', '3', '10', '0', '520321', '遵义县');
INSERT INTO `region` VALUES ('988', '桐梓县', '113', '3', '10', '0', '520322', '桐梓县');
INSERT INTO `region` VALUES ('989', '绥阳县', '113', '3', '10', '0', '520323', '绥阳县');
INSERT INTO `region` VALUES ('990', '正安县', '113', '3', '10', '0', '520324', '正安县');
INSERT INTO `region` VALUES ('991', '凤冈县', '113', '3', '10', '0', '520327', '凤冈县');
INSERT INTO `region` VALUES ('992', '湄潭县', '113', '3', '10', '0', '520328', '湄潭县');
INSERT INTO `region` VALUES ('993', '余庆县', '113', '3', '10', '0', '520329', '余庆县');
INSERT INTO `region` VALUES ('994', '习水县', '113', '3', '10', '0', '520330', '习水县');
INSERT INTO `region` VALUES ('995', '道真', '113', '3', '10', '0', '520325', '道真');
INSERT INTO `region` VALUES ('996', '务川', '113', '3', '10', '0', '520326', '务川');
INSERT INTO `region` VALUES ('997', '铜仁市', '114', '3', '10', '0', '520600', '铜仁市');
INSERT INTO `region` VALUES ('998', '江口县', '114', '3', '10', '0', '520621', '江口县');
INSERT INTO `region` VALUES ('999', '石阡县', '114', '3', '10', '0', '520623', '石阡县');
INSERT INTO `region` VALUES ('1000', '思南县', '114', '3', '10', '0', '520624', '思南县');
INSERT INTO `region` VALUES ('1001', '德江县', '114', '3', '10', '0', '520626', '德江县');
INSERT INTO `region` VALUES ('1002', '玉屏', '114', '3', '10', '0', '520622', '玉屏');
INSERT INTO `region` VALUES ('1003', '印江', '114', '3', '10', '0', '520625', '印江');
INSERT INTO `region` VALUES ('1004', '沿河', '114', '3', '10', '0', '520627', '沿河');
INSERT INTO `region` VALUES ('1005', '松桃', '114', '3', '10', '0', '520628', '松桃');
INSERT INTO `region` VALUES ('1006', '万山特区', '114', '3', '10', '0', '0', '万山特区');
INSERT INTO `region` VALUES ('1007', '兴义市', '115', '3', '10', '0', '522301', '兴义市');
INSERT INTO `region` VALUES ('1008', '兴仁县', '115', '3', '10', '0', '522322', '兴仁县');
INSERT INTO `region` VALUES ('1009', '普安县', '115', '3', '10', '0', '522323', '普安县');
INSERT INTO `region` VALUES ('1010', '晴隆县', '115', '3', '10', '0', '522324', '晴隆县');
INSERT INTO `region` VALUES ('1011', '贞丰县', '115', '3', '10', '0', '522325', '贞丰县');
INSERT INTO `region` VALUES ('1012', '望谟县', '115', '3', '10', '0', '522326', '望谟县');
INSERT INTO `region` VALUES ('1013', '册亨县', '115', '3', '10', '0', '522327', '册亨县');
INSERT INTO `region` VALUES ('1014', '安龙县', '115', '3', '10', '0', '522328', '安龙县');
INSERT INTO `region` VALUES ('1015', '都匀市', '116', '3', '10', '0', '522701', '都匀市');
INSERT INTO `region` VALUES ('1016', '福泉市', '116', '3', '10', '0', '522702', '福泉市');
INSERT INTO `region` VALUES ('1017', '荔波县', '116', '3', '10', '0', '522722', '荔波县');
INSERT INTO `region` VALUES ('1018', '贵定县', '116', '3', '10', '0', '522723', '贵定县');
INSERT INTO `region` VALUES ('1019', '瓮安县', '116', '3', '10', '0', '522725', '瓮安县');
INSERT INTO `region` VALUES ('1020', '独山县', '116', '3', '10', '0', '522726', '独山县');
INSERT INTO `region` VALUES ('1021', '平塘县', '116', '3', '10', '0', '522727', '平塘县');
INSERT INTO `region` VALUES ('1022', '罗甸县', '116', '3', '10', '0', '522728', '罗甸县');
INSERT INTO `region` VALUES ('1023', '长顺县', '116', '3', '10', '0', '522729', '长顺县');
INSERT INTO `region` VALUES ('1024', '龙里县', '116', '3', '10', '0', '522730', '龙里县');
INSERT INTO `region` VALUES ('1025', '惠水县', '116', '3', '10', '0', '522731', '惠水县');
INSERT INTO `region` VALUES ('1026', '三都', '116', '3', '10', '0', '522732', '三都');
INSERT INTO `region` VALUES ('1027', '凯里市', '117', '3', '10', '0', '522601', '凯里市');
INSERT INTO `region` VALUES ('1028', '黄平县', '117', '3', '10', '0', '522622', '黄平县');
INSERT INTO `region` VALUES ('1029', '施秉县', '117', '3', '10', '0', '522623', '施秉县');
INSERT INTO `region` VALUES ('1030', '三穗县', '117', '3', '10', '0', '522624', '三穗县');
INSERT INTO `region` VALUES ('1031', '镇远县', '117', '3', '10', '0', '522625', '镇远县');
INSERT INTO `region` VALUES ('1032', '岑巩县', '117', '3', '10', '0', '522626', '岑巩县');
INSERT INTO `region` VALUES ('1033', '天柱县', '117', '3', '10', '0', '522627', '天柱县');
INSERT INTO `region` VALUES ('1034', '锦屏县', '117', '3', '10', '0', '522628', '锦屏县');
INSERT INTO `region` VALUES ('1035', '剑河县', '117', '3', '10', '0', '522629', '剑河县');
INSERT INTO `region` VALUES ('1036', '台江县', '117', '3', '10', '0', '522630', '台江县');
INSERT INTO `region` VALUES ('1037', '黎平县', '117', '3', '10', '0', '522631', '黎平县');
INSERT INTO `region` VALUES ('1038', '榕江县', '117', '3', '10', '0', '522632', '榕江县');
INSERT INTO `region` VALUES ('1039', '从江县', '117', '3', '10', '0', '522633', '从江县');
INSERT INTO `region` VALUES ('1040', '雷山县', '117', '3', '10', '0', '522634', '雷山县');
INSERT INTO `region` VALUES ('1041', '麻江县', '117', '3', '10', '0', '522635', '麻江县');
INSERT INTO `region` VALUES ('1042', '丹寨县', '117', '3', '10', '0', '522636', '丹寨县');
INSERT INTO `region` VALUES ('1043', '钟山区', '118', '3', '10', '0', '520201', '钟山区');
INSERT INTO `region` VALUES ('1044', '六枝特区', '118', '3', '10', '0', '520203', '六枝特区');
INSERT INTO `region` VALUES ('1045', '水城县', '118', '3', '10', '0', '520221', '水城县');
INSERT INTO `region` VALUES ('1046', '盘县', '118', '3', '10', '0', '520222', '盘县');
INSERT INTO `region` VALUES ('1047', '毕节市', '119', '3', '10', '0', '0', '毕节市');
INSERT INTO `region` VALUES ('1048', '大方县', '119', '3', '10', '0', '520521', '大方县');
INSERT INTO `region` VALUES ('1049', '黔西县', '119', '3', '10', '0', '520522', '黔西县');
INSERT INTO `region` VALUES ('1050', '金沙县', '119', '3', '10', '0', '520523', '金沙县');
INSERT INTO `region` VALUES ('1051', '织金县', '119', '3', '10', '0', '520524', '织金县');
INSERT INTO `region` VALUES ('1052', '纳雍县', '119', '3', '10', '0', '520525', '纳雍县');
INSERT INTO `region` VALUES ('1053', '赫章县', '119', '3', '10', '0', '520527', '赫章县');
INSERT INTO `region` VALUES ('1054', '威宁', '119', '3', '10', '0', '520526', '威宁');
INSERT INTO `region` VALUES ('1055', '西秀区', '120', '3', '10', '0', '520402', '西秀区');
INSERT INTO `region` VALUES ('1056', '关岭', '120', '3', '10', '0', '520424', '关岭');
INSERT INTO `region` VALUES ('1057', '镇宁', '120', '3', '10', '0', '520423', '镇宁');
INSERT INTO `region` VALUES ('1058', '紫云', '120', '3', '10', '0', '520425', '紫云');
INSERT INTO `region` VALUES ('1059', '平坝县', '120', '3', '10', '0', '520421', '平坝县');
INSERT INTO `region` VALUES ('1060', '普定县', '120', '3', '10', '0', '520422', '普定县');
INSERT INTO `region` VALUES ('1061', '市区', '121', '3', '10', '0', '0', '市区');
INSERT INTO `region` VALUES ('1062', '洋浦开发区', '121', '3', '10', '0', '0', '洋浦开发区');
INSERT INTO `region` VALUES ('1063', '那大镇', '121', '3', '10', '0', '0', '那大镇');
INSERT INTO `region` VALUES ('1064', '王五镇', '121', '3', '10', '0', '0', '王五镇');
INSERT INTO `region` VALUES ('1065', '雅星镇', '121', '3', '10', '0', '0', '雅星镇');
INSERT INTO `region` VALUES ('1066', '大成镇', '121', '3', '10', '0', '0', '大成镇');
INSERT INTO `region` VALUES ('1067', '中和镇', '121', '3', '10', '0', '0', '中和镇');
INSERT INTO `region` VALUES ('1068', '峨蔓镇', '121', '3', '10', '0', '0', '峨蔓镇');
INSERT INTO `region` VALUES ('1070', '白马井镇', '121', '3', '10', '0', '0', '白马井镇');
INSERT INTO `region` VALUES ('1071', '兰洋镇', '121', '3', '10', '0', '0', '兰洋镇');
INSERT INTO `region` VALUES ('1072', '和庆镇', '121', '3', '10', '0', '0', '和庆镇');
INSERT INTO `region` VALUES ('1073', '海头镇', '121', '3', '10', '0', '0', '海头镇');
INSERT INTO `region` VALUES ('1074', '排浦镇', '121', '3', '10', '0', '0', '排浦镇');
INSERT INTO `region` VALUES ('1075', '东成镇', '121', '3', '10', '0', '0', '东成镇');
INSERT INTO `region` VALUES ('1076', '光村镇', '121', '3', '10', '0', '0', '光村镇');
INSERT INTO `region` VALUES ('1077', '木棠镇', '121', '3', '10', '0', '0', '木棠镇');
INSERT INTO `region` VALUES ('1078', '新州镇', '121', '3', '10', '0', '0', '新州镇');
INSERT INTO `region` VALUES ('1079', '三都镇', '116', '3', '10', '0', '522732', '三都镇');
INSERT INTO `region` VALUES ('1080', '其他', '121', '3', '10', '0', '0', '其他');
INSERT INTO `region` VALUES ('1081', '秀英区', '138', '3', '10', '0', '460105', '秀英区');
INSERT INTO `region` VALUES ('1082', '龙华区', '138', '3', '10', '0', '460106', '龙华区');
INSERT INTO `region` VALUES ('1083', '琼山区', '138', '3', '10', '0', '460107', '琼山区');
INSERT INTO `region` VALUES ('1084', '美兰区', '138', '3', '10', '0', '460108', '美兰区');
INSERT INTO `region` VALUES ('1085', '新市区', '139', '3', '10', '0', '130602', '新市区');
INSERT INTO `region` VALUES ('1086', '南市区', '139', '3', '10', '0', '130604', '南市区');
INSERT INTO `region` VALUES ('1087', '北市区', '139', '3', '10', '0', '130603', '北市区');
INSERT INTO `region` VALUES ('1088', '涿州市', '139', '3', '10', '0', '130681', '涿州市');
INSERT INTO `region` VALUES ('1089', '定州市', '139', '3', '10', '0', '130682', '定州市');
INSERT INTO `region` VALUES ('1090', '安国市', '139', '3', '10', '0', '130683', '安国市');
INSERT INTO `region` VALUES ('1091', '高碑店市', '139', '3', '10', '0', '130684', '高碑店市');
INSERT INTO `region` VALUES ('1092', '满城县', '139', '3', '10', '0', '130621', '满城县');
INSERT INTO `region` VALUES ('1093', '清苑县', '139', '3', '10', '0', '130622', '清苑县');
INSERT INTO `region` VALUES ('1094', '涞水县', '139', '3', '10', '0', '130623', '涞水县');
INSERT INTO `region` VALUES ('1095', '阜平县', '139', '3', '10', '0', '130624', '阜平县');
INSERT INTO `region` VALUES ('1096', '徐水县', '139', '3', '10', '0', '130625', '徐水县');
INSERT INTO `region` VALUES ('1097', '定兴县', '139', '3', '10', '0', '130626', '定兴县');
INSERT INTO `region` VALUES ('1098', '唐县', '139', '3', '10', '0', '130627', '唐县');
INSERT INTO `region` VALUES ('1099', '高阳县', '139', '3', '10', '0', '130628', '高阳县');
INSERT INTO `region` VALUES ('1100', '容城县', '139', '3', '10', '0', '130629', '容城县');
INSERT INTO `region` VALUES ('1101', '涞源县', '139', '3', '10', '0', '130630', '涞源县');
INSERT INTO `region` VALUES ('1102', '望都县', '139', '3', '10', '0', '130631', '望都县');
INSERT INTO `region` VALUES ('1103', '安新县', '139', '3', '10', '0', '130632', '安新县');
INSERT INTO `region` VALUES ('1104', '易县', '139', '3', '10', '0', '130633', '易县');
INSERT INTO `region` VALUES ('1105', '曲阳县', '139', '3', '10', '0', '130634', '曲阳县');
INSERT INTO `region` VALUES ('1106', '蠡县', '139', '3', '10', '0', '130635', '蠡县');
INSERT INTO `region` VALUES ('1107', '顺平县', '139', '3', '10', '0', '130636', '顺平县');
INSERT INTO `region` VALUES ('1108', '博野县', '139', '3', '10', '0', '130637', '博野县');
INSERT INTO `region` VALUES ('1109', '雄县', '139', '3', '10', '0', '130638', '雄县');
INSERT INTO `region` VALUES ('1110', '长安区', '140', '3', '10', '0', '130102', '长安区');
INSERT INTO `region` VALUES ('1111', '桥东区', '140', '3', '10', '0', '130103', '桥东区');
INSERT INTO `region` VALUES ('1112', '桥西区', '140', '3', '10', '0', '130104', '桥西区');
INSERT INTO `region` VALUES ('1113', '新华区', '140', '3', '10', '0', '130105', '新华区');
INSERT INTO `region` VALUES ('1114', '裕华区', '140', '3', '10', '0', '130108', '裕华区');
INSERT INTO `region` VALUES ('1115', '井陉矿区', '140', '3', '10', '0', '130107', '井陉矿区');
INSERT INTO `region` VALUES ('1116', '高新区', '140', '3', '10', '0', '0', '高新区');
INSERT INTO `region` VALUES ('1117', '辛集市', '140', '3', '10', '0', '130181', '辛集市');
INSERT INTO `region` VALUES ('1118', '藁城市', '140', '3', '10', '0', '130182', '藁城市');
INSERT INTO `region` VALUES ('1119', '晋州市', '140', '3', '10', '0', '130183', '晋州市');
INSERT INTO `region` VALUES ('1120', '新乐市', '140', '3', '10', '0', '130184', '新乐市');
INSERT INTO `region` VALUES ('1121', '鹿泉市', '140', '3', '10', '0', '130185', '鹿泉市');
INSERT INTO `region` VALUES ('1122', '井陉县', '140', '3', '10', '0', '130121', '井陉县');
INSERT INTO `region` VALUES ('1123', '正定县', '140', '3', '10', '0', '130123', '正定县');
INSERT INTO `region` VALUES ('1124', '栾城县', '140', '3', '10', '0', '130124', '栾城县');
INSERT INTO `region` VALUES ('1125', '行唐县', '140', '3', '10', '0', '130125', '行唐县');
INSERT INTO `region` VALUES ('1126', '灵寿县', '140', '3', '10', '0', '130126', '灵寿县');
INSERT INTO `region` VALUES ('1127', '高邑县', '140', '3', '10', '0', '130127', '高邑县');
INSERT INTO `region` VALUES ('1128', '深泽县', '140', '3', '10', '0', '130128', '深泽县');
INSERT INTO `region` VALUES ('1129', '赞皇县', '140', '3', '10', '0', '130129', '赞皇县');
INSERT INTO `region` VALUES ('1130', '无极县', '140', '3', '10', '0', '130130', '无极县');
INSERT INTO `region` VALUES ('1131', '平山县', '140', '3', '10', '0', '130131', '平山县');
INSERT INTO `region` VALUES ('1132', '元氏县', '140', '3', '10', '0', '130132', '元氏县');
INSERT INTO `region` VALUES ('1133', '赵县', '140', '3', '10', '0', '130133', '赵县');
INSERT INTO `region` VALUES ('1134', '双桥区', '141', '3', '10', '0', '130802', '双桥区');
INSERT INTO `region` VALUES ('1135', '双滦区', '141', '3', '10', '0', '130803', '双滦区');
INSERT INTO `region` VALUES ('1136', '鹰手营子矿区', '141', '3', '10', '0', '130804', '鹰手营子矿区');
INSERT INTO `region` VALUES ('1137', '承德县', '141', '3', '10', '0', '130821', '承德县');
INSERT INTO `region` VALUES ('1138', '兴隆县', '141', '3', '10', '0', '130822', '兴隆县');
INSERT INTO `region` VALUES ('1139', '平泉县', '141', '3', '10', '0', '130823', '平泉县');
INSERT INTO `region` VALUES ('1140', '滦平县', '141', '3', '10', '0', '130824', '滦平县');
INSERT INTO `region` VALUES ('1141', '隆化县', '141', '3', '10', '0', '130825', '隆化县');
INSERT INTO `region` VALUES ('1142', '丰宁', '141', '3', '10', '0', '130826', '丰宁');
INSERT INTO `region` VALUES ('1143', '宽城', '141', '3', '10', '0', '130827', '宽城');
INSERT INTO `region` VALUES ('1144', '围场', '141', '3', '10', '0', '130828', '围场');
INSERT INTO `region` VALUES ('1145', '运河区', '142', '3', '10', '0', '130903', '运河区');
INSERT INTO `region` VALUES ('1146', '新华区', '142', '3', '10', '0', '130902', '新华区');
INSERT INTO `region` VALUES ('1147', '泊头市', '142', '3', '10', '0', '130981', '泊头市');
INSERT INTO `region` VALUES ('1148', '任丘市', '142', '3', '10', '0', '130982', '任丘市');
INSERT INTO `region` VALUES ('1149', '黄骅市', '142', '3', '10', '0', '130983', '黄骅市');
INSERT INTO `region` VALUES ('1150', '河间市', '142', '3', '10', '0', '130984', '河间市');
INSERT INTO `region` VALUES ('1151', '沧县', '142', '3', '10', '0', '130921', '沧县');
INSERT INTO `region` VALUES ('1152', '青县', '142', '3', '10', '0', '130922', '青县');
INSERT INTO `region` VALUES ('1153', '东光县', '142', '3', '10', '0', '130923', '东光县');
INSERT INTO `region` VALUES ('1154', '海兴县', '142', '3', '10', '0', '130924', '海兴县');
INSERT INTO `region` VALUES ('1155', '盐山县', '142', '3', '10', '0', '130925', '盐山县');
INSERT INTO `region` VALUES ('1156', '肃宁县', '142', '3', '10', '0', '130926', '肃宁县');
INSERT INTO `region` VALUES ('1157', '南皮县', '142', '3', '10', '0', '130927', '南皮县');
INSERT INTO `region` VALUES ('1158', '吴桥县', '142', '3', '10', '0', '130928', '吴桥县');
INSERT INTO `region` VALUES ('1159', '献县', '142', '3', '10', '0', '130929', '献县');
INSERT INTO `region` VALUES ('1160', '孟村', '142', '3', '10', '0', '130930', '孟村');
INSERT INTO `region` VALUES ('1161', '桃城区', '143', '3', '10', '0', '131102', '桃城区');
INSERT INTO `region` VALUES ('1162', '冀州市', '143', '3', '10', '0', '131181', '冀州市');
INSERT INTO `region` VALUES ('1163', '深州市', '143', '3', '10', '0', '131182', '深州市');
INSERT INTO `region` VALUES ('1164', '枣强县', '143', '3', '10', '0', '131121', '枣强县');
INSERT INTO `region` VALUES ('1165', '武邑县', '143', '3', '10', '0', '131122', '武邑县');
INSERT INTO `region` VALUES ('1166', '武强县', '143', '3', '10', '0', '131123', '武强县');
INSERT INTO `region` VALUES ('1167', '饶阳县', '143', '3', '10', '0', '131124', '饶阳县');
INSERT INTO `region` VALUES ('1168', '安平县', '143', '3', '10', '0', '131125', '安平县');
INSERT INTO `region` VALUES ('1169', '故城县', '143', '3', '10', '0', '131126', '故城县');
INSERT INTO `region` VALUES ('1170', '景县', '143', '3', '10', '0', '131127', '景县');
INSERT INTO `region` VALUES ('1171', '阜城县', '143', '3', '10', '0', '131128', '阜城县');
INSERT INTO `region` VALUES ('1172', '从台区', '144', '3', '10', '0', '0', '从台区');
INSERT INTO `region` VALUES ('1173', '复兴区', '144', '3', '10', '0', '130404', '复兴区');
INSERT INTO `region` VALUES ('1174', '邯山区', '144', '3', '10', '0', '130402', '邯山区');
INSERT INTO `region` VALUES ('1175', '峰峰矿区', '144', '3', '10', '0', '130406', '峰峰矿区');
INSERT INTO `region` VALUES ('1176', '武安市', '144', '3', '10', '0', '130481', '武安市');
INSERT INTO `region` VALUES ('1177', '邯郸县', '144', '3', '10', '0', '130421', '邯郸县');
INSERT INTO `region` VALUES ('1178', '临漳县', '144', '3', '10', '0', '130423', '临漳县');
INSERT INTO `region` VALUES ('1179', '成安县', '144', '3', '10', '0', '130424', '成安县');
INSERT INTO `region` VALUES ('1180', '大名县', '144', '3', '10', '0', '130425', '大名县');
INSERT INTO `region` VALUES ('1181', '涉县', '144', '3', '10', '0', '130426', '涉县');
INSERT INTO `region` VALUES ('1182', '磁县', '144', '3', '10', '0', '130427', '磁县');
INSERT INTO `region` VALUES ('1183', '肥乡县', '144', '3', '10', '0', '130428', '肥乡县');
INSERT INTO `region` VALUES ('1184', '永年县', '144', '3', '10', '0', '130429', '永年县');
INSERT INTO `region` VALUES ('1185', '邱县', '144', '3', '10', '0', '130430', '邱县');
INSERT INTO `region` VALUES ('1186', '鸡泽县', '144', '3', '10', '0', '130431', '鸡泽县');
INSERT INTO `region` VALUES ('1187', '广平县', '144', '3', '10', '0', '130432', '广平县');
INSERT INTO `region` VALUES ('1188', '馆陶县', '144', '3', '10', '0', '130433', '馆陶县');
INSERT INTO `region` VALUES ('1189', '魏县', '144', '3', '10', '0', '130434', '魏县');
INSERT INTO `region` VALUES ('1190', '曲周县', '144', '3', '10', '0', '130435', '曲周县');
INSERT INTO `region` VALUES ('1191', '安次区', '145', '3', '10', '0', '131002', '安次区');
INSERT INTO `region` VALUES ('1192', '广阳区', '145', '3', '10', '0', '131003', '广阳区');
INSERT INTO `region` VALUES ('1193', '霸州市', '145', '3', '10', '0', '131081', '霸州市');
INSERT INTO `region` VALUES ('1194', '三河市', '145', '3', '10', '0', '131082', '三河市');
INSERT INTO `region` VALUES ('1195', '固安县', '145', '3', '10', '0', '131022', '固安县');
INSERT INTO `region` VALUES ('1196', '永清县', '145', '3', '10', '0', '131023', '永清县');
INSERT INTO `region` VALUES ('1197', '香河县', '145', '3', '10', '0', '131024', '香河县');
INSERT INTO `region` VALUES ('1198', '大城县', '145', '3', '10', '0', '131025', '大城县');
INSERT INTO `region` VALUES ('1199', '文安县', '145', '3', '10', '0', '131026', '文安县');
INSERT INTO `region` VALUES ('1200', '大厂', '145', '3', '10', '0', '131028', '大厂');
INSERT INTO `region` VALUES ('1201', '海港区', '146', '3', '10', '0', '130302', '海港区');
INSERT INTO `region` VALUES ('1202', '山海关区', '146', '3', '10', '0', '130303', '山海关区');
INSERT INTO `region` VALUES ('1203', '北戴河区', '146', '3', '10', '0', '130304', '北戴河区');
INSERT INTO `region` VALUES ('1204', '昌黎县', '146', '3', '10', '0', '130322', '昌黎县');
INSERT INTO `region` VALUES ('1205', '抚宁县', '146', '3', '10', '0', '130323', '抚宁县');
INSERT INTO `region` VALUES ('1206', '卢龙县', '146', '3', '10', '0', '130324', '卢龙县');
INSERT INTO `region` VALUES ('1207', '青龙', '146', '3', '10', '0', '130321', '青龙');
INSERT INTO `region` VALUES ('1208', '路北区', '147', '3', '10', '0', '130203', '路北区');
INSERT INTO `region` VALUES ('1209', '路南区', '147', '3', '10', '0', '130202', '路南区');
INSERT INTO `region` VALUES ('1210', '古冶区', '147', '3', '10', '0', '130204', '古冶区');
INSERT INTO `region` VALUES ('1211', '开平区', '147', '3', '10', '0', '130205', '开平区');
INSERT INTO `region` VALUES ('1212', '丰南区', '147', '3', '10', '0', '130207', '丰南区');
INSERT INTO `region` VALUES ('1213', '丰润区', '147', '3', '10', '0', '130208', '丰润区');
INSERT INTO `region` VALUES ('1214', '遵化市', '147', '3', '10', '0', '130281', '遵化市');
INSERT INTO `region` VALUES ('1215', '迁安市', '147', '3', '10', '0', '130283', '迁安市');
INSERT INTO `region` VALUES ('1216', '滦县', '147', '3', '10', '0', '130223', '滦县');
INSERT INTO `region` VALUES ('1217', '滦南县', '147', '3', '10', '0', '130224', '滦南县');
INSERT INTO `region` VALUES ('1218', '乐亭县', '147', '3', '10', '0', '130225', '乐亭县');
INSERT INTO `region` VALUES ('1219', '迁西县', '147', '3', '10', '0', '130227', '迁西县');
INSERT INTO `region` VALUES ('1220', '玉田县', '147', '3', '10', '0', '130229', '玉田县');
INSERT INTO `region` VALUES ('1221', '唐海县', '147', '3', '10', '0', '0', '唐海县');
INSERT INTO `region` VALUES ('1222', '桥东区', '148', '3', '10', '0', '130502', '桥东区');
INSERT INTO `region` VALUES ('1223', '桥西区', '148', '3', '10', '0', '130503', '桥西区');
INSERT INTO `region` VALUES ('1224', '南宫市', '148', '3', '10', '0', '130581', '南宫市');
INSERT INTO `region` VALUES ('1225', '沙河市', '148', '3', '10', '0', '130582', '沙河市');
INSERT INTO `region` VALUES ('1226', '邢台县', '148', '3', '10', '0', '130521', '邢台县');
INSERT INTO `region` VALUES ('1227', '临城县', '148', '3', '10', '0', '130522', '临城县');
INSERT INTO `region` VALUES ('1228', '内丘县', '148', '3', '10', '0', '130523', '内丘县');
INSERT INTO `region` VALUES ('1229', '柏乡县', '148', '3', '10', '0', '130524', '柏乡县');
INSERT INTO `region` VALUES ('1230', '隆尧县', '148', '3', '10', '0', '130525', '隆尧县');
INSERT INTO `region` VALUES ('1231', '任县', '148', '3', '10', '0', '130526', '任县');
INSERT INTO `region` VALUES ('1232', '南和县', '148', '3', '10', '0', '130527', '南和县');
INSERT INTO `region` VALUES ('1233', '宁晋县', '148', '3', '10', '0', '130528', '宁晋县');
INSERT INTO `region` VALUES ('1234', '巨鹿县', '148', '3', '10', '0', '130529', '巨鹿县');
INSERT INTO `region` VALUES ('1235', '新河县', '148', '3', '10', '0', '130530', '新河县');
INSERT INTO `region` VALUES ('1236', '广宗县', '148', '3', '10', '0', '130531', '广宗县');
INSERT INTO `region` VALUES ('1237', '平乡县', '148', '3', '10', '0', '130532', '平乡县');
INSERT INTO `region` VALUES ('1238', '威县', '148', '3', '10', '0', '130533', '威县');
INSERT INTO `region` VALUES ('1239', '清河县', '148', '3', '10', '0', '130534', '清河县');
INSERT INTO `region` VALUES ('1240', '临西县', '148', '3', '10', '0', '130535', '临西县');
INSERT INTO `region` VALUES ('1241', '桥西区', '149', '3', '10', '0', '130703', '桥西区');
INSERT INTO `region` VALUES ('1242', '桥东区', '149', '3', '10', '0', '130702', '桥东区');
INSERT INTO `region` VALUES ('1243', '宣化区', '149', '3', '10', '0', '130705', '宣化区');
INSERT INTO `region` VALUES ('1244', '下花园区', '149', '3', '10', '0', '130706', '下花园区');
INSERT INTO `region` VALUES ('1245', '宣化县', '149', '3', '10', '0', '130721', '宣化县');
INSERT INTO `region` VALUES ('1246', '张北县', '149', '3', '10', '0', '130722', '张北县');
INSERT INTO `region` VALUES ('1247', '康保县', '149', '3', '10', '0', '130723', '康保县');
INSERT INTO `region` VALUES ('1248', '沽源县', '149', '3', '10', '0', '130724', '沽源县');
INSERT INTO `region` VALUES ('1249', '尚义县', '149', '3', '10', '0', '130725', '尚义县');
INSERT INTO `region` VALUES ('1250', '蔚县', '149', '3', '10', '0', '130726', '蔚县');
INSERT INTO `region` VALUES ('1251', '阳原县', '149', '3', '10', '0', '130727', '阳原县');
INSERT INTO `region` VALUES ('1252', '怀安县', '149', '3', '10', '0', '130728', '怀安县');
INSERT INTO `region` VALUES ('1253', '万全县', '149', '3', '10', '0', '130729', '万全县');
INSERT INTO `region` VALUES ('1254', '怀来县', '149', '3', '10', '0', '130730', '怀来县');
INSERT INTO `region` VALUES ('1255', '涿鹿县', '149', '3', '10', '0', '130731', '涿鹿县');
INSERT INTO `region` VALUES ('1256', '赤城县', '149', '3', '10', '0', '130732', '赤城县');
INSERT INTO `region` VALUES ('1257', '崇礼县', '149', '3', '10', '0', '130733', '崇礼县');
INSERT INTO `region` VALUES ('1258', '北关区', '150', '3', '10', '0', '410503', '北关区');
INSERT INTO `region` VALUES ('1259', '文峰区', '150', '3', '10', '0', '410502', '文峰区');
INSERT INTO `region` VALUES ('1260', '殷都区', '150', '3', '10', '0', '410505', '殷都区');
INSERT INTO `region` VALUES ('1261', '龙安区', '150', '3', '10', '0', '410506', '龙安区');
INSERT INTO `region` VALUES ('1262', '林州市', '150', '3', '10', '0', '410581', '林州市');
INSERT INTO `region` VALUES ('1263', '安阳县', '150', '3', '10', '0', '410522', '安阳县');
INSERT INTO `region` VALUES ('1264', '汤阴县', '150', '3', '10', '0', '410523', '汤阴县');
INSERT INTO `region` VALUES ('1265', '滑县', '150', '3', '10', '0', '410526', '滑县');
INSERT INTO `region` VALUES ('1266', '内黄县', '150', '3', '10', '0', '410527', '内黄县');
INSERT INTO `region` VALUES ('1267', '淇滨区', '151', '3', '10', '0', '410611', '淇滨区');
INSERT INTO `region` VALUES ('1268', '山城区', '151', '3', '10', '0', '410603', '山城区');
INSERT INTO `region` VALUES ('1269', '鹤山区', '151', '3', '10', '0', '410602', '鹤山区');
INSERT INTO `region` VALUES ('1270', '浚县', '151', '3', '10', '0', '410621', '浚县');
INSERT INTO `region` VALUES ('1271', '淇县', '151', '3', '10', '0', '410611', '淇县');
INSERT INTO `region` VALUES ('1272', '济源市', '152', '3', '10', '0', '419001', '济源市');
INSERT INTO `region` VALUES ('1273', '解放区', '153', '3', '10', '0', '410802', '解放区');
INSERT INTO `region` VALUES ('1274', '中站区', '153', '3', '10', '0', '410803', '中站区');
INSERT INTO `region` VALUES ('1275', '马村区', '153', '3', '10', '0', '410804', '马村区');
INSERT INTO `region` VALUES ('1276', '山阳区', '153', '3', '10', '0', '410811', '山阳区');
INSERT INTO `region` VALUES ('1277', '沁阳市', '153', '3', '10', '0', '410882', '沁阳市');
INSERT INTO `region` VALUES ('1278', '孟州市', '153', '3', '10', '0', '410883', '孟州市');
INSERT INTO `region` VALUES ('1279', '修武县', '153', '3', '10', '0', '410821', '修武县');
INSERT INTO `region` VALUES ('1280', '博爱县', '153', '3', '10', '0', '410822', '博爱县');
INSERT INTO `region` VALUES ('1281', '武陟县', '153', '3', '10', '0', '410823', '武陟县');
INSERT INTO `region` VALUES ('1282', '温县', '153', '3', '10', '0', '410825', '温县');
INSERT INTO `region` VALUES ('1283', '卧龙区', '154', '3', '10', '0', '411303', '卧龙区');
INSERT INTO `region` VALUES ('1284', '宛城区', '154', '3', '10', '0', '411302', '宛城区');
INSERT INTO `region` VALUES ('1285', '邓州市', '154', '3', '10', '0', '411381', '邓州市');
INSERT INTO `region` VALUES ('1286', '南召县', '154', '3', '10', '0', '411321', '南召县');
INSERT INTO `region` VALUES ('1287', '方城县', '154', '3', '10', '0', '411322', '方城县');
INSERT INTO `region` VALUES ('1288', '西峡县', '154', '3', '10', '0', '411323', '西峡县');
INSERT INTO `region` VALUES ('1289', '镇平县', '154', '3', '10', '0', '411324', '镇平县');
INSERT INTO `region` VALUES ('1290', '内乡县', '154', '3', '10', '0', '411325', '内乡县');
INSERT INTO `region` VALUES ('1291', '淅川县', '154', '3', '10', '0', '411326', '淅川县');
INSERT INTO `region` VALUES ('1292', '社旗县', '154', '3', '10', '0', '411327', '社旗县');
INSERT INTO `region` VALUES ('1293', '唐河县', '154', '3', '10', '0', '411328', '唐河县');
INSERT INTO `region` VALUES ('1294', '新野县', '154', '3', '10', '0', '411329', '新野县');
INSERT INTO `region` VALUES ('1295', '桐柏县', '154', '3', '10', '0', '411330', '桐柏县');
INSERT INTO `region` VALUES ('1296', '新华区', '155', '3', '10', '0', '410402', '新华区');
INSERT INTO `region` VALUES ('1297', '卫东区', '155', '3', '10', '0', '410403', '卫东区');
INSERT INTO `region` VALUES ('1298', '湛河区', '155', '3', '10', '0', '410411', '湛河区');
INSERT INTO `region` VALUES ('1299', '石龙区', '155', '3', '10', '0', '410404', '石龙区');
INSERT INTO `region` VALUES ('1300', '舞钢市', '155', '3', '10', '0', '410481', '舞钢市');
INSERT INTO `region` VALUES ('1301', '汝州市', '155', '3', '10', '0', '410482', '汝州市');
INSERT INTO `region` VALUES ('1302', '宝丰县', '155', '3', '10', '0', '410421', '宝丰县');
INSERT INTO `region` VALUES ('1303', '叶县', '155', '3', '10', '0', '410422', '叶县');
INSERT INTO `region` VALUES ('1304', '鲁山县', '155', '3', '10', '0', '410423', '鲁山县');
INSERT INTO `region` VALUES ('1305', '郏县', '155', '3', '10', '0', '410425', '郏县');
INSERT INTO `region` VALUES ('1306', '湖滨区', '156', '3', '10', '0', '411202', '湖滨区');
INSERT INTO `region` VALUES ('1307', '义马市', '156', '3', '10', '0', '411281', '义马市');
INSERT INTO `region` VALUES ('1308', '灵宝市', '156', '3', '10', '0', '411282', '灵宝市');
INSERT INTO `region` VALUES ('1309', '渑池县', '156', '3', '10', '0', '411221', '渑池县');
INSERT INTO `region` VALUES ('1310', '陕县', '156', '3', '10', '0', '411222', '陕县');
INSERT INTO `region` VALUES ('1311', '卢氏县', '156', '3', '10', '0', '411224', '卢氏县');
INSERT INTO `region` VALUES ('1312', '梁园区', '157', '3', '10', '0', '411402', '梁园区');
INSERT INTO `region` VALUES ('1313', '睢阳区', '157', '3', '10', '0', '411403', '睢阳区');
INSERT INTO `region` VALUES ('1314', '永城市', '157', '3', '10', '0', '411481', '永城市');
INSERT INTO `region` VALUES ('1315', '民权县', '157', '3', '10', '0', '411421', '民权县');
INSERT INTO `region` VALUES ('1316', '睢县', '157', '3', '10', '0', '411422', '睢县');
INSERT INTO `region` VALUES ('1317', '宁陵县', '157', '3', '10', '0', '411423', '宁陵县');
INSERT INTO `region` VALUES ('1318', '虞城县', '157', '3', '10', '0', '411425', '虞城县');
INSERT INTO `region` VALUES ('1319', '柘城县', '157', '3', '10', '0', '411424', '柘城县');
INSERT INTO `region` VALUES ('1320', '夏邑县', '157', '3', '10', '0', '411426', '夏邑县');
INSERT INTO `region` VALUES ('1321', '金水区', '158', '3', '10', '0', '410105', '金水区');
INSERT INTO `region` VALUES ('1322', '邙山区', '158', '3', '10', '0', '0', '邙山区');
INSERT INTO `region` VALUES ('1323', '二七区', '158', '3', '10', '0', '410103', '二七区');
INSERT INTO `region` VALUES ('1324', '管城区', '158', '3', '10', '0', '410104', '管城区');
INSERT INTO `region` VALUES ('1325', '中原区', '158', '3', '10', '0', '410102', '中原区');
INSERT INTO `region` VALUES ('1326', '上街区', '158', '3', '10', '0', '410106', '上街区');
INSERT INTO `region` VALUES ('1327', '惠济区', '158', '3', '10', '0', '410108', '惠济区');
INSERT INTO `region` VALUES ('1328', '郑东新区', '158', '3', '10', '0', '0', '郑东新区');
INSERT INTO `region` VALUES ('1329', '经济技术开发区', '158', '3', '10', '0', '0', '经济技术开发区');
INSERT INTO `region` VALUES ('1330', '高新开发区', '158', '3', '10', '0', '0', '高新开发区');
INSERT INTO `region` VALUES ('1331', '出口加工区', '158', '3', '10', '0', '0', '出口加工区');
INSERT INTO `region` VALUES ('1332', '巩义市', '158', '3', '10', '0', '410181', '巩义市');
INSERT INTO `region` VALUES ('1333', '荥阳市', '158', '3', '10', '0', '410182', '荥阳市');
INSERT INTO `region` VALUES ('1334', '新密市', '158', '3', '10', '0', '410183', '新密市');
INSERT INTO `region` VALUES ('1335', '新郑市', '158', '3', '10', '0', '410184', '新郑市');
INSERT INTO `region` VALUES ('1336', '登封市', '158', '3', '10', '0', '410185', '登封市');
INSERT INTO `region` VALUES ('1337', '中牟县', '158', '3', '10', '0', '410122', '中牟县');
INSERT INTO `region` VALUES ('1338', '西工区', '159', '3', '10', '0', '410303', '西工区');
INSERT INTO `region` VALUES ('1339', '老城区', '159', '3', '10', '0', '410302', '老城区');
INSERT INTO `region` VALUES ('1340', '涧西区', '159', '3', '10', '0', '410305', '涧西区');
INSERT INTO `region` VALUES ('1341', '瀍河回族区', '159', '3', '10', '0', '410304', '瀍河回族区');
INSERT INTO `region` VALUES ('1342', '洛龙区', '159', '3', '10', '0', '410311', '洛龙区');
INSERT INTO `region` VALUES ('1343', '吉利区', '159', '3', '10', '0', '410306', '吉利区');
INSERT INTO `region` VALUES ('1344', '偃师市', '159', '3', '10', '0', '410381', '偃师市');
INSERT INTO `region` VALUES ('1345', '孟津县', '159', '3', '10', '0', '410322', '孟津县');
INSERT INTO `region` VALUES ('1346', '新安县', '159', '3', '10', '0', '410323', '新安县');
INSERT INTO `region` VALUES ('1347', '栾川县', '159', '3', '10', '0', '410324', '栾川县');
INSERT INTO `region` VALUES ('1348', '嵩县', '159', '3', '10', '0', '410325', '嵩县');
INSERT INTO `region` VALUES ('1349', '汝阳县', '159', '3', '10', '0', '410326', '汝阳县');
INSERT INTO `region` VALUES ('1350', '宜阳县', '159', '3', '10', '0', '410327', '宜阳县');
INSERT INTO `region` VALUES ('1351', '洛宁县', '159', '3', '10', '0', '410328', '洛宁县');
INSERT INTO `region` VALUES ('1352', '伊川县', '159', '3', '10', '0', '410329', '伊川县');
INSERT INTO `region` VALUES ('1353', '鼓楼区', '160', '3', '10', '0', '410204', '鼓楼区');
INSERT INTO `region` VALUES ('1354', '龙亭区', '160', '3', '10', '0', '410202', '龙亭区');
INSERT INTO `region` VALUES ('1355', '顺河回族区', '160', '3', '10', '0', '410203', '顺河回族区');
INSERT INTO `region` VALUES ('1356', '金明区', '160', '3', '10', '0', '410211', '金明区');
INSERT INTO `region` VALUES ('1357', '禹王台区', '160', '3', '10', '0', '410205', '禹王台区');
INSERT INTO `region` VALUES ('1358', '杞县', '160', '3', '10', '0', '410221', '杞县');
INSERT INTO `region` VALUES ('1359', '通许县', '160', '3', '10', '0', '410222', '通许县');
INSERT INTO `region` VALUES ('1360', '尉氏县', '160', '3', '10', '0', '410223', '尉氏县');
INSERT INTO `region` VALUES ('1361', '开封县', '160', '3', '10', '0', '410224', '开封县');
INSERT INTO `region` VALUES ('1362', '兰考县', '160', '3', '10', '0', '410225', '兰考县');
INSERT INTO `region` VALUES ('1363', '川汇区', '161', '3', '10', '0', '411602', '川汇区');
INSERT INTO `region` VALUES ('1364', '项城市', '161', '3', '10', '0', '411681', '项城市');
INSERT INTO `region` VALUES ('1365', '扶沟县', '161', '3', '10', '0', '411621', '扶沟县');
INSERT INTO `region` VALUES ('1366', '西华县', '161', '3', '10', '0', '411622', '西华县');
INSERT INTO `region` VALUES ('1367', '商水县', '161', '3', '10', '0', '411623', '商水县');
INSERT INTO `region` VALUES ('1368', '沈丘县', '161', '3', '10', '0', '411624', '沈丘县');
INSERT INTO `region` VALUES ('1369', '郸城县', '161', '3', '10', '0', '411625', '郸城县');
INSERT INTO `region` VALUES ('1370', '淮阳县', '161', '3', '10', '0', '411626', '淮阳县');
INSERT INTO `region` VALUES ('1371', '太康县', '161', '3', '10', '0', '411627', '太康县');
INSERT INTO `region` VALUES ('1372', '鹿邑县', '161', '3', '10', '0', '411628', '鹿邑县');
INSERT INTO `region` VALUES ('1373', '魏都区', '162', '3', '10', '0', '411002', '魏都区');
INSERT INTO `region` VALUES ('1374', '禹州市', '162', '3', '10', '0', '411081', '禹州市');
INSERT INTO `region` VALUES ('1375', '长葛市', '162', '3', '10', '0', '411082', '长葛市');
INSERT INTO `region` VALUES ('1376', '许昌县', '162', '3', '10', '0', '411023', '许昌县');
INSERT INTO `region` VALUES ('1377', '鄢陵县', '162', '3', '10', '0', '411024', '鄢陵县');
INSERT INTO `region` VALUES ('1378', '襄城县', '162', '3', '10', '0', '411025', '襄城县');
INSERT INTO `region` VALUES ('1379', '浉河区', '163', '3', '10', '0', '411502', '浉河区');
INSERT INTO `region` VALUES ('1380', '平桥区', '163', '3', '10', '0', '411503', '平桥区');
INSERT INTO `region` VALUES ('1381', '罗山县', '163', '3', '10', '0', '411521', '罗山县');
INSERT INTO `region` VALUES ('1382', '光山县', '163', '3', '10', '0', '411522', '光山县');
INSERT INTO `region` VALUES ('1383', '新县', '163', '3', '10', '0', '411523', '新县');
INSERT INTO `region` VALUES ('1384', '商城县', '163', '3', '10', '0', '411524', '商城县');
INSERT INTO `region` VALUES ('1385', '固始县', '163', '3', '10', '0', '411525', '固始县');
INSERT INTO `region` VALUES ('1386', '潢川县', '163', '3', '10', '0', '411526', '潢川县');
INSERT INTO `region` VALUES ('1387', '淮滨县', '163', '3', '10', '0', '411527', '淮滨县');
INSERT INTO `region` VALUES ('1388', '息县', '163', '3', '10', '0', '411528', '息县');
INSERT INTO `region` VALUES ('1389', '卫滨区', '164', '3', '10', '0', '410703', '卫滨区');
INSERT INTO `region` VALUES ('1390', '红旗区', '164', '3', '10', '0', '410702', '红旗区');
INSERT INTO `region` VALUES ('1391', '凤泉区', '164', '3', '10', '0', '410704', '凤泉区');
INSERT INTO `region` VALUES ('1392', '牧野区', '164', '3', '10', '0', '410711', '牧野区');
INSERT INTO `region` VALUES ('1393', '卫辉市', '164', '3', '10', '0', '410781', '卫辉市');
INSERT INTO `region` VALUES ('1394', '辉县市', '164', '3', '10', '0', '410782', '辉县市');
INSERT INTO `region` VALUES ('1395', '新乡县', '164', '3', '10', '0', '410721', '新乡县');
INSERT INTO `region` VALUES ('1396', '获嘉县', '164', '3', '10', '0', '410724', '获嘉县');
INSERT INTO `region` VALUES ('1397', '原阳县', '164', '3', '10', '0', '410725', '原阳县');
INSERT INTO `region` VALUES ('1398', '延津县', '164', '3', '10', '0', '410726', '延津县');
INSERT INTO `region` VALUES ('1399', '封丘县', '164', '3', '10', '0', '410727', '封丘县');
INSERT INTO `region` VALUES ('1400', '长垣县', '164', '3', '10', '0', '410728', '长垣县');
INSERT INTO `region` VALUES ('1401', '华龙区', '165', '3', '10', '0', '410902', '华龙区');
INSERT INTO `region` VALUES ('1402', '清丰县', '165', '3', '10', '0', '410922', '清丰县');
INSERT INTO `region` VALUES ('1403', '南乐县', '165', '3', '10', '0', '410923', '南乐县');
INSERT INTO `region` VALUES ('1404', '范县', '165', '3', '10', '0', '410926', '范县');
INSERT INTO `region` VALUES ('1405', '台前县', '165', '3', '10', '0', '410927', '台前县');
INSERT INTO `region` VALUES ('1406', '濮阳县', '165', '3', '10', '0', '410928', '濮阳县');
INSERT INTO `region` VALUES ('1407', '郾城区', '166', '3', '10', '0', '411103', '郾城区');
INSERT INTO `region` VALUES ('1408', '源汇区', '166', '3', '10', '0', '411102', '源汇区');
INSERT INTO `region` VALUES ('1409', '召陵区', '166', '3', '10', '0', '411104', '召陵区');
INSERT INTO `region` VALUES ('1410', '舞阳县', '166', '3', '10', '0', '411121', '舞阳县');
INSERT INTO `region` VALUES ('1411', '临颍县', '166', '3', '10', '0', '411122', '临颍县');
INSERT INTO `region` VALUES ('1412', '驿城区', '167', '3', '10', '0', '411702', '驿城区');
INSERT INTO `region` VALUES ('1413', '西平县', '167', '3', '10', '0', '411721', '西平县');
INSERT INTO `region` VALUES ('1414', '上蔡县', '167', '3', '10', '0', '411722', '上蔡县');
INSERT INTO `region` VALUES ('1415', '平舆县', '167', '3', '10', '0', '411723', '平舆县');
INSERT INTO `region` VALUES ('1416', '正阳县', '167', '3', '10', '0', '411724', '正阳县');
INSERT INTO `region` VALUES ('1417', '确山县', '167', '3', '10', '0', '411725', '确山县');
INSERT INTO `region` VALUES ('1418', '泌阳县', '167', '3', '10', '0', '411726', '泌阳县');
INSERT INTO `region` VALUES ('1419', '汝南县', '167', '3', '10', '0', '411727', '汝南县');
INSERT INTO `region` VALUES ('1420', '遂平县', '167', '3', '10', '0', '411728', '遂平县');
INSERT INTO `region` VALUES ('1421', '新蔡县', '167', '3', '10', '0', '411729', '新蔡县');
INSERT INTO `region` VALUES ('1422', '爱辉区', '168', '3', '10', '0', '231102', '爱辉区');
INSERT INTO `region` VALUES ('1423', '五大连池市', '168', '3', '10', '0', '231182', '五大连池市');
INSERT INTO `region` VALUES ('1424', '北安市', '168', '3', '10', '0', '231181', '北安市');
INSERT INTO `region` VALUES ('1425', '嫩江县', '168', '3', '10', '0', '231121', '嫩江县');
INSERT INTO `region` VALUES ('1426', '逊克县', '168', '3', '10', '0', '231123', '逊克县');
INSERT INTO `region` VALUES ('1427', '孙吴县', '168', '3', '10', '0', '231124', '孙吴县');
INSERT INTO `region` VALUES ('1428', '兴山区', '169', '3', '10', '0', '230407', '兴山区');
INSERT INTO `region` VALUES ('1429', '工农区', '169', '3', '10', '0', '230403', '工农区');
INSERT INTO `region` VALUES ('1430', '南山区', '169', '3', '10', '0', '230404', '南山区');
INSERT INTO `region` VALUES ('1431', '兴安区', '169', '3', '10', '0', '230405', '兴安区');
INSERT INTO `region` VALUES ('1432', '向阳区', '169', '3', '10', '0', '230402', '向阳区');
INSERT INTO `region` VALUES ('1433', '东山区', '169', '3', '10', '0', '230406', '东山区');
INSERT INTO `region` VALUES ('1434', '萝北县', '169', '3', '10', '0', '230421', '萝北县');
INSERT INTO `region` VALUES ('1435', '绥滨县', '169', '3', '10', '0', '230422', '绥滨县');
INSERT INTO `region` VALUES ('1436', '呼玛县', '170', '3', '10', '0', '232721', '呼玛县');
INSERT INTO `region` VALUES ('1437', '漠河县', '170', '3', '10', '0', '232723', '漠河县');
INSERT INTO `region` VALUES ('1438', '塔河县', '170', '3', '10', '0', '232722', '塔河县');
INSERT INTO `region` VALUES ('1439', '萨尔图区', '171', '3', '10', '0', '230602', '萨尔图区');
INSERT INTO `region` VALUES ('1440', '红岗区', '171', '3', '10', '0', '230605', '红岗区');
INSERT INTO `region` VALUES ('1441', '龙凤区', '171', '3', '10', '0', '230603', '龙凤区');
INSERT INTO `region` VALUES ('1442', '让胡路区', '171', '3', '10', '0', '230604', '让胡路区');
INSERT INTO `region` VALUES ('1443', '大同区', '171', '3', '10', '0', '230606', '大同区');
INSERT INTO `region` VALUES ('1444', '肇州县', '171', '3', '10', '0', '230621', '肇州县');
INSERT INTO `region` VALUES ('1445', '肇源县', '171', '3', '10', '0', '230622', '肇源县');
INSERT INTO `region` VALUES ('1446', '林甸县', '171', '3', '10', '0', '230623', '林甸县');
INSERT INTO `region` VALUES ('1447', '杜尔伯特', '171', '3', '10', '0', '230624', '杜尔伯特');
INSERT INTO `region` VALUES ('1448', '桃山区', '172', '3', '10', '0', '230903', '桃山区');
INSERT INTO `region` VALUES ('1449', '新兴区', '172', '3', '10', '0', '230902', '新兴区');
INSERT INTO `region` VALUES ('1450', '茄子河区', '172', '3', '10', '0', '230904', '茄子河区');
INSERT INTO `region` VALUES ('1451', '勃利县', '172', '3', '10', '0', '230921', '勃利县');
INSERT INTO `region` VALUES ('1452', '爱民区', '173', '3', '10', '0', '231004', '爱民区');
INSERT INTO `region` VALUES ('1453', '东安区', '173', '3', '10', '0', '231002', '东安区');
INSERT INTO `region` VALUES ('1454', '阳明区', '173', '3', '10', '0', '231003', '阳明区');
INSERT INTO `region` VALUES ('1455', '西安区', '173', '3', '10', '0', '231005', '西安区');
INSERT INTO `region` VALUES ('1456', '绥芬河市', '173', '3', '10', '0', '231081', '绥芬河市');
INSERT INTO `region` VALUES ('1457', '海林市', '173', '3', '10', '0', '231083', '海林市');
INSERT INTO `region` VALUES ('1458', '宁安市', '173', '3', '10', '0', '231084', '宁安市');
INSERT INTO `region` VALUES ('1459', '穆棱市', '173', '3', '10', '0', '231085', '穆棱市');
INSERT INTO `region` VALUES ('1460', '东宁县', '173', '3', '10', '0', '231024', '东宁县');
INSERT INTO `region` VALUES ('1461', '林口县', '173', '3', '10', '0', '231025', '林口县');
INSERT INTO `region` VALUES ('1462', '前进区', '174', '3', '10', '0', '230804', '前进区');
INSERT INTO `region` VALUES ('1463', '郊区', '174', '3', '10', '0', '230811', '郊区');
INSERT INTO `region` VALUES ('1464', '向阳区', '174', '3', '10', '0', '230803', '向阳区');
INSERT INTO `region` VALUES ('1465', '东风区', '174', '3', '10', '0', '230805', '东风区');
INSERT INTO `region` VALUES ('1466', '同江市', '174', '3', '10', '0', '230881', '同江市');
INSERT INTO `region` VALUES ('1467', '富锦市', '174', '3', '10', '0', '230882', '富锦市');
INSERT INTO `region` VALUES ('1468', '桦南县', '174', '3', '10', '0', '230822', '桦南县');
INSERT INTO `region` VALUES ('1469', '桦川县', '174', '3', '10', '0', '230826', '桦川县');
INSERT INTO `region` VALUES ('1470', '汤原县', '174', '3', '10', '0', '230828', '汤原县');
INSERT INTO `region` VALUES ('1471', '抚远县', '174', '3', '10', '0', '230833', '抚远县');
INSERT INTO `region` VALUES ('1472', '鸡冠区', '175', '3', '10', '0', '230302', '鸡冠区');
INSERT INTO `region` VALUES ('1473', '恒山区', '175', '3', '10', '0', '230303', '恒山区');
INSERT INTO `region` VALUES ('1474', '城子河区', '175', '3', '10', '0', '230306', '城子河区');
INSERT INTO `region` VALUES ('1475', '滴道区', '175', '3', '10', '0', '230304', '滴道区');
INSERT INTO `region` VALUES ('1476', '梨树区', '175', '3', '10', '0', '230305', '梨树区');
INSERT INTO `region` VALUES ('1477', '虎林市', '175', '3', '10', '0', '230381', '虎林市');
INSERT INTO `region` VALUES ('1478', '密山市', '175', '3', '10', '0', '230382', '密山市');
INSERT INTO `region` VALUES ('1479', '鸡东县', '175', '3', '10', '0', '230321', '鸡东县');
INSERT INTO `region` VALUES ('1480', '道里区', '176', '3', '10', '0', '230102', '道里区');
INSERT INTO `region` VALUES ('1481', '南岗区', '176', '3', '10', '0', '230103', '南岗区');
INSERT INTO `region` VALUES ('1482', '动力区', '176', '3', '10', '0', '0', '动力区');
INSERT INTO `region` VALUES ('1483', '平房区', '176', '3', '10', '0', '230108', '平房区');
INSERT INTO `region` VALUES ('1484', '香坊区', '176', '3', '10', '0', '230110', '香坊区');
INSERT INTO `region` VALUES ('1485', '太平区', '176', '3', '10', '0', '0', '太平区');
INSERT INTO `region` VALUES ('1486', '道外区', '176', '3', '10', '0', '230104', '道外区');
INSERT INTO `region` VALUES ('1487', '阿城区', '176', '3', '10', '0', '230112', '阿城区');
INSERT INTO `region` VALUES ('1488', '呼兰区', '176', '3', '10', '0', '230111', '呼兰区');
INSERT INTO `region` VALUES ('1489', '松北区', '176', '3', '10', '0', '230109', '松北区');
INSERT INTO `region` VALUES ('1490', '尚志市', '176', '3', '10', '0', '230183', '尚志市');
INSERT INTO `region` VALUES ('1491', '双城市', '176', '3', '10', '0', '230182', '双城市');
INSERT INTO `region` VALUES ('1492', '五常市', '176', '3', '10', '0', '230184', '五常市');
INSERT INTO `region` VALUES ('1493', '方正县', '176', '3', '10', '0', '230124', '方正县');
INSERT INTO `region` VALUES ('1494', '宾县', '176', '3', '10', '0', '230125', '宾县');
INSERT INTO `region` VALUES ('1495', '依兰县', '176', '3', '10', '0', '230123', '依兰县');
INSERT INTO `region` VALUES ('1496', '巴彦县', '176', '3', '10', '0', '230126', '巴彦县');
INSERT INTO `region` VALUES ('1497', '通河县', '176', '3', '10', '0', '230128', '通河县');
INSERT INTO `region` VALUES ('1498', '木兰县', '176', '3', '10', '0', '230127', '木兰县');
INSERT INTO `region` VALUES ('1499', '延寿县', '176', '3', '10', '0', '230129', '延寿县');
INSERT INTO `region` VALUES ('1500', '北林区', '177', '3', '10', '0', '231202', '北林区');
INSERT INTO `region` VALUES ('1501', '安达市', '177', '3', '10', '0', '231281', '安达市');
INSERT INTO `region` VALUES ('1502', '肇东市', '177', '3', '10', '0', '231282', '肇东市');
INSERT INTO `region` VALUES ('1503', '海伦市', '177', '3', '10', '0', '231283', '海伦市');
INSERT INTO `region` VALUES ('1504', '望奎县', '177', '3', '10', '0', '231221', '望奎县');
INSERT INTO `region` VALUES ('1505', '兰西县', '177', '3', '10', '0', '231222', '兰西县');
INSERT INTO `region` VALUES ('1506', '青冈县', '177', '3', '10', '0', '231223', '青冈县');
INSERT INTO `region` VALUES ('1507', '庆安县', '177', '3', '10', '0', '231224', '庆安县');
INSERT INTO `region` VALUES ('1508', '明水县', '177', '3', '10', '0', '231225', '明水县');
INSERT INTO `region` VALUES ('1509', '绥棱县', '177', '3', '10', '0', '231226', '绥棱县');
INSERT INTO `region` VALUES ('1510', '伊春区', '178', '3', '10', '0', '230702', '伊春区');
INSERT INTO `region` VALUES ('1511', '带岭区', '178', '3', '10', '0', '230713', '带岭区');
INSERT INTO `region` VALUES ('1512', '南岔区', '178', '3', '10', '0', '230703', '南岔区');
INSERT INTO `region` VALUES ('1513', '金山屯区', '178', '3', '10', '0', '230709', '金山屯区');
INSERT INTO `region` VALUES ('1514', '西林区', '178', '3', '10', '0', '230705', '西林区');
INSERT INTO `region` VALUES ('1515', '美溪区', '178', '3', '10', '0', '230708', '美溪区');
INSERT INTO `region` VALUES ('1516', '乌马河区', '178', '3', '10', '0', '230711', '乌马河区');
INSERT INTO `region` VALUES ('1517', '翠峦区', '178', '3', '10', '0', '230706', '翠峦区');
INSERT INTO `region` VALUES ('1518', '友好区', '178', '3', '10', '0', '230704', '友好区');
INSERT INTO `region` VALUES ('1519', '上甘岭区', '178', '3', '10', '0', '230716', '上甘岭区');
INSERT INTO `region` VALUES ('1520', '五营区', '178', '3', '10', '0', '230710', '五营区');
INSERT INTO `region` VALUES ('1521', '红星区', '178', '3', '10', '0', '230715', '红星区');
INSERT INTO `region` VALUES ('1522', '新青区', '178', '3', '10', '0', '230707', '新青区');
INSERT INTO `region` VALUES ('1523', '汤旺河区', '178', '3', '10', '0', '230712', '汤旺河区');
INSERT INTO `region` VALUES ('1524', '乌伊岭区', '178', '3', '10', '0', '230714', '乌伊岭区');
INSERT INTO `region` VALUES ('1525', '铁力市', '178', '3', '10', '0', '230781', '铁力市');
INSERT INTO `region` VALUES ('1526', '嘉荫县', '178', '3', '10', '0', '230722', '嘉荫县');
INSERT INTO `region` VALUES ('1527', '龙沙区', '179', '3', '10', '0', '230202', '龙沙区');
INSERT INTO `region` VALUES ('1528', '昂昂溪区', '179', '3', '10', '0', '230205', '昂昂溪区');
INSERT INTO `region` VALUES ('1529', '铁峰区', '179', '3', '10', '0', '0', '铁峰区');
INSERT INTO `region` VALUES ('1530', '建华区', '179', '3', '10', '0', '230203', '建华区');
INSERT INTO `region` VALUES ('1531', '富拉尔基区', '179', '3', '10', '0', '230206', '富拉尔基区');
INSERT INTO `region` VALUES ('1532', '碾子山区', '179', '3', '10', '0', '230207', '碾子山区');
INSERT INTO `region` VALUES ('1533', '梅里斯达斡尔区', '179', '3', '10', '0', '230208', '梅里斯达斡尔区');
INSERT INTO `region` VALUES ('1534', '讷河市', '179', '3', '10', '0', '230281', '讷河市');
INSERT INTO `region` VALUES ('1535', '龙江县', '179', '3', '10', '0', '230221', '龙江县');
INSERT INTO `region` VALUES ('1536', '依安县', '179', '3', '10', '0', '230223', '依安县');
INSERT INTO `region` VALUES ('1537', '泰来县', '179', '3', '10', '0', '230224', '泰来县');
INSERT INTO `region` VALUES ('1538', '甘南县', '179', '3', '10', '0', '230225', '甘南县');
INSERT INTO `region` VALUES ('1539', '富裕县', '179', '3', '10', '0', '230227', '富裕县');
INSERT INTO `region` VALUES ('1540', '克山县', '179', '3', '10', '0', '230229', '克山县');
INSERT INTO `region` VALUES ('1541', '克东县', '179', '3', '10', '0', '230230', '克东县');
INSERT INTO `region` VALUES ('1542', '拜泉县', '179', '3', '10', '0', '230231', '拜泉县');
INSERT INTO `region` VALUES ('1543', '尖山区', '180', '3', '10', '0', '230502', '尖山区');
INSERT INTO `region` VALUES ('1544', '岭东区', '180', '3', '10', '0', '230503', '岭东区');
INSERT INTO `region` VALUES ('1545', '四方台区', '180', '3', '10', '0', '230505', '四方台区');
INSERT INTO `region` VALUES ('1546', '宝山区', '180', '3', '10', '0', '230506', '宝山区');
INSERT INTO `region` VALUES ('1547', '集贤县', '180', '3', '10', '0', '230521', '集贤县');
INSERT INTO `region` VALUES ('1548', '友谊县', '180', '3', '10', '0', '230522', '友谊县');
INSERT INTO `region` VALUES ('1549', '宝清县', '180', '3', '10', '0', '230523', '宝清县');
INSERT INTO `region` VALUES ('1550', '饶河县', '180', '3', '10', '0', '230524', '饶河县');
INSERT INTO `region` VALUES ('1551', '恩施市', '181', '3', '10', '0', '422801', '恩施市');
INSERT INTO `region` VALUES ('1552', '利川市', '181', '3', '10', '0', '422802', '利川市');
INSERT INTO `region` VALUES ('1553', '建始县', '181', '3', '10', '0', '422822', '建始县');
INSERT INTO `region` VALUES ('1554', '巴东县', '181', '3', '10', '0', '422823', '巴东县');
INSERT INTO `region` VALUES ('1555', '宣恩县', '181', '3', '10', '0', '422825', '宣恩县');
INSERT INTO `region` VALUES ('1556', '咸丰县', '181', '3', '10', '0', '422826', '咸丰县');
INSERT INTO `region` VALUES ('1557', '来凤县', '181', '3', '10', '0', '422827', '来凤县');
INSERT INTO `region` VALUES ('1558', '鹤峰县', '181', '3', '10', '0', '422828', '鹤峰县');
INSERT INTO `region` VALUES ('1559', '襄城区', '182', '3', '10', '0', '420602', '襄城区');
INSERT INTO `region` VALUES ('1560', '樊城区', '182', '3', '10', '0', '420606', '樊城区');
INSERT INTO `region` VALUES ('1561', '襄阳区', '182', '3', '10', '0', '420600', '襄阳区');
INSERT INTO `region` VALUES ('1562', '老河口市', '182', '3', '10', '0', '420682', '老河口市');
INSERT INTO `region` VALUES ('1563', '枣阳市', '182', '3', '10', '0', '420683', '枣阳市');
INSERT INTO `region` VALUES ('1564', '宜城市', '182', '3', '10', '0', '420684', '宜城市');
INSERT INTO `region` VALUES ('1565', '南漳县', '182', '3', '10', '0', '420624', '南漳县');
INSERT INTO `region` VALUES ('1566', '谷城县', '182', '3', '10', '0', '420625', '谷城县');
INSERT INTO `region` VALUES ('1567', '保康县', '182', '3', '10', '0', '420626', '保康县');
INSERT INTO `region` VALUES ('1568', '咸安区', '183', '3', '10', '0', '421202', '咸安区');
INSERT INTO `region` VALUES ('1569', '赤壁市', '183', '3', '10', '0', '421281', '赤壁市');
INSERT INTO `region` VALUES ('1570', '嘉鱼县', '183', '3', '10', '0', '421221', '嘉鱼县');
INSERT INTO `region` VALUES ('1571', '通城县', '183', '3', '10', '0', '421222', '通城县');
INSERT INTO `region` VALUES ('1572', '崇阳县', '183', '3', '10', '0', '421223', '崇阳县');
INSERT INTO `region` VALUES ('1573', '通山县', '183', '3', '10', '0', '421224', '通山县');
INSERT INTO `region` VALUES ('1574', '长阳', '184', '3', '10', '0', '420528', '长阳');
INSERT INTO `region` VALUES ('1575', '五峰', '184', '3', '10', '0', '420529', '五峰');
INSERT INTO `region` VALUES ('1576', '西陵区', '184', '3', '10', '0', '420502', '西陵区');
INSERT INTO `region` VALUES ('1577', '伍家岗区', '184', '3', '10', '0', '420503', '伍家岗区');
INSERT INTO `region` VALUES ('1578', '点军区', '184', '3', '10', '0', '420504', '点军区');
INSERT INTO `region` VALUES ('1579', '猇亭区', '184', '3', '10', '0', '420505', '猇亭区');
INSERT INTO `region` VALUES ('1580', '夷陵区', '184', '3', '10', '0', '420506', '夷陵区');
INSERT INTO `region` VALUES ('1581', '宜都市', '184', '3', '10', '0', '420581', '宜都市');
INSERT INTO `region` VALUES ('1582', '当阳市', '184', '3', '10', '0', '420582', '当阳市');
INSERT INTO `region` VALUES ('1583', '枝江市', '184', '3', '10', '0', '420583', '枝江市');
INSERT INTO `region` VALUES ('1584', '远安县', '184', '3', '10', '0', '420525', '远安县');
INSERT INTO `region` VALUES ('1585', '兴山县', '184', '3', '10', '0', '420526', '兴山县');
INSERT INTO `region` VALUES ('1586', '秭归县', '184', '3', '10', '0', '420527', '秭归县');
INSERT INTO `region` VALUES ('1587', '孝南区', '185', '3', '10', '0', '420902', '孝南区');
INSERT INTO `region` VALUES ('1588', '应城市', '185', '3', '10', '0', '420981', '应城市');
INSERT INTO `region` VALUES ('1589', '安陆市', '185', '3', '10', '0', '420982', '安陆市');
INSERT INTO `region` VALUES ('1590', '汉川市', '185', '3', '10', '0', '420984', '汉川市');
INSERT INTO `region` VALUES ('1591', '孝昌县', '185', '3', '10', '0', '420921', '孝昌县');
INSERT INTO `region` VALUES ('1592', '大悟县', '185', '3', '10', '0', '420922', '大悟县');
INSERT INTO `region` VALUES ('1593', '云梦县', '185', '3', '10', '0', '420923', '云梦县');
INSERT INTO `region` VALUES ('1594', '沙市区', '186', '3', '10', '0', '421002', '沙市区');
INSERT INTO `region` VALUES ('1595', '荆州区', '186', '3', '10', '0', '421003', '荆州区');
INSERT INTO `region` VALUES ('1596', '石首市', '186', '3', '10', '0', '421081', '石首市');
INSERT INTO `region` VALUES ('1597', '洪湖市', '186', '3', '10', '0', '421083', '洪湖市');
INSERT INTO `region` VALUES ('1598', '松滋市', '186', '3', '10', '0', '421087', '松滋市');
INSERT INTO `region` VALUES ('1599', '公安县', '186', '3', '10', '0', '421022', '公安县');
INSERT INTO `region` VALUES ('1600', '监利县', '186', '3', '10', '0', '421023', '监利县');
INSERT INTO `region` VALUES ('1601', '江陵县', '186', '3', '10', '0', '421024', '江陵县');
INSERT INTO `region` VALUES ('1602', '潜江市', '3441', '3', '10', '0', '429005', '潜江市');
INSERT INTO `region` VALUES ('1603', '黄石港区', '188', '3', '10', '0', '420202', '黄石港区');
INSERT INTO `region` VALUES ('1604', '西塞山区', '188', '3', '10', '0', '420203', '西塞山区');
INSERT INTO `region` VALUES ('1605', '下陆区', '188', '3', '10', '0', '420204', '下陆区');
INSERT INTO `region` VALUES ('1606', '铁山区', '188', '3', '10', '0', '420205', '铁山区');
INSERT INTO `region` VALUES ('1607', '大冶市', '188', '3', '10', '0', '420281', '大冶市');
INSERT INTO `region` VALUES ('1608', '阳新县', '188', '3', '10', '0', '420222', '阳新县');
INSERT INTO `region` VALUES ('1609', '东宝区', '189', '3', '10', '0', '420802', '东宝区');
INSERT INTO `region` VALUES ('1610', '掇刀区', '189', '3', '10', '0', '420804', '掇刀区');
INSERT INTO `region` VALUES ('1611', '钟祥市', '189', '3', '10', '0', '420881', '钟祥市');
INSERT INTO `region` VALUES ('1612', '京山县', '189', '3', '10', '0', '420821', '京山县');
INSERT INTO `region` VALUES ('1613', '沙洋县', '189', '3', '10', '0', '420822', '沙洋县');
INSERT INTO `region` VALUES ('1614', '曾都区', '190', '3', '10', '0', '421303', '曾都区');
INSERT INTO `region` VALUES ('1615', '广水市', '190', '3', '10', '0', '421381', '广水市');
INSERT INTO `region` VALUES ('1616', '天门市', '3441', '3', '10', '0', '429006', '天门市');
INSERT INTO `region` VALUES ('1617', '神农架林区', '192', '3', '10', '0', '0', '神农架林区');
INSERT INTO `region` VALUES ('1618', '张湾区', '193', '3', '10', '0', '420303', '张湾区');
INSERT INTO `region` VALUES ('1619', '茅箭区', '193', '3', '10', '0', '420302', '茅箭区');
INSERT INTO `region` VALUES ('1620', '丹江口市', '193', '3', '10', '0', '420381', '丹江口市');
INSERT INTO `region` VALUES ('1621', '郧县', '193', '3', '10', '0', '420321', '郧县');
INSERT INTO `region` VALUES ('1622', '郧西县', '193', '3', '10', '0', '420322', '郧西县');
INSERT INTO `region` VALUES ('1623', '竹山县', '193', '3', '10', '0', '420323', '竹山县');
INSERT INTO `region` VALUES ('1624', '竹溪县', '193', '3', '10', '0', '420324', '竹溪县');
INSERT INTO `region` VALUES ('1625', '房县', '193', '3', '10', '0', '420325', '房县');
INSERT INTO `region` VALUES ('1626', '鄂城区', '194', '3', '10', '0', '420704', '鄂城区');
INSERT INTO `region` VALUES ('1627', '华容区', '194', '3', '10', '0', '420703', '华容区');
INSERT INTO `region` VALUES ('1628', '梁子湖区', '194', '3', '10', '0', '420702', '梁子湖区');
INSERT INTO `region` VALUES ('1629', '黄州区', '195', '3', '10', '0', '421102', '黄州区');
INSERT INTO `region` VALUES ('1630', '麻城市', '195', '3', '10', '0', '421181', '麻城市');
INSERT INTO `region` VALUES ('1631', '武穴市', '195', '3', '10', '0', '421182', '武穴市');
INSERT INTO `region` VALUES ('1632', '团风县', '195', '3', '10', '0', '421121', '团风县');
INSERT INTO `region` VALUES ('1633', '红安县', '195', '3', '10', '0', '421122', '红安县');
INSERT INTO `region` VALUES ('1634', '罗田县', '195', '3', '10', '0', '421123', '罗田县');
INSERT INTO `region` VALUES ('1635', '英山县', '195', '3', '10', '0', '421124', '英山县');
INSERT INTO `region` VALUES ('1636', '浠水县', '195', '3', '10', '0', '421125', '浠水县');
INSERT INTO `region` VALUES ('1637', '蕲春县', '195', '3', '10', '0', '421126', '蕲春县');
INSERT INTO `region` VALUES ('1638', '黄梅县', '195', '3', '10', '0', '421127', '黄梅县');
INSERT INTO `region` VALUES ('1639', '江岸区', '196', '3', '10', '0', '420102', '江岸区');
INSERT INTO `region` VALUES ('1640', '武昌区', '196', '3', '10', '0', '420106', '武昌区');
INSERT INTO `region` VALUES ('1641', '江汉区', '196', '3', '10', '0', '420103', '江汉区');
INSERT INTO `region` VALUES ('1642', '硚口区', '196', '3', '10', '0', '420104', '硚口区');
INSERT INTO `region` VALUES ('1643', '汉阳区', '196', '3', '10', '0', '420105', '汉阳区');
INSERT INTO `region` VALUES ('1644', '青山区', '196', '3', '10', '0', '420107', '青山区');
INSERT INTO `region` VALUES ('1645', '洪山区', '196', '3', '10', '0', '420111', '洪山区');
INSERT INTO `region` VALUES ('1646', '东西湖区', '196', '3', '10', '0', '420112', '东西湖区');
INSERT INTO `region` VALUES ('1647', '汉南区', '196', '3', '10', '0', '420113', '汉南区');
INSERT INTO `region` VALUES ('1648', '蔡甸区', '196', '3', '10', '0', '420114', '蔡甸区');
INSERT INTO `region` VALUES ('1649', '江夏区', '196', '3', '10', '0', '420115', '江夏区');
INSERT INTO `region` VALUES ('1650', '黄陂区', '196', '3', '10', '0', '420116', '黄陂区');
INSERT INTO `region` VALUES ('1651', '新洲区', '196', '3', '10', '0', '420117', '新洲区');
INSERT INTO `region` VALUES ('1652', '经济开发区', '196', '3', '10', '0', '0', '经济开发区');
INSERT INTO `region` VALUES ('1653', '仙桃市', '3441', '3', '10', '0', '429004', '仙桃市');
INSERT INTO `region` VALUES ('1654', '岳塘区', '198', '3', '10', '0', '430304', '岳塘区');
INSERT INTO `region` VALUES ('1655', '雨湖区', '198', '3', '10', '0', '430302', '雨湖区');
INSERT INTO `region` VALUES ('1656', '湘乡市', '198', '3', '10', '0', '430381', '湘乡市');
INSERT INTO `region` VALUES ('1657', '韶山市', '198', '3', '10', '0', '430382', '韶山市');
INSERT INTO `region` VALUES ('1658', '湘潭县', '198', '3', '10', '0', '430321', '湘潭县');
INSERT INTO `region` VALUES ('1659', '城步', '199', '3', '10', '0', '430529', '城步');
INSERT INTO `region` VALUES ('1660', '双清区', '199', '3', '10', '0', '430502', '双清区');
INSERT INTO `region` VALUES ('1661', '大祥区', '199', '3', '10', '0', '430503', '大祥区');
INSERT INTO `region` VALUES ('1662', '北塔区', '199', '3', '10', '0', '430511', '北塔区');
INSERT INTO `region` VALUES ('1663', '武冈市', '199', '3', '10', '0', '430581', '武冈市');
INSERT INTO `region` VALUES ('1664', '邵东县', '199', '3', '10', '0', '430521', '邵东县');
INSERT INTO `region` VALUES ('1665', '新邵县', '199', '3', '10', '0', '430522', '新邵县');
INSERT INTO `region` VALUES ('1666', '邵阳县', '199', '3', '10', '0', '430523', '邵阳县');
INSERT INTO `region` VALUES ('1667', '隆回县', '199', '3', '10', '0', '430524', '隆回县');
INSERT INTO `region` VALUES ('1668', '洞口县', '199', '3', '10', '0', '430525', '洞口县');
INSERT INTO `region` VALUES ('1669', '绥宁县', '199', '3', '10', '0', '430527', '绥宁县');
INSERT INTO `region` VALUES ('1670', '新宁县', '199', '3', '10', '0', '430528', '新宁县');
INSERT INTO `region` VALUES ('1671', '赫山区', '200', '3', '10', '0', '430903', '赫山区');
INSERT INTO `region` VALUES ('1672', '资阳区', '200', '3', '10', '0', '430902', '资阳区');
INSERT INTO `region` VALUES ('1673', '沅江市', '200', '3', '10', '0', '430981', '沅江市');
INSERT INTO `region` VALUES ('1674', '南县', '200', '3', '10', '0', '430921', '南县');
INSERT INTO `region` VALUES ('1675', '桃江县', '200', '3', '10', '0', '430922', '桃江县');
INSERT INTO `region` VALUES ('1676', '安化县', '200', '3', '10', '0', '430923', '安化县');
INSERT INTO `region` VALUES ('1677', '吉首市', '201', '3', '10', '0', '433101', '吉首市');
INSERT INTO `region` VALUES ('1678', '泸溪县', '201', '3', '10', '0', '433122', '泸溪县');
INSERT INTO `region` VALUES ('1679', '凤凰县', '201', '3', '10', '0', '433123', '凤凰县');
INSERT INTO `region` VALUES ('1680', '花垣县', '201', '3', '10', '0', '433124', '花垣县');
INSERT INTO `region` VALUES ('1681', '保靖县', '201', '3', '10', '0', '433125', '保靖县');
INSERT INTO `region` VALUES ('1682', '古丈县', '201', '3', '10', '0', '433126', '古丈县');
INSERT INTO `region` VALUES ('1683', '永顺县', '201', '3', '10', '0', '433127', '永顺县');
INSERT INTO `region` VALUES ('1684', '龙山县', '201', '3', '10', '0', '433130', '龙山县');
INSERT INTO `region` VALUES ('1685', '雁峰区', '202', '3', '10', '0', '430406', '雁峰区');
INSERT INTO `region` VALUES ('1686', '珠晖区', '202', '3', '10', '0', '430405', '珠晖区');
INSERT INTO `region` VALUES ('1687', '石鼓区', '202', '3', '10', '0', '430407', '石鼓区');
INSERT INTO `region` VALUES ('1688', '蒸湘区', '202', '3', '10', '0', '430408', '蒸湘区');
INSERT INTO `region` VALUES ('1689', '南岳区', '202', '3', '10', '0', '430412', '南岳区');
INSERT INTO `region` VALUES ('1690', '耒阳市', '202', '3', '10', '0', '430481', '耒阳市');
INSERT INTO `region` VALUES ('1691', '常宁市', '202', '3', '10', '0', '430482', '常宁市');
INSERT INTO `region` VALUES ('1692', '衡阳县', '202', '3', '10', '0', '430421', '衡阳县');
INSERT INTO `region` VALUES ('1693', '衡南县', '202', '3', '10', '0', '430422', '衡南县');
INSERT INTO `region` VALUES ('1694', '衡山县', '202', '3', '10', '0', '430423', '衡山县');
INSERT INTO `region` VALUES ('1695', '衡东县', '202', '3', '10', '0', '430424', '衡东县');
INSERT INTO `region` VALUES ('1696', '祁东县', '202', '3', '10', '0', '430426', '祁东县');
INSERT INTO `region` VALUES ('1697', '北湖区', '203', '3', '10', '0', '431002', '北湖区');
INSERT INTO `region` VALUES ('1698', '苏仙区', '203', '3', '10', '0', '431003', '苏仙区');
INSERT INTO `region` VALUES ('1699', '资兴市', '203', '3', '10', '0', '431081', '资兴市');
INSERT INTO `region` VALUES ('1700', '桂阳县', '203', '3', '10', '0', '431021', '桂阳县');
INSERT INTO `region` VALUES ('1701', '宜章县', '203', '3', '10', '0', '431022', '宜章县');
INSERT INTO `region` VALUES ('1702', '永兴县', '203', '3', '10', '0', '431023', '永兴县');
INSERT INTO `region` VALUES ('1703', '嘉禾县', '203', '3', '10', '0', '431024', '嘉禾县');
INSERT INTO `region` VALUES ('1704', '临武县', '203', '3', '10', '0', '431025', '临武县');
INSERT INTO `region` VALUES ('1705', '汝城县', '203', '3', '10', '0', '431026', '汝城县');
INSERT INTO `region` VALUES ('1706', '桂东县', '203', '3', '10', '0', '431027', '桂东县');
INSERT INTO `region` VALUES ('1707', '安仁县', '203', '3', '10', '0', '431028', '安仁县');
INSERT INTO `region` VALUES ('1708', '娄星区', '204', '3', '10', '0', '431302', '娄星区');
INSERT INTO `region` VALUES ('1709', '冷水江市', '204', '3', '10', '0', '431381', '冷水江市');
INSERT INTO `region` VALUES ('1710', '涟源市', '204', '3', '10', '0', '431382', '涟源市');
INSERT INTO `region` VALUES ('1711', '双峰县', '204', '3', '10', '0', '431321', '双峰县');
INSERT INTO `region` VALUES ('1712', '新化县', '204', '3', '10', '0', '431322', '新化县');
INSERT INTO `region` VALUES ('1713', '鹤城区', '205', '3', '10', '0', '431202', '鹤城区');
INSERT INTO `region` VALUES ('1714', '靖州', '205', '3', '10', '0', '431229', '靖州');
INSERT INTO `region` VALUES ('1715', '麻阳', '205', '3', '10', '0', '431226', '麻阳');
INSERT INTO `region` VALUES ('1716', '通道', '205', '3', '10', '0', '431230', '通道');
INSERT INTO `region` VALUES ('1717', '新晃', '205', '3', '10', '0', '431227', '新晃');
INSERT INTO `region` VALUES ('1718', '芷江', '205', '3', '10', '0', '431228', '芷江');
INSERT INTO `region` VALUES ('1719', '沅陵县', '205', '3', '10', '0', '431222', '沅陵县');
INSERT INTO `region` VALUES ('1720', '辰溪县', '205', '3', '10', '0', '431223', '辰溪县');
INSERT INTO `region` VALUES ('1721', '溆浦县', '205', '3', '10', '0', '431224', '溆浦县');
INSERT INTO `region` VALUES ('1722', '中方县', '205', '3', '10', '0', '431221', '中方县');
INSERT INTO `region` VALUES ('1723', '会同县', '205', '3', '10', '0', '431225', '会同县');
INSERT INTO `region` VALUES ('1724', '洪江市', '205', '3', '10', '0', '431281', '洪江市');
INSERT INTO `region` VALUES ('1725', '岳麓区', '206', '3', '10', '0', '430104', '岳麓区');
INSERT INTO `region` VALUES ('1726', '芙蓉区', '206', '3', '10', '0', '430102', '芙蓉区');
INSERT INTO `region` VALUES ('1727', '天心区', '206', '3', '10', '0', '430103', '天心区');
INSERT INTO `region` VALUES ('1728', '开福区', '206', '3', '10', '0', '430105', '开福区');
INSERT INTO `region` VALUES ('1729', '雨花区', '206', '3', '10', '0', '430111', '雨花区');
INSERT INTO `region` VALUES ('1730', '开发区', '206', '3', '10', '0', '0', '开发区');
INSERT INTO `region` VALUES ('1731', '浏阳市', '206', '3', '10', '0', '430181', '浏阳市');
INSERT INTO `region` VALUES ('1732', '长沙县', '206', '3', '10', '0', '430121', '长沙县');
INSERT INTO `region` VALUES ('1733', '望城县', '206', '3', '10', '0', '430112', '望城县');
INSERT INTO `region` VALUES ('1734', '宁乡县', '206', '3', '10', '0', '430124', '宁乡县');
INSERT INTO `region` VALUES ('1735', '武陵区', '207', '3', '10', '0', '430702', '武陵区');
INSERT INTO `region` VALUES ('1736', '鼎城区', '207', '3', '10', '0', '430703', '鼎城区');
INSERT INTO `region` VALUES ('1737', '津市市', '207', '3', '10', '0', '430781', '津市市');
INSERT INTO `region` VALUES ('1738', '安乡县', '207', '3', '10', '0', '430721', '安乡县');
INSERT INTO `region` VALUES ('1739', '汉寿县', '207', '3', '10', '0', '430722', '汉寿县');
INSERT INTO `region` VALUES ('1740', '澧县', '207', '3', '10', '0', '430723', '澧县');
INSERT INTO `region` VALUES ('1741', '临澧县', '207', '3', '10', '0', '430724', '临澧县');
INSERT INTO `region` VALUES ('1742', '桃源县', '207', '3', '10', '0', '430725', '桃源县');
INSERT INTO `region` VALUES ('1743', '石门县', '207', '3', '10', '0', '430726', '石门县');
INSERT INTO `region` VALUES ('1744', '永定区', '208', '3', '10', '0', '430802', '永定区');
INSERT INTO `region` VALUES ('1745', '武陵源区', '208', '3', '10', '0', '430811', '武陵源区');
INSERT INTO `region` VALUES ('1746', '慈利县', '208', '3', '10', '0', '430821', '慈利县');
INSERT INTO `region` VALUES ('1747', '桑植县', '208', '3', '10', '0', '430822', '桑植县');
INSERT INTO `region` VALUES ('1748', '江华', '209', '3', '10', '0', '431129', '江华');
INSERT INTO `region` VALUES ('1749', '冷水滩区', '209', '3', '10', '0', '431103', '冷水滩区');
INSERT INTO `region` VALUES ('1750', '零陵区', '209', '3', '10', '0', '431102', '零陵区');
INSERT INTO `region` VALUES ('1751', '祁阳县', '209', '3', '10', '0', '431121', '祁阳县');
INSERT INTO `region` VALUES ('1752', '东安县', '209', '3', '10', '0', '431122', '东安县');
INSERT INTO `region` VALUES ('1753', '双牌县', '209', '3', '10', '0', '431123', '双牌县');
INSERT INTO `region` VALUES ('1754', '道县', '209', '3', '10', '0', '431124', '道县');
INSERT INTO `region` VALUES ('1755', '江永县', '209', '3', '10', '0', '431125', '江永县');
INSERT INTO `region` VALUES ('1756', '宁远县', '209', '3', '10', '0', '431126', '宁远县');
INSERT INTO `region` VALUES ('1757', '蓝山县', '209', '3', '10', '0', '431127', '蓝山县');
INSERT INTO `region` VALUES ('1758', '新田县', '209', '3', '10', '0', '431128', '新田县');
INSERT INTO `region` VALUES ('1759', '岳阳楼区', '210', '3', '10', '0', '430602', '岳阳楼区');
INSERT INTO `region` VALUES ('1760', '君山区', '210', '3', '10', '0', '430611', '君山区');
INSERT INTO `region` VALUES ('1761', '云溪区', '210', '3', '10', '0', '430603', '云溪区');
INSERT INTO `region` VALUES ('1762', '汨罗市', '210', '3', '10', '0', '430681', '汨罗市');
INSERT INTO `region` VALUES ('1763', '临湘市', '210', '3', '10', '0', '430682', '临湘市');
INSERT INTO `region` VALUES ('1764', '岳阳县', '210', '3', '10', '0', '430621', '岳阳县');
INSERT INTO `region` VALUES ('1765', '华容县', '210', '3', '10', '0', '430623', '华容县');
INSERT INTO `region` VALUES ('1766', '湘阴县', '210', '3', '10', '0', '430624', '湘阴县');
INSERT INTO `region` VALUES ('1767', '平江县', '210', '3', '10', '0', '430626', '平江县');
INSERT INTO `region` VALUES ('1768', '天元区', '211', '3', '10', '0', '430211', '天元区');
INSERT INTO `region` VALUES ('1769', '荷塘区', '211', '3', '10', '0', '430202', '荷塘区');
INSERT INTO `region` VALUES ('1770', '芦淞区', '211', '3', '10', '0', '430203', '芦淞区');
INSERT INTO `region` VALUES ('1771', '石峰区', '211', '3', '10', '0', '430204', '石峰区');
INSERT INTO `region` VALUES ('1772', '醴陵市', '211', '3', '10', '0', '430281', '醴陵市');
INSERT INTO `region` VALUES ('1773', '株洲县', '211', '3', '10', '0', '430221', '株洲县');
INSERT INTO `region` VALUES ('1774', '攸县', '211', '3', '10', '0', '430223', '攸县');
INSERT INTO `region` VALUES ('1775', '茶陵县', '211', '3', '10', '0', '430224', '茶陵县');
INSERT INTO `region` VALUES ('1776', '炎陵县', '211', '3', '10', '0', '430225', '炎陵县');
INSERT INTO `region` VALUES ('1777', '铁西区', '212', '3', '10', '0', '220302', '铁西区');
INSERT INTO `region` VALUES ('1778', '铁东区', '212', '3', '10', '0', '220303', '铁东区');
INSERT INTO `region` VALUES ('1779', '伊通', '212', '3', '10', '0', '220323', '伊通');
INSERT INTO `region` VALUES ('1780', '公主岭市', '212', '3', '10', '0', '220381', '公主岭市');
INSERT INTO `region` VALUES ('1781', '双辽市', '212', '3', '10', '0', '220382', '双辽市');
INSERT INTO `region` VALUES ('1782', '梨树县', '212', '3', '10', '0', '220322', '梨树县');
INSERT INTO `region` VALUES ('1783', '前郭尔罗斯', '213', '3', '10', '0', '220721', '前郭尔罗斯');
INSERT INTO `region` VALUES ('1784', '宁江区', '213', '3', '10', '0', '220702', '宁江区');
INSERT INTO `region` VALUES ('1785', '长岭县', '213', '3', '10', '0', '220722', '长岭县');
INSERT INTO `region` VALUES ('1786', '乾安县', '213', '3', '10', '0', '220723', '乾安县');
INSERT INTO `region` VALUES ('1787', '扶余县', '213', '3', '10', '0', '220781', '扶余县');
INSERT INTO `region` VALUES ('1788', '东昌区', '214', '3', '10', '0', '220502', '东昌区');
INSERT INTO `region` VALUES ('1789', '二道江区', '214', '3', '10', '0', '220503', '二道江区');
INSERT INTO `region` VALUES ('1790', '梅河口市', '214', '3', '10', '0', '220581', '梅河口市');
INSERT INTO `region` VALUES ('1791', '集安市', '214', '3', '10', '0', '220582', '集安市');
INSERT INTO `region` VALUES ('1792', '通化县', '214', '3', '10', '0', '220521', '通化县');
INSERT INTO `region` VALUES ('1793', '辉南县', '214', '3', '10', '0', '220523', '辉南县');
INSERT INTO `region` VALUES ('1794', '柳河县', '214', '3', '10', '0', '220524', '柳河县');
INSERT INTO `region` VALUES ('1795', '延吉市', '215', '3', '10', '0', '222401', '延吉市');
INSERT INTO `region` VALUES ('1796', '图们市', '215', '3', '10', '0', '222402', '图们市');
INSERT INTO `region` VALUES ('1797', '敦化市', '215', '3', '10', '0', '222403', '敦化市');
INSERT INTO `region` VALUES ('1798', '珲春市', '215', '3', '10', '0', '222404', '珲春市');
INSERT INTO `region` VALUES ('1799', '龙井市', '215', '3', '10', '0', '222405', '龙井市');
INSERT INTO `region` VALUES ('1800', '和龙市', '215', '3', '10', '0', '222406', '和龙市');
INSERT INTO `region` VALUES ('1801', '安图县', '215', '3', '10', '0', '222426', '安图县');
INSERT INTO `region` VALUES ('1802', '汪清县', '215', '3', '10', '0', '222424', '汪清县');
INSERT INTO `region` VALUES ('1803', '船营区', '216', '3', '10', '0', '220204', '船营区');
INSERT INTO `region` VALUES ('1804', '昌邑区', '216', '3', '10', '0', '220202', '昌邑区');
INSERT INTO `region` VALUES ('1805', '龙潭区', '216', '3', '10', '0', '220203', '龙潭区');
INSERT INTO `region` VALUES ('1806', '丰满区', '216', '3', '10', '0', '220211', '丰满区');
INSERT INTO `region` VALUES ('1807', '蛟河市', '216', '3', '10', '0', '220281', '蛟河市');
INSERT INTO `region` VALUES ('1808', '桦甸市', '216', '3', '10', '0', '220282', '桦甸市');
INSERT INTO `region` VALUES ('1809', '舒兰市', '216', '3', '10', '0', '220283', '舒兰市');
INSERT INTO `region` VALUES ('1810', '磐石市', '216', '3', '10', '0', '220284', '磐石市');
INSERT INTO `region` VALUES ('1811', '永吉县', '216', '3', '10', '0', '220221', '永吉县');
INSERT INTO `region` VALUES ('1812', '洮北区', '217', '3', '10', '0', '220802', '洮北区');
INSERT INTO `region` VALUES ('1813', '洮南市', '217', '3', '10', '0', '220881', '洮南市');
INSERT INTO `region` VALUES ('1814', '大安市', '217', '3', '10', '0', '220882', '大安市');
INSERT INTO `region` VALUES ('1815', '镇赉县', '217', '3', '10', '0', '220821', '镇赉县');
INSERT INTO `region` VALUES ('1816', '通榆县', '217', '3', '10', '0', '220822', '通榆县');
INSERT INTO `region` VALUES ('1817', '江源区', '218', '3', '10', '0', '220605', '江源区');
INSERT INTO `region` VALUES ('1818', '八道江区', '218', '3', '10', '0', '0', '八道江区');
INSERT INTO `region` VALUES ('1819', '长白', '218', '3', '10', '0', '220623', '长白');
INSERT INTO `region` VALUES ('1820', '临江市', '218', '3', '10', '0', '220681', '临江市');
INSERT INTO `region` VALUES ('1821', '抚松县', '218', '3', '10', '0', '220621', '抚松县');
INSERT INTO `region` VALUES ('1822', '靖宇县', '218', '3', '10', '0', '220622', '靖宇县');
INSERT INTO `region` VALUES ('1823', '龙山区', '219', '3', '10', '0', '220402', '龙山区');
INSERT INTO `region` VALUES ('1824', '西安区', '219', '3', '10', '0', '220403', '西安区');
INSERT INTO `region` VALUES ('1825', '东丰县', '219', '3', '10', '0', '220421', '东丰县');
INSERT INTO `region` VALUES ('1826', '东辽县', '219', '3', '10', '0', '220422', '东辽县');
INSERT INTO `region` VALUES ('1827', '朝阳区', '220', '3', '10', '0', '220104', '朝阳区');
INSERT INTO `region` VALUES ('1828', '宽城区', '220', '3', '10', '0', '220103', '宽城区');
INSERT INTO `region` VALUES ('1829', '二道区', '220', '3', '10', '0', '220105', '二道区');
INSERT INTO `region` VALUES ('1830', '南关区', '220', '3', '10', '0', '220102', '南关区');
INSERT INTO `region` VALUES ('1831', '绿园区', '220', '3', '10', '0', '220106', '绿园区');
INSERT INTO `region` VALUES ('1832', '双阳区', '220', '3', '10', '0', '220112', '双阳区');
INSERT INTO `region` VALUES ('1833', '净月潭开发区', '220', '3', '10', '0', '0', '净月潭开发区');
INSERT INTO `region` VALUES ('1834', '高新技术开发区', '220', '3', '10', '0', '0', '高新技术开发区');
INSERT INTO `region` VALUES ('1835', '经济技术开发区', '220', '3', '10', '0', '0', '经济技术开发区');
INSERT INTO `region` VALUES ('1836', '汽车产业开发区', '220', '3', '10', '0', '0', '汽车产业开发区');
INSERT INTO `region` VALUES ('1837', '德惠市', '220', '3', '10', '0', '220183', '德惠市');
INSERT INTO `region` VALUES ('1838', '九台市', '220', '3', '10', '0', '220181', '九台市');
INSERT INTO `region` VALUES ('1839', '榆树市', '220', '3', '10', '0', '220182', '榆树市');
INSERT INTO `region` VALUES ('1840', '农安县', '220', '3', '10', '0', '220122', '农安县');
INSERT INTO `region` VALUES ('1841', '安源区', '221', '3', '10', '0', '360302', '安源区');
INSERT INTO `region` VALUES ('1842', '湘东区', '221', '3', '10', '0', '360313', '湘东区');
INSERT INTO `region` VALUES ('1843', '莲花县', '221', '3', '10', '0', '360321', '莲花县');
INSERT INTO `region` VALUES ('1844', '芦溪县', '221', '3', '10', '0', '360323', '芦溪县');
INSERT INTO `region` VALUES ('1845', '上栗县', '221', '3', '10', '0', '360322', '上栗县');
INSERT INTO `region` VALUES ('1846', '浔阳区', '222', '3', '10', '0', '360403', '浔阳区');
INSERT INTO `region` VALUES ('1847', '庐山区', '222', '3', '10', '0', '360402', '庐山区');
INSERT INTO `region` VALUES ('1848', '瑞昌市', '222', '3', '10', '0', '360481', '瑞昌市');
INSERT INTO `region` VALUES ('1849', '九江县', '222', '3', '10', '0', '360421', '九江县');
INSERT INTO `region` VALUES ('1850', '武宁县', '222', '3', '10', '0', '360423', '武宁县');
INSERT INTO `region` VALUES ('1851', '修水县', '222', '3', '10', '0', '360424', '修水县');
INSERT INTO `region` VALUES ('1852', '永修县', '222', '3', '10', '0', '360425', '永修县');
INSERT INTO `region` VALUES ('1853', '德安县', '222', '3', '10', '0', '360426', '德安县');
INSERT INTO `region` VALUES ('1854', '星子县', '222', '3', '10', '0', '360427', '星子县');
INSERT INTO `region` VALUES ('1855', '都昌县', '222', '3', '10', '0', '360428', '都昌县');
INSERT INTO `region` VALUES ('1856', '湖口县', '222', '3', '10', '0', '360429', '湖口县');
INSERT INTO `region` VALUES ('1857', '彭泽县', '222', '3', '10', '0', '360430', '彭泽县');
INSERT INTO `region` VALUES ('1858', '珠山区', '223', '3', '10', '0', '360203', '珠山区');
INSERT INTO `region` VALUES ('1859', '昌江区', '223', '3', '10', '0', '360202', '昌江区');
INSERT INTO `region` VALUES ('1860', '乐平市', '223', '3', '10', '0', '360281', '乐平市');
INSERT INTO `region` VALUES ('1861', '浮梁县', '223', '3', '10', '0', '360222', '浮梁县');
INSERT INTO `region` VALUES ('1862', '安福县', '224', '3', '10', '0', '360829', '安福县');
INSERT INTO `region` VALUES ('1863', '吉州区', '224', '3', '10', '0', '360802', '吉州区');
INSERT INTO `region` VALUES ('1864', '青原区', '224', '3', '10', '0', '360803', '青原区');
INSERT INTO `region` VALUES ('1865', '井冈山市', '224', '3', '10', '0', '360881', '井冈山市');
INSERT INTO `region` VALUES ('1866', '吉安县', '224', '3', '10', '0', '360821', '吉安县');
INSERT INTO `region` VALUES ('1867', '吉水县', '224', '3', '10', '0', '360822', '吉水县');
INSERT INTO `region` VALUES ('1868', '峡江县', '224', '3', '10', '0', '360823', '峡江县');
INSERT INTO `region` VALUES ('1869', '新干县', '224', '3', '10', '0', '360824', '新干县');
INSERT INTO `region` VALUES ('1870', '永丰县', '224', '3', '10', '0', '360825', '永丰县');
INSERT INTO `region` VALUES ('1871', '泰和县', '224', '3', '10', '0', '360826', '泰和县');
INSERT INTO `region` VALUES ('1872', '遂川县', '224', '3', '10', '0', '360827', '遂川县');
INSERT INTO `region` VALUES ('1873', '万安县', '224', '3', '10', '0', '360828', '万安县');
INSERT INTO `region` VALUES ('1874', '永新县', '224', '3', '10', '0', '360830', '永新县');
INSERT INTO `region` VALUES ('1875', '章贡区', '225', '3', '10', '0', '360702', '章贡区');
INSERT INTO `region` VALUES ('1876', '于都县', '225', '3', '10', '0', '360731', '于都县');
INSERT INTO `region` VALUES ('1877', '瑞金市', '225', '3', '10', '0', '360781', '瑞金市');
INSERT INTO `region` VALUES ('1878', '南康市', '225', '3', '10', '0', '360782', '南康市');
INSERT INTO `region` VALUES ('1879', '赣县', '225', '3', '10', '0', '360721', '赣县');
INSERT INTO `region` VALUES ('1880', '信丰县', '225', '3', '10', '0', '360722', '信丰县');
INSERT INTO `region` VALUES ('1881', '大余县', '225', '3', '10', '0', '360723', '大余县');
INSERT INTO `region` VALUES ('1882', '上犹县', '225', '3', '10', '0', '360724', '上犹县');
INSERT INTO `region` VALUES ('1883', '崇义县', '225', '3', '10', '0', '360725', '崇义县');
INSERT INTO `region` VALUES ('1884', '安远县', '225', '3', '10', '0', '360726', '安远县');
INSERT INTO `region` VALUES ('1885', '龙南县', '225', '3', '10', '0', '360727', '龙南县');
INSERT INTO `region` VALUES ('1886', '定南县', '225', '3', '10', '0', '360728', '定南县');
INSERT INTO `region` VALUES ('1887', '全南县', '225', '3', '10', '0', '360729', '全南县');
INSERT INTO `region` VALUES ('1888', '宁都县', '225', '3', '10', '0', '360730', '宁都县');
INSERT INTO `region` VALUES ('1889', '兴国县', '225', '3', '10', '0', '360732', '兴国县');
INSERT INTO `region` VALUES ('1890', '会昌县', '225', '3', '10', '0', '360733', '会昌县');
INSERT INTO `region` VALUES ('1891', '寻乌县', '225', '3', '10', '0', '360734', '寻乌县');
INSERT INTO `region` VALUES ('1892', '石城县', '225', '3', '10', '0', '360735', '石城县');
INSERT INTO `region` VALUES ('1893', '临川区', '226', '3', '10', '0', '361002', '临川区');
INSERT INTO `region` VALUES ('1894', '南城县', '226', '3', '10', '0', '361021', '南城县');
INSERT INTO `region` VALUES ('1895', '黎川县', '226', '3', '10', '0', '361022', '黎川县');
INSERT INTO `region` VALUES ('1896', '南丰县', '226', '3', '10', '0', '361023', '南丰县');
INSERT INTO `region` VALUES ('1897', '崇仁县', '226', '3', '10', '0', '361024', '崇仁县');
INSERT INTO `region` VALUES ('1898', '乐安县', '226', '3', '10', '0', '361025', '乐安县');
INSERT INTO `region` VALUES ('1899', '宜黄县', '226', '3', '10', '0', '361026', '宜黄县');
INSERT INTO `region` VALUES ('1900', '金溪县', '226', '3', '10', '0', '361027', '金溪县');
INSERT INTO `region` VALUES ('1901', '资溪县', '226', '3', '10', '0', '361028', '资溪县');
INSERT INTO `region` VALUES ('1902', '东乡县', '226', '3', '10', '0', '361029', '东乡县');
INSERT INTO `region` VALUES ('1903', '广昌县', '226', '3', '10', '0', '361030', '广昌县');
INSERT INTO `region` VALUES ('1904', '东湖区', '227', '3', '10', '0', '360102', '东湖区');
INSERT INTO `region` VALUES ('1905', '西湖区', '227', '3', '10', '0', '360103', '西湖区');
INSERT INTO `region` VALUES ('1906', '青云谱区', '227', '3', '10', '0', '360104', '青云谱区');
INSERT INTO `region` VALUES ('1907', '湾里区', '227', '3', '10', '0', '360105', '湾里区');
INSERT INTO `region` VALUES ('1908', '青山湖区', '227', '3', '10', '0', '360111', '青山湖区');
INSERT INTO `region` VALUES ('1909', '红谷滩新区', '227', '3', '10', '0', '360125', '红谷滩新区');
INSERT INTO `region` VALUES ('1910', '昌北区', '227', '3', '10', '0', '0', '昌北区');
INSERT INTO `region` VALUES ('1911', '高新区', '227', '3', '10', '0', '0', '高新区');
INSERT INTO `region` VALUES ('1912', '南昌县', '227', '3', '10', '0', '360121', '南昌县');
INSERT INTO `region` VALUES ('1913', '新建县', '227', '3', '10', '0', '360122', '新建县');
INSERT INTO `region` VALUES ('1914', '安义县', '227', '3', '10', '0', '360123', '安义县');
INSERT INTO `region` VALUES ('1915', '进贤县', '227', '3', '10', '0', '360124', '进贤县');
INSERT INTO `region` VALUES ('1916', '袁州区', '228', '3', '10', '0', '360902', '袁州区');
INSERT INTO `region` VALUES ('1917', '丰城市', '228', '3', '10', '0', '360981', '丰城市');
INSERT INTO `region` VALUES ('1918', '樟树市', '228', '3', '10', '0', '360982', '樟树市');
INSERT INTO `region` VALUES ('1919', '高安市', '228', '3', '10', '0', '360983', '高安市');
INSERT INTO `region` VALUES ('1920', '奉新县', '228', '3', '10', '0', '360921', '奉新县');
INSERT INTO `region` VALUES ('1921', '万载县', '228', '3', '10', '0', '360922', '万载县');
INSERT INTO `region` VALUES ('1922', '上高县', '228', '3', '10', '0', '360923', '上高县');
INSERT INTO `region` VALUES ('1923', '宜丰县', '228', '3', '10', '0', '360924', '宜丰县');
INSERT INTO `region` VALUES ('1924', '靖安县', '228', '3', '10', '0', '360925', '靖安县');
INSERT INTO `region` VALUES ('1925', '铜鼓县', '228', '3', '10', '0', '360926', '铜鼓县');
INSERT INTO `region` VALUES ('1926', '月湖区', '229', '3', '10', '0', '360602', '月湖区');
INSERT INTO `region` VALUES ('1927', '贵溪市', '229', '3', '10', '0', '360681', '贵溪市');
INSERT INTO `region` VALUES ('1928', '余江县', '229', '3', '10', '0', '360622', '余江县');
INSERT INTO `region` VALUES ('1929', '信州区', '230', '3', '10', '0', '361102', '信州区');
INSERT INTO `region` VALUES ('1930', '德兴市', '230', '3', '10', '0', '361181', '德兴市');
INSERT INTO `region` VALUES ('1931', '上饶县', '230', '3', '10', '0', '361121', '上饶县');
INSERT INTO `region` VALUES ('1932', '广丰县', '230', '3', '10', '0', '361122', '广丰县');
INSERT INTO `region` VALUES ('1933', '玉山县', '230', '3', '10', '0', '361123', '玉山县');
INSERT INTO `region` VALUES ('1934', '铅山县', '230', '3', '10', '0', '361124', '铅山县');
INSERT INTO `region` VALUES ('1935', '横峰县', '230', '3', '10', '0', '361125', '横峰县');
INSERT INTO `region` VALUES ('1936', '弋阳县', '230', '3', '10', '0', '361126', '弋阳县');
INSERT INTO `region` VALUES ('1937', '余干县', '230', '3', '10', '0', '361127', '余干县');
INSERT INTO `region` VALUES ('1938', '波阳县', '230', '3', '10', '0', '0', '波阳县');
INSERT INTO `region` VALUES ('1939', '万年县', '230', '3', '10', '0', '361129', '万年县');
INSERT INTO `region` VALUES ('1940', '婺源县', '230', '3', '10', '0', '361130', '婺源县');
INSERT INTO `region` VALUES ('1941', '渝水区', '231', '3', '10', '0', '360502', '渝水区');
INSERT INTO `region` VALUES ('1942', '分宜县', '231', '3', '10', '0', '360521', '分宜县');
INSERT INTO `region` VALUES ('1943', '京口区', '232', '3', '10', '0', '321102', '京口区');
INSERT INTO `region` VALUES ('1944', '润州区', '232', '3', '10', '0', '321111', '润州区');
INSERT INTO `region` VALUES ('1945', '丹徒区', '232', '3', '10', '0', '321112', '丹徒区');
INSERT INTO `region` VALUES ('1946', '丹阳市', '232', '3', '10', '0', '321181', '丹阳市');
INSERT INTO `region` VALUES ('1947', '扬中市', '232', '3', '10', '0', '321182', '扬中市');
INSERT INTO `region` VALUES ('1948', '句容市', '232', '3', '10', '0', '321183', '句容市');
INSERT INTO `region` VALUES ('1949', '广陵区', '233', '3', '10', '0', '321002', '广陵区');
INSERT INTO `region` VALUES ('1950', '维扬区', '233', '3', '10', '0', '0', '维扬区');
INSERT INTO `region` VALUES ('1951', '邗江区', '233', '3', '10', '0', '321003', '邗江区');
INSERT INTO `region` VALUES ('1952', '仪征市', '233', '3', '10', '0', '321081', '仪征市');
INSERT INTO `region` VALUES ('1953', '高邮市', '233', '3', '10', '0', '321084', '高邮市');
INSERT INTO `region` VALUES ('1954', '江都市', '233', '3', '10', '0', '321012', '江都市');
INSERT INTO `region` VALUES ('1955', '宝应县', '233', '3', '10', '0', '321023', '宝应县');
INSERT INTO `region` VALUES ('1956', '城区', '234', '3', '10', '0', '0', '城区');
INSERT INTO `region` VALUES ('1957', '亭湖区', '234', '3', '10', '0', '320902', '亭湖区');
INSERT INTO `region` VALUES ('1958', '盐都区', '234', '3', '10', '0', '320903', '盐都区');
INSERT INTO `region` VALUES ('1959', '盐都县', '234', '3', '10', '0', '320903', '盐都县');
INSERT INTO `region` VALUES ('1960', '东台市', '234', '3', '10', '0', '320981', '东台市');
INSERT INTO `region` VALUES ('1961', '大丰市', '234', '3', '10', '0', '320982', '大丰市');
INSERT INTO `region` VALUES ('1962', '响水县', '234', '3', '10', '0', '320921', '响水县');
INSERT INTO `region` VALUES ('1963', '滨海县', '234', '3', '10', '0', '320922', '滨海县');
INSERT INTO `region` VALUES ('1964', '阜宁县', '234', '3', '10', '0', '320923', '阜宁县');
INSERT INTO `region` VALUES ('1965', '射阳县', '234', '3', '10', '0', '320924', '射阳县');
INSERT INTO `region` VALUES ('1966', '建湖县', '234', '3', '10', '0', '320925', '建湖县');
INSERT INTO `region` VALUES ('1967', '云龙区', '235', '3', '10', '0', '320303', '云龙区');
INSERT INTO `region` VALUES ('1968', '鼓楼区', '235', '3', '10', '0', '320302', '鼓楼区');
INSERT INTO `region` VALUES ('1969', '九里区', '235', '3', '10', '0', '0', '九里区');
INSERT INTO `region` VALUES ('1970', '贾汪区', '235', '3', '10', '0', '320305', '贾汪区');
INSERT INTO `region` VALUES ('1971', '泉山区', '235', '3', '10', '0', '320311', '泉山区');
INSERT INTO `region` VALUES ('1972', '新沂市', '235', '3', '10', '0', '320381', '新沂市');
INSERT INTO `region` VALUES ('1973', '邳州市', '235', '3', '10', '0', '320382', '邳州市');
INSERT INTO `region` VALUES ('1974', '丰县', '235', '3', '10', '0', '320321', '丰县');
INSERT INTO `region` VALUES ('1975', '沛县', '235', '3', '10', '0', '320322', '沛县');
INSERT INTO `region` VALUES ('1976', '铜山县', '235', '3', '10', '0', '320312', '铜山县');
INSERT INTO `region` VALUES ('1977', '睢宁县', '235', '3', '10', '0', '320324', '睢宁县');
INSERT INTO `region` VALUES ('1978', '海陵区', '236', '3', '10', '0', '321202', '海陵区');
INSERT INTO `region` VALUES ('1979', '高港区', '236', '3', '10', '0', '321203', '高港区');
INSERT INTO `region` VALUES ('1980', '兴化市', '236', '3', '10', '0', '321281', '兴化市');
INSERT INTO `region` VALUES ('1981', '靖江市', '236', '3', '10', '0', '321282', '靖江市');
INSERT INTO `region` VALUES ('1982', '泰兴市', '236', '3', '10', '0', '321283', '泰兴市');
INSERT INTO `region` VALUES ('1983', '姜堰市', '236', '3', '10', '0', '321204', '姜堰市');
INSERT INTO `region` VALUES ('1984', '宿城区', '237', '3', '10', '0', '321302', '宿城区');
INSERT INTO `region` VALUES ('1985', '宿豫区', '237', '3', '10', '0', '321311', '宿豫区');
INSERT INTO `region` VALUES ('1986', '宿豫县', '237', '3', '10', '0', '321311', '宿豫县');
INSERT INTO `region` VALUES ('1987', '沭阳县', '237', '3', '10', '0', '321322', '沭阳县');
INSERT INTO `region` VALUES ('1988', '泗阳县', '237', '3', '10', '0', '321323', '泗阳县');
INSERT INTO `region` VALUES ('1989', '泗洪县', '237', '3', '10', '0', '321324', '泗洪县');
INSERT INTO `region` VALUES ('1990', '崇川区', '238', '3', '10', '0', '320602', '崇川区');
INSERT INTO `region` VALUES ('1991', '港闸区', '238', '3', '10', '0', '320611', '港闸区');
INSERT INTO `region` VALUES ('1992', '经济开发区', '238', '3', '10', '0', '0', '经济开发区');
INSERT INTO `region` VALUES ('1993', '启东市', '238', '3', '10', '0', '320681', '启东市');
INSERT INTO `region` VALUES ('1994', '如皋市', '238', '3', '10', '0', '320682', '如皋市');
INSERT INTO `region` VALUES ('1995', '通州市', '238', '3', '10', '0', '320612', '通州市');
INSERT INTO `region` VALUES ('1996', '海门市', '238', '3', '10', '0', '320684', '海门市');
INSERT INTO `region` VALUES ('1997', '海安县', '238', '3', '10', '0', '320621', '海安县');
INSERT INTO `region` VALUES ('1998', '如东县', '238', '3', '10', '0', '320623', '如东县');
INSERT INTO `region` VALUES ('1999', '新浦区', '239', '3', '10', '0', '320705', '新浦区');
INSERT INTO `region` VALUES ('2000', '连云区', '239', '3', '10', '0', '320703', '连云区');
INSERT INTO `region` VALUES ('2001', '海州区', '239', '3', '10', '0', '320706', '海州区');
INSERT INTO `region` VALUES ('2002', '赣榆县', '239', '3', '10', '0', '320721', '赣榆县');
INSERT INTO `region` VALUES ('2003', '东海县', '239', '3', '10', '0', '320722', '东海县');
INSERT INTO `region` VALUES ('2004', '灌云县', '239', '3', '10', '0', '320723', '灌云县');
INSERT INTO `region` VALUES ('2005', '灌南县', '239', '3', '10', '0', '320724', '灌南县');
INSERT INTO `region` VALUES ('2006', '清河区', '240', '3', '10', '0', '320802', '清河区');
INSERT INTO `region` VALUES ('2007', '清浦区', '240', '3', '10', '0', '320811', '清浦区');
INSERT INTO `region` VALUES ('2008', '楚州区', '240', '3', '10', '0', '0', '楚州区');
INSERT INTO `region` VALUES ('2009', '淮阴区', '240', '3', '10', '0', '320804', '淮阴区');
INSERT INTO `region` VALUES ('2010', '涟水县', '240', '3', '10', '0', '320826', '涟水县');
INSERT INTO `region` VALUES ('2011', '洪泽县', '240', '3', '10', '0', '320829', '洪泽县');
INSERT INTO `region` VALUES ('2012', '盱眙县', '240', '3', '10', '0', '320830', '盱眙县');
INSERT INTO `region` VALUES ('2013', '金湖县', '240', '3', '10', '0', '320831', '金湖县');
INSERT INTO `region` VALUES ('2014', '玄武区', '241', '3', '10', '0', '320102', '玄武区');
INSERT INTO `region` VALUES ('2015', '鼓楼区', '241', '3', '10', '0', '320106', '鼓楼区');
INSERT INTO `region` VALUES ('2016', '白下区', '241', '3', '10', '0', '0', '白下区');
INSERT INTO `region` VALUES ('2017', '建邺区', '241', '3', '10', '0', '320105', '建邺区');
INSERT INTO `region` VALUES ('2018', '秦淮区', '241', '3', '10', '0', '320104', '秦淮区');
INSERT INTO `region` VALUES ('2019', '雨花台区', '241', '3', '10', '0', '320114', '雨花台区');
INSERT INTO `region` VALUES ('2020', '下关区', '241', '3', '10', '0', '0', '下关区');
INSERT INTO `region` VALUES ('2021', '栖霞区', '241', '3', '10', '0', '320113', '栖霞区');
INSERT INTO `region` VALUES ('2022', '浦口区', '241', '3', '10', '0', '320111', '浦口区');
INSERT INTO `region` VALUES ('2023', '江宁区', '241', '3', '10', '0', '320115', '江宁区');
INSERT INTO `region` VALUES ('2024', '六合区', '241', '3', '10', '0', '320116', '六合区');
INSERT INTO `region` VALUES ('2025', '溧水县', '241', '3', '10', '0', '320117', '溧水县');
INSERT INTO `region` VALUES ('2026', '高淳县', '241', '3', '10', '0', '320118', '高淳县');
INSERT INTO `region` VALUES ('2027', '沧浪区', '242', '3', '10', '0', '0', '沧浪区');
INSERT INTO `region` VALUES ('2028', '金阊区', '242', '3', '10', '0', '0', '金阊区');
INSERT INTO `region` VALUES ('2029', '平江区', '242', '3', '10', '0', '0', '平江区');
INSERT INTO `region` VALUES ('2030', '虎丘区', '242', '3', '10', '0', '320505', '虎丘区');
INSERT INTO `region` VALUES ('2031', '吴中区', '242', '3', '10', '0', '320506', '吴中区');
INSERT INTO `region` VALUES ('2032', '相城区', '242', '3', '10', '0', '320507', '相城区');
INSERT INTO `region` VALUES ('2033', '园区', '242', '3', '10', '0', '0', '园区');
INSERT INTO `region` VALUES ('2034', '新区', '242', '3', '10', '0', '0', '新区');
INSERT INTO `region` VALUES ('2035', '常熟市', '242', '3', '10', '0', '320581', '常熟市');
INSERT INTO `region` VALUES ('2036', '张家港市', '242', '3', '10', '0', '320582', '张家港市');
INSERT INTO `region` VALUES ('2037', '玉山镇', '242', '3', '10', '0', '0', '玉山镇');
INSERT INTO `region` VALUES ('2038', '巴城镇', '242', '3', '10', '0', '0', '巴城镇');
INSERT INTO `region` VALUES ('2039', '周市镇', '242', '3', '10', '0', '0', '周市镇');
INSERT INTO `region` VALUES ('2040', '陆家镇', '242', '3', '10', '0', '0', '陆家镇');
INSERT INTO `region` VALUES ('2041', '花桥镇', '242', '3', '10', '0', '0', '花桥镇');
INSERT INTO `region` VALUES ('2042', '淀山湖镇', '242', '3', '10', '0', '0', '淀山湖镇');
INSERT INTO `region` VALUES ('2043', '张浦镇', '242', '3', '10', '0', '0', '张浦镇');
INSERT INTO `region` VALUES ('2044', '周庄镇', '242', '3', '10', '0', '0', '周庄镇');
INSERT INTO `region` VALUES ('2045', '千灯镇', '242', '3', '10', '0', '0', '千灯镇');
INSERT INTO `region` VALUES ('2046', '锦溪镇', '242', '3', '10', '0', '0', '锦溪镇');
INSERT INTO `region` VALUES ('2047', '开发区', '242', '3', '10', '0', '0', '开发区');
INSERT INTO `region` VALUES ('2048', '吴江市', '242', '3', '10', '0', '320509', '吴江市');
INSERT INTO `region` VALUES ('2049', '太仓市', '242', '3', '10', '0', '320585', '太仓市');
INSERT INTO `region` VALUES ('2050', '崇安区', '243', '3', '10', '0', '320202', '崇安区');
INSERT INTO `region` VALUES ('2051', '北塘区', '243', '3', '10', '0', '320204', '北塘区');
INSERT INTO `region` VALUES ('2052', '南长区', '243', '3', '10', '0', '320203', '南长区');
INSERT INTO `region` VALUES ('2053', '锡山区', '243', '3', '10', '0', '320205', '锡山区');
INSERT INTO `region` VALUES ('2054', '惠山区', '243', '3', '10', '0', '320206', '惠山区');
INSERT INTO `region` VALUES ('2055', '滨湖区', '243', '3', '10', '0', '320211', '滨湖区');
INSERT INTO `region` VALUES ('2056', '新区', '243', '3', '10', '0', '0', '新区');
INSERT INTO `region` VALUES ('2057', '江阴市', '243', '3', '10', '0', '320281', '江阴市');
INSERT INTO `region` VALUES ('2058', '宜兴市', '243', '3', '10', '0', '320282', '宜兴市');
INSERT INTO `region` VALUES ('2059', '天宁区', '244', '3', '10', '0', '320402', '天宁区');
INSERT INTO `region` VALUES ('2060', '钟楼区', '244', '3', '10', '0', '320404', '钟楼区');
INSERT INTO `region` VALUES ('2061', '戚墅堰区', '244', '3', '10', '0', '320405', '戚墅堰区');
INSERT INTO `region` VALUES ('2062', '郊区', '244', '3', '10', '0', '0', '郊区');
INSERT INTO `region` VALUES ('2063', '新北区', '244', '3', '10', '0', '320411', '新北区');
INSERT INTO `region` VALUES ('2064', '武进区', '244', '3', '10', '0', '320412', '武进区');
INSERT INTO `region` VALUES ('2065', '溧阳市', '244', '3', '10', '0', '320481', '溧阳市');
INSERT INTO `region` VALUES ('2066', '金坛市', '244', '3', '10', '0', '320482', '金坛市');
INSERT INTO `region` VALUES ('2067', '回民区', '245', '3', '10', '0', '150103', '回民区');
INSERT INTO `region` VALUES ('2068', '玉泉区', '245', '3', '10', '0', '150104', '玉泉区');
INSERT INTO `region` VALUES ('2069', '新城区', '245', '3', '10', '0', '150102', '新城区');
INSERT INTO `region` VALUES ('2070', '赛罕区', '245', '3', '10', '0', '150105', '赛罕区');
INSERT INTO `region` VALUES ('2071', '清水河县', '245', '3', '10', '0', '150124', '清水河县');
INSERT INTO `region` VALUES ('2072', '土默特左旗', '245', '3', '10', '0', '150121', '土默特左旗');
INSERT INTO `region` VALUES ('2073', '托克托县', '245', '3', '10', '0', '150122', '托克托县');
INSERT INTO `region` VALUES ('2074', '和林格尔县', '245', '3', '10', '0', '150123', '和林格尔县');
INSERT INTO `region` VALUES ('2075', '武川县', '245', '3', '10', '0', '150125', '武川县');
INSERT INTO `region` VALUES ('2076', '阿拉善左旗', '246', '3', '10', '0', '152921', '阿拉善左旗');
INSERT INTO `region` VALUES ('2077', '阿拉善右旗', '246', '3', '10', '0', '152922', '阿拉善右旗');
INSERT INTO `region` VALUES ('2078', '额济纳旗', '246', '3', '10', '0', '152923', '额济纳旗');
INSERT INTO `region` VALUES ('2079', '红山区', '247', '3', '10', '0', '150402', '红山区');
INSERT INTO `region` VALUES ('2080', '元宝山区', '247', '3', '10', '0', '150403', '元宝山区');
INSERT INTO `region` VALUES ('2081', '松山区', '247', '3', '10', '0', '150404', '松山区');
INSERT INTO `region` VALUES ('2082', '阿鲁科尔沁旗', '247', '3', '10', '0', '150421', '阿鲁科尔沁旗');
INSERT INTO `region` VALUES ('2083', '巴林左旗', '247', '3', '10', '0', '150422', '巴林左旗');
INSERT INTO `region` VALUES ('2084', '巴林右旗', '247', '3', '10', '0', '150423', '巴林右旗');
INSERT INTO `region` VALUES ('2085', '林西县', '247', '3', '10', '0', '150424', '林西县');
INSERT INTO `region` VALUES ('2086', '克什克腾旗', '247', '3', '10', '0', '150425', '克什克腾旗');
INSERT INTO `region` VALUES ('2087', '翁牛特旗', '247', '3', '10', '0', '150426', '翁牛特旗');
INSERT INTO `region` VALUES ('2088', '喀喇沁旗', '247', '3', '10', '0', '150428', '喀喇沁旗');
INSERT INTO `region` VALUES ('2089', '宁城县', '247', '3', '10', '0', '150429', '宁城县');
INSERT INTO `region` VALUES ('2090', '敖汉旗', '247', '3', '10', '0', '150430', '敖汉旗');
INSERT INTO `region` VALUES ('2091', '东胜区', '248', '3', '10', '0', '150602', '东胜区');
INSERT INTO `region` VALUES ('2092', '达拉特旗', '248', '3', '10', '0', '150621', '达拉特旗');
INSERT INTO `region` VALUES ('2093', '准格尔旗', '248', '3', '10', '0', '150622', '准格尔旗');
INSERT INTO `region` VALUES ('2094', '鄂托克前旗', '248', '3', '10', '0', '150623', '鄂托克前旗');
INSERT INTO `region` VALUES ('2095', '鄂托克旗', '248', '3', '10', '0', '150624', '鄂托克旗');
INSERT INTO `region` VALUES ('2096', '杭锦旗', '248', '3', '10', '0', '150625', '杭锦旗');
INSERT INTO `region` VALUES ('2097', '乌审旗', '248', '3', '10', '0', '150626', '乌审旗');
INSERT INTO `region` VALUES ('2098', '伊金霍洛旗', '248', '3', '10', '0', '150627', '伊金霍洛旗');
INSERT INTO `region` VALUES ('2099', '临河区', '249', '3', '10', '0', '150802', '临河区');
INSERT INTO `region` VALUES ('2100', '五原县', '249', '3', '10', '0', '150821', '五原县');
INSERT INTO `region` VALUES ('2101', '磴口县', '249', '3', '10', '0', '150822', '磴口县');
INSERT INTO `region` VALUES ('2102', '乌拉特前旗', '249', '3', '10', '0', '150823', '乌拉特前旗');
INSERT INTO `region` VALUES ('2103', '乌拉特中旗', '249', '3', '10', '0', '150824', '乌拉特中旗');
INSERT INTO `region` VALUES ('2104', '乌拉特后旗', '249', '3', '10', '0', '150825', '乌拉特后旗');
INSERT INTO `region` VALUES ('2105', '杭锦后旗', '249', '3', '10', '0', '150826', '杭锦后旗');
INSERT INTO `region` VALUES ('2106', '昆都仑区', '250', '3', '10', '0', '150203', '昆都仑区');
INSERT INTO `region` VALUES ('2107', '青山区', '250', '3', '10', '0', '150204', '青山区');
INSERT INTO `region` VALUES ('2108', '东河区', '250', '3', '10', '0', '150202', '东河区');
INSERT INTO `region` VALUES ('2109', '九原区', '250', '3', '10', '0', '150207', '九原区');
INSERT INTO `region` VALUES ('2110', '石拐区', '250', '3', '10', '0', '150205', '石拐区');
INSERT INTO `region` VALUES ('2111', '白云矿区', '250', '3', '10', '0', '0', '白云矿区');
INSERT INTO `region` VALUES ('2112', '土默特右旗', '250', '3', '10', '0', '150221', '土默特右旗');
INSERT INTO `region` VALUES ('2113', '固阳县', '250', '3', '10', '0', '150222', '固阳县');
INSERT INTO `region` VALUES ('2114', '达尔罕茂明安联合旗', '250', '3', '10', '0', '150223', '达尔罕茂明安联合旗');
INSERT INTO `region` VALUES ('2115', '海勃湾区', '251', '3', '10', '0', '150302', '海勃湾区');
INSERT INTO `region` VALUES ('2116', '乌达区', '251', '3', '10', '0', '150304', '乌达区');
INSERT INTO `region` VALUES ('2117', '海南区', '251', '3', '10', '0', '150303', '海南区');
INSERT INTO `region` VALUES ('2118', '化德县', '252', '3', '10', '0', '150922', '化德县');
INSERT INTO `region` VALUES ('2119', '集宁区', '252', '3', '10', '0', '150902', '集宁区');
INSERT INTO `region` VALUES ('2120', '丰镇市', '252', '3', '10', '0', '150981', '丰镇市');
INSERT INTO `region` VALUES ('2121', '卓资县', '252', '3', '10', '0', '150921', '卓资县');
INSERT INTO `region` VALUES ('2122', '商都县', '252', '3', '10', '0', '150923', '商都县');
INSERT INTO `region` VALUES ('2123', '兴和县', '252', '3', '10', '0', '150924', '兴和县');
INSERT INTO `region` VALUES ('2124', '凉城县', '252', '3', '10', '0', '150925', '凉城县');
INSERT INTO `region` VALUES ('2125', '察哈尔右翼前旗', '252', '3', '10', '0', '150926', '察哈尔右翼前旗');
INSERT INTO `region` VALUES ('2126', '察哈尔右翼中旗', '252', '3', '10', '0', '150927', '察哈尔右翼中旗');
INSERT INTO `region` VALUES ('2127', '察哈尔右翼后旗', '252', '3', '10', '0', '150928', '察哈尔右翼后旗');
INSERT INTO `region` VALUES ('2128', '四子王旗', '252', '3', '10', '0', '150929', '四子王旗');
INSERT INTO `region` VALUES ('2129', '海拉尔区', '253', '3', '10', '0', '150702', '海拉尔区');
INSERT INTO `region` VALUES ('2130', '莫力达瓦', '253', '3', '10', '0', '150722', '莫力达瓦');
INSERT INTO `region` VALUES ('2131', '满洲里市', '253', '3', '10', '0', '150781', '满洲里市');
INSERT INTO `region` VALUES ('2132', '牙克石市', '253', '3', '10', '0', '150782', '牙克石市');
INSERT INTO `region` VALUES ('2133', '扎兰屯市', '253', '3', '10', '0', '150783', '扎兰屯市');
INSERT INTO `region` VALUES ('2134', '额尔古纳市', '253', '3', '10', '0', '150784', '额尔古纳市');
INSERT INTO `region` VALUES ('2135', '根河市', '253', '3', '10', '0', '150785', '根河市');
INSERT INTO `region` VALUES ('2136', '阿荣旗', '253', '3', '10', '0', '150721', '阿荣旗');
INSERT INTO `region` VALUES ('2137', '鄂伦春自治旗', '253', '3', '10', '0', '150723', '鄂伦春自治旗');
INSERT INTO `region` VALUES ('2138', '鄂温克族自治旗', '253', '3', '10', '0', '150724', '鄂温克族自治旗');
INSERT INTO `region` VALUES ('2139', '陈巴尔虎旗', '253', '3', '10', '0', '150725', '陈巴尔虎旗');
INSERT INTO `region` VALUES ('2140', '新巴尔虎左旗', '253', '3', '10', '0', '150726', '新巴尔虎左旗');
INSERT INTO `region` VALUES ('2141', '新巴尔虎右旗', '253', '3', '10', '0', '150727', '新巴尔虎右旗');
INSERT INTO `region` VALUES ('2142', '科尔沁区', '254', '3', '10', '0', '150502', '科尔沁区');
INSERT INTO `region` VALUES ('2143', '霍林郭勒市', '254', '3', '10', '0', '150581', '霍林郭勒市');
INSERT INTO `region` VALUES ('2144', '科尔沁左翼中旗', '254', '3', '10', '0', '150521', '科尔沁左翼中旗');
INSERT INTO `region` VALUES ('2145', '科尔沁左翼后旗', '254', '3', '10', '0', '150522', '科尔沁左翼后旗');
INSERT INTO `region` VALUES ('2146', '开鲁县', '254', '3', '10', '0', '150523', '开鲁县');
INSERT INTO `region` VALUES ('2147', '库伦旗', '254', '3', '10', '0', '150524', '库伦旗');
INSERT INTO `region` VALUES ('2148', '奈曼旗', '254', '3', '10', '0', '150525', '奈曼旗');
INSERT INTO `region` VALUES ('2149', '扎鲁特旗', '254', '3', '10', '0', '150526', '扎鲁特旗');
INSERT INTO `region` VALUES ('2150', '二连浩特市', '255', '3', '10', '0', '152501', '二连浩特市');
INSERT INTO `region` VALUES ('2151', '锡林浩特市', '255', '3', '10', '0', '152502', '锡林浩特市');
INSERT INTO `region` VALUES ('2152', '阿巴嘎旗', '255', '3', '10', '0', '152522', '阿巴嘎旗');
INSERT INTO `region` VALUES ('2153', '苏尼特左旗', '255', '3', '10', '0', '152523', '苏尼特左旗');
INSERT INTO `region` VALUES ('2154', '苏尼特右旗', '255', '3', '10', '0', '152524', '苏尼特右旗');
INSERT INTO `region` VALUES ('2155', '东乌珠穆沁旗', '255', '3', '10', '0', '152525', '东乌珠穆沁旗');
INSERT INTO `region` VALUES ('2156', '西乌珠穆沁旗', '255', '3', '10', '0', '152526', '西乌珠穆沁旗');
INSERT INTO `region` VALUES ('2157', '太仆寺旗', '255', '3', '10', '0', '152527', '太仆寺旗');
INSERT INTO `region` VALUES ('2158', '镶黄旗', '255', '3', '10', '0', '152528', '镶黄旗');
INSERT INTO `region` VALUES ('2159', '正镶白旗', '255', '3', '10', '0', '152529', '正镶白旗');
INSERT INTO `region` VALUES ('2160', '正蓝旗', '255', '3', '10', '0', '152530', '正蓝旗');
INSERT INTO `region` VALUES ('2161', '多伦县', '255', '3', '10', '0', '152531', '多伦县');
INSERT INTO `region` VALUES ('2162', '乌兰浩特市', '256', '3', '10', '0', '152201', '乌兰浩特市');
INSERT INTO `region` VALUES ('2163', '阿尔山市', '256', '3', '10', '0', '152202', '阿尔山市');
INSERT INTO `region` VALUES ('2164', '科尔沁右翼前旗', '256', '3', '10', '0', '152221', '科尔沁右翼前旗');
INSERT INTO `region` VALUES ('2165', '科尔沁右翼中旗', '256', '3', '10', '0', '152222', '科尔沁右翼中旗');
INSERT INTO `region` VALUES ('2166', '扎赉特旗', '256', '3', '10', '0', '152223', '扎赉特旗');
INSERT INTO `region` VALUES ('2167', '突泉县', '256', '3', '10', '0', '152224', '突泉县');
INSERT INTO `region` VALUES ('2168', '白塔区', '257', '3', '10', '0', '211002', '白塔区');
INSERT INTO `region` VALUES ('2169', '文圣区', '257', '3', '10', '0', '211003', '文圣区');
INSERT INTO `region` VALUES ('2170', '宏伟区', '257', '3', '10', '0', '211004', '宏伟区');
INSERT INTO `region` VALUES ('2171', '太子河区', '257', '3', '10', '0', '211011', '太子河区');
INSERT INTO `region` VALUES ('2172', '弓长岭区', '257', '3', '10', '0', '211005', '弓长岭区');
INSERT INTO `region` VALUES ('2173', '灯塔市', '257', '3', '10', '0', '211081', '灯塔市');
INSERT INTO `region` VALUES ('2174', '辽阳县', '257', '3', '10', '0', '211000', '辽阳县');
INSERT INTO `region` VALUES ('2175', '双台子区', '258', '3', '10', '0', '211102', '双台子区');
INSERT INTO `region` VALUES ('2176', '兴隆台区', '258', '3', '10', '0', '211103', '兴隆台区');
INSERT INTO `region` VALUES ('2177', '大洼县', '258', '3', '10', '0', '211121', '大洼县');
INSERT INTO `region` VALUES ('2178', '盘山县', '258', '3', '10', '0', '211122', '盘山县');
INSERT INTO `region` VALUES ('2179', '银州区', '259', '3', '10', '0', '211202', '银州区');
INSERT INTO `region` VALUES ('2180', '清河区', '259', '3', '10', '0', '211204', '清河区');
INSERT INTO `region` VALUES ('2181', '调兵山市', '259', '3', '10', '0', '211281', '调兵山市');
INSERT INTO `region` VALUES ('2182', '开原市', '259', '3', '10', '0', '211282', '开原市');
INSERT INTO `region` VALUES ('2183', '铁岭县', '259', '3', '10', '0', '211221', '铁岭县');
INSERT INTO `region` VALUES ('2184', '西丰县', '259', '3', '10', '0', '211223', '西丰县');
INSERT INTO `region` VALUES ('2185', '昌图县', '259', '3', '10', '0', '211224', '昌图县');
INSERT INTO `region` VALUES ('2186', '龙港区', '260', '3', '10', '0', '211403', '龙港区');
INSERT INTO `region` VALUES ('2187', '南票区', '260', '3', '10', '0', '211404', '南票区');
INSERT INTO `region` VALUES ('2188', '连山区', '260', '3', '10', '0', '211402', '连山区');
INSERT INTO `region` VALUES ('2189', '兴城市', '260', '3', '10', '0', '211481', '兴城市');
INSERT INTO `region` VALUES ('2190', '绥中县', '260', '3', '10', '0', '211421', '绥中县');
INSERT INTO `region` VALUES ('2191', '建昌县', '260', '3', '10', '0', '211422', '建昌县');
INSERT INTO `region` VALUES ('2192', '站前区', '261', '3', '10', '0', '210802', '站前区');
INSERT INTO `region` VALUES ('2193', '西市区', '261', '3', '10', '0', '210803', '西市区');
INSERT INTO `region` VALUES ('2194', '鲅鱼圈区', '261', '3', '10', '0', '210804', '鲅鱼圈区');
INSERT INTO `region` VALUES ('2195', '老边区', '261', '3', '10', '0', '210811', '老边区');
INSERT INTO `region` VALUES ('2196', '盖州市', '261', '3', '10', '0', '210881', '盖州市');
INSERT INTO `region` VALUES ('2197', '大石桥市', '261', '3', '10', '0', '210882', '大石桥市');
INSERT INTO `region` VALUES ('2198', '太和区', '262', '3', '10', '0', '210711', '太和区');
INSERT INTO `region` VALUES ('2199', '古塔区', '262', '3', '10', '0', '210702', '古塔区');
INSERT INTO `region` VALUES ('2200', '凌河区', '262', '3', '10', '0', '210703', '凌河区');
INSERT INTO `region` VALUES ('2201', '凌海市', '262', '3', '10', '0', '210781', '凌海市');
INSERT INTO `region` VALUES ('2202', '北镇市', '262', '3', '10', '0', '210782', '北镇市');
INSERT INTO `region` VALUES ('2203', '黑山县', '262', '3', '10', '0', '210726', '黑山县');
INSERT INTO `region` VALUES ('2204', '义县', '262', '3', '10', '0', '210727', '义县');
INSERT INTO `region` VALUES ('2205', '顺城区', '263', '3', '10', '0', '210411', '顺城区');
INSERT INTO `region` VALUES ('2206', '新抚区', '263', '3', '10', '0', '210402', '新抚区');
INSERT INTO `region` VALUES ('2207', '东洲区', '263', '3', '10', '0', '210403', '东洲区');
INSERT INTO `region` VALUES ('2208', '望花区', '263', '3', '10', '0', '210404', '望花区');
INSERT INTO `region` VALUES ('2209', '清原', '263', '3', '10', '0', '210423', '清原');
INSERT INTO `region` VALUES ('2210', '新宾', '263', '3', '10', '0', '210422', '新宾');
INSERT INTO `region` VALUES ('2211', '抚顺县', '263', '3', '10', '0', '210421', '抚顺县');
INSERT INTO `region` VALUES ('2212', '阜新', '264', '3', '10', '0', '0', '阜新');
INSERT INTO `region` VALUES ('2213', '海州区', '264', '3', '10', '0', '210902', '海州区');
INSERT INTO `region` VALUES ('2214', '新邱区', '264', '3', '10', '0', '210903', '新邱区');
INSERT INTO `region` VALUES ('2215', '太平区', '264', '3', '10', '0', '210904', '太平区');
INSERT INTO `region` VALUES ('2216', '清河门区', '264', '3', '10', '0', '210905', '清河门区');
INSERT INTO `region` VALUES ('2217', '细河区', '264', '3', '10', '0', '210911', '细河区');
INSERT INTO `region` VALUES ('2218', '彰武县', '264', '3', '10', '0', '210922', '彰武县');
INSERT INTO `region` VALUES ('2219', '双塔区', '265', '3', '10', '0', '211302', '双塔区');
INSERT INTO `region` VALUES ('2220', '龙城区', '265', '3', '10', '0', '211303', '龙城区');
INSERT INTO `region` VALUES ('2221', '喀喇沁左翼蒙古族自治县', '265', '3', '10', '0', '211324', '喀喇沁左翼蒙古族自治县');
INSERT INTO `region` VALUES ('2222', '北票市', '265', '3', '10', '0', '211381', '北票市');
INSERT INTO `region` VALUES ('2223', '凌源市', '265', '3', '10', '0', '211382', '凌源市');
INSERT INTO `region` VALUES ('2224', '朝阳县', '265', '3', '10', '0', '211300', '朝阳县');
INSERT INTO `region` VALUES ('2225', '建平县', '265', '3', '10', '0', '211322', '建平县');
INSERT INTO `region` VALUES ('2226', '振兴区', '266', '3', '10', '0', '210603', '振兴区');
INSERT INTO `region` VALUES ('2227', '元宝区', '266', '3', '10', '0', '210602', '元宝区');
INSERT INTO `region` VALUES ('2228', '振安区', '266', '3', '10', '0', '210604', '振安区');
INSERT INTO `region` VALUES ('2229', '宽甸', '266', '3', '10', '0', '210624', '宽甸');
INSERT INTO `region` VALUES ('2230', '东港市', '266', '3', '10', '0', '210681', '东港市');
INSERT INTO `region` VALUES ('2231', '凤城市', '266', '3', '10', '0', '210682', '凤城市');
INSERT INTO `region` VALUES ('2232', '铁东区', '267', '3', '10', '0', '210302', '铁东区');
INSERT INTO `region` VALUES ('2233', '铁西区', '267', '3', '10', '0', '210303', '铁西区');
INSERT INTO `region` VALUES ('2234', '立山区', '267', '3', '10', '0', '210304', '立山区');
INSERT INTO `region` VALUES ('2235', '千山区', '267', '3', '10', '0', '210311', '千山区');
INSERT INTO `region` VALUES ('2236', '岫岩', '267', '3', '10', '0', '210323', '岫岩');
INSERT INTO `region` VALUES ('2237', '海城市', '267', '3', '10', '0', '210381', '海城市');
INSERT INTO `region` VALUES ('2238', '台安县', '267', '3', '10', '0', '210321', '台安县');
INSERT INTO `region` VALUES ('2239', '本溪', '268', '3', '10', '0', '0', '本溪');
INSERT INTO `region` VALUES ('2240', '平山区', '268', '3', '10', '0', '210502', '平山区');
INSERT INTO `region` VALUES ('2241', '明山区', '268', '3', '10', '0', '210504', '明山区');
INSERT INTO `region` VALUES ('2242', '溪湖区', '268', '3', '10', '0', '210503', '溪湖区');
INSERT INTO `region` VALUES ('2243', '南芬区', '268', '3', '10', '0', '210505', '南芬区');
INSERT INTO `region` VALUES ('2244', '桓仁', '268', '3', '10', '0', '210522', '桓仁');
INSERT INTO `region` VALUES ('2245', '沈河区', '269', '3', '10', '0', '210103', '沈河区');
INSERT INTO `region` VALUES ('2246', '皇姑区', '269', '3', '10', '0', '210105', '皇姑区');
INSERT INTO `region` VALUES ('2247', '和平区', '269', '3', '10', '0', '210102', '和平区');
INSERT INTO `region` VALUES ('2248', '大东区', '269', '3', '10', '0', '210104', '大东区');
INSERT INTO `region` VALUES ('2249', '铁西区', '269', '3', '10', '0', '210106', '铁西区');
INSERT INTO `region` VALUES ('2250', '苏家屯区', '269', '3', '10', '0', '210111', '苏家屯区');
INSERT INTO `region` VALUES ('2251', '东陵区', '269', '3', '10', '0', '210112', '东陵区');
INSERT INTO `region` VALUES ('2252', '沈北新区', '269', '3', '10', '0', '210113', '沈北新区');
INSERT INTO `region` VALUES ('2253', '于洪区', '269', '3', '10', '0', '210114', '于洪区');
INSERT INTO `region` VALUES ('2254', '浑南新区', '269', '3', '10', '0', '0', '浑南新区');
INSERT INTO `region` VALUES ('2255', '新民市', '269', '3', '10', '0', '210181', '新民市');
INSERT INTO `region` VALUES ('2256', '辽中县', '269', '3', '10', '0', '210122', '辽中县');
INSERT INTO `region` VALUES ('2257', '康平县', '269', '3', '10', '0', '210123', '康平县');
INSERT INTO `region` VALUES ('2258', '法库县', '269', '3', '10', '0', '210124', '法库县');
INSERT INTO `region` VALUES ('2259', '西岗区', '270', '3', '10', '0', '210203', '西岗区');
INSERT INTO `region` VALUES ('2260', '中山区', '270', '3', '10', '0', '210202', '中山区');
INSERT INTO `region` VALUES ('2261', '沙河口区', '270', '3', '10', '0', '210204', '沙河口区');
INSERT INTO `region` VALUES ('2262', '甘井子区', '270', '3', '10', '0', '210211', '甘井子区');
INSERT INTO `region` VALUES ('2263', '旅顺口区', '270', '3', '10', '0', '210212', '旅顺口区');
INSERT INTO `region` VALUES ('2264', '金州区', '270', '3', '10', '0', '210213', '金州区');
INSERT INTO `region` VALUES ('2265', '开发区', '270', '3', '10', '0', '0', '开发区');
INSERT INTO `region` VALUES ('2266', '瓦房店市', '270', '3', '10', '0', '210281', '瓦房店市');
INSERT INTO `region` VALUES ('2267', '普兰店市', '270', '3', '10', '0', '210282', '普兰店市');
INSERT INTO `region` VALUES ('2268', '庄河市', '270', '3', '10', '0', '210283', '庄河市');
INSERT INTO `region` VALUES ('2269', '长海县', '270', '3', '10', '0', '210224', '长海县');
INSERT INTO `region` VALUES ('2270', '城中区', '271', '3', '10', '0', '630103', '城中区');
INSERT INTO `region` VALUES ('2271', '城东区', '271', '3', '10', '0', '630102', '城东区');
INSERT INTO `region` VALUES ('2272', '城西区', '271', '3', '10', '0', '630104', '城西区');
INSERT INTO `region` VALUES ('2273', '城北区', '271', '3', '10', '0', '630105', '城北区');
INSERT INTO `region` VALUES ('2274', '湟中县', '271', '3', '10', '0', '630122', '湟中县');
INSERT INTO `region` VALUES ('2275', '湟源县', '271', '3', '10', '0', '630123', '湟源县');
INSERT INTO `region` VALUES ('2276', '大通', '271', '3', '10', '0', '630121', '大通');
INSERT INTO `region` VALUES ('2277', '共和县', '272', '3', '10', '0', '632521', '共和县');
INSERT INTO `region` VALUES ('2278', '同德县', '272', '3', '10', '0', '632522', '同德县');
INSERT INTO `region` VALUES ('2279', '贵德县', '272', '3', '10', '0', '632523', '贵德县');
INSERT INTO `region` VALUES ('2280', '兴海县', '272', '3', '10', '0', '632524', '兴海县');
INSERT INTO `region` VALUES ('2281', '贵南县', '272', '3', '10', '0', '632525', '贵南县');
INSERT INTO `region` VALUES ('2282', '平安县', '273', '3', '10', '0', '630221', '平安县');
INSERT INTO `region` VALUES ('2283', '乐都县', '273', '3', '10', '0', '630202', '乐都县');
INSERT INTO `region` VALUES ('2284', '民和', '273', '3', '10', '0', '630222', '民和');
INSERT INTO `region` VALUES ('2285', '互助', '273', '3', '10', '0', '630223', '互助');
INSERT INTO `region` VALUES ('2286', '化隆', '273', '3', '10', '0', '630224', '化隆');
INSERT INTO `region` VALUES ('2287', '循化', '273', '3', '10', '0', '630225', '循化');
INSERT INTO `region` VALUES ('2288', '海晏县', '274', '3', '10', '0', '632223', '海晏县');
INSERT INTO `region` VALUES ('2289', '祁连县', '274', '3', '10', '0', '632222', '祁连县');
INSERT INTO `region` VALUES ('2290', '刚察县', '274', '3', '10', '0', '632224', '刚察县');
INSERT INTO `region` VALUES ('2291', '门源', '274', '3', '10', '0', '632221', '门源');
INSERT INTO `region` VALUES ('2292', '玛沁县', '275', '3', '10', '0', '632621', '玛沁县');
INSERT INTO `region` VALUES ('2293', '班玛县', '275', '3', '10', '0', '632622', '班玛县');
INSERT INTO `region` VALUES ('2294', '甘德县', '275', '3', '10', '0', '632623', '甘德县');
INSERT INTO `region` VALUES ('2295', '达日县', '275', '3', '10', '0', '632624', '达日县');
INSERT INTO `region` VALUES ('2296', '久治县', '275', '3', '10', '0', '632625', '久治县');
INSERT INTO `region` VALUES ('2297', '玛多县', '275', '3', '10', '0', '632626', '玛多县');
INSERT INTO `region` VALUES ('2298', '玉树县', '276', '3', '10', '0', '632721', '玉树县');
INSERT INTO `region` VALUES ('2299', '杂多县', '276', '3', '10', '0', '632722', '杂多县');
INSERT INTO `region` VALUES ('2300', '称多县', '276', '3', '10', '0', '632723', '称多县');
INSERT INTO `region` VALUES ('2301', '治多县', '276', '3', '10', '0', '632724', '治多县');
INSERT INTO `region` VALUES ('2302', '囊谦县', '276', '3', '10', '0', '632725', '囊谦县');
INSERT INTO `region` VALUES ('2303', '曲麻莱县', '276', '3', '10', '0', '632726', '曲麻莱县');
INSERT INTO `region` VALUES ('2304', '同仁县', '277', '3', '10', '0', '632321', '同仁县');
INSERT INTO `region` VALUES ('2305', '尖扎县', '277', '3', '10', '0', '632322', '尖扎县');
INSERT INTO `region` VALUES ('2306', '泽库县', '277', '3', '10', '0', '632323', '泽库县');
INSERT INTO `region` VALUES ('2307', '河南蒙古族自治县', '277', '3', '10', '0', '632324', '河南蒙古族自治县');
INSERT INTO `region` VALUES ('2308', '德令哈市', '278', '3', '10', '0', '632802', '德令哈市');
INSERT INTO `region` VALUES ('2309', '格尔木市', '278', '3', '10', '0', '632801', '格尔木市');
INSERT INTO `region` VALUES ('2310', '乌兰县', '278', '3', '10', '0', '632821', '乌兰县');
INSERT INTO `region` VALUES ('2311', '都兰县', '278', '3', '10', '0', '632822', '都兰县');
INSERT INTO `region` VALUES ('2312', '天峻县', '278', '3', '10', '0', '632823', '天峻县');
INSERT INTO `region` VALUES ('2313', '沙坡头区', '279', '3', '10', '0', '640502', '沙坡头区');
INSERT INTO `region` VALUES ('2314', '海原县', '279', '3', '10', '0', '640522', '海原县');
INSERT INTO `region` VALUES ('2315', '中宁县', '279', '3', '10', '0', '640521', '中宁县');
INSERT INTO `region` VALUES ('2316', '利通区', '280', '3', '10', '0', '640302', '利通区');
INSERT INTO `region` VALUES ('2318', '青铜峡市', '280', '3', '10', '0', '640381', '青铜峡市');
INSERT INTO `region` VALUES ('2319', '中宁县', '280', '3', '10', '0', '0', '中宁县');
INSERT INTO `region` VALUES ('2320', '盐池县', '280', '3', '10', '0', '640323', '盐池县');
INSERT INTO `region` VALUES ('2321', '同心县', '280', '3', '10', '0', '640324', '同心县');
INSERT INTO `region` VALUES ('2322', '惠农县', '281', '3', '10', '0', '640205', '惠农县');
INSERT INTO `region` VALUES ('2323', '大武口区', '281', '3', '10', '0', '640202', '大武口区');
INSERT INTO `region` VALUES ('2324', '惠农区', '281', '3', '10', '0', '640205', '惠农区');
INSERT INTO `region` VALUES ('2325', '陶乐县', '281', '3', '10', '0', '0', '陶乐县');
INSERT INTO `region` VALUES ('2326', '平罗县', '281', '3', '10', '0', '640221', '平罗县');
INSERT INTO `region` VALUES ('2327', '西夏区', '282', '3', '10', '0', '640105', '西夏区');
INSERT INTO `region` VALUES ('2328', '金凤区', '282', '3', '10', '0', '640106', '金凤区');
INSERT INTO `region` VALUES ('2329', '兴庆区', '282', '3', '10', '0', '640104', '兴庆区');
INSERT INTO `region` VALUES ('2330', '灵武市', '282', '3', '10', '0', '640181', '灵武市');
INSERT INTO `region` VALUES ('2331', '永宁县', '282', '3', '10', '0', '640121', '永宁县');
INSERT INTO `region` VALUES ('2332', '贺兰县', '282', '3', '10', '0', '640122', '贺兰县');
INSERT INTO `region` VALUES ('2333', '原州区', '283', '3', '10', '0', '640402', '原州区');
INSERT INTO `region` VALUES ('2334', '海原县', '283', '3', '10', '0', '0', '海原县');
INSERT INTO `region` VALUES ('2335', '西吉县', '283', '3', '10', '0', '640422', '西吉县');
INSERT INTO `region` VALUES ('2336', '隆德县', '283', '3', '10', '0', '640423', '隆德县');
INSERT INTO `region` VALUES ('2337', '泾源县', '283', '3', '10', '0', '640424', '泾源县');
INSERT INTO `region` VALUES ('2338', '彭阳县', '283', '3', '10', '0', '640425', '彭阳县');
INSERT INTO `region` VALUES ('2339', '尧都区', '284', '3', '10', '0', '141002', '尧都区');
INSERT INTO `region` VALUES ('2340', '侯马市', '284', '3', '10', '0', '141081', '侯马市');
INSERT INTO `region` VALUES ('2341', '霍州市', '284', '3', '10', '0', '141082', '霍州市');
INSERT INTO `region` VALUES ('2342', '曲沃县', '284', '3', '10', '0', '141021', '曲沃县');
INSERT INTO `region` VALUES ('2343', '翼城县', '284', '3', '10', '0', '141022', '翼城县');
INSERT INTO `region` VALUES ('2344', '襄汾县', '284', '3', '10', '0', '141023', '襄汾县');
INSERT INTO `region` VALUES ('2345', '洪洞县', '284', '3', '10', '0', '141024', '洪洞县');
INSERT INTO `region` VALUES ('2346', '吉县', '284', '3', '10', '0', '141028', '吉县');
INSERT INTO `region` VALUES ('2347', '安泽县', '284', '3', '10', '0', '141026', '安泽县');
INSERT INTO `region` VALUES ('2348', '浮山县', '284', '3', '10', '0', '141027', '浮山县');
INSERT INTO `region` VALUES ('2349', '古县', '284', '3', '10', '0', '141025', '古县');
INSERT INTO `region` VALUES ('2350', '乡宁县', '284', '3', '10', '0', '141029', '乡宁县');
INSERT INTO `region` VALUES ('2351', '大宁县', '284', '3', '10', '0', '141030', '大宁县');
INSERT INTO `region` VALUES ('2352', '隰县', '284', '3', '10', '0', '141031', '隰县');
INSERT INTO `region` VALUES ('2353', '永和县', '284', '3', '10', '0', '141032', '永和县');
INSERT INTO `region` VALUES ('2354', '蒲县', '284', '3', '10', '0', '141033', '蒲县');
INSERT INTO `region` VALUES ('2355', '汾西县', '284', '3', '10', '0', '141034', '汾西县');
INSERT INTO `region` VALUES ('2356', '榆次区', '285', '3', '10', '0', '140702', '榆次区');
INSERT INTO `region` VALUES ('2357', '介休市', '285', '3', '10', '0', '140781', '介休市');
INSERT INTO `region` VALUES ('2358', '榆社县', '285', '3', '10', '0', '140721', '榆社县');
INSERT INTO `region` VALUES ('2359', '左权县', '285', '3', '10', '0', '140722', '左权县');
INSERT INTO `region` VALUES ('2360', '和顺县', '285', '3', '10', '0', '140723', '和顺县');
INSERT INTO `region` VALUES ('2361', '昔阳县', '285', '3', '10', '0', '140724', '昔阳县');
INSERT INTO `region` VALUES ('2362', '寿阳县', '285', '3', '10', '0', '140725', '寿阳县');
INSERT INTO `region` VALUES ('2363', '太谷县', '285', '3', '10', '0', '140726', '太谷县');
INSERT INTO `region` VALUES ('2364', '祁县', '285', '3', '10', '0', '140727', '祁县');
INSERT INTO `region` VALUES ('2365', '平遥县', '285', '3', '10', '0', '140728', '平遥县');
INSERT INTO `region` VALUES ('2366', '灵石县', '285', '3', '10', '0', '140729', '灵石县');
INSERT INTO `region` VALUES ('2367', '朔城区', '286', '3', '10', '0', '140602', '朔城区');
INSERT INTO `region` VALUES ('2368', '平鲁区', '286', '3', '10', '0', '140603', '平鲁区');
INSERT INTO `region` VALUES ('2369', '山阴县', '286', '3', '10', '0', '140621', '山阴县');
INSERT INTO `region` VALUES ('2370', '应县', '286', '3', '10', '0', '140622', '应县');
INSERT INTO `region` VALUES ('2371', '右玉县', '286', '3', '10', '0', '140623', '右玉县');
INSERT INTO `region` VALUES ('2372', '怀仁县', '286', '3', '10', '0', '140624', '怀仁县');
INSERT INTO `region` VALUES ('2373', '离石市', '287', '3', '10', '0', '141121', '离石市');
INSERT INTO `region` VALUES ('2374', '离石区', '287', '3', '10', '0', '141102', '离石区');
INSERT INTO `region` VALUES ('2375', '孝义市', '287', '3', '10', '0', '141181', '孝义市');
INSERT INTO `region` VALUES ('2376', '汾阳市', '287', '3', '10', '0', '141182', '汾阳市');
INSERT INTO `region` VALUES ('2377', '文水县', '287', '3', '10', '0', '141121', '文水县');
INSERT INTO `region` VALUES ('2378', '交城县', '287', '3', '10', '0', '141122', '交城县');
INSERT INTO `region` VALUES ('2379', '兴县', '287', '3', '10', '0', '141123', '兴县');
INSERT INTO `region` VALUES ('2380', '临县', '287', '3', '10', '0', '141124', '临县');
INSERT INTO `region` VALUES ('2381', '柳林县', '287', '3', '10', '0', '141125', '柳林县');
INSERT INTO `region` VALUES ('2382', '石楼县', '287', '3', '10', '0', '141126', '石楼县');
INSERT INTO `region` VALUES ('2383', '岚县', '287', '3', '10', '0', '141127', '岚县');
INSERT INTO `region` VALUES ('2384', '方山县', '287', '3', '10', '0', '141128', '方山县');
INSERT INTO `region` VALUES ('2385', '中阳县', '287', '3', '10', '0', '141129', '中阳县');
INSERT INTO `region` VALUES ('2386', '交口县', '287', '3', '10', '0', '141130', '交口县');
INSERT INTO `region` VALUES ('2387', '城区', '288', '3', '10', '0', '0', '城区');
INSERT INTO `region` VALUES ('2388', '矿区', '288', '3', '10', '0', '140303', '矿区');
INSERT INTO `region` VALUES ('2389', '郊区', '288', '3', '10', '0', '140311', '郊区');
INSERT INTO `region` VALUES ('2390', '平定县', '288', '3', '10', '0', '140321', '平定县');
INSERT INTO `region` VALUES ('2391', '盂县', '288', '3', '10', '0', '140322', '盂县');
INSERT INTO `region` VALUES ('2392', '忻府区', '289', '3', '10', '0', '140902', '忻府区');
INSERT INTO `region` VALUES ('2393', '原平市', '289', '3', '10', '0', '140981', '原平市');
INSERT INTO `region` VALUES ('2394', '定襄县', '289', '3', '10', '0', '140921', '定襄县');
INSERT INTO `region` VALUES ('2395', '五台县', '289', '3', '10', '0', '140922', '五台县');
INSERT INTO `region` VALUES ('2396', '代县', '289', '3', '10', '0', '140923', '代县');
INSERT INTO `region` VALUES ('2397', '繁峙县', '289', '3', '10', '0', '140924', '繁峙县');
INSERT INTO `region` VALUES ('2398', '宁武县', '289', '3', '10', '0', '140925', '宁武县');
INSERT INTO `region` VALUES ('2399', '静乐县', '289', '3', '10', '0', '140926', '静乐县');
INSERT INTO `region` VALUES ('2400', '神池县', '289', '3', '10', '0', '140927', '神池县');
INSERT INTO `region` VALUES ('2401', '五寨县', '289', '3', '10', '0', '140928', '五寨县');
INSERT INTO `region` VALUES ('2402', '岢岚县', '289', '3', '10', '0', '140929', '岢岚县');
INSERT INTO `region` VALUES ('2403', '河曲县', '289', '3', '10', '0', '140930', '河曲县');
INSERT INTO `region` VALUES ('2404', '保德县', '289', '3', '10', '0', '140931', '保德县');
INSERT INTO `region` VALUES ('2405', '偏关县', '289', '3', '10', '0', '140932', '偏关县');
INSERT INTO `region` VALUES ('2406', '盐湖区', '290', '3', '10', '0', '140802', '盐湖区');
INSERT INTO `region` VALUES ('2407', '永济市', '290', '3', '10', '0', '140881', '永济市');
INSERT INTO `region` VALUES ('2408', '河津市', '290', '3', '10', '0', '140882', '河津市');
INSERT INTO `region` VALUES ('2409', '临猗县', '290', '3', '10', '0', '140821', '临猗县');
INSERT INTO `region` VALUES ('2410', '万荣县', '290', '3', '10', '0', '140822', '万荣县');
INSERT INTO `region` VALUES ('2411', '闻喜县', '290', '3', '10', '0', '140823', '闻喜县');
INSERT INTO `region` VALUES ('2412', '稷山县', '290', '3', '10', '0', '140824', '稷山县');
INSERT INTO `region` VALUES ('2413', '新绛县', '290', '3', '10', '0', '140825', '新绛县');
INSERT INTO `region` VALUES ('2414', '绛县', '290', '3', '10', '0', '140826', '绛县');
INSERT INTO `region` VALUES ('2415', '垣曲县', '290', '3', '10', '0', '140827', '垣曲县');
INSERT INTO `region` VALUES ('2416', '夏县', '290', '3', '10', '0', '140828', '夏县');
INSERT INTO `region` VALUES ('2417', '平陆县', '290', '3', '10', '0', '140829', '平陆县');
INSERT INTO `region` VALUES ('2418', '芮城县', '290', '3', '10', '0', '140830', '芮城县');
INSERT INTO `region` VALUES ('2419', '杏花岭区', '291', '3', '10', '0', '140107', '杏花岭区');
INSERT INTO `region` VALUES ('2420', '小店区', '291', '3', '10', '0', '140105', '小店区');
INSERT INTO `region` VALUES ('2421', '迎泽区', '291', '3', '10', '0', '140106', '迎泽区');
INSERT INTO `region` VALUES ('2422', '尖草坪区', '291', '3', '10', '0', '140108', '尖草坪区');
INSERT INTO `region` VALUES ('2423', '万柏林区', '291', '3', '10', '0', '140109', '万柏林区');
INSERT INTO `region` VALUES ('2424', '晋源区', '291', '3', '10', '0', '140110', '晋源区');
INSERT INTO `region` VALUES ('2425', '高新开发区', '291', '3', '10', '0', '0', '高新开发区');
INSERT INTO `region` VALUES ('2426', '民营经济开发区', '291', '3', '10', '0', '0', '民营经济开发区');
INSERT INTO `region` VALUES ('2427', '经济技术开发区', '291', '3', '10', '0', '0', '经济技术开发区');
INSERT INTO `region` VALUES ('2428', '清徐县', '291', '3', '10', '0', '140121', '清徐县');
INSERT INTO `region` VALUES ('2429', '阳曲县', '291', '3', '10', '0', '140122', '阳曲县');
INSERT INTO `region` VALUES ('2430', '娄烦县', '291', '3', '10', '0', '140123', '娄烦县');
INSERT INTO `region` VALUES ('2431', '古交市', '291', '3', '10', '0', '140181', '古交市');
INSERT INTO `region` VALUES ('2432', '城区', '292', '3', '10', '0', '140402', '城区');
INSERT INTO `region` VALUES ('2433', '郊区', '292', '3', '10', '0', '140411', '郊区');
INSERT INTO `region` VALUES ('2434', '沁县', '292', '3', '10', '0', '140430', '沁县');
INSERT INTO `region` VALUES ('2435', '潞城市', '292', '3', '10', '0', '140481', '潞城市');
INSERT INTO `region` VALUES ('2436', '长治县', '292', '3', '10', '0', '140421', '长治县');
INSERT INTO `region` VALUES ('2437', '襄垣县', '292', '3', '10', '0', '140423', '襄垣县');
INSERT INTO `region` VALUES ('2438', '屯留县', '292', '3', '10', '0', '140424', '屯留县');
INSERT INTO `region` VALUES ('2439', '平顺县', '292', '3', '10', '0', '140425', '平顺县');
INSERT INTO `region` VALUES ('2440', '黎城县', '292', '3', '10', '0', '140426', '黎城县');
INSERT INTO `region` VALUES ('2441', '壶关县', '292', '3', '10', '0', '140427', '壶关县');
INSERT INTO `region` VALUES ('2442', '长子县', '292', '3', '10', '0', '140428', '长子县');
INSERT INTO `region` VALUES ('2443', '武乡县', '292', '3', '10', '0', '140429', '武乡县');
INSERT INTO `region` VALUES ('2444', '沁源县', '292', '3', '10', '0', '140431', '沁源县');
INSERT INTO `region` VALUES ('2445', '城区', '293', '3', '10', '0', '140202', '城区');
INSERT INTO `region` VALUES ('2446', '矿区', '293', '3', '10', '0', '140203', '矿区');
INSERT INTO `region` VALUES ('2447', '南郊区', '293', '3', '10', '0', '140211', '南郊区');
INSERT INTO `region` VALUES ('2448', '新荣区', '293', '3', '10', '0', '140212', '新荣区');
INSERT INTO `region` VALUES ('2449', '阳高县', '293', '3', '10', '0', '140221', '阳高县');
INSERT INTO `region` VALUES ('2450', '天镇县', '293', '3', '10', '0', '140222', '天镇县');
INSERT INTO `region` VALUES ('2451', '广灵县', '293', '3', '10', '0', '140223', '广灵县');
INSERT INTO `region` VALUES ('2452', '灵丘县', '293', '3', '10', '0', '140224', '灵丘县');
INSERT INTO `region` VALUES ('2453', '浑源县', '293', '3', '10', '0', '140225', '浑源县');
INSERT INTO `region` VALUES ('2454', '左云县', '293', '3', '10', '0', '140226', '左云县');
INSERT INTO `region` VALUES ('2455', '大同县', '293', '3', '10', '0', '140227', '大同县');
INSERT INTO `region` VALUES ('2456', '城区', '294', '3', '10', '0', '140502', '城区');
INSERT INTO `region` VALUES ('2457', '高平市', '294', '3', '10', '0', '140581', '高平市');
INSERT INTO `region` VALUES ('2458', '沁水县', '294', '3', '10', '0', '140521', '沁水县');
INSERT INTO `region` VALUES ('2459', '阳城县', '294', '3', '10', '0', '140522', '阳城县');
INSERT INTO `region` VALUES ('2460', '陵川县', '294', '3', '10', '0', '140524', '陵川县');
INSERT INTO `region` VALUES ('2461', '泽州县', '294', '3', '10', '0', '140525', '泽州县');
INSERT INTO `region` VALUES ('2462', '市中区', '295', '3', '10', '0', '370103', '市中区');
INSERT INTO `region` VALUES ('2463', '历下区', '295', '3', '10', '0', '370102', '历下区');
INSERT INTO `region` VALUES ('2464', '天桥区', '295', '3', '10', '0', '370105', '天桥区');
INSERT INTO `region` VALUES ('2465', '槐荫区', '295', '3', '10', '0', '370104', '槐荫区');
INSERT INTO `region` VALUES ('2466', '历城区', '295', '3', '10', '0', '370112', '历城区');
INSERT INTO `region` VALUES ('2467', '长清区', '295', '3', '10', '0', '370113', '长清区');
INSERT INTO `region` VALUES ('2468', '章丘市', '295', '3', '10', '0', '370181', '章丘市');
INSERT INTO `region` VALUES ('2469', '平阴县', '295', '3', '10', '0', '370124', '平阴县');
INSERT INTO `region` VALUES ('2470', '济阳县', '295', '3', '10', '0', '370125', '济阳县');
INSERT INTO `region` VALUES ('2471', '商河县', '295', '3', '10', '0', '370126', '商河县');
INSERT INTO `region` VALUES ('2472', '东营区', '296', '3', '10', '0', '370502', '东营区');
INSERT INTO `region` VALUES ('2473', '河口区', '296', '3', '10', '0', '370503', '河口区');
INSERT INTO `region` VALUES ('2474', '垦利县', '296', '3', '10', '0', '370521', '垦利县');
INSERT INTO `region` VALUES ('2475', '利津县', '296', '3', '10', '0', '370522', '利津县');
INSERT INTO `region` VALUES ('2476', '广饶县', '296', '3', '10', '0', '370523', '广饶县');
INSERT INTO `region` VALUES ('2477', '德城区', '297', '3', '10', '0', '371402', '德城区');
INSERT INTO `region` VALUES ('2478', '陵县', '297', '3', '10', '0', '371421', '陵县');
INSERT INTO `region` VALUES ('2479', '乐陵市', '297', '3', '10', '0', '371481', '乐陵市');
INSERT INTO `region` VALUES ('2480', '禹城市', '297', '3', '10', '0', '371482', '禹城市');
INSERT INTO `region` VALUES ('2481', '宁津县', '297', '3', '10', '0', '371422', '宁津县');
INSERT INTO `region` VALUES ('2482', '庆云县', '297', '3', '10', '0', '371423', '庆云县');
INSERT INTO `region` VALUES ('2483', '临邑县', '297', '3', '10', '0', '371424', '临邑县');
INSERT INTO `region` VALUES ('2484', '齐河县', '297', '3', '10', '0', '371425', '齐河县');
INSERT INTO `region` VALUES ('2485', '平原县', '297', '3', '10', '0', '371426', '平原县');
INSERT INTO `region` VALUES ('2486', '夏津县', '297', '3', '10', '0', '371427', '夏津县');
INSERT INTO `region` VALUES ('2487', '武城县', '297', '3', '10', '0', '371428', '武城县');
INSERT INTO `region` VALUES ('2488', '滨城区', '298', '3', '10', '0', '371602', '滨城区');
INSERT INTO `region` VALUES ('2489', '惠民县', '298', '3', '10', '0', '371621', '惠民县');
INSERT INTO `region` VALUES ('2490', '阳信县', '298', '3', '10', '0', '371622', '阳信县');
INSERT INTO `region` VALUES ('2491', '无棣县', '298', '3', '10', '0', '371623', '无棣县');
INSERT INTO `region` VALUES ('2492', '沾化县', '298', '3', '10', '0', '371624', '沾化县');
INSERT INTO `region` VALUES ('2493', '博兴县', '298', '3', '10', '0', '371625', '博兴县');
INSERT INTO `region` VALUES ('2494', '邹平县', '298', '3', '10', '0', '371626', '邹平县');
INSERT INTO `region` VALUES ('2495', '市南区', '299', '3', '10', '0', '370202', '市南区');
INSERT INTO `region` VALUES ('2496', '市北区', '299', '3', '10', '0', '370203', '市北区');
INSERT INTO `region` VALUES ('2497', '城阳区', '299', '3', '10', '0', '370214', '城阳区');
INSERT INTO `region` VALUES ('2498', '四方区', '299', '3', '10', '0', '0', '四方区');
INSERT INTO `region` VALUES ('2499', '李沧区', '299', '3', '10', '0', '370213', '李沧区');
INSERT INTO `region` VALUES ('2500', '黄岛区', '299', '3', '10', '0', '370211', '黄岛区');
INSERT INTO `region` VALUES ('2501', '崂山区', '299', '3', '10', '0', '370212', '崂山区');
INSERT INTO `region` VALUES ('2502', '胶州市', '299', '3', '10', '0', '370281', '胶州市');
INSERT INTO `region` VALUES ('2503', '即墨市', '299', '3', '10', '0', '370282', '即墨市');
INSERT INTO `region` VALUES ('2504', '平度市', '299', '3', '10', '0', '370283', '平度市');
INSERT INTO `region` VALUES ('2505', '胶南市', '299', '3', '10', '0', '0', '胶南市');
INSERT INTO `region` VALUES ('2506', '莱西市', '299', '3', '10', '0', '370285', '莱西市');
INSERT INTO `region` VALUES ('2507', '牡丹区', '300', '3', '10', '0', '371702', '牡丹区');
INSERT INTO `region` VALUES ('2508', '曹县', '300', '3', '10', '0', '371721', '曹县');
INSERT INTO `region` VALUES ('2509', '单县', '300', '3', '10', '0', '371722', '单县');
INSERT INTO `region` VALUES ('2510', '成武县', '300', '3', '10', '0', '371723', '成武县');
INSERT INTO `region` VALUES ('2511', '巨野县', '300', '3', '10', '0', '371724', '巨野县');
INSERT INTO `region` VALUES ('2512', '郓城县', '300', '3', '10', '0', '371725', '郓城县');
INSERT INTO `region` VALUES ('2513', '鄄城县', '300', '3', '10', '0', '371726', '鄄城县');
INSERT INTO `region` VALUES ('2514', '定陶县', '300', '3', '10', '0', '371727', '定陶县');
INSERT INTO `region` VALUES ('2515', '东明县', '300', '3', '10', '0', '371728', '东明县');
INSERT INTO `region` VALUES ('2516', '市中区', '301', '3', '10', '0', '370802', '市中区');
INSERT INTO `region` VALUES ('2517', '任城区', '301', '3', '10', '0', '370811', '任城区');
INSERT INTO `region` VALUES ('2518', '曲阜市', '301', '3', '10', '0', '370881', '曲阜市');
INSERT INTO `region` VALUES ('2519', '兖州市', '301', '3', '10', '0', '370882', '兖州市');
INSERT INTO `region` VALUES ('2520', '邹城市', '301', '3', '10', '0', '370883', '邹城市');
INSERT INTO `region` VALUES ('2521', '微山县', '301', '3', '10', '0', '370826', '微山县');
INSERT INTO `region` VALUES ('2522', '鱼台县', '301', '3', '10', '0', '370827', '鱼台县');
INSERT INTO `region` VALUES ('2523', '金乡县', '301', '3', '10', '0', '370828', '金乡县');
INSERT INTO `region` VALUES ('2524', '嘉祥县', '301', '3', '10', '0', '370829', '嘉祥县');
INSERT INTO `region` VALUES ('2525', '汶上县', '301', '3', '10', '0', '370830', '汶上县');
INSERT INTO `region` VALUES ('2526', '泗水县', '301', '3', '10', '0', '370831', '泗水县');
INSERT INTO `region` VALUES ('2527', '梁山县', '301', '3', '10', '0', '370832', '梁山县');
INSERT INTO `region` VALUES ('2528', '莱城区', '302', '3', '10', '0', '371202', '莱城区');
INSERT INTO `region` VALUES ('2529', '钢城区', '302', '3', '10', '0', '371203', '钢城区');
INSERT INTO `region` VALUES ('2530', '东昌府区', '303', '3', '10', '0', '371502', '东昌府区');
INSERT INTO `region` VALUES ('2531', '临清市', '303', '3', '10', '0', '371581', '临清市');
INSERT INTO `region` VALUES ('2532', '阳谷县', '303', '3', '10', '0', '371521', '阳谷县');
INSERT INTO `region` VALUES ('2533', '莘县', '303', '3', '10', '0', '371522', '莘县');
INSERT INTO `region` VALUES ('2534', '茌平县', '303', '3', '10', '0', '371523', '茌平县');
INSERT INTO `region` VALUES ('2535', '东阿县', '303', '3', '10', '0', '371524', '东阿县');
INSERT INTO `region` VALUES ('2536', '冠县', '303', '3', '10', '0', '371525', '冠县');
INSERT INTO `region` VALUES ('2537', '高唐县', '303', '3', '10', '0', '371526', '高唐县');
INSERT INTO `region` VALUES ('2538', '兰山区', '304', '3', '10', '0', '371302', '兰山区');
INSERT INTO `region` VALUES ('2539', '罗庄区', '304', '3', '10', '0', '371311', '罗庄区');
INSERT INTO `region` VALUES ('2540', '河东区', '304', '3', '10', '0', '371312', '河东区');
INSERT INTO `region` VALUES ('2541', '沂南县', '304', '3', '10', '0', '371321', '沂南县');
INSERT INTO `region` VALUES ('2542', '郯城县', '304', '3', '10', '0', '371322', '郯城县');
INSERT INTO `region` VALUES ('2543', '沂水县', '304', '3', '10', '0', '371323', '沂水县');
INSERT INTO `region` VALUES ('2544', '苍山县', '304', '3', '10', '0', '371324', '苍山县');
INSERT INTO `region` VALUES ('2545', '费县', '304', '3', '10', '0', '371325', '费县');
INSERT INTO `region` VALUES ('2546', '平邑县', '304', '3', '10', '0', '371326', '平邑县');
INSERT INTO `region` VALUES ('2547', '莒南县', '304', '3', '10', '0', '371327', '莒南县');
INSERT INTO `region` VALUES ('2548', '蒙阴县', '304', '3', '10', '0', '371328', '蒙阴县');
INSERT INTO `region` VALUES ('2549', '临沭县', '304', '3', '10', '0', '371329', '临沭县');
INSERT INTO `region` VALUES ('2550', '东港区', '305', '3', '10', '0', '371102', '东港区');
INSERT INTO `region` VALUES ('2551', '岚山区', '305', '3', '10', '0', '371103', '岚山区');
INSERT INTO `region` VALUES ('2552', '五莲县', '305', '3', '10', '0', '371121', '五莲县');
INSERT INTO `region` VALUES ('2553', '莒县', '305', '3', '10', '0', '371122', '莒县');
INSERT INTO `region` VALUES ('2554', '泰山区', '306', '3', '10', '0', '370902', '泰山区');
INSERT INTO `region` VALUES ('2555', '岱岳区', '306', '3', '10', '0', '370911', '岱岳区');
INSERT INTO `region` VALUES ('2556', '新泰市', '306', '3', '10', '0', '370982', '新泰市');
INSERT INTO `region` VALUES ('2557', '肥城市', '306', '3', '10', '0', '370983', '肥城市');
INSERT INTO `region` VALUES ('2558', '宁阳县', '306', '3', '10', '0', '370921', '宁阳县');
INSERT INTO `region` VALUES ('2559', '东平县', '306', '3', '10', '0', '370923', '东平县');
INSERT INTO `region` VALUES ('2560', '荣成市', '307', '3', '10', '0', '371082', '荣成市');
INSERT INTO `region` VALUES ('2561', '乳山市', '307', '3', '10', '0', '371083', '乳山市');
INSERT INTO `region` VALUES ('2562', '环翠区', '307', '3', '10', '0', '371002', '环翠区');
INSERT INTO `region` VALUES ('2563', '文登市', '307', '3', '10', '0', '371081', '文登市');
INSERT INTO `region` VALUES ('2564', '潍城区', '308', '3', '10', '0', '370702', '潍城区');
INSERT INTO `region` VALUES ('2565', '寒亭区', '308', '3', '10', '0', '370703', '寒亭区');
INSERT INTO `region` VALUES ('2566', '坊子区', '308', '3', '10', '0', '370704', '坊子区');
INSERT INTO `region` VALUES ('2567', '奎文区', '308', '3', '10', '0', '370705', '奎文区');
INSERT INTO `region` VALUES ('2568', '青州市', '308', '3', '10', '0', '370781', '青州市');
INSERT INTO `region` VALUES ('2569', '诸城市', '308', '3', '10', '0', '370782', '诸城市');
INSERT INTO `region` VALUES ('2570', '寿光市', '308', '3', '10', '0', '370783', '寿光市');
INSERT INTO `region` VALUES ('2571', '安丘市', '308', '3', '10', '0', '370784', '安丘市');
INSERT INTO `region` VALUES ('2572', '高密市', '308', '3', '10', '0', '370785', '高密市');
INSERT INTO `region` VALUES ('2573', '昌邑市', '308', '3', '10', '0', '370786', '昌邑市');
INSERT INTO `region` VALUES ('2574', '临朐县', '308', '3', '10', '0', '370724', '临朐县');
INSERT INTO `region` VALUES ('2575', '昌乐县', '308', '3', '10', '0', '370725', '昌乐县');
INSERT INTO `region` VALUES ('2576', '芝罘区', '309', '3', '10', '0', '370602', '芝罘区');
INSERT INTO `region` VALUES ('2577', '福山区', '309', '3', '10', '0', '370611', '福山区');
INSERT INTO `region` VALUES ('2578', '牟平区', '309', '3', '10', '0', '370612', '牟平区');
INSERT INTO `region` VALUES ('2579', '莱山区', '309', '3', '10', '0', '370613', '莱山区');
INSERT INTO `region` VALUES ('2580', '开发区', '309', '3', '10', '0', '0', '开发区');
INSERT INTO `region` VALUES ('2581', '龙口市', '309', '3', '10', '0', '370681', '龙口市');
INSERT INTO `region` VALUES ('2582', '莱阳市', '309', '3', '10', '0', '370682', '莱阳市');
INSERT INTO `region` VALUES ('2583', '莱州市', '309', '3', '10', '0', '370683', '莱州市');
INSERT INTO `region` VALUES ('2584', '蓬莱市', '309', '3', '10', '0', '370684', '蓬莱市');
INSERT INTO `region` VALUES ('2585', '招远市', '309', '3', '10', '0', '370685', '招远市');
INSERT INTO `region` VALUES ('2586', '栖霞市', '309', '3', '10', '0', '370686', '栖霞市');
INSERT INTO `region` VALUES ('2587', '海阳市', '309', '3', '10', '0', '370687', '海阳市');
INSERT INTO `region` VALUES ('2588', '长岛县', '309', '3', '10', '0', '370634', '长岛县');
INSERT INTO `region` VALUES ('2589', '市中区', '310', '3', '10', '0', '370402', '市中区');
INSERT INTO `region` VALUES ('2590', '山亭区', '310', '3', '10', '0', '370406', '山亭区');
INSERT INTO `region` VALUES ('2591', '峄城区', '310', '3', '10', '0', '370404', '峄城区');
INSERT INTO `region` VALUES ('2592', '台儿庄区', '310', '3', '10', '0', '370405', '台儿庄区');
INSERT INTO `region` VALUES ('2593', '薛城区', '310', '3', '10', '0', '370403', '薛城区');
INSERT INTO `region` VALUES ('2594', '滕州市', '310', '3', '10', '0', '370481', '滕州市');
INSERT INTO `region` VALUES ('2595', '张店区', '311', '3', '10', '0', '370303', '张店区');
INSERT INTO `region` VALUES ('2596', '临淄区', '311', '3', '10', '0', '370305', '临淄区');
INSERT INTO `region` VALUES ('2597', '淄川区', '311', '3', '10', '0', '370302', '淄川区');
INSERT INTO `region` VALUES ('2598', '博山区', '311', '3', '10', '0', '370304', '博山区');
INSERT INTO `region` VALUES ('2599', '周村区', '311', '3', '10', '0', '370306', '周村区');
INSERT INTO `region` VALUES ('2600', '桓台县', '311', '3', '10', '0', '370321', '桓台县');
INSERT INTO `region` VALUES ('2601', '高青县', '311', '3', '10', '0', '370322', '高青县');
INSERT INTO `region` VALUES ('2602', '沂源县', '311', '3', '10', '0', '370323', '沂源县');
INSERT INTO `region` VALUES ('2603', '长宁区', '312', '3', '10', '0', '310105', '长宁区');
INSERT INTO `region` VALUES ('2604', '闸北区', '312', '3', '10', '0', '310108', '闸北区');
INSERT INTO `region` VALUES ('2605', '闵行区', '312', '3', '10', '0', '310112', '闵行区');
INSERT INTO `region` VALUES ('2606', '徐汇区', '312', '3', '10', '0', '310104', '徐汇区');
INSERT INTO `region` VALUES ('2607', '浦东新区', '312', '3', '10', '0', '310115', '浦东新区');
INSERT INTO `region` VALUES ('2608', '杨浦区', '312', '3', '10', '0', '310110', '杨浦区');
INSERT INTO `region` VALUES ('2609', '普陀区', '312', '3', '10', '0', '310107', '普陀区');
INSERT INTO `region` VALUES ('2610', '静安区', '312', '3', '10', '0', '310106', '静安区');
INSERT INTO `region` VALUES ('2611', '卢湾区', '312', '3', '10', '0', '0', '卢湾区');
INSERT INTO `region` VALUES ('2612', '虹口区', '312', '3', '10', '0', '310109', '虹口区');
INSERT INTO `region` VALUES ('2613', '黄浦区', '312', '3', '10', '0', '310101', '黄浦区');
INSERT INTO `region` VALUES ('2614', '南汇区', '312', '3', '10', '0', '0', '南汇区');
INSERT INTO `region` VALUES ('2615', '松江区', '312', '3', '10', '0', '310117', '松江区');
INSERT INTO `region` VALUES ('2616', '嘉定区', '312', '3', '10', '0', '310114', '嘉定区');
INSERT INTO `region` VALUES ('2617', '宝山区', '312', '3', '10', '0', '310113', '宝山区');
INSERT INTO `region` VALUES ('2618', '青浦区', '312', '3', '10', '0', '310118', '青浦区');
INSERT INTO `region` VALUES ('2619', '金山区', '312', '3', '10', '0', '310116', '金山区');
INSERT INTO `region` VALUES ('2620', '奉贤区', '312', '3', '10', '0', '310120', '奉贤区');
INSERT INTO `region` VALUES ('2621', '崇明县', '312', '3', '10', '0', '310230', '崇明县');
INSERT INTO `region` VALUES ('2622', '莲湖区', '313', '3', '10', '0', '610104', '莲湖区');
INSERT INTO `region` VALUES ('2623', '新城区', '313', '3', '10', '0', '610102', '新城区');
INSERT INTO `region` VALUES ('2624', '碑林区', '313', '3', '10', '0', '610103', '碑林区');
INSERT INTO `region` VALUES ('2625', '雁塔区', '313', '3', '10', '0', '610113', '雁塔区');
INSERT INTO `region` VALUES ('2626', '灞桥区', '313', '3', '10', '0', '610111', '灞桥区');
INSERT INTO `region` VALUES ('2627', '未央区', '313', '3', '10', '0', '610112', '未央区');
INSERT INTO `region` VALUES ('2628', '阎良区', '313', '3', '10', '0', '610114', '阎良区');
INSERT INTO `region` VALUES ('2629', '临潼区', '313', '3', '10', '0', '610115', '临潼区');
INSERT INTO `region` VALUES ('2630', '长安区', '313', '3', '10', '0', '610116', '长安区');
INSERT INTO `region` VALUES ('2631', '蓝田县', '313', '3', '10', '0', '610122', '蓝田县');
INSERT INTO `region` VALUES ('2632', '周至县', '313', '3', '10', '0', '610124', '周至县');
INSERT INTO `region` VALUES ('2633', '户县', '313', '3', '10', '0', '610125', '户县');
INSERT INTO `region` VALUES ('2634', '高陵县', '313', '3', '10', '0', '610126', '高陵县');
INSERT INTO `region` VALUES ('2635', '陈仓区', '314', '3', '10', '0', '610304', '陈仓区');
INSERT INTO `region` VALUES ('2636', '渭滨区', '314', '3', '10', '0', '610302', '渭滨区');
INSERT INTO `region` VALUES ('2637', '金台区', '314', '3', '10', '0', '610303', '金台区');
INSERT INTO `region` VALUES ('2638', '凤翔县', '314', '3', '10', '0', '610322', '凤翔县');
INSERT INTO `region` VALUES ('2639', '岐山县', '314', '3', '10', '0', '610323', '岐山县');
INSERT INTO `region` VALUES ('2640', '扶风县', '314', '3', '10', '0', '610324', '扶风县');
INSERT INTO `region` VALUES ('2641', '眉县', '314', '3', '10', '0', '610326', '眉县');
INSERT INTO `region` VALUES ('2642', '陇县', '314', '3', '10', '0', '610327', '陇县');
INSERT INTO `region` VALUES ('2643', '千阳县', '314', '3', '10', '0', '610328', '千阳县');
INSERT INTO `region` VALUES ('2644', '麟游县', '314', '3', '10', '0', '610329', '麟游县');
INSERT INTO `region` VALUES ('2645', '凤县', '314', '3', '10', '0', '610330', '凤县');
INSERT INTO `region` VALUES ('2646', '太白县', '314', '3', '10', '0', '610331', '太白县');
INSERT INTO `region` VALUES ('2647', '汉滨区', '315', '3', '10', '0', '610902', '汉滨区');
INSERT INTO `region` VALUES ('2648', '汉阴县', '315', '3', '10', '0', '610921', '汉阴县');
INSERT INTO `region` VALUES ('2649', '石泉县', '315', '3', '10', '0', '610922', '石泉县');
INSERT INTO `region` VALUES ('2650', '宁陕县', '315', '3', '10', '0', '610923', '宁陕县');
INSERT INTO `region` VALUES ('2651', '紫阳县', '315', '3', '10', '0', '610924', '紫阳县');
INSERT INTO `region` VALUES ('2652', '岚皋县', '315', '3', '10', '0', '610925', '岚皋县');
INSERT INTO `region` VALUES ('2653', '平利县', '315', '3', '10', '0', '610926', '平利县');
INSERT INTO `region` VALUES ('2654', '镇坪县', '315', '3', '10', '0', '610927', '镇坪县');
INSERT INTO `region` VALUES ('2655', '旬阳县', '315', '3', '10', '0', '610928', '旬阳县');
INSERT INTO `region` VALUES ('2656', '白河县', '315', '3', '10', '0', '610929', '白河县');
INSERT INTO `region` VALUES ('2657', '商州区', '316', '3', '10', '0', '611002', '商州区');
INSERT INTO `region` VALUES ('2658', '洛南县', '316', '3', '10', '0', '611021', '洛南县');
INSERT INTO `region` VALUES ('2659', '丹凤县', '316', '3', '10', '0', '611022', '丹凤县');
INSERT INTO `region` VALUES ('2660', '商南县', '316', '3', '10', '0', '611023', '商南县');
INSERT INTO `region` VALUES ('2661', '山阳县', '316', '3', '10', '0', '611024', '山阳县');
INSERT INTO `region` VALUES ('2662', '镇安县', '316', '3', '10', '0', '611025', '镇安县');
INSERT INTO `region` VALUES ('2663', '柞水县', '316', '3', '10', '0', '611026', '柞水县');
INSERT INTO `region` VALUES ('2664', '汉台区', '317', '3', '10', '0', '610702', '汉台区');
INSERT INTO `region` VALUES ('2665', '南郑县', '317', '3', '10', '0', '610721', '南郑县');
INSERT INTO `region` VALUES ('2666', '城固县', '317', '3', '10', '0', '610722', '城固县');
INSERT INTO `region` VALUES ('2667', '洋县', '317', '3', '10', '0', '610723', '洋县');
INSERT INTO `region` VALUES ('2668', '西乡县', '317', '3', '10', '0', '610724', '西乡县');
INSERT INTO `region` VALUES ('2669', '勉县', '317', '3', '10', '0', '610725', '勉县');
INSERT INTO `region` VALUES ('2670', '宁强县', '317', '3', '10', '0', '610726', '宁强县');
INSERT INTO `region` VALUES ('2671', '略阳县', '317', '3', '10', '0', '610727', '略阳县');
INSERT INTO `region` VALUES ('2672', '镇巴县', '317', '3', '10', '0', '610728', '镇巴县');
INSERT INTO `region` VALUES ('2673', '留坝县', '317', '3', '10', '0', '610729', '留坝县');
INSERT INTO `region` VALUES ('2674', '佛坪县', '317', '3', '10', '0', '610730', '佛坪县');
INSERT INTO `region` VALUES ('2675', '临渭区', '318', '3', '10', '0', '610502', '临渭区');
INSERT INTO `region` VALUES ('2676', '韩城市', '318', '3', '10', '0', '610581', '韩城市');
INSERT INTO `region` VALUES ('2677', '华阴市', '318', '3', '10', '0', '610582', '华阴市');
INSERT INTO `region` VALUES ('2678', '华县', '318', '3', '10', '0', '610521', '华县');
INSERT INTO `region` VALUES ('2679', '潼关县', '318', '3', '10', '0', '610522', '潼关县');
INSERT INTO `region` VALUES ('2680', '大荔县', '318', '3', '10', '0', '610523', '大荔县');
INSERT INTO `region` VALUES ('2681', '合阳县', '318', '3', '10', '0', '610524', '合阳县');
INSERT INTO `region` VALUES ('2682', '澄城县', '318', '3', '10', '0', '610525', '澄城县');
INSERT INTO `region` VALUES ('2683', '蒲城县', '318', '3', '10', '0', '610526', '蒲城县');
INSERT INTO `region` VALUES ('2684', '白水县', '318', '3', '10', '0', '610527', '白水县');
INSERT INTO `region` VALUES ('2685', '富平县', '318', '3', '10', '0', '610528', '富平县');
INSERT INTO `region` VALUES ('2686', '耀州区', '319', '3', '10', '0', '610204', '耀州区');
INSERT INTO `region` VALUES ('2687', '王益区', '319', '3', '10', '0', '610202', '王益区');
INSERT INTO `region` VALUES ('2688', '印台区', '319', '3', '10', '0', '610203', '印台区');
INSERT INTO `region` VALUES ('2689', '宜君县', '319', '3', '10', '0', '610222', '宜君县');
INSERT INTO `region` VALUES ('2690', '吴起县', '320', '3', '10', '0', '610626', '吴起县');
INSERT INTO `region` VALUES ('2691', '宝塔区', '320', '3', '10', '0', '610602', '宝塔区');
INSERT INTO `region` VALUES ('2692', '延长县', '320', '3', '10', '0', '610621', '延长县');
INSERT INTO `region` VALUES ('2693', '延川县', '320', '3', '10', '0', '610622', '延川县');
INSERT INTO `region` VALUES ('2694', '子长县', '320', '3', '10', '0', '610623', '子长县');
INSERT INTO `region` VALUES ('2695', '安塞县', '320', '3', '10', '0', '610624', '安塞县');
INSERT INTO `region` VALUES ('2696', '志丹县', '320', '3', '10', '0', '610625', '志丹县');
INSERT INTO `region` VALUES ('2697', '甘泉县', '320', '3', '10', '0', '610627', '甘泉县');
INSERT INTO `region` VALUES ('2698', '富县', '320', '3', '10', '0', '610628', '富县');
INSERT INTO `region` VALUES ('2699', '洛川县', '320', '3', '10', '0', '610629', '洛川县');
INSERT INTO `region` VALUES ('2700', '宜川县', '320', '3', '10', '0', '610630', '宜川县');
INSERT INTO `region` VALUES ('2701', '黄龙县', '320', '3', '10', '0', '610631', '黄龙县');
INSERT INTO `region` VALUES ('2702', '黄陵县', '320', '3', '10', '0', '610632', '黄陵县');
INSERT INTO `region` VALUES ('2703', '秦都区', '321', '3', '10', '0', '610402', '秦都区');
INSERT INTO `region` VALUES ('2704', '渭城区', '321', '3', '10', '0', '610404', '渭城区');
INSERT INTO `region` VALUES ('2705', '杨陵区', '321', '3', '10', '0', '610403', '杨陵区');
INSERT INTO `region` VALUES ('2706', '兴平市', '321', '3', '10', '0', '610481', '兴平市');
INSERT INTO `region` VALUES ('2707', '三原县', '321', '3', '10', '0', '610422', '三原县');
INSERT INTO `region` VALUES ('2708', '泾阳县', '321', '3', '10', '0', '610423', '泾阳县');
INSERT INTO `region` VALUES ('2709', '乾县', '321', '3', '10', '0', '610424', '乾县');
INSERT INTO `region` VALUES ('2710', '礼泉县', '321', '3', '10', '0', '610425', '礼泉县');
INSERT INTO `region` VALUES ('2711', '永寿县', '321', '3', '10', '0', '610426', '永寿县');
INSERT INTO `region` VALUES ('2712', '彬县', '321', '3', '10', '0', '610427', '彬县');
INSERT INTO `region` VALUES ('2713', '长武县', '321', '3', '10', '0', '610428', '长武县');
INSERT INTO `region` VALUES ('2714', '旬邑县', '321', '3', '10', '0', '610429', '旬邑县');
INSERT INTO `region` VALUES ('2715', '淳化县', '321', '3', '10', '0', '610430', '淳化县');
INSERT INTO `region` VALUES ('2716', '武功县', '321', '3', '10', '0', '610431', '武功县');
INSERT INTO `region` VALUES ('2717', '榆阳区', '322', '3', '10', '0', '610802', '榆阳区');
INSERT INTO `region` VALUES ('2718', '神木县', '322', '3', '10', '0', '610821', '神木县');
INSERT INTO `region` VALUES ('2719', '府谷县', '322', '3', '10', '0', '610822', '府谷县');
INSERT INTO `region` VALUES ('2720', '横山县', '322', '3', '10', '0', '610823', '横山县');
INSERT INTO `region` VALUES ('2721', '靖边县', '322', '3', '10', '0', '610824', '靖边县');
INSERT INTO `region` VALUES ('2722', '定边县', '322', '3', '10', '0', '610825', '定边县');
INSERT INTO `region` VALUES ('2723', '绥德县', '322', '3', '10', '0', '610826', '绥德县');
INSERT INTO `region` VALUES ('2724', '米脂县', '322', '3', '10', '0', '610827', '米脂县');
INSERT INTO `region` VALUES ('2725', '佳县', '322', '3', '10', '0', '610828', '佳县');
INSERT INTO `region` VALUES ('2726', '吴堡县', '322', '3', '10', '0', '610829', '吴堡县');
INSERT INTO `region` VALUES ('2727', '清涧县', '322', '3', '10', '0', '610830', '清涧县');
INSERT INTO `region` VALUES ('2728', '子洲县', '322', '3', '10', '0', '610831', '子洲县');
INSERT INTO `region` VALUES ('2729', '和平区', '323', '3', '10', '0', '120101', '和平区');
INSERT INTO `region` VALUES ('2730', '河西区', '323', '3', '10', '0', '120103', '河西区');
INSERT INTO `region` VALUES ('2731', '南开区', '323', '3', '10', '0', '120104', '南开区');
INSERT INTO `region` VALUES ('2732', '河北区', '323', '3', '10', '0', '120105', '河北区');
INSERT INTO `region` VALUES ('2733', '河东区', '323', '3', '10', '0', '120102', '河东区');
INSERT INTO `region` VALUES ('2734', '红桥区', '323', '3', '10', '0', '120106', '红桥区');
INSERT INTO `region` VALUES ('2735', '东丽区', '323', '3', '10', '0', '120110', '东丽区');
INSERT INTO `region` VALUES ('2736', '津南区', '323', '3', '10', '0', '120112', '津南区');
INSERT INTO `region` VALUES ('2737', '西青区', '323', '3', '10', '0', '120111', '西青区');
INSERT INTO `region` VALUES ('2738', '北辰区', '323', '3', '10', '0', '120113', '北辰区');
INSERT INTO `region` VALUES ('2739', '塘沽区', '323', '3', '10', '0', '0', '塘沽区');
INSERT INTO `region` VALUES ('2740', '汉沽区', '323', '3', '10', '0', '0', '汉沽区');
INSERT INTO `region` VALUES ('2741', '大港区', '323', '3', '10', '0', '0', '大港区');
INSERT INTO `region` VALUES ('2742', '武清区', '323', '3', '10', '0', '120114', '武清区');
INSERT INTO `region` VALUES ('2743', '宝坻区', '323', '3', '10', '0', '120115', '宝坻区');
INSERT INTO `region` VALUES ('2744', '经济开发区', '323', '3', '10', '0', '0', '经济开发区');
INSERT INTO `region` VALUES ('2745', '宁河县', '323', '3', '10', '0', '120221', '宁河县');
INSERT INTO `region` VALUES ('2746', '静海县', '323', '3', '10', '0', '120223', '静海县');
INSERT INTO `region` VALUES ('2747', '蓟县', '323', '3', '10', '0', '120225', '蓟县');
INSERT INTO `region` VALUES ('2748', '江阳区', '324', '3', '10', '0', '510502', '江阳区');
INSERT INTO `region` VALUES ('2749', '纳溪区', '324', '3', '10', '0', '510503', '纳溪区');
INSERT INTO `region` VALUES ('2750', '龙马潭区', '324', '3', '10', '0', '510504', '龙马潭区');
INSERT INTO `region` VALUES ('2751', '泸县', '324', '3', '10', '0', '510521', '泸县');
INSERT INTO `region` VALUES ('2752', '合江县', '324', '3', '10', '0', '510522', '合江县');
INSERT INTO `region` VALUES ('2753', '叙永县', '324', '3', '10', '0', '510524', '叙永县');
INSERT INTO `region` VALUES ('2754', '古蔺县', '324', '3', '10', '0', '510525', '古蔺县');
INSERT INTO `region` VALUES ('2755', '大安区', '325', '3', '10', '0', '510304', '大安区');
INSERT INTO `region` VALUES ('2756', '自流井区', '325', '3', '10', '0', '510302', '自流井区');
INSERT INTO `region` VALUES ('2757', '贡井区', '325', '3', '10', '0', '510303', '贡井区');
INSERT INTO `region` VALUES ('2758', '沿滩区', '325', '3', '10', '0', '510311', '沿滩区');
INSERT INTO `region` VALUES ('2759', '荣县', '325', '3', '10', '0', '510321', '荣县');
INSERT INTO `region` VALUES ('2760', '富顺县', '325', '3', '10', '0', '510322', '富顺县');
INSERT INTO `region` VALUES ('2761', '雁江区', '326', '3', '10', '0', '512002', '雁江区');
INSERT INTO `region` VALUES ('2762', '简阳市', '326', '3', '10', '0', '512081', '简阳市');
INSERT INTO `region` VALUES ('2763', '安岳县', '326', '3', '10', '0', '512021', '安岳县');
INSERT INTO `region` VALUES ('2764', '乐至县', '326', '3', '10', '0', '512022', '乐至县');
INSERT INTO `region` VALUES ('2765', '翠屏区', '327', '3', '10', '0', '511502', '翠屏区');
INSERT INTO `region` VALUES ('2766', '宜宾县', '327', '3', '10', '0', '511521', '宜宾县');
INSERT INTO `region` VALUES ('2767', '南溪县', '327', '3', '10', '0', '511503', '南溪县');
INSERT INTO `region` VALUES ('2768', '江安县', '327', '3', '10', '0', '511523', '江安县');
INSERT INTO `region` VALUES ('2769', '长宁县', '327', '3', '10', '0', '511524', '长宁县');
INSERT INTO `region` VALUES ('2770', '高县', '327', '3', '10', '0', '511525', '高县');
INSERT INTO `region` VALUES ('2771', '珙县', '327', '3', '10', '0', '511526', '珙县');
INSERT INTO `region` VALUES ('2772', '筠连县', '327', '3', '10', '0', '511527', '筠连县');
INSERT INTO `region` VALUES ('2773', '兴文县', '327', '3', '10', '0', '511528', '兴文县');
INSERT INTO `region` VALUES ('2774', '屏山县', '327', '3', '10', '0', '511529', '屏山县');
INSERT INTO `region` VALUES ('2775', '雨城区', '328', '3', '10', '0', '511802', '雨城区');
INSERT INTO `region` VALUES ('2776', '名山县', '328', '3', '10', '0', '511803', '名山县');
INSERT INTO `region` VALUES ('2777', '荥经县', '328', '3', '10', '0', '511822', '荥经县');
INSERT INTO `region` VALUES ('2778', '汉源县', '328', '3', '10', '0', '511823', '汉源县');
INSERT INTO `region` VALUES ('2779', '石棉县', '328', '3', '10', '0', '511824', '石棉县');
INSERT INTO `region` VALUES ('2780', '天全县', '328', '3', '10', '0', '511825', '天全县');
INSERT INTO `region` VALUES ('2781', '芦山县', '328', '3', '10', '0', '511826', '芦山县');
INSERT INTO `region` VALUES ('2782', '宝兴县', '328', '3', '10', '0', '511827', '宝兴县');
INSERT INTO `region` VALUES ('2783', '船山区', '329', '3', '10', '0', '510903', '船山区');
INSERT INTO `region` VALUES ('2784', '安居区', '329', '3', '10', '0', '510904', '安居区');
INSERT INTO `region` VALUES ('2785', '蓬溪县', '329', '3', '10', '0', '510921', '蓬溪县');
INSERT INTO `region` VALUES ('2786', '射洪县', '329', '3', '10', '0', '510922', '射洪县');
INSERT INTO `region` VALUES ('2787', '大英县', '329', '3', '10', '0', '510923', '大英县');
INSERT INTO `region` VALUES ('2788', '东  区', '330', '3', '10', '0', '0', '东  区');
INSERT INTO `region` VALUES ('2789', '西  区', '330', '3', '10', '0', '0', '西  区');
INSERT INTO `region` VALUES ('2790', '仁和区', '330', '3', '10', '0', '510411', '仁和区');
INSERT INTO `region` VALUES ('2791', '米易县', '330', '3', '10', '0', '510421', '米易县');
INSERT INTO `region` VALUES ('2792', '盐边县', '330', '3', '10', '0', '510422', '盐边县');
INSERT INTO `region` VALUES ('2793', '通川区', '331', '3', '10', '0', '511702', '通川区');
INSERT INTO `region` VALUES ('2794', '万源市', '331', '3', '10', '0', '511781', '万源市');
INSERT INTO `region` VALUES ('2795', '达县', '331', '3', '10', '0', '511721', '达县');
INSERT INTO `region` VALUES ('2796', '宣汉县', '331', '3', '10', '0', '511722', '宣汉县');
INSERT INTO `region` VALUES ('2797', '开江县', '331', '3', '10', '0', '511723', '开江县');
INSERT INTO `region` VALUES ('2798', '大竹县', '331', '3', '10', '0', '511724', '大竹县');
INSERT INTO `region` VALUES ('2799', '渠县', '331', '3', '10', '0', '511725', '渠县');
INSERT INTO `region` VALUES ('2800', '旌阳区', '332', '3', '10', '0', '510603', '旌阳区');
INSERT INTO `region` VALUES ('2801', '广汉市', '332', '3', '10', '0', '510681', '广汉市');
INSERT INTO `region` VALUES ('2802', '什邡市', '332', '3', '10', '0', '510682', '什邡市');
INSERT INTO `region` VALUES ('2803', '绵竹市', '332', '3', '10', '0', '510683', '绵竹市');
INSERT INTO `region` VALUES ('2804', '罗江县', '332', '3', '10', '0', '510626', '罗江县');
INSERT INTO `region` VALUES ('2805', '中江县', '332', '3', '10', '0', '510623', '中江县');
INSERT INTO `region` VALUES ('2806', '马尔康县', '333', '3', '10', '0', '513229', '马尔康县');
INSERT INTO `region` VALUES ('2807', '汶川县', '333', '3', '10', '0', '513221', '汶川县');
INSERT INTO `region` VALUES ('2808', '理县', '333', '3', '10', '0', '513222', '理县');
INSERT INTO `region` VALUES ('2809', '茂县', '333', '3', '10', '0', '513223', '茂县');
INSERT INTO `region` VALUES ('2810', '松潘县', '333', '3', '10', '0', '513224', '松潘县');
INSERT INTO `region` VALUES ('2811', '九寨沟县', '333', '3', '10', '0', '513225', '九寨沟县');
INSERT INTO `region` VALUES ('2812', '金川县', '333', '3', '10', '0', '513226', '金川县');
INSERT INTO `region` VALUES ('2813', '小金县', '333', '3', '10', '0', '513227', '小金县');
INSERT INTO `region` VALUES ('2814', '黑水县', '333', '3', '10', '0', '513228', '黑水县');
INSERT INTO `region` VALUES ('2815', '壤塘县', '333', '3', '10', '0', '513230', '壤塘县');
INSERT INTO `region` VALUES ('2816', '阿坝县', '333', '3', '10', '0', '513231', '阿坝县');
INSERT INTO `region` VALUES ('2817', '若尔盖县', '333', '3', '10', '0', '513232', '若尔盖县');
INSERT INTO `region` VALUES ('2818', '红原县', '333', '3', '10', '0', '513233', '红原县');
INSERT INTO `region` VALUES ('2819', '巴州区', '334', '3', '10', '0', '511902', '巴州区');
INSERT INTO `region` VALUES ('2820', '通江县', '334', '3', '10', '0', '511921', '通江县');
INSERT INTO `region` VALUES ('2821', '南江县', '334', '3', '10', '0', '511922', '南江县');
INSERT INTO `region` VALUES ('2822', '平昌县', '334', '3', '10', '0', '511923', '平昌县');
INSERT INTO `region` VALUES ('2823', '青羊区', '335', '3', '10', '0', '510105', '青羊区');
INSERT INTO `region` VALUES ('2824', '锦江区', '335', '3', '10', '0', '510104', '锦江区');
INSERT INTO `region` VALUES ('2825', '金牛区', '335', '3', '10', '0', '510106', '金牛区');
INSERT INTO `region` VALUES ('2826', '武侯区', '335', '3', '10', '0', '510107', '武侯区');
INSERT INTO `region` VALUES ('2827', '成华区', '335', '3', '10', '0', '510108', '成华区');
INSERT INTO `region` VALUES ('2828', '龙泉驿区', '335', '3', '10', '0', '510112', '龙泉驿区');
INSERT INTO `region` VALUES ('2829', '青白江区', '335', '3', '10', '0', '510113', '青白江区');
INSERT INTO `region` VALUES ('2830', '新都区', '335', '3', '10', '0', '510114', '新都区');
INSERT INTO `region` VALUES ('2831', '温江区', '335', '3', '10', '0', '510115', '温江区');
INSERT INTO `region` VALUES ('2832', '高新区', '335', '3', '10', '0', '0', '高新区');
INSERT INTO `region` VALUES ('2833', '高新西区', '335', '3', '10', '0', '0', '高新西区');
INSERT INTO `region` VALUES ('2834', '都江堰市', '335', '3', '10', '0', '510181', '都江堰市');
INSERT INTO `region` VALUES ('2835', '彭州市', '335', '3', '10', '0', '510182', '彭州市');
INSERT INTO `region` VALUES ('2836', '邛崃市', '335', '3', '10', '0', '510183', '邛崃市');
INSERT INTO `region` VALUES ('2837', '崇州市', '335', '3', '10', '0', '510184', '崇州市');
INSERT INTO `region` VALUES ('2838', '金堂县', '335', '3', '10', '0', '510121', '金堂县');
INSERT INTO `region` VALUES ('2839', '双流县', '335', '3', '10', '0', '510122', '双流县');
INSERT INTO `region` VALUES ('2840', '郫县', '335', '3', '10', '0', '510124', '郫县');
INSERT INTO `region` VALUES ('2841', '大邑县', '335', '3', '10', '0', '510129', '大邑县');
INSERT INTO `region` VALUES ('2842', '蒲江县', '335', '3', '10', '0', '510131', '蒲江县');
INSERT INTO `region` VALUES ('2843', '新津县', '335', '3', '10', '0', '510132', '新津县');
INSERT INTO `region` VALUES ('2844', '涪城区', '336', '3', '10', '0', '510703', '涪城区');
INSERT INTO `region` VALUES ('2845', '游仙区', '336', '3', '10', '0', '510704', '游仙区');
INSERT INTO `region` VALUES ('2846', '江油市', '336', '3', '10', '0', '510781', '江油市');
INSERT INTO `region` VALUES ('2847', '盐亭县', '336', '3', '10', '0', '510723', '盐亭县');
INSERT INTO `region` VALUES ('2848', '三台县', '336', '3', '10', '0', '510722', '三台县');
INSERT INTO `region` VALUES ('2849', '平武县', '336', '3', '10', '0', '510727', '平武县');
INSERT INTO `region` VALUES ('2850', '安县', '336', '3', '10', '0', '510724', '安县');
INSERT INTO `region` VALUES ('2851', '梓潼县', '336', '3', '10', '0', '510725', '梓潼县');
INSERT INTO `region` VALUES ('2852', '北川县', '336', '3', '10', '0', '510726', '北川县');
INSERT INTO `region` VALUES ('2853', '阆中市', '337', '3', '10', '0', '511381', '阆中市');
INSERT INTO `region` VALUES ('2854', '南部县', '337', '3', '10', '0', '511321', '南部县');
INSERT INTO `region` VALUES ('2855', '营山县', '337', '3', '10', '0', '511322', '营山县');
INSERT INTO `region` VALUES ('2856', '蓬安县', '337', '3', '10', '0', '511323', '蓬安县');
INSERT INTO `region` VALUES ('2857', '仪陇县', '337', '3', '10', '0', '511324', '仪陇县');
INSERT INTO `region` VALUES ('2858', '顺庆区', '337', '3', '10', '0', '511302', '顺庆区');
INSERT INTO `region` VALUES ('2859', '高坪区', '337', '3', '10', '0', '511303', '高坪区');
INSERT INTO `region` VALUES ('2860', '嘉陵区', '337', '3', '10', '0', '511304', '嘉陵区');
INSERT INTO `region` VALUES ('2861', '西充县', '337', '3', '10', '0', '511325', '西充县');
INSERT INTO `region` VALUES ('2862', '市中区', '338', '3', '10', '0', '511002', '市中区');
INSERT INTO `region` VALUES ('2863', '东兴区', '338', '3', '10', '0', '511011', '东兴区');
INSERT INTO `region` VALUES ('2864', '威远县', '338', '3', '10', '0', '511024', '威远县');
INSERT INTO `region` VALUES ('2865', '资中县', '338', '3', '10', '0', '511025', '资中县');
INSERT INTO `region` VALUES ('2866', '隆昌县', '338', '3', '10', '0', '511028', '隆昌县');
INSERT INTO `region` VALUES ('2867', '西昌市', '339', '3', '10', '0', '513401', '西昌市');
INSERT INTO `region` VALUES ('2868', '盐源县', '339', '3', '10', '0', '513423', '盐源县');
INSERT INTO `region` VALUES ('2869', '德昌县', '339', '3', '10', '0', '513424', '德昌县');
INSERT INTO `region` VALUES ('2870', '会理县', '339', '3', '10', '0', '513425', '会理县');
INSERT INTO `region` VALUES ('2871', '会东县', '339', '3', '10', '0', '513426', '会东县');
INSERT INTO `region` VALUES ('2872', '宁南县', '339', '3', '10', '0', '513427', '宁南县');
INSERT INTO `region` VALUES ('2873', '普格县', '339', '3', '10', '0', '513428', '普格县');
INSERT INTO `region` VALUES ('2874', '布拖县', '339', '3', '10', '0', '513429', '布拖县');
INSERT INTO `region` VALUES ('2875', '金阳县', '339', '3', '10', '0', '513430', '金阳县');
INSERT INTO `region` VALUES ('2876', '昭觉县', '339', '3', '10', '0', '513431', '昭觉县');
INSERT INTO `region` VALUES ('2877', '喜德县', '339', '3', '10', '0', '513432', '喜德县');
INSERT INTO `region` VALUES ('2878', '冕宁县', '339', '3', '10', '0', '513433', '冕宁县');
INSERT INTO `region` VALUES ('2879', '越西县', '339', '3', '10', '0', '513434', '越西县');
INSERT INTO `region` VALUES ('2880', '甘洛县', '339', '3', '10', '0', '513435', '甘洛县');
INSERT INTO `region` VALUES ('2881', '美姑县', '339', '3', '10', '0', '513436', '美姑县');
INSERT INTO `region` VALUES ('2882', '雷波县', '339', '3', '10', '0', '513437', '雷波县');
INSERT INTO `region` VALUES ('2883', '木里', '339', '3', '10', '0', '513422', '木里');
INSERT INTO `region` VALUES ('2884', '东坡区', '340', '3', '10', '0', '511402', '东坡区');
INSERT INTO `region` VALUES ('2885', '仁寿县', '340', '3', '10', '0', '511421', '仁寿县');
INSERT INTO `region` VALUES ('2886', '彭山县', '340', '3', '10', '0', '511422', '彭山县');
INSERT INTO `region` VALUES ('2887', '洪雅县', '340', '3', '10', '0', '511423', '洪雅县');
INSERT INTO `region` VALUES ('2888', '丹棱县', '340', '3', '10', '0', '511424', '丹棱县');
INSERT INTO `region` VALUES ('2889', '青神县', '340', '3', '10', '0', '511425', '青神县');
INSERT INTO `region` VALUES ('2890', '利州区', '341', '3', '10', '0', '510802', '利州区');
INSERT INTO `region` VALUES ('2891', '元坝区', '341', '3', '10', '0', '510811', '元坝区');
INSERT INTO `region` VALUES ('2892', '朝天区', '341', '3', '10', '0', '510812', '朝天区');
INSERT INTO `region` VALUES ('2893', '旺苍县', '341', '3', '10', '0', '510821', '旺苍县');
INSERT INTO `region` VALUES ('2894', '青川县', '341', '3', '10', '0', '510822', '青川县');
INSERT INTO `region` VALUES ('2895', '剑阁县', '341', '3', '10', '0', '510823', '剑阁县');
INSERT INTO `region` VALUES ('2896', '苍溪县', '341', '3', '10', '0', '510824', '苍溪县');
INSERT INTO `region` VALUES ('2897', '峨眉山市', '342', '3', '10', '0', '511181', '峨眉山市');
INSERT INTO `region` VALUES ('2898', '乐山市', '342', '3', '10', '0', '511100', '乐山市');
INSERT INTO `region` VALUES ('2899', '犍为县', '342', '3', '10', '0', '511123', '犍为县');
INSERT INTO `region` VALUES ('2900', '井研县', '342', '3', '10', '0', '511124', '井研县');
INSERT INTO `region` VALUES ('2901', '夹江县', '342', '3', '10', '0', '511126', '夹江县');
INSERT INTO `region` VALUES ('2902', '沐川县', '342', '3', '10', '0', '511129', '沐川县');
INSERT INTO `region` VALUES ('2903', '峨边', '342', '3', '10', '0', '511132', '峨边');
INSERT INTO `region` VALUES ('2904', '马边', '342', '3', '10', '0', '511133', '马边');
INSERT INTO `region` VALUES ('2905', '康定县', '343', '3', '10', '0', '513321', '康定县');
INSERT INTO `region` VALUES ('2906', '丹巴县', '343', '3', '10', '0', '513323', '丹巴县');
INSERT INTO `region` VALUES ('2907', '泸定县', '343', '3', '10', '0', '513322', '泸定县');
INSERT INTO `region` VALUES ('2908', '炉霍县', '343', '3', '10', '0', '513327', '炉霍县');
INSERT INTO `region` VALUES ('2909', '九龙县', '343', '3', '10', '0', '513324', '九龙县');
INSERT INTO `region` VALUES ('2910', '甘孜县', '343', '3', '10', '0', '513328', '甘孜县');
INSERT INTO `region` VALUES ('2911', '雅江县', '343', '3', '10', '0', '513325', '雅江县');
INSERT INTO `region` VALUES ('2912', '新龙县', '343', '3', '10', '0', '513329', '新龙县');
INSERT INTO `region` VALUES ('2913', '道孚县', '343', '3', '10', '0', '513326', '道孚县');
INSERT INTO `region` VALUES ('2914', '白玉县', '343', '3', '10', '0', '513331', '白玉县');
INSERT INTO `region` VALUES ('2915', '理塘县', '343', '3', '10', '0', '513334', '理塘县');
INSERT INTO `region` VALUES ('2916', '德格县', '343', '3', '10', '0', '513330', '德格县');
INSERT INTO `region` VALUES ('2917', '乡城县', '343', '3', '10', '0', '513336', '乡城县');
INSERT INTO `region` VALUES ('2918', '石渠县', '343', '3', '10', '0', '513332', '石渠县');
INSERT INTO `region` VALUES ('2919', '稻城县', '343', '3', '10', '0', '513337', '稻城县');
INSERT INTO `region` VALUES ('2920', '色达县', '343', '3', '10', '0', '513333', '色达县');
INSERT INTO `region` VALUES ('2921', '巴塘县', '343', '3', '10', '0', '513335', '巴塘县');
INSERT INTO `region` VALUES ('2922', '得荣县', '343', '3', '10', '0', '513338', '得荣县');
INSERT INTO `region` VALUES ('2923', '广安区', '344', '3', '10', '0', '511602', '广安区');
INSERT INTO `region` VALUES ('2924', '华蓥市', '344', '3', '10', '0', '511681', '华蓥市');
INSERT INTO `region` VALUES ('2925', '岳池县', '344', '3', '10', '0', '511621', '岳池县');
INSERT INTO `region` VALUES ('2926', '武胜县', '344', '3', '10', '0', '511622', '武胜县');
INSERT INTO `region` VALUES ('2927', '邻水县', '344', '3', '10', '0', '511623', '邻水县');
INSERT INTO `region` VALUES ('2928', '天山区', '345', '3', '10', '0', '650102', '天山区');
INSERT INTO `region` VALUES ('2929', '沙依巴克区', '345', '3', '10', '0', '650103', '沙依巴克区');
INSERT INTO `region` VALUES ('2930', '新市区', '345', '3', '10', '0', '650104', '新市区');
INSERT INTO `region` VALUES ('2931', '水磨沟区', '345', '3', '10', '0', '650105', '水磨沟区');
INSERT INTO `region` VALUES ('2932', '头屯河区', '345', '3', '10', '0', '650106', '头屯河区');
INSERT INTO `region` VALUES ('2933', '达坂城区', '345', '3', '10', '0', '650107', '达坂城区');
INSERT INTO `region` VALUES ('2934', '米东区', '345', '3', '10', '0', '650109', '米东区');
INSERT INTO `region` VALUES ('2935', '乌鲁木齐县', '345', '3', '10', '0', '650100', '乌鲁木齐县');
INSERT INTO `region` VALUES ('2936', '呼图壁县', '346', '3', '10', '0', '652323', '呼图壁县');
INSERT INTO `region` VALUES ('2937', '米泉市', '346', '3', '10', '0', '0', '米泉市');
INSERT INTO `region` VALUES ('2938', '昌吉市', '346', '3', '10', '0', '652301', '昌吉市');
INSERT INTO `region` VALUES ('2939', '阜康市', '346', '3', '10', '0', '652302', '阜康市');
INSERT INTO `region` VALUES ('2940', '玛纳斯县', '346', '3', '10', '0', '652324', '玛纳斯县');
INSERT INTO `region` VALUES ('2941', '奇台县', '346', '3', '10', '0', '652325', '奇台县');
INSERT INTO `region` VALUES ('2942', '吉木萨尔县', '346', '3', '10', '0', '652327', '吉木萨尔县');
INSERT INTO `region` VALUES ('2943', '木垒', '346', '3', '10', '0', '652328', '木垒');
INSERT INTO `region` VALUES ('2944', '哈密市', '347', '3', '10', '0', '652201', '哈密市');
INSERT INTO `region` VALUES ('2945', '伊吾县', '347', '3', '10', '0', '652223', '伊吾县');
INSERT INTO `region` VALUES ('2946', '巴里坤', '347', '3', '10', '0', '652222', '巴里坤');
INSERT INTO `region` VALUES ('2947', '和田市', '348', '3', '10', '0', '653201', '和田市');
INSERT INTO `region` VALUES ('2948', '和田县', '348', '3', '10', '0', '653221', '和田县');
INSERT INTO `region` VALUES ('2949', '墨玉县', '348', '3', '10', '0', '653222', '墨玉县');
INSERT INTO `region` VALUES ('2950', '皮山县', '348', '3', '10', '0', '653223', '皮山县');
INSERT INTO `region` VALUES ('2951', '洛浦县', '348', '3', '10', '0', '653224', '洛浦县');
INSERT INTO `region` VALUES ('2952', '策勒县', '348', '3', '10', '0', '653225', '策勒县');
INSERT INTO `region` VALUES ('2953', '于田县', '348', '3', '10', '0', '653226', '于田县');
INSERT INTO `region` VALUES ('2954', '民丰县', '348', '3', '10', '0', '653227', '民丰县');
INSERT INTO `region` VALUES ('2955', '喀什市', '349', '3', '10', '0', '653101', '喀什市');
INSERT INTO `region` VALUES ('2956', '疏附县', '349', '3', '10', '0', '653121', '疏附县');
INSERT INTO `region` VALUES ('2957', '疏勒县', '349', '3', '10', '0', '653122', '疏勒县');
INSERT INTO `region` VALUES ('2958', '英吉沙县', '349', '3', '10', '0', '653123', '英吉沙县');
INSERT INTO `region` VALUES ('2959', '泽普县', '349', '3', '10', '0', '653124', '泽普县');
INSERT INTO `region` VALUES ('2960', '莎车县', '349', '3', '10', '0', '653125', '莎车县');
INSERT INTO `region` VALUES ('2961', '叶城县', '349', '3', '10', '0', '653126', '叶城县');
INSERT INTO `region` VALUES ('2962', '麦盖提县', '349', '3', '10', '0', '653127', '麦盖提县');
INSERT INTO `region` VALUES ('2963', '岳普湖县', '349', '3', '10', '0', '653128', '岳普湖县');
INSERT INTO `region` VALUES ('2964', '伽师县', '349', '3', '10', '0', '653129', '伽师县');
INSERT INTO `region` VALUES ('2965', '巴楚县', '349', '3', '10', '0', '653130', '巴楚县');
INSERT INTO `region` VALUES ('2966', '塔什库尔干', '349', '3', '10', '0', '653131', '塔什库尔干');
INSERT INTO `region` VALUES ('2967', '阿克苏市', '350', '3', '10', '0', '652901', '阿克苏市');
INSERT INTO `region` VALUES ('2968', '温宿县', '350', '3', '10', '0', '652922', '温宿县');
INSERT INTO `region` VALUES ('2969', '库车县', '350', '3', '10', '0', '652923', '库车县');
INSERT INTO `region` VALUES ('2970', '沙雅县', '350', '3', '10', '0', '652924', '沙雅县');
INSERT INTO `region` VALUES ('2971', '新和县', '350', '3', '10', '0', '652925', '新和县');
INSERT INTO `region` VALUES ('2972', '拜城县', '350', '3', '10', '0', '652926', '拜城县');
INSERT INTO `region` VALUES ('2973', '乌什县', '350', '3', '10', '0', '652927', '乌什县');
INSERT INTO `region` VALUES ('2974', '阿瓦提县', '350', '3', '10', '0', '652928', '阿瓦提县');
INSERT INTO `region` VALUES ('2975', '柯坪县', '350', '3', '10', '0', '652929', '柯坪县');
INSERT INTO `region` VALUES ('2976', '阿拉尔市', '351', '3', '10', '0', '659002', '阿拉尔市');
INSERT INTO `region` VALUES ('2977', '库尔勒市', '352', '3', '10', '0', '652801', '库尔勒市');
INSERT INTO `region` VALUES ('2978', '轮台县', '352', '3', '10', '0', '652822', '轮台县');
INSERT INTO `region` VALUES ('2979', '尉犁县', '352', '3', '10', '0', '652823', '尉犁县');
INSERT INTO `region` VALUES ('2980', '若羌县', '352', '3', '10', '0', '652824', '若羌县');
INSERT INTO `region` VALUES ('2981', '且末县', '352', '3', '10', '0', '652825', '且末县');
INSERT INTO `region` VALUES ('2982', '焉耆', '352', '3', '10', '0', '652826', '焉耆');
INSERT INTO `region` VALUES ('2983', '和静县', '352', '3', '10', '0', '652827', '和静县');
INSERT INTO `region` VALUES ('2984', '和硕县', '352', '3', '10', '0', '652828', '和硕县');
INSERT INTO `region` VALUES ('2985', '博湖县', '352', '3', '10', '0', '652829', '博湖县');
INSERT INTO `region` VALUES ('2986', '博乐市', '353', '3', '10', '0', '652701', '博乐市');
INSERT INTO `region` VALUES ('2987', '精河县', '353', '3', '10', '0', '652722', '精河县');
INSERT INTO `region` VALUES ('2988', '温泉县', '353', '3', '10', '0', '652723', '温泉县');
INSERT INTO `region` VALUES ('2989', '吐鲁番市', '354', '3', '10', '0', '652101', '吐鲁番市');
INSERT INTO `region` VALUES ('2990', '鄯善县', '354', '3', '10', '0', '652122', '鄯善县');
INSERT INTO `region` VALUES ('2991', '托克逊县', '354', '3', '10', '0', '652123', '托克逊县');
INSERT INTO `region` VALUES ('2992', '五家渠市', '355', '3', '10', '0', '659004', '五家渠市');
INSERT INTO `region` VALUES ('2993', '阿勒泰市', '3427', '3', '10', '0', '654301', '阿勒泰市');
INSERT INTO `region` VALUES ('2994', '布克赛尔', '3425', '3', '10', '0', '654226', '布克赛尔');
INSERT INTO `region` VALUES ('2995', '伊宁市', '356', '3', '10', '0', '654002', '伊宁市');
INSERT INTO `region` VALUES ('2996', '布尔津县', '3427', '3', '10', '0', '654321', '布尔津县');
INSERT INTO `region` VALUES ('2997', '奎屯市', '356', '3', '10', '0', '654003', '奎屯市');
INSERT INTO `region` VALUES ('2998', '乌苏市', '3425', '3', '10', '0', '654202', '乌苏市');
INSERT INTO `region` VALUES ('2999', '额敏县', '3425', '3', '10', '0', '654221', '额敏县');
INSERT INTO `region` VALUES ('3000', '富蕴县', '3427', '3', '10', '0', '654322', '富蕴县');
INSERT INTO `region` VALUES ('3001', '伊宁县', '356', '3', '10', '0', '654021', '伊宁县');
INSERT INTO `region` VALUES ('3002', '福海县', '3427', '3', '10', '0', '654323', '福海县');
INSERT INTO `region` VALUES ('3003', '霍城县', '356', '3', '10', '0', '654023', '霍城县');
INSERT INTO `region` VALUES ('3004', '沙湾县', '3425', '3', '10', '0', '654223', '沙湾县');
INSERT INTO `region` VALUES ('3005', '巩留县', '356', '3', '10', '0', '654024', '巩留县');
INSERT INTO `region` VALUES ('3006', '哈巴河县', '3427', '3', '10', '0', '654324', '哈巴河县');
INSERT INTO `region` VALUES ('3007', '托里县', '3425', '3', '10', '0', '654224', '托里县');
INSERT INTO `region` VALUES ('3008', '青河县', '3427', '3', '10', '0', '654325', '青河县');
INSERT INTO `region` VALUES ('3009', '新源县', '356', '3', '10', '0', '654025', '新源县');
INSERT INTO `region` VALUES ('3010', '裕民县', '3425', '3', '10', '0', '654225', '裕民县');
INSERT INTO `region` VALUES ('3011', '和布克赛尔', '3425', '3', '10', '0', '654226', '和布克赛尔');
INSERT INTO `region` VALUES ('3012', '吉木乃县', '3427', '3', '10', '0', '654326', '吉木乃县');
INSERT INTO `region` VALUES ('3013', '昭苏县', '356', '3', '10', '0', '654026', '昭苏县');
INSERT INTO `region` VALUES ('3014', '特克斯县', '356', '3', '10', '0', '654027', '特克斯县');
INSERT INTO `region` VALUES ('3015', '尼勒克县', '356', '3', '10', '0', '654028', '尼勒克县');
INSERT INTO `region` VALUES ('3016', '察布查尔', '356', '3', '10', '0', '654022', '察布查尔');
INSERT INTO `region` VALUES ('3017', '克拉玛依市', '357', '3', '10', '0', '650200', '克拉玛依市');
INSERT INTO `region` VALUES ('3018', '阿图什市', '358', '3', '10', '0', '653001', '阿图什市');
INSERT INTO `region` VALUES ('3019', '阿克陶县', '358', '3', '10', '0', '653022', '阿克陶县');
INSERT INTO `region` VALUES ('3020', '阿合奇县', '358', '3', '10', '0', '653023', '阿合奇县');
INSERT INTO `region` VALUES ('3021', '乌恰县', '358', '3', '10', '0', '653024', '乌恰县');
INSERT INTO `region` VALUES ('3022', '石河子市', '359', '3', '10', '0', '659001', '石河子市');
INSERT INTO `region` VALUES ('3023', '图木舒克市', '360', '3', '10', '0', '659003', '图木舒克市');
INSERT INTO `region` VALUES ('3024', '乃东县', '361', '3', '10', '0', '542221', '乃东县');
INSERT INTO `region` VALUES ('3025', '扎囊县', '361', '3', '10', '0', '542222', '扎囊县');
INSERT INTO `region` VALUES ('3026', '贡嘎县', '361', '3', '10', '0', '542223', '贡嘎县');
INSERT INTO `region` VALUES ('3027', '桑日县', '361', '3', '10', '0', '542224', '桑日县');
INSERT INTO `region` VALUES ('3028', '琼结县', '361', '3', '10', '0', '542225', '琼结县');
INSERT INTO `region` VALUES ('3029', '曲松县', '361', '3', '10', '0', '542226', '曲松县');
INSERT INTO `region` VALUES ('3030', '措美县', '361', '3', '10', '0', '542227', '措美县');
INSERT INTO `region` VALUES ('3031', '洛扎县', '361', '3', '10', '0', '542228', '洛扎县');
INSERT INTO `region` VALUES ('3032', '加查县', '361', '3', '10', '0', '542229', '加查县');
INSERT INTO `region` VALUES ('3033', '隆子县', '361', '3', '10', '0', '542231', '隆子县');
INSERT INTO `region` VALUES ('3034', '错那县', '361', '3', '10', '0', '542232', '错那县');
INSERT INTO `region` VALUES ('3035', '浪卡子县', '361', '3', '10', '0', '542233', '浪卡子县');
INSERT INTO `region` VALUES ('3036', '日喀则市', '362', '3', '10', '0', '542301', '日喀则市');
INSERT INTO `region` VALUES ('3037', '南木林县', '362', '3', '10', '0', '542322', '南木林县');
INSERT INTO `region` VALUES ('3038', '江孜县', '362', '3', '10', '0', '542323', '江孜县');
INSERT INTO `region` VALUES ('3039', '定日县', '362', '3', '10', '0', '542324', '定日县');
INSERT INTO `region` VALUES ('3040', '萨迦县', '362', '3', '10', '0', '542325', '萨迦县');
INSERT INTO `region` VALUES ('3041', '拉孜县', '362', '3', '10', '0', '542326', '拉孜县');
INSERT INTO `region` VALUES ('3042', '昂仁县', '362', '3', '10', '0', '542327', '昂仁县');
INSERT INTO `region` VALUES ('3043', '谢通门县', '362', '3', '10', '0', '542328', '谢通门县');
INSERT INTO `region` VALUES ('3044', '白朗县', '362', '3', '10', '0', '542329', '白朗县');
INSERT INTO `region` VALUES ('3045', '仁布县', '362', '3', '10', '0', '542330', '仁布县');
INSERT INTO `region` VALUES ('3046', '康马县', '362', '3', '10', '0', '542331', '康马县');
INSERT INTO `region` VALUES ('3047', '定结县', '362', '3', '10', '0', '542332', '定结县');
INSERT INTO `region` VALUES ('3048', '仲巴县', '362', '3', '10', '0', '542333', '仲巴县');
INSERT INTO `region` VALUES ('3049', '亚东县', '362', '3', '10', '0', '542334', '亚东县');
INSERT INTO `region` VALUES ('3050', '吉隆县', '362', '3', '10', '0', '542335', '吉隆县');
INSERT INTO `region` VALUES ('3051', '聂拉木县', '362', '3', '10', '0', '542336', '聂拉木县');
INSERT INTO `region` VALUES ('3052', '萨嘎县', '362', '3', '10', '0', '542337', '萨嘎县');
INSERT INTO `region` VALUES ('3053', '岗巴县', '362', '3', '10', '0', '542338', '岗巴县');
INSERT INTO `region` VALUES ('3054', '那曲县', '363', '3', '10', '0', '542421', '那曲县');
INSERT INTO `region` VALUES ('3055', '嘉黎县', '363', '3', '10', '0', '542422', '嘉黎县');
INSERT INTO `region` VALUES ('3056', '比如县', '363', '3', '10', '0', '542423', '比如县');
INSERT INTO `region` VALUES ('3057', '聂荣县', '363', '3', '10', '0', '542424', '聂荣县');
INSERT INTO `region` VALUES ('3058', '安多县', '363', '3', '10', '0', '542425', '安多县');
INSERT INTO `region` VALUES ('3059', '申扎县', '363', '3', '10', '0', '542426', '申扎县');
INSERT INTO `region` VALUES ('3060', '索县', '363', '3', '10', '0', '542427', '索县');
INSERT INTO `region` VALUES ('3061', '班戈县', '363', '3', '10', '0', '542428', '班戈县');
INSERT INTO `region` VALUES ('3062', '巴青县', '363', '3', '10', '0', '542429', '巴青县');
INSERT INTO `region` VALUES ('3063', '尼玛县', '363', '3', '10', '0', '542430', '尼玛县');
INSERT INTO `region` VALUES ('3064', '林芝县', '364', '3', '10', '0', '542621', '林芝县');
INSERT INTO `region` VALUES ('3065', '工布江达县', '364', '3', '10', '0', '542622', '工布江达县');
INSERT INTO `region` VALUES ('3066', '米林县', '364', '3', '10', '0', '542623', '米林县');
INSERT INTO `region` VALUES ('3067', '墨脱县', '364', '3', '10', '0', '542624', '墨脱县');
INSERT INTO `region` VALUES ('3068', '波密县', '364', '3', '10', '0', '542625', '波密县');
INSERT INTO `region` VALUES ('3069', '察隅县', '364', '3', '10', '0', '542626', '察隅县');
INSERT INTO `region` VALUES ('3070', '朗县', '364', '3', '10', '0', '542627', '朗县');
INSERT INTO `region` VALUES ('3071', '昌都县', '365', '3', '10', '0', '542121', '昌都县');
INSERT INTO `region` VALUES ('3072', '江达县', '365', '3', '10', '0', '542122', '江达县');
INSERT INTO `region` VALUES ('3073', '贡觉县', '365', '3', '10', '0', '542123', '贡觉县');
INSERT INTO `region` VALUES ('3074', '类乌齐县', '365', '3', '10', '0', '542124', '类乌齐县');
INSERT INTO `region` VALUES ('3075', '丁青县', '365', '3', '10', '0', '542125', '丁青县');
INSERT INTO `region` VALUES ('3076', '察雅县', '365', '3', '10', '0', '542126', '察雅县');
INSERT INTO `region` VALUES ('3077', '八宿县', '365', '3', '10', '0', '542127', '八宿县');
INSERT INTO `region` VALUES ('3078', '左贡县', '365', '3', '10', '0', '542128', '左贡县');
INSERT INTO `region` VALUES ('3079', '芒康县', '365', '3', '10', '0', '542129', '芒康县');
INSERT INTO `region` VALUES ('3080', '洛隆县', '365', '3', '10', '0', '542132', '洛隆县');
INSERT INTO `region` VALUES ('3081', '边坝县', '365', '3', '10', '0', '542133', '边坝县');
INSERT INTO `region` VALUES ('3082', '噶尔县', '366', '3', '10', '0', '542523', '噶尔县');
INSERT INTO `region` VALUES ('3083', '普兰县', '366', '3', '10', '0', '542521', '普兰县');
INSERT INTO `region` VALUES ('3084', '札达县', '366', '3', '10', '0', '542522', '札达县');
INSERT INTO `region` VALUES ('3085', '日土县', '366', '3', '10', '0', '542524', '日土县');
INSERT INTO `region` VALUES ('3086', '革吉县', '366', '3', '10', '0', '542525', '革吉县');
INSERT INTO `region` VALUES ('3087', '改则县', '366', '3', '10', '0', '542526', '改则县');
INSERT INTO `region` VALUES ('3088', '措勤县', '366', '3', '10', '0', '542527', '措勤县');
INSERT INTO `region` VALUES ('3089', '城关区', '367', '3', '10', '0', '540102', '城关区');
INSERT INTO `region` VALUES ('3090', '林周县', '367', '3', '10', '0', '540121', '林周县');
INSERT INTO `region` VALUES ('3091', '当雄县', '367', '3', '10', '0', '540122', '当雄县');
INSERT INTO `region` VALUES ('3092', '尼木县', '367', '3', '10', '0', '540123', '尼木县');
INSERT INTO `region` VALUES ('3093', '曲水县', '367', '3', '10', '0', '540124', '曲水县');
INSERT INTO `region` VALUES ('3094', '堆龙德庆县', '367', '3', '10', '0', '540125', '堆龙德庆县');
INSERT INTO `region` VALUES ('3095', '达孜县', '367', '3', '10', '0', '540126', '达孜县');
INSERT INTO `region` VALUES ('3096', '墨竹工卡县', '367', '3', '10', '0', '540127', '墨竹工卡县');
INSERT INTO `region` VALUES ('3097', '西湖区', '368', '3', '10', '0', '330106', '西湖区');
INSERT INTO `region` VALUES ('3098', '上城区', '368', '3', '10', '0', '330102', '上城区');
INSERT INTO `region` VALUES ('3099', '下城区', '368', '3', '10', '0', '330103', '下城区');
INSERT INTO `region` VALUES ('3100', '拱墅区', '368', '3', '10', '0', '330105', '拱墅区');
INSERT INTO `region` VALUES ('3101', '滨江区', '368', '3', '10', '0', '330108', '滨江区');
INSERT INTO `region` VALUES ('3102', '江干区', '368', '3', '10', '0', '330104', '江干区');
INSERT INTO `region` VALUES ('3103', '萧山区', '368', '3', '10', '0', '330109', '萧山区');
INSERT INTO `region` VALUES ('3104', '余杭区', '368', '3', '10', '0', '330110', '余杭区');
INSERT INTO `region` VALUES ('3105', '市郊', '368', '3', '10', '0', '0', '市郊');
INSERT INTO `region` VALUES ('3106', '建德市', '368', '3', '10', '0', '330182', '建德市');
INSERT INTO `region` VALUES ('3107', '富阳市', '368', '3', '10', '0', '330183', '富阳市');
INSERT INTO `region` VALUES ('3108', '临安市', '368', '3', '10', '0', '330185', '临安市');
INSERT INTO `region` VALUES ('3109', '桐庐县', '368', '3', '10', '0', '330122', '桐庐县');
INSERT INTO `region` VALUES ('3110', '淳安县', '368', '3', '10', '0', '330127', '淳安县');
INSERT INTO `region` VALUES ('3111', '衢江区', '369', '3', '10', '0', '330803', '衢江区');
INSERT INTO `region` VALUES ('3112', '江山市', '369', '3', '10', '0', '330881', '江山市');
INSERT INTO `region` VALUES ('3113', '常山县', '369', '3', '10', '0', '330822', '常山县');
INSERT INTO `region` VALUES ('3114', '开化县', '369', '3', '10', '0', '330824', '开化县');
INSERT INTO `region` VALUES ('3115', '龙游县', '369', '3', '10', '0', '330825', '龙游县');
INSERT INTO `region` VALUES ('3116', '定海区', '370', '3', '10', '0', '330902', '定海区');
INSERT INTO `region` VALUES ('3117', '普陀区', '370', '3', '10', '0', '330903', '普陀区');
INSERT INTO `region` VALUES ('3118', '岱山县', '370', '3', '10', '0', '330921', '岱山县');
INSERT INTO `region` VALUES ('3119', '嵊泗县', '370', '3', '10', '0', '330922', '嵊泗县');
INSERT INTO `region` VALUES ('3120', '莲都区', '371', '3', '10', '0', '331102', '莲都区');
INSERT INTO `region` VALUES ('3121', '龙泉市', '371', '3', '10', '0', '331181', '龙泉市');
INSERT INTO `region` VALUES ('3122', '青田县', '371', '3', '10', '0', '331121', '青田县');
INSERT INTO `region` VALUES ('3123', '缙云县', '371', '3', '10', '0', '331122', '缙云县');
INSERT INTO `region` VALUES ('3124', '遂昌县', '371', '3', '10', '0', '331123', '遂昌县');
INSERT INTO `region` VALUES ('3125', '松阳县', '371', '3', '10', '0', '331124', '松阳县');
INSERT INTO `region` VALUES ('3126', '云和县', '371', '3', '10', '0', '331125', '云和县');
INSERT INTO `region` VALUES ('3127', '庆元县', '371', '3', '10', '0', '331126', '庆元县');
INSERT INTO `region` VALUES ('3128', '景宁', '371', '3', '10', '0', '331127', '景宁');
INSERT INTO `region` VALUES ('3129', '婺城区', '372', '3', '10', '0', '330702', '婺城区');
INSERT INTO `region` VALUES ('3130', '金东区', '372', '3', '10', '0', '330703', '金东区');
INSERT INTO `region` VALUES ('3131', '兰溪市', '372', '3', '10', '0', '330781', '兰溪市');
INSERT INTO `region` VALUES ('3132', '市区', '372', '3', '10', '0', '0', '市区');
INSERT INTO `region` VALUES ('3133', '佛堂镇', '372', '3', '10', '0', '0', '佛堂镇');
INSERT INTO `region` VALUES ('3134', '上溪镇', '372', '3', '10', '0', '0', '上溪镇');
INSERT INTO `region` VALUES ('3135', '义亭镇', '372', '3', '10', '0', '0', '义亭镇');
INSERT INTO `region` VALUES ('3136', '大陈镇', '372', '3', '10', '0', '0', '大陈镇');
INSERT INTO `region` VALUES ('3137', '苏溪镇', '372', '3', '10', '0', '0', '苏溪镇');
INSERT INTO `region` VALUES ('3138', '赤岸镇', '372', '3', '10', '0', '0', '赤岸镇');
INSERT INTO `region` VALUES ('3139', '东阳市', '372', '3', '10', '0', '330783', '东阳市');
INSERT INTO `region` VALUES ('3140', '永康市', '372', '3', '10', '0', '330784', '永康市');
INSERT INTO `region` VALUES ('3141', '武义县', '372', '3', '10', '0', '330723', '武义县');
INSERT INTO `region` VALUES ('3142', '浦江县', '372', '3', '10', '0', '330726', '浦江县');
INSERT INTO `region` VALUES ('3143', '磐安县', '372', '3', '10', '0', '330727', '磐安县');
INSERT INTO `region` VALUES ('3144', '南湖区', '373', '3', '10', '0', '330402', '南湖区');
INSERT INTO `region` VALUES ('3145', '秀洲区', '373', '3', '10', '0', '330411', '秀洲区');
INSERT INTO `region` VALUES ('3146', '海宁市', '373', '3', '10', '0', '330481', '海宁市');
INSERT INTO `region` VALUES ('3147', '嘉善县', '373', '3', '10', '0', '330421', '嘉善县');
INSERT INTO `region` VALUES ('3148', '平湖市', '373', '3', '10', '0', '330482', '平湖市');
INSERT INTO `region` VALUES ('3149', '桐乡市', '373', '3', '10', '0', '330483', '桐乡市');
INSERT INTO `region` VALUES ('3150', '海盐县', '373', '3', '10', '0', '330424', '海盐县');
INSERT INTO `region` VALUES ('3151', '吴兴区', '374', '3', '10', '0', '330502', '吴兴区');
INSERT INTO `region` VALUES ('3152', '南浔区', '374', '3', '10', '0', '330503', '南浔区');
INSERT INTO `region` VALUES ('3153', '德清县', '374', '3', '10', '0', '330521', '德清县');
INSERT INTO `region` VALUES ('3154', '长兴县', '374', '3', '10', '0', '330522', '长兴县');
INSERT INTO `region` VALUES ('3155', '安吉县', '374', '3', '10', '0', '330523', '安吉县');
INSERT INTO `region` VALUES ('3156', '鹿城区', '375', '3', '10', '0', '330302', '鹿城区');
INSERT INTO `region` VALUES ('3157', '龙湾区', '375', '3', '10', '0', '330303', '龙湾区');
INSERT INTO `region` VALUES ('3158', '瓯海区', '375', '3', '10', '0', '330304', '瓯海区');
INSERT INTO `region` VALUES ('3159', '瑞安市', '375', '3', '10', '0', '330381', '瑞安市');
INSERT INTO `region` VALUES ('3160', '乐清市', '375', '3', '10', '0', '330382', '乐清市');
INSERT INTO `region` VALUES ('3161', '洞头县', '375', '3', '10', '0', '330322', '洞头县');
INSERT INTO `region` VALUES ('3162', '永嘉县', '375', '3', '10', '0', '330324', '永嘉县');
INSERT INTO `region` VALUES ('3163', '平阳县', '375', '3', '10', '0', '330326', '平阳县');
INSERT INTO `region` VALUES ('3164', '苍南县', '375', '3', '10', '0', '330327', '苍南县');
INSERT INTO `region` VALUES ('3165', '文成县', '375', '3', '10', '0', '330328', '文成县');
INSERT INTO `region` VALUES ('3166', '泰顺县', '375', '3', '10', '0', '330329', '泰顺县');
INSERT INTO `region` VALUES ('3167', '椒江区', '376', '3', '10', '0', '331002', '椒江区');
INSERT INTO `region` VALUES ('3168', '黄岩区', '376', '3', '10', '0', '331003', '黄岩区');
INSERT INTO `region` VALUES ('3169', '路桥区', '376', '3', '10', '0', '331004', '路桥区');
INSERT INTO `region` VALUES ('3170', '温岭市', '376', '3', '10', '0', '331081', '温岭市');
INSERT INTO `region` VALUES ('3171', '临海市', '376', '3', '10', '0', '331082', '临海市');
INSERT INTO `region` VALUES ('3172', '玉环县', '376', '3', '10', '0', '331021', '玉环县');
INSERT INTO `region` VALUES ('3173', '三门县', '376', '3', '10', '0', '331022', '三门县');
INSERT INTO `region` VALUES ('3174', '天台县', '376', '3', '10', '0', '331023', '天台县');
INSERT INTO `region` VALUES ('3175', '仙居县', '376', '3', '10', '0', '331024', '仙居县');
INSERT INTO `region` VALUES ('3176', '越城区', '377', '3', '10', '0', '330602', '越城区');
INSERT INTO `region` VALUES ('3177', '上虞市', '377', '3', '10', '0', '330682', '上虞市');
INSERT INTO `region` VALUES ('3178', '嵊州市', '377', '3', '10', '0', '330683', '嵊州市');
INSERT INTO `region` VALUES ('3179', '绍兴县', '377', '3', '10', '0', '330621', '绍兴县');
INSERT INTO `region` VALUES ('3180', '新昌县', '377', '3', '10', '0', '330624', '新昌县');
INSERT INTO `region` VALUES ('3181', '诸暨市', '377', '3', '10', '0', '330681', '诸暨市');
INSERT INTO `region` VALUES ('3182', '海曙区', '378', '3', '10', '0', '330203', '海曙区');
INSERT INTO `region` VALUES ('3183', '江东区', '378', '3', '10', '0', '330204', '江东区');
INSERT INTO `region` VALUES ('3184', '江北区', '378', '3', '10', '0', '330205', '江北区');
INSERT INTO `region` VALUES ('3185', '镇海区', '378', '3', '10', '0', '330211', '镇海区');
INSERT INTO `region` VALUES ('3186', '北仑区', '378', '3', '10', '0', '330206', '北仑区');
INSERT INTO `region` VALUES ('3187', '鄞州区', '378', '3', '10', '0', '330212', '鄞州区');
INSERT INTO `region` VALUES ('3188', '余姚市', '378', '3', '10', '0', '330281', '余姚市');
INSERT INTO `region` VALUES ('3189', '慈溪市', '378', '3', '10', '0', '330282', '慈溪市');
INSERT INTO `region` VALUES ('3190', '奉化市', '378', '3', '10', '0', '330283', '奉化市');
INSERT INTO `region` VALUES ('3191', '象山县', '378', '3', '10', '0', '330225', '象山县');
INSERT INTO `region` VALUES ('3192', '宁海县', '378', '3', '10', '0', '330226', '宁海县');
INSERT INTO `region` VALUES ('3193', '大理市', '379', '3', '10', '0', '532901', '大理市');
INSERT INTO `region` VALUES ('3194', '祥云县', '379', '3', '10', '0', '532923', '祥云县');
INSERT INTO `region` VALUES ('3195', '宾川县', '379', '3', '10', '0', '532924', '宾川县');
INSERT INTO `region` VALUES ('3196', '弥渡县', '379', '3', '10', '0', '532925', '弥渡县');
INSERT INTO `region` VALUES ('3197', '永平县', '379', '3', '10', '0', '532928', '永平县');
INSERT INTO `region` VALUES ('3198', '云龙县', '379', '3', '10', '0', '532929', '云龙县');
INSERT INTO `region` VALUES ('3199', '洱源县', '379', '3', '10', '0', '532930', '洱源县');
INSERT INTO `region` VALUES ('3200', '剑川县', '379', '3', '10', '0', '532931', '剑川县');
INSERT INTO `region` VALUES ('3201', '鹤庆县', '379', '3', '10', '0', '532932', '鹤庆县');
INSERT INTO `region` VALUES ('3202', '漾濞', '379', '3', '10', '0', '532922', '漾濞');
INSERT INTO `region` VALUES ('3203', '南涧', '379', '3', '10', '0', '532926', '南涧');
INSERT INTO `region` VALUES ('3204', '巍山', '379', '3', '10', '0', '532927', '巍山');
INSERT INTO `region` VALUES ('3205', '楚雄市', '380', '3', '10', '0', '532301', '楚雄市');
INSERT INTO `region` VALUES ('3206', '双柏县', '380', '3', '10', '0', '532322', '双柏县');
INSERT INTO `region` VALUES ('3207', '牟定县', '380', '3', '10', '0', '532323', '牟定县');
INSERT INTO `region` VALUES ('3208', '南华县', '380', '3', '10', '0', '532324', '南华县');
INSERT INTO `region` VALUES ('3209', '姚安县', '380', '3', '10', '0', '532325', '姚安县');
INSERT INTO `region` VALUES ('3210', '大姚县', '380', '3', '10', '0', '532326', '大姚县');
INSERT INTO `region` VALUES ('3211', '永仁县', '380', '3', '10', '0', '532327', '永仁县');
INSERT INTO `region` VALUES ('3212', '元谋县', '380', '3', '10', '0', '532328', '元谋县');
INSERT INTO `region` VALUES ('3213', '武定县', '380', '3', '10', '0', '532329', '武定县');
INSERT INTO `region` VALUES ('3214', '禄丰县', '380', '3', '10', '0', '532331', '禄丰县');
INSERT INTO `region` VALUES ('3215', '香格里拉县', '381', '3', '10', '0', '533421', '香格里拉县');
INSERT INTO `region` VALUES ('3216', '德钦县', '381', '3', '10', '0', '533422', '德钦县');
INSERT INTO `region` VALUES ('3217', '维西', '381', '3', '10', '0', '533423', '维西');
INSERT INTO `region` VALUES ('3218', '潞西市', '382', '3', '10', '0', '0', '潞西市');
INSERT INTO `region` VALUES ('3219', '瑞丽市', '382', '3', '10', '0', '533102', '瑞丽市');
INSERT INTO `region` VALUES ('3220', '梁河县', '382', '3', '10', '0', '533122', '梁河县');
INSERT INTO `region` VALUES ('3221', '盈江县', '382', '3', '10', '0', '533123', '盈江县');
INSERT INTO `region` VALUES ('3222', '陇川县', '382', '3', '10', '0', '533124', '陇川县');
INSERT INTO `region` VALUES ('3223', '宁洱', '383', '3', '10', '0', '530821', '宁洱');
INSERT INTO `region` VALUES ('3224', '思茅区', '383', '3', '10', '0', '530802', '思茅区');
INSERT INTO `region` VALUES ('3225', '墨江', '383', '3', '10', '0', '530822', '墨江');
INSERT INTO `region` VALUES ('3226', '景东', '383', '3', '10', '0', '530823', '景东');
INSERT INTO `region` VALUES ('3227', '景谷', '383', '3', '10', '0', '530824', '景谷');
INSERT INTO `region` VALUES ('3228', '镇沅', '383', '3', '10', '0', '530825', '镇沅');
INSERT INTO `region` VALUES ('3229', '江城', '383', '3', '10', '0', '530826', '江城');
INSERT INTO `region` VALUES ('3230', '孟连', '383', '3', '10', '0', '530827', '孟连');
INSERT INTO `region` VALUES ('3231', '澜沧', '383', '3', '10', '0', '530828', '澜沧');
INSERT INTO `region` VALUES ('3232', '西盟', '383', '3', '10', '0', '530829', '西盟');
INSERT INTO `region` VALUES ('3233', '兰坪', '384', '3', '10', '0', '533325', '兰坪');
INSERT INTO `region` VALUES ('3234', '泸水县', '384', '3', '10', '0', '533321', '泸水县');
INSERT INTO `region` VALUES ('3235', '福贡县', '384', '3', '10', '0', '533323', '福贡县');
INSERT INTO `region` VALUES ('3236', '贡山', '384', '3', '10', '0', '533324', '贡山');
INSERT INTO `region` VALUES ('3237', '隆阳区', '385', '3', '10', '0', '530502', '隆阳区');
INSERT INTO `region` VALUES ('3238', '施甸县', '385', '3', '10', '0', '530521', '施甸县');
INSERT INTO `region` VALUES ('3239', '腾冲县', '385', '3', '10', '0', '530522', '腾冲县');
INSERT INTO `region` VALUES ('3240', '龙陵县', '385', '3', '10', '0', '530523', '龙陵县');
INSERT INTO `region` VALUES ('3241', '昌宁县', '385', '3', '10', '0', '530524', '昌宁县');
INSERT INTO `region` VALUES ('3242', '古城区', '386', '3', '10', '0', '530702', '古城区');
INSERT INTO `region` VALUES ('3243', '宁蒗', '386', '3', '10', '0', '530724', '宁蒗');
INSERT INTO `region` VALUES ('3244', '玉龙', '386', '3', '10', '0', '530721', '玉龙');
INSERT INTO `region` VALUES ('3245', '永胜县', '386', '3', '10', '0', '530722', '永胜县');
INSERT INTO `region` VALUES ('3246', '华坪县', '386', '3', '10', '0', '530723', '华坪县');
INSERT INTO `region` VALUES ('3247', '红塔区', '387', '3', '10', '0', '530402', '红塔区');
INSERT INTO `region` VALUES ('3248', '江川县', '387', '3', '10', '0', '530421', '江川县');
INSERT INTO `region` VALUES ('3249', '澄江县', '387', '3', '10', '0', '530422', '澄江县');
INSERT INTO `region` VALUES ('3250', '通海县', '387', '3', '10', '0', '530423', '通海县');
INSERT INTO `region` VALUES ('3251', '华宁县', '387', '3', '10', '0', '530424', '华宁县');
INSERT INTO `region` VALUES ('3252', '易门县', '387', '3', '10', '0', '530425', '易门县');
INSERT INTO `region` VALUES ('3253', '峨山', '387', '3', '10', '0', '530426', '峨山');
INSERT INTO `region` VALUES ('3254', '新平', '387', '3', '10', '0', '530427', '新平');
INSERT INTO `region` VALUES ('3255', '元江', '387', '3', '10', '0', '530428', '元江');
INSERT INTO `region` VALUES ('3256', '景洪市', '388', '3', '10', '0', '532801', '景洪市');
INSERT INTO `region` VALUES ('3257', '勐海县', '388', '3', '10', '0', '532822', '勐海县');
INSERT INTO `region` VALUES ('3258', '勐腊县', '388', '3', '10', '0', '532823', '勐腊县');
INSERT INTO `region` VALUES ('3259', '昭阳区', '389', '3', '10', '0', '530602', '昭阳区');
INSERT INTO `region` VALUES ('3260', '鲁甸县', '389', '3', '10', '0', '530621', '鲁甸县');
INSERT INTO `region` VALUES ('3261', '巧家县', '389', '3', '10', '0', '530622', '巧家县');
INSERT INTO `region` VALUES ('3262', '盐津县', '389', '3', '10', '0', '530623', '盐津县');
INSERT INTO `region` VALUES ('3263', '大关县', '389', '3', '10', '0', '530624', '大关县');
INSERT INTO `region` VALUES ('3264', '永善县', '389', '3', '10', '0', '530625', '永善县');
INSERT INTO `region` VALUES ('3265', '绥江县', '389', '3', '10', '0', '530626', '绥江县');
INSERT INTO `region` VALUES ('3266', '镇雄县', '389', '3', '10', '0', '530627', '镇雄县');
INSERT INTO `region` VALUES ('3267', '彝良县', '389', '3', '10', '0', '530628', '彝良县');
INSERT INTO `region` VALUES ('3268', '威信县', '389', '3', '10', '0', '530629', '威信县');
INSERT INTO `region` VALUES ('3269', '水富县', '389', '3', '10', '0', '530630', '水富县');
INSERT INTO `region` VALUES ('3270', '临翔区', '390', '3', '10', '0', '530902', '临翔区');
INSERT INTO `region` VALUES ('3271', '凤庆县', '390', '3', '10', '0', '530921', '凤庆县');
INSERT INTO `region` VALUES ('3272', '云县', '390', '3', '10', '0', '530922', '云县');
INSERT INTO `region` VALUES ('3273', '永德县', '390', '3', '10', '0', '530923', '永德县');
INSERT INTO `region` VALUES ('3274', '镇康县', '390', '3', '10', '0', '530924', '镇康县');
INSERT INTO `region` VALUES ('3275', '双江', '390', '3', '10', '0', '530925', '双江');
INSERT INTO `region` VALUES ('3276', '耿马', '390', '3', '10', '0', '530926', '耿马');
INSERT INTO `region` VALUES ('3277', '沧源', '390', '3', '10', '0', '530927', '沧源');
INSERT INTO `region` VALUES ('3278', '泸西县', '391', '3', '10', '0', '532527', '泸西县');
INSERT INTO `region` VALUES ('3279', '蒙自县', '391', '3', '10', '0', '532503', '蒙自县');
INSERT INTO `region` VALUES ('3280', '个旧市', '391', '3', '10', '0', '532501', '个旧市');
INSERT INTO `region` VALUES ('3281', '开远市', '391', '3', '10', '0', '532502', '开远市');
INSERT INTO `region` VALUES ('3282', '绿春县', '391', '3', '10', '0', '532531', '绿春县');
INSERT INTO `region` VALUES ('3283', '建水县', '391', '3', '10', '0', '532524', '建水县');
INSERT INTO `region` VALUES ('3284', '石屏县', '391', '3', '10', '0', '532525', '石屏县');
INSERT INTO `region` VALUES ('3285', '弥勒县', '391', '3', '10', '0', '532504', '弥勒县');
INSERT INTO `region` VALUES ('3286', '元阳县', '391', '3', '10', '0', '532528', '元阳县');
INSERT INTO `region` VALUES ('3287', '红河县', '391', '3', '10', '0', '532529', '红河县');
INSERT INTO `region` VALUES ('3288', '金平', '391', '3', '10', '0', '532530', '金平');
INSERT INTO `region` VALUES ('3289', '河口', '391', '3', '10', '0', '532532', '河口');
INSERT INTO `region` VALUES ('3290', '屏边', '391', '3', '10', '0', '532523', '屏边');
INSERT INTO `region` VALUES ('3291', '文山县', '392', '3', '10', '0', '532601', '文山县');
INSERT INTO `region` VALUES ('3292', '砚山县', '392', '3', '10', '0', '532622', '砚山县');
INSERT INTO `region` VALUES ('3293', '西畴县', '392', '3', '10', '0', '532623', '西畴县');
INSERT INTO `region` VALUES ('3294', '麻栗坡县', '392', '3', '10', '0', '532624', '麻栗坡县');
INSERT INTO `region` VALUES ('3295', '马关县', '392', '3', '10', '0', '532625', '马关县');
INSERT INTO `region` VALUES ('3296', '丘北县', '392', '3', '10', '0', '532626', '丘北县');
INSERT INTO `region` VALUES ('3297', '广南县', '392', '3', '10', '0', '532627', '广南县');
INSERT INTO `region` VALUES ('3298', '富宁县', '392', '3', '10', '0', '532628', '富宁县');
INSERT INTO `region` VALUES ('3299', '麒麟区', '393', '3', '10', '0', '530302', '麒麟区');
INSERT INTO `region` VALUES ('3300', '宣威市', '393', '3', '10', '0', '530381', '宣威市');
INSERT INTO `region` VALUES ('3301', '马龙县', '393', '3', '10', '0', '530321', '马龙县');
INSERT INTO `region` VALUES ('3302', '陆良县', '393', '3', '10', '0', '530322', '陆良县');
INSERT INTO `region` VALUES ('3303', '师宗县', '393', '3', '10', '0', '530323', '师宗县');
INSERT INTO `region` VALUES ('3304', '罗平县', '393', '3', '10', '0', '530324', '罗平县');
INSERT INTO `region` VALUES ('3305', '富源县', '393', '3', '10', '0', '530325', '富源县');
INSERT INTO `region` VALUES ('3306', '会泽县', '393', '3', '10', '0', '530326', '会泽县');
INSERT INTO `region` VALUES ('3307', '沾益县', '393', '3', '10', '0', '530328', '沾益县');
INSERT INTO `region` VALUES ('3308', '盘龙区', '394', '3', '10', '0', '530103', '盘龙区');
INSERT INTO `region` VALUES ('3309', '五华区', '394', '3', '10', '0', '530102', '五华区');
INSERT INTO `region` VALUES ('3310', '官渡区', '394', '3', '10', '0', '530111', '官渡区');
INSERT INTO `region` VALUES ('3311', '西山区', '394', '3', '10', '0', '530112', '西山区');
INSERT INTO `region` VALUES ('3312', '东川区', '394', '3', '10', '0', '530113', '东川区');
INSERT INTO `region` VALUES ('3313', '安宁市', '394', '3', '10', '0', '530181', '安宁市');
INSERT INTO `region` VALUES ('3314', '呈贡县', '394', '3', '10', '0', '530114', '呈贡县');
INSERT INTO `region` VALUES ('3315', '晋宁县', '394', '3', '10', '0', '530122', '晋宁县');
INSERT INTO `region` VALUES ('3316', '富民县', '394', '3', '10', '0', '530124', '富民县');
INSERT INTO `region` VALUES ('3317', '宜良县', '394', '3', '10', '0', '530125', '宜良县');
INSERT INTO `region` VALUES ('3318', '嵩明县', '394', '3', '10', '0', '530127', '嵩明县');
INSERT INTO `region` VALUES ('3319', '石林县', '394', '3', '10', '0', '530126', '石林县');
INSERT INTO `region` VALUES ('3320', '禄劝', '394', '3', '10', '0', '530128', '禄劝');
INSERT INTO `region` VALUES ('3321', '寻甸', '394', '3', '10', '0', '530129', '寻甸');
INSERT INTO `region` VALUES ('3322', '澳门', '395', '3', '10', '0', '0', '澳门');
INSERT INTO `region` VALUES ('3323', '台北', '396', '3', '10', '0', '0', '台北');
INSERT INTO `region` VALUES ('3324', '高雄', '396', '3', '10', '0', '0', '高雄');
INSERT INTO `region` VALUES ('3325', '基隆', '396', '3', '10', '0', '0', '基隆');
INSERT INTO `region` VALUES ('3326', '台中', '396', '3', '10', '0', '0', '台中');
INSERT INTO `region` VALUES ('3327', '台南', '396', '3', '10', '0', '0', '台南');
INSERT INTO `region` VALUES ('3328', '新竹', '396', '3', '10', '0', '0', '新竹');
INSERT INTO `region` VALUES ('3329', '嘉义', '396', '3', '10', '0', '0', '嘉义');
INSERT INTO `region` VALUES ('3330', '宜兰县', '396', '3', '10', '0', '0', '宜兰县');
INSERT INTO `region` VALUES ('3331', '桃园县', '396', '3', '10', '0', '0', '桃园县');
INSERT INTO `region` VALUES ('3332', '苗栗县', '396', '3', '10', '0', '0', '苗栗县');
INSERT INTO `region` VALUES ('3333', '彰化县', '396', '3', '10', '0', '0', '彰化县');
INSERT INTO `region` VALUES ('3334', '南投县', '396', '3', '10', '0', '0', '南投县');
INSERT INTO `region` VALUES ('3335', '云林县', '396', '3', '10', '0', '0', '云林县');
INSERT INTO `region` VALUES ('3336', '屏东县', '396', '3', '10', '0', '0', '屏东县');
INSERT INTO `region` VALUES ('3337', '台东县', '396', '3', '10', '0', '0', '台东县');
INSERT INTO `region` VALUES ('3338', '花莲县', '396', '3', '10', '0', '0', '花莲县');
INSERT INTO `region` VALUES ('3339', '澎湖县', '396', '3', '10', '0', '0', '澎湖县');
INSERT INTO `region` VALUES ('3340', '合川区', '397', '3', '10', '0', '500117', '合川区');
INSERT INTO `region` VALUES ('3341', '江津区', '397', '3', '10', '0', '500116', '江津区');
INSERT INTO `region` VALUES ('3342', '南川区', '397', '3', '10', '0', '500119', '南川区');
INSERT INTO `region` VALUES ('3343', '永川区', '397', '3', '10', '0', '500118', '永川区');
INSERT INTO `region` VALUES ('3344', '南岸区', '397', '3', '10', '0', '500108', '南岸区');
INSERT INTO `region` VALUES ('3345', '渝北区', '397', '3', '10', '0', '500112', '渝北区');
INSERT INTO `region` VALUES ('3346', '万盛区', '397', '3', '10', '0', '0', '万盛区');
INSERT INTO `region` VALUES ('3347', '大渡口区', '397', '3', '10', '0', '500104', '大渡口区');
INSERT INTO `region` VALUES ('3348', '万州区', '397', '3', '10', '0', '500101', '万州区');
INSERT INTO `region` VALUES ('3349', '北碚区', '397', '3', '10', '0', '500109', '北碚区');
INSERT INTO `region` VALUES ('3350', '沙坪坝区', '397', '3', '10', '0', '500106', '沙坪坝区');
INSERT INTO `region` VALUES ('3351', '巴南区', '397', '3', '10', '0', '500113', '巴南区');
INSERT INTO `region` VALUES ('3352', '涪陵区', '397', '3', '10', '0', '500102', '涪陵区');
INSERT INTO `region` VALUES ('3353', '江北区', '397', '3', '10', '0', '500105', '江北区');
INSERT INTO `region` VALUES ('3354', '九龙坡区', '397', '3', '10', '0', '500107', '九龙坡区');
INSERT INTO `region` VALUES ('3355', '渝中区', '397', '3', '10', '0', '500103', '渝中区');
INSERT INTO `region` VALUES ('3356', '黔江开发区', '397', '3', '10', '0', '0', '黔江开发区');
INSERT INTO `region` VALUES ('3357', '长寿区', '397', '3', '10', '0', '500115', '长寿区');
INSERT INTO `region` VALUES ('3358', '双桥区', '397', '3', '10', '0', '0', '双桥区');
INSERT INTO `region` VALUES ('3359', '綦江县', '397', '3', '10', '0', '500110', '綦江县');
INSERT INTO `region` VALUES ('3360', '潼南县', '397', '3', '10', '0', '500223', '潼南县');
INSERT INTO `region` VALUES ('3361', '铜梁县', '397', '3', '10', '0', '500224', '铜梁县');
INSERT INTO `region` VALUES ('3362', '大足县', '397', '3', '10', '0', '500111', '大足县');
INSERT INTO `region` VALUES ('3363', '荣昌县', '397', '3', '10', '0', '500226', '荣昌县');
INSERT INTO `region` VALUES ('3364', '璧山县', '397', '3', '10', '0', '500227', '璧山县');
INSERT INTO `region` VALUES ('3365', '垫江县', '397', '3', '10', '0', '500231', '垫江县');
INSERT INTO `region` VALUES ('3366', '武隆县', '397', '3', '10', '0', '500232', '武隆县');
INSERT INTO `region` VALUES ('3367', '丰都县', '397', '3', '10', '0', '500230', '丰都县');
INSERT INTO `region` VALUES ('3368', '城口县', '397', '3', '10', '0', '500229', '城口县');
INSERT INTO `region` VALUES ('3369', '梁平县', '397', '3', '10', '0', '500228', '梁平县');
INSERT INTO `region` VALUES ('3370', '开县', '397', '3', '10', '0', '500234', '开县');
INSERT INTO `region` VALUES ('3371', '巫溪县', '397', '3', '10', '0', '500238', '巫溪县');
INSERT INTO `region` VALUES ('3372', '巫山县', '397', '3', '10', '0', '500237', '巫山县');
INSERT INTO `region` VALUES ('3373', '奉节县', '397', '3', '10', '0', '500236', '奉节县');
INSERT INTO `region` VALUES ('3374', '云阳县', '397', '3', '10', '0', '500235', '云阳县');
INSERT INTO `region` VALUES ('3375', '忠县', '397', '3', '10', '0', '500233', '忠县');
INSERT INTO `region` VALUES ('3376', '石柱', '397', '3', '10', '0', '500240', '石柱');
INSERT INTO `region` VALUES ('3377', '彭水', '397', '3', '10', '0', '500243', '彭水');
INSERT INTO `region` VALUES ('3378', '酉阳', '397', '3', '10', '0', '500242', '酉阳');
INSERT INTO `region` VALUES ('3379', '秀山', '397', '3', '10', '0', '500241', '秀山');
INSERT INTO `region` VALUES ('3380', '沙田区', '398', '3', '10', '0', '0', '沙田区');
INSERT INTO `region` VALUES ('3381', '东区', '398', '3', '10', '0', '0', '东区');
INSERT INTO `region` VALUES ('3382', '观塘区', '398', '3', '10', '0', '0', '观塘区');
INSERT INTO `region` VALUES ('3383', '黄大仙区', '398', '3', '10', '0', '0', '黄大仙区');
INSERT INTO `region` VALUES ('3384', '九龙城区', '398', '3', '10', '0', '0', '九龙城区');
INSERT INTO `region` VALUES ('3385', '屯门区', '398', '3', '10', '0', '0', '屯门区');
INSERT INTO `region` VALUES ('3386', '葵青区', '398', '3', '10', '0', '0', '葵青区');
INSERT INTO `region` VALUES ('3387', '元朗区', '398', '3', '10', '0', '0', '元朗区');
INSERT INTO `region` VALUES ('3388', '深水埗区', '398', '3', '10', '0', '0', '深水埗区');
INSERT INTO `region` VALUES ('3389', '西贡区', '398', '3', '10', '0', '0', '西贡区');
INSERT INTO `region` VALUES ('3390', '大埔区', '398', '3', '10', '0', '0', '大埔区');
INSERT INTO `region` VALUES ('3391', '湾仔区', '398', '3', '10', '0', '0', '湾仔区');
INSERT INTO `region` VALUES ('3392', '油尖旺区', '398', '3', '10', '0', '0', '油尖旺区');
INSERT INTO `region` VALUES ('3393', '北区', '398', '3', '10', '0', '0', '北区');
INSERT INTO `region` VALUES ('3394', '南区', '398', '3', '10', '0', '0', '南区');
INSERT INTO `region` VALUES ('3395', '荃湾区', '398', '3', '10', '0', '0', '荃湾区');
INSERT INTO `region` VALUES ('3396', '中西区', '398', '3', '10', '0', '0', '中西区');
INSERT INTO `region` VALUES ('3397', '离岛区', '398', '3', '10', '0', '0', '离岛区');
INSERT INTO `region` VALUES ('3399', '省直辖行政单位', '9', '2', '10', '0', '469000', '省直辖行政单位');
INSERT INTO `region` VALUES ('3401', '襄阳', '13', '2', '10', '0', '420600', '襄阳市');
INSERT INTO `region` VALUES ('3403', '襄城区', '3401', '3', '10', '0', '420602', '襄城区');
INSERT INTO `region` VALUES ('3405', '樊城区', '3401', '3', '10', '0', '420606', '樊城区');
INSERT INTO `region` VALUES ('3407', '襄州区', '3401', '3', '10', '0', '420607', '襄州区');
INSERT INTO `region` VALUES ('3409', '南漳县', '3401', '3', '10', '0', '420624', '南漳县');
INSERT INTO `region` VALUES ('3411', '谷城县', '3401', '3', '10', '0', '420625', '谷城县');
INSERT INTO `region` VALUES ('3413', '保康县', '3401', '3', '10', '0', '420626', '保康县');
INSERT INTO `region` VALUES ('3415', '老河口市', '3401', '3', '10', '0', '420682', '老河口市');
INSERT INTO `region` VALUES ('3417', '枣阳市', '3401', '3', '10', '0', '420683', '枣阳市');
INSERT INTO `region` VALUES ('3419', '宜城市', '3401', '3', '10', '0', '420684', '宜城市');
INSERT INTO `region` VALUES ('3420', '自治区直辖县级行政区划', '28', '2', '10', '0', '659000', '自治区直辖县级行政区划');
INSERT INTO `region` VALUES ('3423', '定安县', '132', '3', '10', '0', '469021', '定安县');
INSERT INTO `region` VALUES ('3425', '塔城', '28', '2', '10', '0', '654200', '塔城地区');
INSERT INTO `region` VALUES ('3426', '柯城区', '369', '3', '10', '0', '330802', '柯城区');
INSERT INTO `region` VALUES ('3427', '阿勒泰', '28', '2', '10', '0', '654300', '阿勒泰地区');
INSERT INTO `region` VALUES ('3429', '市辖区', '137', '3', '10', '0', '0', '市辖区');
INSERT INTO `region` VALUES ('3431', '海棠区', '137', '3', '10', '0', '460202', '海棠区');
INSERT INTO `region` VALUES ('3433', '吉阳区', '137', '3', '10', '0', '460203', '吉阳区');
INSERT INTO `region` VALUES ('3435', '天涯区', '137', '3', '10', '0', '460204', '天涯区');
INSERT INTO `region` VALUES ('3437', '崖州区', '137', '3', '10', '0', '460205', '崖州区');
INSERT INTO `region` VALUES ('3439', '滨海新区', '323', '3', '10', '0', '120116', '滨海新区');
INSERT INTO `region` VALUES ('3441', '省直辖县级行政区划', '13', '2', '10', '0', '429000', '省直辖县级行政区划');
INSERT INTO `region` VALUES ('3443', '市辖区', '242', '3', '10', '0', '320501', '市辖区');
INSERT INTO `region` VALUES ('3445', '姑苏区', '242', '3', '10', '0', '320508', '姑苏区');
INSERT INTO `region` VALUES ('3447', '昆山市', '242', '3', '10', '0', '320583', '昆山市');
INSERT INTO `region` VALUES ('3449', '义乌', '372', '3', '10', '0', '1', '义乌');
INSERT INTO `region` VALUES ('3451', '新吴区', '243', '3', '10', '0', '320283', '新吴区');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `role_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_code` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '角色编码',
  `sys_code` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'ç³»ç»Ÿç¼–ç ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0 启用 -1 删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unqi_role` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='è§’è‰²è¡¨';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('16', '管理员', 'admin', 'saas', '2017-09-13 17:34:34', '2017-09-13 17:34:34', '0');

-- ----------------------------
-- Table structure for `role_menu_ref`
-- ----------------------------
DROP TABLE IF EXISTS `role_menu_ref`;
CREATE TABLE `role_menu_ref` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `role_code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '角色编码',
  `menu_code` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '菜单编码',
  `sys_code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '系统编码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_role_menu` (`role_code`,`menu_code`,`sys_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58504 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of role_menu_ref
-- ----------------------------
INSERT INTO `role_menu_ref` VALUES ('58493', 'admin', 'm_home', 'pf', '2019-07-26 13:01:55', '2019-07-26 13:02:49');
INSERT INTO `role_menu_ref` VALUES ('58494', 'admin', 'm_auth_mgr', 'pf', '2019-07-26 13:02:00', '2019-07-26 13:02:49');
INSERT INTO `role_menu_ref` VALUES ('58495', 'admin', 'm_shop_mgr', 'pf', '2019-07-26 13:02:15', '2019-07-26 13:02:50');
INSERT INTO `role_menu_ref` VALUES ('58496', 'admin', 'm_shop_list', 'pf', '2019-07-26 13:02:18', '2019-07-26 13:02:50');
INSERT INTO `role_menu_ref` VALUES ('58497', 'admin', 'm_order_mgr', 'pf', '2019-07-26 13:02:28', '2019-07-26 13:02:51');
INSERT INTO `role_menu_ref` VALUES ('58498', 'admin', 'm_order_list', 'pf', '2019-07-26 13:02:33', '2019-07-26 13:02:51');
INSERT INTO `role_menu_ref` VALUES ('58499', 'admin', 'm_pfuser_list', 'pf', '2019-07-26 13:02:35', '2019-07-26 13:02:53');
INSERT INTO `role_menu_ref` VALUES ('58500', 'admin', 'm_goods_mgr', 'pf', '2019-09-14 13:41:44', '2019-09-14 13:41:44');
INSERT INTO `role_menu_ref` VALUES ('58501', 'admin', 'm_goods_list', 'pf', '2019-09-14 13:41:57', '2019-09-14 13:41:57');
INSERT INTO `role_menu_ref` VALUES ('58502', 'admin', 'm_goods_add', 'pf', '2019-09-14 13:42:04', '2019-09-14 13:42:09');
INSERT INTO `role_menu_ref` VALUES ('58503', 'admin', 'm_role_list', 'pf', '2019-09-17 17:30:08', '2019-09-17 17:30:08');

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '店铺名',
  `license_no` varchar(30) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '营业执照',
  `province_id` int(11) NOT NULL DEFAULT '0' COMMENT '省份id',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `pf_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '平台用户id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0：审核中 ；1： 有效；-1：无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logo_url` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '店铺logo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '商城', '1231241', '0', '0', '1', '0', '2019-07-03 12:52:31', '2019-07-18 21:42:16', '');
INSERT INTO `shop` VALUES ('2', '测试2店', 'sdfsdf', '0', '36', '2', '0', '2019-07-18 21:42:14', '2019-07-19 17:16:53', '');
INSERT INTO `shop` VALUES ('3', '测试3店', 't3', '0', '36', '3', '0', '2019-07-19 17:17:13', '2019-07-19 17:18:59', '');
INSERT INTO `shop` VALUES ('4', '测试4店', 't4', '0', '36', '4', '0', '2019-07-19 17:17:29', '2019-07-19 17:19:00', '');
INSERT INTO `shop` VALUES ('5', '测试5店', 't5', '0', '36', '5', '0', '2019-07-19 17:17:44', '2019-07-19 17:19:00', '');
INSERT INTO `shop` VALUES ('6', '测试6店', 't6', '0', '36', '6', '0', '2019-07-19 17:17:53', '2019-07-19 17:19:02', '');
INSERT INTO `shop` VALUES ('7', '测试7店', 't7', '0', '36', '7', '0', '2019-07-19 17:18:06', '2019-07-19 17:19:02', '');
INSERT INTO `shop` VALUES ('8', '测试8店', 't8', '0', '36', '8', '0', '2019-07-19 17:18:13', '2019-07-19 17:19:03', '');
INSERT INTO `shop` VALUES ('9', '测试9店', 't9', '0', '36', '9', '0', '2019-07-19 17:18:24', '2019-07-19 17:19:04', '');
INSERT INTO `shop` VALUES ('10', '测试10店', 't10', '0', '36', '10', '0', '2019-07-19 17:18:34', '2019-07-19 17:19:06', '');
INSERT INTO `shop` VALUES ('11', '测试11店', 't11', '0', '36', '0', '0', '2019-07-19 17:19:23', '2019-07-19 17:19:23', '');

-- ----------------------------
-- Table structure for `shop_account`
-- ----------------------------
DROP TABLE IF EXISTS `shop_account`;
CREATE TABLE `shop_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 有效 -1 无效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of shop_account
-- ----------------------------

-- ----------------------------
-- Table structure for `shop_trade_record`
-- ----------------------------
DROP TABLE IF EXISTS `shop_trade_record`;
CREATE TABLE `shop_trade_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL DEFAULT '0' COMMENT '支出账户id',
  `target_id` int(11) NOT NULL DEFAULT '0' COMMENT '转入账户id',
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '交易金额',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 交易中 1 成功 2 失败',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of shop_trade_record
-- ----------------------------

-- ----------------------------
-- Table structure for `system`
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '系统编码',
  `sys_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '系统名称',
  `sys_desc` varchar(50) DEFAULT NULL COMMENT '系统描述',
  `sys_domain` varchar(255) DEFAULT NULL,
  `pf_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '平台',
  `status` tinyint(4) NOT NULL COMMENT '状态 0可用 1已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index` (`sys_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('1', 'cheyigou', '开心汽车', '开心汽车', 'http://www.kaixin.com', 'cheyigou', '1', '2017-09-12 09:09:28', '2018-03-05 10:58:54');
INSERT INTO `system` VALUES ('2', 'oc_saas_center', '二手车销售运营中心', '二手车销售运营中心', 'http://platform.d.renrenauto.com', 'oc_saas_center', '0', '2017-10-12 11:47:34', '2018-03-12 16:57:30');
INSERT INTO `system` VALUES ('3', 'oc_market_center', '汽车售后服务运营中心', '汽车售后服务运营中心', 'http://service.d.renrenauto.com', 'oc_market_center', '0', '2017-12-07 17:54:00', '2018-05-16 17:25:14');
INSERT INTO `system` VALUES ('4', 'oc_cpc_center', 'JV车商', 'JV车商', 'http://jvapp.renrenauto.com', 'oc_cpc_center', '0', '2017-11-07 15:27:13', '2018-05-16 17:22:07');
INSERT INTO `system` VALUES ('5', 'approval_center', '风控作业中心', '风控作业中心', 'http://approval.51fenqi.com', 'approval_center', '0', '2017-09-22 18:17:54', '2018-05-16 18:17:57');
INSERT INTO `system` VALUES ('6', 'renren_market', '售后服务平台', '售后服务平台', 'http://service.renren.auto.com', 'renren_market', '1', '2017-11-29 19:43:17', '2018-03-09 18:33:31');
INSERT INTO `system` VALUES ('8', 'oc_kaixin_car', '开心汽车运营中心', '开心汽车运营中心', 'http://platform.d.che360.com', 'oc_saas_center', '0', '2018-01-11 11:46:34', '2018-03-09 18:31:25');
INSERT INTO `system` VALUES ('9', 'oc_custom_service', '客服系统', '客服系统', 'http://kf.renrenauto.com', 'oc_kaixin_car', '0', '2018-01-31 11:20:29', '2018-05-16 17:59:59');
INSERT INTO `system` VALUES ('14', 'core_asm_center', '核心交易平台', '核心交易平台', 'http://ams.51fenqi.com', 'core_manager', '0', '2018-03-09 11:31:38', '2018-05-16 18:52:58');
INSERT INTO `system` VALUES ('15', 'core_abs_center', 'ABS资产证券化系统', 'ABS资产证券化系统', 'http://abs.51fenqi.com', 'core_manager', '0', '2018-03-09 11:32:18', '2018-05-16 18:52:58');
INSERT INTO `system` VALUES ('16', 'bda', '大数据分析平台', '大数据分析平台', 'http://bda.renrenauto.com', 'core_manager', '0', '2017-11-08 16:23:53', '2018-05-16 18:16:14');
INSERT INTO `system` VALUES ('17', 'oc_manager', '权限管理系统', '权限管理系统', 'http://auth.d.51fenqi.com', 'oc_manager', '0', '2018-02-09 13:36:30', '2018-07-12 15:06:26');
INSERT INTO `system` VALUES ('19', 'fenqi_center', '51分期运营平台', '51分期运营平台', 'http://platform.51fenqi.com', 'core_manager', '0', '2018-03-09 18:07:30', '2018-05-16 19:02:59');
INSERT INTO `system` VALUES ('20', 'bda_3t', '三体系统', '三体系统', 'http://3t.51fenqi.com/?realm=app', 'core_manager', '0', '2017-11-08 16:23:53', '2018-05-16 17:23:22');
INSERT INTO `system` VALUES ('21', 'risk_center', '风控接口流程平台', '分控接口流程平台', 'http://rc.d.51fenqi.com', 'approval_center', '0', '2018-03-08 16:33:30', '2018-05-16 15:40:12');
INSERT INTO `system` VALUES ('27', 'core_licai_center', '理财运营平台', '理财运营平台', 'http://licai.51fenqi.com', 'oc_other', '0', '2018-03-09 11:32:49', '2018-05-16 17:33:37');
INSERT INTO `system` VALUES ('29', 'oc_car_type', '车型车系库管理后台', '车型车系库管理后台', 'http://autonation.fenqi.d.xiaonei.com/chameleon/login?next=/chameleon/', 'core_manager', '0', '2018-03-09 18:14:29', '2018-05-16 17:23:49');
INSERT INTO `system` VALUES ('33', 'oc_center', 'JV库融系统', 'JV库融系统', 'http://oc.51fenqi.com', 'approval_center', '0', '2017-09-22 18:17:54', '2018-05-16 15:06:33');
INSERT INTO `system` VALUES ('98', 'oc_old_manager', '权限管理系统(旧版)', '权限管理系统(旧版)', 'http://auth.d.51fenqi.com/index', 'oc_other', '0', '2018-02-09 13:36:30', '2018-05-16 17:13:05');
INSERT INTO `system` VALUES ('100', 'report_config', '微服务配置系统', '配置所有的微服务', 'http://10.2.52.175:9999', 'core_manager', '1', '2018-05-31 18:31:32', '2018-11-30 17:24:02');
INSERT INTO `system` VALUES ('101', 'cms', '配置内容管理系统', '配置内容管理系统', '', 'core_manager', '0', '2018-07-06 14:26:28', '2018-07-06 14:26:28');
INSERT INTO `system` VALUES ('102', 'oc_bz_auto_center', '开心汽车极速版', '开心汽车极速版', 'http://bz.renrenauto.com', 'approval_center', '0', '2018-08-10 14:16:15', '2018-08-10 14:16:15');
INSERT INTO `system` VALUES ('103', 'oc_bz_auto_sales_center', '开心汽车销售版', '开心汽车销售版', '', 'approval_center', '0', '2018-08-10 15:56:15', '2018-08-15 12:06:32');
INSERT INTO `system` VALUES ('104', 'renren_auto_video_mgr', '短视频运营后台', '短视频运营后台', '', 'approval_center', '0', '2018-08-15 11:55:26', '2018-08-15 12:06:33');
INSERT INTO `system` VALUES ('105', 'saas_mgr_app', '二手车销售运营app', '二手车销售运营app', '', 'oc_saas_center', '0', '2018-08-15 19:44:12', '2018-08-15 19:44:12');
INSERT INTO `system` VALUES ('106', 'oc_test', '测试', '111', '2222', 'oc_saas_center', '0', '2018-08-21 11:14:37', '2018-08-21 11:18:24');
INSERT INTO `system` VALUES ('107', 'special_system', '特殊系统', '特殊系统', '', 'oc_other', '0', '2018-08-21 14:42:43', '2019-03-29 15:06:52');
INSERT INTO `system` VALUES ('108', 'oc_anji', '上汽安吉', '上汽安吉审批系统', 'http://anji.kaixin.com', 'oc_other', '0', '2018-10-29 16:06:11', '2018-11-02 19:31:34');
INSERT INTO `system` VALUES ('109', 'business_config', '业务配置系统', '业务配置内部综合系统', '', 'core_manager', '0', '2018-11-30 11:33:42', '2018-11-30 11:33:42');
INSERT INTO `system` VALUES ('110', 'raqsoft_report', '润乾报表系统', '润乾报表系统', 'http://platform.d.renrenauto.com', 'oc_center', '0', '2018-12-19 11:03:20', '2018-12-19 11:03:20');
INSERT INTO `system` VALUES ('111', 'testclient', '开发测试系统', null, null, null, '0', '2019-07-02 15:20:07', '2019-07-02 15:20:07');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '电话，登录账号',
  `name` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '用户名',
  `pwd` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '密码 密文',
  `avatar_url` varchar(200) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '头像url',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0 有效 -1 删除',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `open_id` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `skey` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `province` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `country` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `gender` tinyint(4) DEFAULT NULL COMMENT '性别',
  `nick_name` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '网名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `open_id_index` (`open_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '13681295349', '测试刘', '', '', '2019-07-18 21:44:50', '2019-07-18 21:44:50', '0', '0', '', '', '2019-07-19 15:45:08', '', '', '', '', null, '');

-- ----------------------------
-- Table structure for `user_address`
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `province_code` int(11) NOT NULL DEFAULT '0' COMMENT '省份id',
  `city_code` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `county_code` int(11) NOT NULL DEFAULT '0' COMMENT '县或地级市id',
  `address` varchar(100) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '收获地址',
  `is_default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否默认 0 否 1 是',
  `phone` varchar(11) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '手机号',
  `consignee` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '收件人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否删除，0：是，1否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user_address
-- ----------------------------

-- ----------------------------
-- Table structure for `user_payment_record`
-- ----------------------------
DROP TABLE IF EXISTS `user_payment_record`;
CREATE TABLE `user_payment_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `pay_id` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT '支付id',
  `pay_time` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0 付款中 1 付款成功 -1 付款失败',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 0 支付 1 退款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of user_payment_record
-- ----------------------------

-- ----------------------------
-- Table structure for `user_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `user_ticket`;
CREATE TABLE `user_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL COMMENT '用户uid',
  `ticket` varchar(100) NOT NULL COMMENT '票据',
  `type` tinyint(4) DEFAULT NULL COMMENT '票据类型',
  `status` tinyint(4) DEFAULT NULL COMMENT '票据状态',
  `ip` varchar(100) NOT NULL COMMENT '用户IP',
  `client` varchar(100) DEFAULT NULL COMMENT '判断为那一端T票',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `expire_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_ticket` (`ticket`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2308 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_ticket
-- ----------------------------
