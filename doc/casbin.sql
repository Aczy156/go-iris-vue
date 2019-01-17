/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : casbin

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-01-17 17:17:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `p_type` varchar(100) DEFAULT NULL,
  `v0` varchar(100) DEFAULT NULL,
  `v1` varchar(100) DEFAULT NULL,
  `v2` varchar(100) DEFAULT NULL,
  `v3` varchar(100) DEFAULT NULL,
  `v4` varchar(100) DEFAULT NULL,
  `v5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_casbin_rule_v0` (`v0`),
  KEY `IDX_casbin_rule_v1` (`v1`),
  KEY `IDX_casbin_rule_v2` (`v2`),
  KEY `IDX_casbin_rule_v3` (`v3`),
  KEY `IDX_casbin_rule_v4` (`v4`),
  KEY `IDX_casbin_rule_v5` (`v5`),
  KEY `IDX_casbin_rule_p_type` (`p_type`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of casbin_rule
-- ----------------------------
INSERT INTO `casbin_rule` VALUES ('65', 'p', '90', '/*', 'ANY', '.*', '', '');
INSERT INTO `casbin_rule` VALUES ('66', 'g', '90', 'admin', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('67', 'g', '90', 'demo', '', '', '', '');
INSERT INTO `casbin_rule` VALUES ('68', 'p', 'admin', '/admin*', 'GET|POST|DELETE|PUT', '.*', '角色管理', '');
INSERT INTO `casbin_rule` VALUES ('69', 'p', 'demo', '/demo*', 'GET|POST|DELETE|PUT', '.*', 'demo角色', '');

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(255) DEFAULT '',
  `product_name` varchar(255) DEFAULT '',
  `number` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES ('1', 'PD-001', 'asc', '2', '2019-01-08 10:30:33');
INSERT INTO `demo` VALUES ('2', 'PD-002', 'asc', '2', '2019-01-08 10:38:21');
INSERT INTO `demo` VALUES ('3', 'PD-003', 'asc', '2', '2019-01-08 10:38:51');
INSERT INTO `demo` VALUES ('4', 'PD-005', 'asc', '2', '2019-01-08 10:39:33');
INSERT INTO `demo` VALUES ('5', 'PD-006', 'asc', '2', '2019-01-08 10:44:21');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `path` varchar(64) DEFAULT '',
  `url` varchar(64) DEFAULT '',
  `modular` varchar(64) DEFAULT '' COMMENT '模块名',
  `component` varchar(64) DEFAULT '',
  `name` varchar(64) DEFAULT '',
  `icon` varchar(64) DEFAULT '',
  `keep_alive` varchar(64) DEFAULT '',
  `require_auth` varchar(64) DEFAULT '',
  `parent_id` int(10) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '/', null, '', null, '所有', null, null, null, null, '1', null, null);
INSERT INTO `menu` VALUES ('2', '/', '/home', '', 'Home', '权限管理', 'fa fa-cog', null, null, '1', '1', null, null);
INSERT INTO `menu` VALUES ('3', '/user', '/a', 'admin', 'User', '用户管理', 'fa fa-user', null, null, '2', '1', null, null);
INSERT INTO `menu` VALUES ('4', '/role', '/a', 'admin', 'Role', '角色管理', 'fa fa-user-secret', '', '', '2', '1', null, null);
INSERT INTO `menu` VALUES ('5', '/menu', '/a', 'admin', 'Menu', '菜单管理', 'fa fa-quora', '', '', '2', '1', null, null);
INSERT INTO `menu` VALUES ('14', '/user', '/', '7', '7', 'as', '7', '', '', '3', '7', '2018-07-25 13:59:04', null);
INSERT INTO `menu` VALUES ('15', '/user', '/', '8', '8', '大萨达撒の21321', '8', '', '', '3', '8', '2018-07-25 13:59:57', null);
INSERT INTO `menu` VALUES ('16', '/menu', '/', '9', '9', 'eqwewqedsads', '9', '', '', '5', '9', '2018-07-25 14:00:27', null);
INSERT INTO `menu` VALUES ('17', '/menu', '/', '1', '1', 'kjhjhgjghjgh炬华科技好看', '1', '', '', '5', '1', '2018-07-25 14:14:05', null);
INSERT INTO `menu` VALUES ('18', '/menu', '/', '计划国际化', '1', 'ss', '1', '', '', '5', '1', '2018-07-25 14:14:13', null);

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL COMMENT '角色id',
  `mid` int(10) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`),
  KEY `m_r_id` (`mid`),
  KEY `r_m_id` (`rid`),
  CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`),
  CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `casbin_rule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('29', '68', '2');
INSERT INTO `role_menu` VALUES ('30', '68', '3');
INSERT INTO `role_menu` VALUES ('31', '68', '4');
INSERT INTO `role_menu` VALUES ('32', '68', '5');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `enable` tinyint(1) DEFAULT '0' COMMENT '0：启用用户 1：禁用用户',
  `appid` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `userface` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('76', 'yhm1', 'x04jpoIrc8/mvNRqAG59Wg==', '0', '', '', '', '', '', '2019-01-14 11:54:11', null);
INSERT INTO `user` VALUES ('90', 'root', 'x04jpoIrc8/mvNRqAG59Wg==', '0', '', '', '', '', '', '2019-01-16 10:42:34', null);
