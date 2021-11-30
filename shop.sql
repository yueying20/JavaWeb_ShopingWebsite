/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : shop

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 27/12/2019 09:22:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ausertable
-- ----------------------------
DROP TABLE IF EXISTS `ausertable`;
CREATE TABLE `ausertable`  (
  `aname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`aname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ausertable
-- ----------------------------
INSERT INTO `ausertable` VALUES ('admin', 'admin');

-- ----------------------------
-- Table structure for busertable
-- ----------------------------
DROP TABLE IF EXISTS `busertable`;
CREATE TABLE `busertable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bemail` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bpwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of busertable
-- ----------------------------
INSERT INTO `busertable` VALUES (5, '1179595349@qq.com', 'asd135750');
INSERT INTO `busertable` VALUES (7, 'qingyue@qq.com', 'asd135750');
INSERT INTO `busertable` VALUES (8, '777@qq.com', 'asd135750');

-- ----------------------------
-- Table structure for carttable
-- ----------------------------
DROP TABLE IF EXISTS `carttable`;
CREATE TABLE `carttable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bid`(`busertable_id`) USING BTREE,
  INDEX `gno`(`goodstable_id`) USING BTREE,
  CONSTRAINT `bid` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `gno` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carttable
-- ----------------------------
INSERT INTO `carttable` VALUES (21, 7, 21, 1);
INSERT INTO `carttable` VALUES (22, 8, 21, 2);
INSERT INTO `carttable` VALUES (24, 5, 20, 1);

-- ----------------------------
-- Table structure for goodstable
-- ----------------------------
DROP TABLE IF EXISTS `goodstable`;
CREATE TABLE `goodstable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `goprice` double NULL DEFAULT NULL,
  `grprice` double NULL DEFAULT NULL,
  `gstore` int(11) NULL DEFAULT NULL,
  `gpicture` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `goodstype_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `typeid`(`goodstype_id`) USING BTREE,
  CONSTRAINT `typeid` FOREIGN KEY (`goodstype_id`) REFERENCES `goodstype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodstable
-- ----------------------------
INSERT INTO `goodstable` VALUES (12, '茉莉', 999, 899, 99, '20191123190722840.jpg', 16);
INSERT INTO `goodstable` VALUES (13, '笔记本电脑', 9999, 8999, 42, '20191123190737554.jpg', 18);
INSERT INTO `goodstable` VALUES (14, '(SONY)', 7700, 7649, 80, '20191123190924351.jpg', 14);
INSERT INTO `goodstable` VALUES (16, '打印机', 300, 289, 60, '20191123190754258.jpg', 20);
INSERT INTO `goodstable` VALUES (17, 'mate30', 4999, 4989, 99, '20191123190806259.jpg', 21);
INSERT INTO `goodstable` VALUES (18, '红酒', 39, 35, 999, '20191123190813232.jpg', 19);
INSERT INTO `goodstable` VALUES (19, '(Intel)i7-9700KF', 2888, 2799, 60, '20191123190825323.jpg', 22);
INSERT INTO `goodstable` VALUES (20, '华硕MG248QR', 1450, 1399, 98, '20191123190835198.jpg', 23);
INSERT INTO `goodstable` VALUES (21, ' RTX2080', 13999, 11999, 27, '20191123190842157.jpg', 24);
INSERT INTO `goodstable` VALUES (22, 'WH-1000XM3 ', 2700, 2599, 28, '20191123190917236.jpg', 25);

-- ----------------------------
-- Table structure for goodstype
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES (14, '数码');
INSERT INTO `goodstype` VALUES (16, '二次元手办');
INSERT INTO `goodstype` VALUES (18, '笔记本');
INSERT INTO `goodstype` VALUES (19, '食品');
INSERT INTO `goodstype` VALUES (20, '办公设备');
INSERT INTO `goodstype` VALUES (21, '手机');
INSERT INTO `goodstype` VALUES (22, 'CPU');
INSERT INTO `goodstype` VALUES (23, '显示屏');
INSERT INTO `goodstype` VALUES (24, '显卡');
INSERT INTO `goodstype` VALUES (25, '耳机');

-- ----------------------------
-- Table structure for orderbasetable
-- ----------------------------
DROP TABLE IF EXISTS `orderbasetable`;
CREATE TABLE `orderbasetable`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busertable_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(4) NOT NULL,
  `orderdate` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bid2`(`busertable_id`) USING BTREE,
  CONSTRAINT `bid2` FOREIGN KEY (`busertable_id`) REFERENCES `busertable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderbasetable
-- ----------------------------
INSERT INTO `orderbasetable` VALUES (9, 5, 2777, 1, '2019-11-04 00:25:27');
INSERT INTO `orderbasetable` VALUES (10, 5, 8999, 1, '2019-11-04 12:37:25');
INSERT INTO `orderbasetable` VALUES (13, 7, 11999, 1, '2019-12-08 15:02:49');
INSERT INTO `orderbasetable` VALUES (15, 5, 1399, 0, '2019-12-10 12:54:43');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderbasetable_id` int(11) NOT NULL,
  `goodstable_id` int(11) NOT NULL,
  `shoppingnum` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `odsn`(`orderbasetable_id`) USING BTREE,
  INDEX `gno3`(`goodstable_id`) USING BTREE,
  CONSTRAINT `gno3` FOREIGN KEY (`goodstable_id`) REFERENCES `goodstable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `odsn` FOREIGN KEY (`orderbasetable_id`) REFERENCES `orderbasetable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (17, 9, 14, 1);
INSERT INTO `orderdetail` VALUES (18, 10, 13, 1);
INSERT INTO `orderdetail` VALUES (21, 13, 21, 1);
INSERT INTO `orderdetail` VALUES (23, 15, 20, 1);

SET FOREIGN_KEY_CHECKS = 1;
