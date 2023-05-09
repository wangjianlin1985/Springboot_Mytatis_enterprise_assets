/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : boot_zichan_guanli

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2020-02-13 19:03:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `assets_borrow`
-- ----------------------------
DROP TABLE IF EXISTS `assets_borrow`;
CREATE TABLE `assets_borrow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `user_id` bigint(20) NOT NULL COMMENT '租借人id',
  `expect_return_time` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：在借，2：已归还',
  `return_time` datetime DEFAULT NULL COMMENT '归还时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '资产名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `ab@user_id` (`user_id`) USING BTREE,
  KEY `ab@uuid` (`uuid`) USING BTREE,
  CONSTRAINT `assets_borrow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `assets_borrow_ibfk_2` FOREIGN KEY (`uuid`) REFERENCES `assets_item` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_borrow
-- ----------------------------
INSERT INTO `assets_borrow` VALUES ('9', '9cfe225f-0a65-4859-8bf1-39a8f5b3ec53', '21', '2020-02-15 00:00:00', '2', '2020-02-13 18:25:55', null, '2020-02-13 18:24:42', '2020-02-13 18:25:54');
INSERT INTO `assets_borrow` VALUES ('10', '799f70a6-da25-4f2d-a546-80ad8efcda79', '22', '2020-02-11 00:00:00', '2', '2020-02-11 00:00:00', null, '2020-02-13 18:27:37', '2020-02-13 18:27:58');
INSERT INTO `assets_borrow` VALUES ('11', '799f70a6-da25-4f2d-a546-80ad8efcda79', '21', '2020-02-12 00:00:00', '2', '2020-02-12 00:00:00', null, '2020-02-11 18:29:37', '2020-02-11 18:29:48');

-- ----------------------------
-- Table structure for `assets_item`
-- ----------------------------
DROP TABLE IF EXISTS `assets_item`;
CREATE TABLE `assets_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `customs_id` varchar(50) NOT NULL COMMENT '用户提供的资产编码',
  `name` varchar(255) NOT NULL COMMENT '资产名称',
  `price` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：正常，2：租借，3：维修，4：报废',
  `assets_type_id` bigint(20) NOT NULL COMMENT '资产类型id',
  `point_id` bigint(20) NOT NULL COMMENT '网点id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique@uuid` (`uuid`) USING BTREE,
  KEY `ai@point_id` (`point_id`) USING BTREE,
  KEY `ai@assets_type_id` (`assets_type_id`) USING BTREE,
  CONSTRAINT `assets_item_ibfk_1` FOREIGN KEY (`assets_type_id`) REFERENCES `assets_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_item
-- ----------------------------
INSERT INTO `assets_item` VALUES ('13', '54dd284d-d392-4a96-b4a6-257ad768ddd8', 'GD562649632', '台式机', '4000.00', '3', '1', '1', '2019-12-28 14:17:54', '2020-02-13 18:33:07');
INSERT INTO `assets_item` VALUES ('14', '799f70a6-da25-4f2d-a546-80ad8efcda79', 'BG16516516', '笔记本电脑', '6000.00', '1', '1', '1', '2019-12-28 14:19:56', '2020-02-11 18:29:48');
INSERT INTO `assets_item` VALUES ('15', '9cfe225f-0a65-4859-8bf1-39a8f5b3ec53', 'DG13408501', '500G硬盘', '260.00', '1', '8', '1', '2020-02-13 18:21:40', '2020-02-13 18:25:54');

-- ----------------------------
-- Table structure for `assets_operation_record`
-- ----------------------------
DROP TABLE IF EXISTS `assets_operation_record`;
CREATE TABLE `assets_operation_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `user_id` bigint(20) NOT NULL COMMENT '操作人id',
  `operation_type` tinyint(4) NOT NULL COMMENT '操作类型，1：登记，2：借，3：换，4：丢失，5：报修，6：作废，7：盘点',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_operation_record
-- ----------------------------
INSERT INTO `assets_operation_record` VALUES ('38', '54dd284d-d392-4a96-b4a6-257ad768ddd8', '1', '1', '添加成功', '2019-12-28 14:17:54', '2019-12-28 14:17:54');
INSERT INTO `assets_operation_record` VALUES ('39', '799f70a6-da25-4f2d-a546-80ad8efcda79', '1', '1', '添加成功', '2019-12-28 14:19:56', '2019-12-28 14:19:56');
INSERT INTO `assets_operation_record` VALUES ('40', '9cfe225f-0a65-4859-8bf1-39a8f5b3ec53', '1', '1', '添加成功', '2020-02-13 18:21:40', '2020-02-13 18:21:40');
INSERT INTO `assets_operation_record` VALUES ('41', '9cfe225f-0a65-4859-8bf1-39a8f5b3ec53', '1', '2', '操作成功,租借人id：21', '2020-02-13 18:24:42', '2020-02-13 18:24:42');
INSERT INTO `assets_operation_record` VALUES ('42', '9cfe225f-0a65-4859-8bf1-39a8f5b3ec53', '1', '3', '操作成功,归还人name：21', '2020-02-13 18:25:54', '2020-02-13 18:25:54');
INSERT INTO `assets_operation_record` VALUES ('43', '799f70a6-da25-4f2d-a546-80ad8efcda79', '1', '2', '操作成功,租借人id：22', '2020-02-13 18:27:37', '2020-02-13 18:27:37');
INSERT INTO `assets_operation_record` VALUES ('44', '799f70a6-da25-4f2d-a546-80ad8efcda79', '1', '3', '操作成功,归还人name：22', '2020-02-13 18:27:58', '2020-02-13 18:27:58');
INSERT INTO `assets_operation_record` VALUES ('45', '799f70a6-da25-4f2d-a546-80ad8efcda79', '1', '2', '操作成功,租借人id：21', '2020-02-11 18:29:37', '2020-02-11 18:29:37');
INSERT INTO `assets_operation_record` VALUES ('46', '799f70a6-da25-4f2d-a546-80ad8efcda79', '1', '3', '操作成功,归还人name：22', '2020-02-11 18:29:48', '2020-02-11 18:29:48');
INSERT INTO `assets_operation_record` VALUES ('47', '54dd284d-d392-4a96-b4a6-257ad768ddd8', '1', '5', '成功,打印不出来', '2020-02-13 18:33:07', '2020-02-13 18:33:07');
INSERT INTO `assets_operation_record` VALUES ('48', '9cfe225f-0a65-4859-8bf1-39a8f5b3ec53', '1', '7', '操作成功', '2020-02-13 18:38:03', '2020-02-13 18:38:03');

-- ----------------------------
-- Table structure for `assets_stock_take`
-- ----------------------------
DROP TABLE IF EXISTS `assets_stock_take`;
CREATE TABLE `assets_stock_take` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL COMMENT '盘点名称',
  `user_id` bigint(20) NOT NULL COMMENT '盘点负责人',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，1：盘点中，2：盘点完成',
  `end_time` datetime DEFAULT NULL COMMENT '盘点结束时间',
  `all_amount` int(8) DEFAULT '0' COMMENT '盘点数目',
  `handling_amount` int(8) DEFAULT '0' COMMENT '待处理数目',
  `normal_amount` int(8) DEFAULT '0' COMMENT '正常数目',
  `abnormal_amount` int(8) DEFAULT '0' COMMENT '异常数目',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_stock_take
-- ----------------------------
INSERT INTO `assets_stock_take` VALUES ('9', '2020-02-13盘点', '1', '1', null, '3', '3', '0', '0', '2020-02-13 18:35:24', '2020-02-13 18:35:24');

-- ----------------------------
-- Table structure for `assets_stock_take_item`
-- ----------------------------
DROP TABLE IF EXISTS `assets_stock_take_item`;
CREATE TABLE `assets_stock_take_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `stock_take_id` bigint(36) NOT NULL COMMENT '审核记录id',
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `customs_id` varchar(50) NOT NULL COMMENT '用户提供的资产编码',
  `name` varchar(255) NOT NULL COMMENT '资产名称',
  `price` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：待盘点，2：正常，3：异常',
  `assets_type_id` bigint(20) NOT NULL COMMENT '资产类型id',
  `point_id` bigint(20) NOT NULL COMMENT '网点id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique@stock_take_id, uuid` (`stock_take_id`,`uuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_stock_take_item
-- ----------------------------
INSERT INTO `assets_stock_take_item` VALUES ('72', '9', '54dd284d-d392-4a96-b4a6-257ad768ddd8', 'GD562649632', '台式机', '4000.00', '1', '1', '1', '2020-02-13 18:35:24', '2020-02-13 18:35:24');
INSERT INTO `assets_stock_take_item` VALUES ('73', '9', '799f70a6-da25-4f2d-a546-80ad8efcda79', 'BG16516516', '笔记本电脑', '6000.00', '1', '1', '1', '2020-02-13 18:35:24', '2020-02-13 18:35:24');
INSERT INTO `assets_stock_take_item` VALUES ('74', '9', '9cfe225f-0a65-4859-8bf1-39a8f5b3ec53', 'DG13408501', '500G硬盘', '260.00', '2', '8', '1', '2020-02-13 18:35:24', '2020-02-13 18:38:03');

-- ----------------------------
-- Table structure for `assets_type`
-- ----------------------------
DROP TABLE IF EXISTS `assets_type`;
CREATE TABLE `assets_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `pid` bigint(20) NOT NULL COMMENT '父节点id',
  `order` int(8) NOT NULL COMMENT '同一个父节点下面的排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of assets_type
-- ----------------------------
INSERT INTO `assets_type` VALUES ('1', '计算机类', '0', '1', '2017-04-29 19:59:20', '2017-04-29 19:59:20');
INSERT INTO `assets_type` VALUES ('7', '软件类', '0', '2', '2019-12-28 14:20:10', '2019-12-28 14:20:10');
INSERT INTO `assets_type` VALUES ('8', '硬件类', '0', '12', '2019-12-28 14:20:25', '2019-12-28 14:20:25');

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `code` varchar(50) NOT NULL COMMENT '权限code',
  `name` varchar(250) NOT NULL COMMENT '权限名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique@name` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'sys:user:add', '用户添加', '2017-04-17 22:47:12', '2017-09-05 00:17:00');
INSERT INTO `auth_permission` VALUES ('2', 'sys:user:delete', '用户删除', '2017-04-27 09:38:25', '2017-08-01 13:26:49');
INSERT INTO `auth_permission` VALUES ('3', 'sys:user:update', '用户更新', '2017-04-27 09:39:27', '2017-08-01 13:26:51');
INSERT INTO `auth_permission` VALUES ('4', 'sys:user:getList', '用户列表', '2017-04-27 09:40:46', '2017-08-01 13:26:55');
INSERT INTO `auth_permission` VALUES ('9', 'sys:develop', '开发模式', '2017-04-27 10:07:26', '2017-08-01 13:27:47');
INSERT INTO `auth_permission` VALUES ('20', 'asset:add', '资产添加', '2017-05-05 20:34:15', '2017-08-01 13:29:14');
INSERT INTO `auth_permission` VALUES ('21', 'asset:delete', '资产删除', '2017-05-05 20:34:28', '2017-08-01 13:29:22');
INSERT INTO `auth_permission` VALUES ('22', 'asset:update', '资产更新', '2017-05-05 20:34:37', '2017-08-01 13:29:28');
INSERT INTO `auth_permission` VALUES ('23', 'asset:getList', '资产列表', '2017-05-05 20:34:50', '2017-08-01 13:29:34');
INSERT INTO `auth_permission` VALUES ('24', 'asset:record:getByUuid', '资产记录列表', '2017-05-05 20:35:05', '2017-08-01 13:30:18');
INSERT INTO `auth_permission` VALUES ('25', 'asset:borrow:operation', '资产租借操作', '2017-05-05 20:35:20', '2017-08-01 13:30:49');
INSERT INTO `auth_permission` VALUES ('26', 'asset:borrow:list', '资产租借列表', '2017-05-05 20:35:40', '2017-08-17 23:03:12');
INSERT INTO `auth_permission` VALUES ('27', 'asset:updateStatus', '资产状态更新', '2017-05-05 20:37:46', '2017-08-01 13:31:49');
INSERT INTO `auth_permission` VALUES ('28', 'sys:assetType:add', '资产类型添加', '2017-05-05 20:38:07', '2017-08-01 13:33:02');
INSERT INTO `auth_permission` VALUES ('29', 'sys:assetType:delete', '资产类型删除', '2017-05-05 20:38:16', '2017-08-01 13:33:11');
INSERT INTO `auth_permission` VALUES ('31', 'sys:assetType:update', '资产类型更新', '2017-05-05 20:38:46', '2017-08-01 13:33:18');
INSERT INTO `auth_permission` VALUES ('32', 'sys:assetType:getList', '资产类型列表', '2017-05-05 20:38:57', '2017-08-01 13:33:26');
INSERT INTO `auth_permission` VALUES ('33', 'sys:assetType:getType', '资产类型xx', '2017-05-05 20:39:06', '2017-08-01 13:33:41');
INSERT INTO `auth_permission` VALUES ('34', 'sys:assetType:getMapByPid', '资产类型xx', '2017-05-05 20:39:18', '2017-08-01 13:33:47');
INSERT INTO `auth_permission` VALUES ('41', 'report:getOverall', '报表总揽', '2017-05-05 20:41:31', '2017-08-01 13:34:23');
INSERT INTO `auth_permission` VALUES ('42', 'report:getBorrow', '报表借还', '2017-05-05 20:41:36', '2017-08-01 13:34:32');
INSERT INTO `auth_permission` VALUES ('45', 'stockTake:add', '盘点添加', '2017-05-05 20:42:59', '2017-08-01 13:35:05');
INSERT INTO `auth_permission` VALUES ('46', 'stockTake:delete', '盘点删除', '2017-05-05 20:43:04', '2017-08-01 13:35:22');
INSERT INTO `auth_permission` VALUES ('47', 'stockTake:update', '盘点更新', '2017-05-05 20:43:10', '2017-08-01 13:35:28');
INSERT INTO `auth_permission` VALUES ('48', 'stockTake:getList', '盘点列表', '2017-05-05 20:43:17', '2017-08-01 13:35:36');
INSERT INTO `auth_permission` VALUES ('49', 'stockTake:handle', '盘点处理', '2017-05-05 20:43:23', '2017-08-01 13:35:46');
INSERT INTO `auth_permission` VALUES ('50', 'stockTake:getAvailableMap', '盘点xx', '2017-05-05 20:43:38', '2017-08-01 13:36:00');
INSERT INTO `auth_permission` VALUES ('51', 'stockTake:updateAmount', '盘点数量更新', '2017-05-05 20:43:46', '2017-08-01 13:36:10');
INSERT INTO `auth_permission` VALUES ('52', 'stockTake:getItemList', '盘点明显列表', '2017-05-05 20:43:55', '2017-08-01 13:36:20');
INSERT INTO `auth_permission` VALUES ('53', 'stockTake:updateToAbnormal', '盘点标记异常', '2017-05-05 20:44:00', '2017-08-01 13:36:37');
INSERT INTO `auth_permission` VALUES ('54', 'user:updatePoint', '用户网点更新', '2017-05-05 20:44:27', '2017-08-01 13:36:55');
INSERT INTO `auth_permission` VALUES ('56', 'asset:stockTake:add', '资产盘点开启', '2017-05-05 20:56:21', '2017-08-01 13:37:56');
INSERT INTO `auth_permission` VALUES ('57', 'stockTake:close', '盘点关闭', '2017-05-08 11:34:15', '2017-08-01 13:37:11');
INSERT INTO `auth_permission` VALUES ('58', 'system-point-subordinate:query', '网点下级查询', '2017-08-25 22:31:09', '2017-08-25 22:31:09');
INSERT INTO `auth_permission` VALUES ('59', 'system-point-subordinate:query:edit', '网点下级管理', '2017-08-25 22:31:32', '2017-08-25 22:31:32');
INSERT INTO `auth_permission` VALUES ('60', 'system-point-subordinate:query:globe', '网点全局查询', '2017-08-25 22:31:54', '2017-08-25 22:31:54');
INSERT INTO `auth_permission` VALUES ('61', 'sys:point', '网点管理', '2017-08-27 22:36:26', '2017-08-27 22:36:26');

-- ----------------------------
-- Table structure for `auth_role`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态，1：启用，2：不启用',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES ('1', '超级管理员', '1', '2017-01-30 22:30:59', '2017-05-05 21:29:52');
INSERT INTO `auth_role` VALUES ('2', '默认角色', '1', '2017-01-30 22:30:37', '2017-05-05 21:22:24');

-- ----------------------------
-- Table structure for `auth_role_assets_type_relation`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_assets_type_relation`;
CREATE TABLE `auth_role_assets_type_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `assets_type_id` bigint(20) NOT NULL COMMENT '资产类型id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique@role_id, assets_type_id` (`role_id`,`assets_type_id`) USING BTREE,
  KEY `rat@assets_type_id` (`assets_type_id`) USING BTREE,
  CONSTRAINT `auth_role_assets_type_relation_ibfk_1` FOREIGN KEY (`assets_type_id`) REFERENCES `assets_type` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_role_assets_type_relation_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_assets_type_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_role_permission_relation`
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_permission_relation`;
CREATE TABLE `auth_role_permission_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `permission_id` bigint(20) NOT NULL COMMENT '权限id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique@role_id, permission_id` (`role_id`,`permission_id`) USING BTREE,
  KEY `rp@permission_id` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_role_permission_relation_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `auth_role_permission_relation_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_role_permission_relation
-- ----------------------------
INSERT INTO `auth_role_permission_relation` VALUES ('273', '1', '1', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('274', '1', '2', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('275', '1', '3', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('276', '1', '4', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('277', '1', '9', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('278', '1', '20', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('279', '1', '21', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('280', '1', '22', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('281', '1', '23', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('282', '1', '24', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('283', '1', '25', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('284', '1', '26', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('285', '1', '27', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('286', '1', '28', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('287', '1', '29', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('288', '1', '31', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('289', '1', '32', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('290', '1', '33', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('291', '1', '34', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('292', '1', '41', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('293', '1', '42', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('294', '1', '45', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('295', '1', '46', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('296', '1', '47', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('297', '1', '48', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('298', '1', '49', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('299', '1', '50', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('300', '1', '51', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('301', '1', '52', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('302', '1', '53', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('303', '1', '54', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('304', '1', '56', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('305', '1', '57', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('306', '1', '58', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('307', '1', '59', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('308', '1', '60', '2017-08-28 00:06:37', '2017-08-28 00:06:37');
INSERT INTO `auth_role_permission_relation` VALUES ('309', '1', '61', '2017-08-28 00:06:37', '2017-08-28 00:06:37');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(50) NOT NULL COMMENT '用户名称',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `description` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `point_id` bigint(20) DEFAULT NULL COMMENT '网点id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique@name` (`name`) USING BTREE,
  KEY `user@role_id` (`role_id`) USING BTREE,
  KEY `user@point_id` (`point_id`) USING BTREE,
  CONSTRAINT `auth_user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `auth_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'admin', 'admin', '开心！', '1', '1', '2017-01-31 22:39:53', '2019-12-28 14:41:01');
INSERT INTO `auth_user` VALUES ('21', 'lisi', '123456', null, '2', '1', '2019-12-28 14:20:47', '2019-12-28 14:20:47');
INSERT INTO `auth_user` VALUES ('22', 'xiaoli', '123456', '测试测试啊啊啊', '2', '1', '2020-02-13 18:22:50', '2020-02-13 18:22:50');

-- ----------------------------
-- Table structure for `point`
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '网点id',
  `name` varchar(50) NOT NULL COMMENT '网点名称',
  `pid` bigint(20) NOT NULL COMMENT '父节点id',
  `order` int(8) NOT NULL COMMENT '同一个父节点下面的排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of point
-- ----------------------------
INSERT INTO `point` VALUES ('1', '浙江总部', '1', '0', '2017-04-30 19:34:38', '2017-08-25 22:10:07');
INSERT INTO `point` VALUES ('7', '江苏总部', '0', '2', '2019-12-28 14:21:18', '2019-12-28 14:21:18');

-- ----------------------------
-- Table structure for `system_config`
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `variable` varchar(128) NOT NULL COMMENT '系统变量',
  `value` varchar(128) DEFAULT NULL COMMENT '系统值',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique@variable` (`variable`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_config
-- ----------------------------

-- ----------------------------
-- Table structure for `system_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary`;
CREATE TABLE `system_dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table` varchar(255) NOT NULL COMMENT '表',
  `column` varchar(255) NOT NULL COMMENT '列',
  `key` varchar(255) NOT NULL COMMENT 'key',
  `value` varchar(255) NOT NULL COMMENT 'value',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique@table, column, key` (`table`,`column`,`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_dictionary
-- ----------------------------
INSERT INTO `system_dictionary` VALUES ('1', 'auth_role', 'status', '1', '启用', '2017-04-16 18:23:37', '2017-04-16 18:23:37');
INSERT INTO `system_dictionary` VALUES ('2', 'auth_role', 'status', '2', '不启用', '2017-04-16 18:23:58', '2017-04-16 18:23:58');
INSERT INTO `system_dictionary` VALUES ('3', 'auth_menu', 'type', '1', '菜单', '2017-04-23 20:49:09', '2017-04-25 20:27:19');
INSERT INTO `system_dictionary` VALUES ('4', 'auth_menu', 'type', '2', '权限', '2017-04-23 20:50:20', '2017-04-25 20:27:22');
INSERT INTO `system_dictionary` VALUES ('5', 'assets_operation_record', 'operation_type', '1', '登记', '2017-05-02 21:46:29', '2017-05-02 21:46:29');
INSERT INTO `system_dictionary` VALUES ('6', 'assets_operation_record', 'operation_type', '2', '借', '2017-05-02 21:46:29', '2017-05-02 21:46:29');
INSERT INTO `system_dictionary` VALUES ('7', 'assets_operation_record', 'operation_type', '3', '还', '2017-05-02 21:49:44', '2017-05-03 20:00:57');
INSERT INTO `system_dictionary` VALUES ('8', 'assets_operation_record', 'operation_type', '4', '丢失', '2017-05-02 21:49:44', '2017-05-02 21:49:44');
INSERT INTO `system_dictionary` VALUES ('9', 'assets_operation_record', 'operation_type', '5', '报修', '2017-05-02 21:49:44', '2017-05-02 21:49:44');
INSERT INTO `system_dictionary` VALUES ('10', 'assets_operation_record', 'operation_type', '6', '作废', '2017-05-02 21:49:44', '2017-05-02 21:49:44');
INSERT INTO `system_dictionary` VALUES ('11', 'assets_operation_record', 'operation_type', '7', '盘点', '2017-05-02 21:49:44', '2017-05-02 21:49:44');
INSERT INTO `system_dictionary` VALUES ('12', 'assets_item', 'status', '1', '正常', '2017-05-03 16:22:14', '2017-05-03 16:22:14');
INSERT INTO `system_dictionary` VALUES ('13', 'assets_item', 'status', '2', '租借', '2017-05-03 16:22:14', '2017-05-03 16:22:14');
INSERT INTO `system_dictionary` VALUES ('14', 'assets_item', 'status', '3', '维修', '2017-05-03 16:22:14', '2017-05-03 16:22:14');
INSERT INTO `system_dictionary` VALUES ('15', 'assets_item', 'status', '4', '报废', '2017-05-03 16:22:14', '2017-05-03 16:22:14');
INSERT INTO `system_dictionary` VALUES ('16', 'assets_stock_take_item', 'status', '1', '待处理', '2017-05-04 17:40:55', '2017-05-04 17:40:55');
INSERT INTO `system_dictionary` VALUES ('17', 'assets_stock_take_item', 'status', '2', '正常', '2017-05-04 17:40:55', '2017-05-04 17:40:55');
INSERT INTO `system_dictionary` VALUES ('18', 'assets_stock_take_item', 'status', '3', '异常', '2017-05-04 17:40:55', '2017-05-04 17:40:55');
INSERT INTO `system_dictionary` VALUES ('19', 'assets_stock_take', 'status', '1', '盘点中', '2017-05-04 23:43:05', '2017-05-04 23:43:05');
INSERT INTO `system_dictionary` VALUES ('20', 'assets_stock_take', 'status', '2', '盘点完成', '2017-05-04 23:43:05', '2017-05-04 23:43:05');
