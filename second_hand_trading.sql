/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : second_hand_trading

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 11/09/2021 09:04:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sh_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_address`;
CREATE TABLE `sh_address`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `consignee_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人姓名',
  `consignee_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人手机号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '市',
  `region_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '区',
  `detail_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详细地址',
  `default_flag` tinyint(0) NOT NULL COMMENT '是否默认地址',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_address
-- ----------------------------
INSERT INTO `sh_address` VALUES (1, 'user9', '13011110009', '江苏省', '南通市', '崇川区', '花园一单元一号楼', 1, 10);
INSERT INTO `sh_address` VALUES (2, 'user8', '13011110008', '江苏省', '南通市', '崇川区', '888', 1, 9);
INSERT INTO `sh_address` VALUES (27, 'MZ', '13011110000', '河南省', '新乡市', '原阳县', '测试测试', 1, 1);

-- ----------------------------
-- Table structure for sh_admin
-- ----------------------------
DROP TABLE IF EXISTS `sh_admin`;
CREATE TABLE `sh_admin`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理员账号',
  `admin_password` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `admin_name` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '管理员名字',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_admin
-- ----------------------------
INSERT INTO `sh_admin` VALUES (1, '11', '123123', '超级管理员');
INSERT INTO `sh_admin` VALUES (2, '22', '123123', '管理员1');
INSERT INTO `sh_admin` VALUES (3, '33', '123123', '管理员2');
INSERT INTO `sh_admin` VALUES (11, '44', '123123', '管理员3');
INSERT INTO `sh_admin` VALUES (12, '55', '123123', '管理员4');

-- ----------------------------
-- Table structure for sh_favorite
-- ----------------------------
DROP TABLE IF EXISTS `sh_favorite`;
CREATE TABLE `sh_favorite`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键id',
  `create_time` datetime(0) NOT NULL COMMENT '加入收藏的时间',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  `idle_id` bigint(0) NOT NULL COMMENT '闲置物主键id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `idle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_favorite
-- ----------------------------
INSERT INTO `sh_favorite` VALUES (42, '2021-09-02 07:21:59', 9, 80);

-- ----------------------------
-- Table structure for sh_idle_item
-- ----------------------------
DROP TABLE IF EXISTS `sh_idle_item`;
CREATE TABLE `sh_idle_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `idle_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '闲置物名称',
  `idle_details` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详情',
  `picture_list` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图集',
  `idle_price` decimal(10, 2) NOT NULL COMMENT '价格',
  `idle_place` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '发货地区',
  `idle_label` int(0) NOT NULL COMMENT '分类标签',
  `release_time` datetime(0) NOT NULL COMMENT '发布时间',
  `idle_status` tinyint(0) NOT NULL COMMENT '状态（发布1、下架2、删除0）',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_idle_item
-- ----------------------------
INSERT INTO `sh_idle_item` VALUES (1, '山地自行车', '自行车', '[\"http://localhost:8080/image?imageName=file163048533212810021.jpg\"]', 500.00, '南通市', 3, '2021-09-01 08:35:34', 1, 1);
INSERT INTO `sh_idle_item` VALUES (2, '绿源电动车-哆啦A梦', '电动车', '[\"http://localhost:8080/image?imageName=file163048602221410032.jpg\"]', 1500.00, '南通市', 3, '2021-09-01 08:47:04', 1, 1);
INSERT INTO `sh_idle_item` VALUES (3, '二手苹果手机', '二手苹果手机，一直自己用的，可以正常开机，账号可退出。', '[\"http://localhost:8080/image?imageName=file163048725652110031.jpeg\"]', 2200.00, '南通市', 1, '2021-09-01 09:07:42', 1, 1);
INSERT INTO `sh_idle_item` VALUES (4, '二手笔记本电脑', '自己一直在用，最近想换一个配置高点的。', '[\"http://localhost:8080/image?imageName=file16304882140851005bijibendiannao.jpg\"]', 2000.00, '南通市', 1, '2021-09-01 09:23:36', 1, 2);
INSERT INTO `sh_idle_item` VALUES (5, '女款包包', '最近不用它，就不想要它了', '[\"http://localhost:8080/image?imageName=file16304884628571006baobao1.jpg\"]', 5000.00, '南通市', 5, '2021-09-01 09:27:45', 1, 2);
INSERT INTO `sh_idle_item` VALUES (6, '二手相机', '不想摄影了，留着没用了，决定出手。', '[\"http://localhost:8080/image?imageName=file16304888272641002xiangji1.jpeg\"]', 3000.00, '南通市', 1, '2021-09-01 09:33:50', 1, 2);
INSERT INTO `sh_idle_item` VALUES (7, '二手笔记本电脑', '买了一小段时间，觉得电脑配置达不到自己想要的，决定出手转让', '[\"http://localhost:8080/image?imageName=file16304893070261005bijibendiannao2.jpg\"]', 2300.00, '南通市', 1, '2021-09-01 09:41:50', 1, 3);
INSERT INTO `sh_idle_item` VALUES (8, '二手摩托车', '闲置很久，不在年轻，不想骑了。', '[\"http://localhost:8080/image?imageName=file16304894866401006motuo1.jpg\"]', 10000.00, '南通市', 3, '2021-09-01 09:44:48', 1, 3);
INSERT INTO `sh_idle_item` VALUES (9, '盆', '毕业了，有偿就出。', '[\"http://localhost:8080/image?imageName=file16305511843751003pen1.jpeg\"]', 5.00, '南通市', 5, '2021-09-02 02:53:09', 1, 4);
INSERT INTO `sh_idle_item` VALUES (10, 'GTX970', '有了更高的配置，没有用了，决定出手', '[\"http://localhost:8080/image?imageName=file16305513129051004gtx970.jpeg\"]', 2000.00, '南通市', 1, '2021-09-02 02:55:16', 1, 4);
INSERT INTO `sh_idle_item` VALUES (11, '二手iPad', '用的次数不多了，放着没用。', '[\"http://localhost:8080/image?imageName=file16305513967991005ipad.jpeg\"]', 1000.00, '新乡市', 1, '2021-09-02 02:56:40', 1, 4);
INSERT INTO `sh_idle_item` VALUES (12, '大猩猩装饰', '没地方放了。', '[\"http://localhost:8080/image?imageName=file16305518909091006zhuanshipin1.jpeg\"]', 100.00, '南通市', 5, '2021-09-02 03:04:53', 1, 4);
INSERT INTO `sh_idle_item` VALUES (13, '蓝色大猩猩装饰', '没地方放了。', '[\"http://localhost:8080/image?imageName=file16305522436241007zhungshipin2.jpeg\"]', 100.00, '南通市', 5, '2021-09-02 03:10:47', 1, 4);
INSERT INTO `sh_idle_item` VALUES (14, '装饰品1', '没地方放了。', '[\"http://localhost:8080/image?imageName=file16305525547611008zhuangshipin3.jpeg\"]', 100.00, '南通市', 5, '2021-09-02 03:15:57', 1, 4);
INSERT INTO `sh_idle_item` VALUES (15, '豹装饰品', '没地方放了。', '[\"http://localhost:8080/image?imageName=file16305627772661010zhuangshipin4.jpeg\"]', 100.00, '南通市', 5, '2021-09-02 06:06:28', 1, 5);
INSERT INTO `sh_idle_item` VALUES (16, '二手吉他', '吉他很信，自己没有音乐细胞决定出手。', '[\"http://localhost:8080/image?imageName=file16305629698081011jita.jpeg\"]', 120.00, '南通市', 5, '2021-09-02 06:09:33', 1, 5);
INSERT INTO `sh_idle_item` VALUES (17, '项链', '自己不带了，出手转让。', '[\"http://localhost:8080/image?imageName=file16305630763551012xianglian.jpeg\"]', 200.00, '南通市', 5, '2021-09-02 06:11:19', 1, 5);
INSERT INTO `sh_idle_item` VALUES (18, '小米10S', '不用了，决定出手。', '[\"http://localhost:8080/image?imageName=file16305632636091013xiaomi10s.jpeg\"]', 2200.00, '南通市', 1, '2021-09-02 06:14:26', 1, 5);
INSERT INTO `sh_idle_item` VALUES (19, '饮水机1', '毕业了，转让出去。', '[\"http://localhost:8080/image?imageName=file16305637915371015yinshuiji1.jpeg\"]', 88.00, '南通市', 2, '2021-09-02 06:23:14', 1, 6);
INSERT INTO `sh_idle_item` VALUES (20, '饮水机2', '毕业了，转让出去。', '[\"http://localhost:8080/image?imageName=file16305638820121017ynshuiji2.jpeg\"]', 99.00, '南通市', 2, '2021-09-02 06:24:51', 1, 6);
INSERT INTO `sh_idle_item` VALUES (21, '热水壶1', '毕业了，转手出去。', '[\"http://localhost:8080/image?imageName=file16305640146971018reshuihu1.jpeg\"]', 30.00, '南通市', 2, '2021-09-02 06:26:58', 1, 6);
INSERT INTO `sh_idle_item` VALUES (22, '热水壶2', '毕业了，转手出去。', '[\"http://localhost:8080/image?imageName=file16305640722321019reshuihu2.jpeg\"]', 35.00, '南通市', 2, '2021-09-02 06:27:55', 1, 6);
INSERT INTO `sh_idle_item` VALUES (23, '书1', '毕业，出手。', '[\"http://localhost:8080/image?imageName=file16305644340121021tushu1.jpeg\"]', 10.00, '南通市', 4, '2021-09-02 06:33:56', 1, 7);
INSERT INTO `sh_idle_item` VALUES (24, '书2', '毕业，出手。', '[\"http://localhost:8080/image?imageName=file16305644797971022tushu2.jpeg\"]', 10.00, '南通市', 4, '2021-09-02 06:34:42', 2, 7);
INSERT INTO `sh_idle_item` VALUES (25, '书3', '毕业，出手。', '[\"http://localhost:8080/image?imageName=file16305647729631023tushu3.jpeg\"]', 10.00, '南通市', 4, '2021-09-02 06:39:36', 1, 7);
INSERT INTO `sh_idle_item` VALUES (26, '书4', '毕业，出手。', '[\"http://localhost:8080/image?imageName=file16305648532081024tushu4.jpeg\"]', 10.00, '南通市', 4, '2021-09-02 06:40:56', 1, 7);
INSERT INTO `sh_idle_item` VALUES (27, '书5', '毕业，出手。', '[\"http://localhost:8080/image?imageName=file16305648988441025tushu5.jpeg\"]', 10.00, '南通市', 4, '2021-09-02 06:41:45', 2, 7);
INSERT INTO `sh_idle_item` VALUES (75, '书6', '毕业了，有偿就出手。', '[\"http://localhost:8080/image?imageName=file16305663146861027tushu6.jpeg\"]', 10.00, '新乡市', 4, '2021-09-02 07:05:18', 1, 8);
INSERT INTO `sh_idle_item` VALUES (76, '书7', '毕业了，有偿就出手。', '[\"http://localhost:8080/image?imageName=file16305663729081028tushu7.jpeg\"]', 10.00, '新乡市', 4, '2021-09-02 07:06:15', 1, 8);
INSERT INTO `sh_idle_item` VALUES (77, '书8', '毕业了，有偿就出手。', '[\"http://localhost:8080/image?imageName=file16305664106111029tushu8.jpeg\"]', 10.00, '新乡市', 4, '2021-09-02 07:06:54', 2, 8);
INSERT INTO `sh_idle_item` VALUES (78, '书9', '毕业了，有偿就出手。', '[\"http://localhost:8080/image?imageName=file16305664630451030tushu9.jpeg\"]', 10.00, '新乡市', 4, '2021-09-02 07:07:47', 0, 8);
INSERT INTO `sh_idle_item` VALUES (79, '书10', '毕业了，有偿就出手。', '[\"http://localhost:8080/image?imageName=file16305665160441031tushu10.jpeg\"]', 10.00, '新乡市', 4, '2021-09-02 07:08:39', 1, 8);
INSERT INTO `sh_idle_item` VALUES (80, '书9', '毕业了，有偿就出手。', '[\"http://localhost:8080/image?imageName=file16305671820781034tushu9.jpeg\"]', 10.00, '新乡市', 4, '2021-09-02 07:19:44', 2, 8);

-- ----------------------------
-- Table structure for sh_message
-- ----------------------------
DROP TABLE IF EXISTS `sh_message`;
CREATE TABLE `sh_message`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  `idle_id` bigint(0) NOT NULL COMMENT '闲置主键id',
  `content` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '留言内容',
  `create_time` datetime(0) NOT NULL COMMENT '留言时间',
  `to_user` bigint(0) NOT NULL COMMENT '所回复的用户',
  `to_message` bigint(0) NULL DEFAULT NULL COMMENT '所回复的留言',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `idle_id_index`(`idle_id`) USING BTREE,
  INDEX `to_user_index`(`to_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_message
-- ----------------------------
INSERT INTO `sh_message` VALUES (34, 1, 27, '测试测试', '2021-09-03 01:24:00', 7, NULL);
INSERT INTO `sh_message` VALUES (35, 2, 3, '测试测试', '2021-09-10 00:55:32', 1, NULL);

-- ----------------------------
-- Table structure for sh_order
-- ----------------------------
DROP TABLE IF EXISTS `sh_order`;
CREATE TABLE `sh_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `user_id` bigint(0) NOT NULL COMMENT '用户主键id',
  `idle_id` bigint(0) NOT NULL COMMENT '闲置物品主键id',
  `order_price` decimal(10, 2) NOT NULL COMMENT '订单总价',
  `payment_status` tinyint(0) NOT NULL COMMENT '支付状态',
  `payment_way` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付方式',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint(0) NOT NULL COMMENT '订单状态',
  `is_deleted` tinyint(0) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_order
-- ----------------------------
INSERT INTO `sh_order` VALUES (2, '163056721392410003', 9, 77, 10.00, 1, '支付宝', '2021-09-02 07:20:14', '2021-09-02 07:21:18', 3, NULL);
INSERT INTO `sh_order` VALUES (3, '163056734482710004', 10, 80, 10.00, 1, '支付宝', '2021-09-02 07:22:25', '2021-09-02 07:22:30', 3, NULL);
INSERT INTO `sh_order` VALUES (61, '163063224538410002', 1, 27, 10.00, 1, '支付宝', '2021-09-03 01:24:05', '2021-09-03 01:40:01', 2, NULL);
INSERT INTO `sh_order` VALUES (62, '163063233203510003', 1, 24, 10.00, 1, '支付宝', '2021-09-03 01:25:32', '2021-09-03 01:27:54', 3, NULL);

-- ----------------------------
-- Table structure for sh_order_address
-- ----------------------------
DROP TABLE IF EXISTS `sh_order_address`;
CREATE TABLE `sh_order_address`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint(0) NOT NULL COMMENT '订单id',
  `consignee_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货人',
  `consignee_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '电话',
  `detail_address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orderId`(`order_id`) USING BTREE,
  INDEX `order_id_index`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_order_address
-- ----------------------------
INSERT INTO `sh_order_address` VALUES (1, 58, 'user9', '13011110009', '江苏省南通市崇川区花园一单元一号楼');
INSERT INTO `sh_order_address` VALUES (2, 59, 'user8', '13011110008', '江苏省南通市崇川区888');
INSERT INTO `sh_order_address` VALUES (3, 60, 'user9', '13011110009', '江苏省南通市崇川区花园一单元一号楼');
INSERT INTO `sh_order_address` VALUES (4, 62, 'MZ', '13011110000', '河南省新乡市原阳县测试测试');
INSERT INTO `sh_order_address` VALUES (5, 61, 'MZ', '13011110000', '河南省新乡市原阳县测试测试');

-- ----------------------------
-- Table structure for sh_user
-- ----------------------------
DROP TABLE IF EXISTS `sh_user`;
CREATE TABLE `sh_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号（手机号）',
  `user_password` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录密码',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '头像',
  `sign_in_time` datetime(0) NOT NULL COMMENT '注册时间',
  `user_status` tinyint(0) NULL DEFAULT NULL COMMENT '状态（1代表封禁）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_number`(`account_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sh_user
-- ----------------------------
INSERT INTO `sh_user` VALUES (1, '13011110000', '123456', 'MZZ', 'http://localhost:8080/image?imageName=file163048677402310021.png', '2021-09-01 10:49:01', 0);
INSERT INTO `sh_user` VALUES (2, '13011110001', '123456', 'user1', 'http://localhost:8080/image?imageName=file163048812809710042.jpg', '2021-09-01 11:47:19', NULL);
INSERT INTO `sh_user` VALUES (3, '13011110002', '123456', 'user2', 'http://localhost:8080/image?imageName=file163048887345410033.jpg', '2021-09-01 11:47:30', NULL);
INSERT INTO `sh_user` VALUES (4, '13011110003', '123456', 'user3', 'http://localhost:8080/image?imageName=file163054658458510024.jpg', '2021-09-01 11:53:15', NULL);
INSERT INTO `sh_user` VALUES (5, '13011110004', '123456', 'user4', 'http://localhost:8080/image?imageName=file163056266717710095.jpg', '2021-09-01 12:21:50', NULL);
INSERT INTO `sh_user` VALUES (6, '13011110005', '123456', 'user5', 'http://localhost:8080/image?imageName=file163056369494610146.jpg', '2021-09-01 12:22:33', NULL);
INSERT INTO `sh_user` VALUES (7, '13011110006', '123456', 'user6', 'http://localhost:8080/image?imageName=file163056437906010207.jpg', '2021-09-01 12:23:15', NULL);
INSERT INTO `sh_user` VALUES (8, '13011110007', '123456', 'user7', 'http://localhost:8080/image?imageName=file163056510678810268.jpg', '2021-09-01 12:25:36', 0);
INSERT INTO `sh_user` VALUES (9, '13011110008', '123456', 'user8', 'http://localhost:8080/image?imageName=file163056673007710329.jpg', '2021-09-01 13:24:04', 0);
INSERT INTO `sh_user` VALUES (10, '13011110009', '123456', 'user9', 'http://localhost:8080/image?imageName=file1630566760773103310.jpg', '2021-09-01 13:49:01', 0);

