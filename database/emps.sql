/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : emps

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 10/11/2021 18:32:39
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `emp_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工编号',
  `emp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工姓名',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位',
  `salary` double(10, 2) NULL DEFAULT NULL COMMENT '工资',
  `commission_pct` double(10, 2) NULL DEFAULT NULL COMMENT '提成比',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在部门',
  `hiredate` datetime NULL DEFAULT NULL COMMENT '入职时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES (1, '201001', '张三', '13237892181', '后端', 20000.00, 0.00, '研发部', '2019-09-15 00:00:00');
INSERT INTO `emp` VALUES (2, '201002', '李四', '15172218562', '前端开发', 15000.00, 0.00, '研发部', '2019-09-02 00:00:00');
INSERT INTO `emp` VALUES (3, '201003', '王五', '19945679101', '测试', 10000.00, 0.00, '研发部', '2019-07-09 00:00:00');
INSERT INTO `emp` VALUES (4, '202001', '韩梅梅', '15245678990', '销售', 6000.00, 0.10, '销售部', '2018-09-09 00:00:00');
INSERT INTO `emp` VALUES (5, '203001', '李雷', '15145621348', '人事', 6000.00, 0.00, '人事部', '2018-07-10 00:00:00');
INSERT INTO `emp` VALUES (6, '200001', 'DW', '13237892181', '架构师', 50000.00, 0.00, '研发部', '2018-09-15 00:00:00');
INSERT INTO `emp` VALUES (7, '200002', '老王', '15527184652', '行政', 10000.00, 0.00, '行政部', '2018-06-15 00:00:00');
INSERT INTO `emp` VALUES (8, '202002', '李静', '15727184620', '销售', 6000.00, 0.10, '销售部', '2021-08-16 00:00:00');
INSERT INTO `emp` VALUES (9, '203002', '李晓', '18215978532', '人事', 7000.00, 0.00, '人事部', '2018-05-16 00:00:00');
INSERT INTO `emp` VALUES (10, '204001', '毛总', '15872063241', '保安', 4000.00, 0.00, '安保部', '2017-05-16 00:00:00');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin123');
INSERT INTO `user` VALUES (2, '李斯', '123456');

SET FOREIGN_KEY_CHECKS = 1;
