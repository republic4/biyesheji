/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : recommend

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 16/01/2024 13:26:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$150000$YxMKwwSXXwQ0$F4FrK5g9T9wz1aI5j/oSYVfSjYDnYkJ4JMHSLTABoAI=', '2024-01-16 05:06:56.111037', 1, 'admins', '', '', '123456@qq.com', 1, 1, '2024-01-16 04:44:53.395557');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'item', 'xiangmu');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-01-16 04:44:25.383772');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2024-01-16 04:44:25.632452');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2024-01-16 04:44:26.420738');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-01-16 04:44:26.593285');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-01-16 04:44:26.604288');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-01-16 04:44:26.914004');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-01-16 04:44:26.996926');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-01-16 04:44:27.024678');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-01-16 04:44:27.037382');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-01-16 04:44:27.106330');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-01-16 04:44:27.112312');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-01-16 04:44:27.123126');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-01-16 04:44:27.354262');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-01-16 04:44:27.468451');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-01-16 04:44:27.490075');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-01-16 04:44:27.501712');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0smybyhfr5b3fmuwqgeogilm8o2w90nl', 'MTBhMTdhMDZjMGQ5YTNiOGU4OGIzMmRiYjc3OWYyYTFkNGI3ZDIwYTp7Im9yZGVyIjpudWxsLCJsb2dpbl9pbiI6dHJ1ZSwidXNlcl9pZCI6MTgwNywibmFtZSI6ImFkbWlucyJ9', '2022-05-07 15:33:11.240156');
INSERT INTO `django_session` VALUES ('0yp66yhsx8pymz9jtkcawjxeltloh1ab', 'MDRmZGViNWNiNzY2MDdjN2E0NTVlMzJkMDI0MjAwZmViNmIxMGJmNDp7Im9yZGVyIjpudWxsLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMGQ0NjRkNTI2MjlhZjBhMzNhZWE3OGQ0NDRlZjYyYjVkMzAwZWNiNyIsInNpbXBsZXVpXzIwMjIwMzE4Ijp0cnVlfQ==', '2022-04-01 14:56:40.453050');
INSERT INTO `django_session` VALUES ('31b6c5d8md6uc8x7hk9ehvqz28grwjyd', 'ZjBjNTM5ZmFmNTY1NzI1OTM4ZGM0N2NiNjQ5YWZiZDI1ZDQ4OGJjYzp7Im9yZGVyIjpudWxsfQ==', '2022-04-03 15:41:52.657041');
INSERT INTO `django_session` VALUES ('3w898ubdrofn0i50tmfjunn13zfackvf', 'ZjFiMmFiMWFlMmU0YTUwMTE4OGY1YjhlNzQxZDkxMzBkYjMxZjA1NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhODVmMGZjZmUwNzIxNjgyZTk4OTFjNDNlN2ZjMTg5MDI3N2FmYWNlIiwic2ltcGxldWlfMjAyNDAxMTYiOnRydWV9', '2024-01-30 04:59:31.531198');
INSERT INTO `django_session` VALUES ('6w9tfs55p31ox7erls3hf6n7o5r0u6k0', 'MDg0MThjNDk5MTNmNGJjODFhMjM1NTg2NzM4NWMwZTliM2JlNDc1ZTp7ImxvZ2luX2luIjp0cnVlLCJ1c2VyX2lkIjoxODA3LCJuYW1lIjoiYWRtaW5zIiwib3JkZXIiOm51bGx9', '2021-05-28 15:59:52.529946');
INSERT INTO `django_session` VALUES ('97fkdo796he4zu6eej6dpbmbbts4fetw', 'MTBhMTdhMDZjMGQ5YTNiOGU4OGIzMmRiYjc3OWYyYTFkNGI3ZDIwYTp7Im9yZGVyIjpudWxsLCJsb2dpbl9pbiI6dHJ1ZSwidXNlcl9pZCI6MTgwNywibmFtZSI6ImFkbWlucyJ9', '2021-05-28 15:55:34.058264');
INSERT INTO `django_session` VALUES ('dqmouzlii8beayagqb6ojekh90j1q1h9', 'NDFhYjI0ZGE3M2I3ZTcyYzVhYTAwNzRkM2QyZDQ3NGNlYjdlYjNkZDp7Im9yZGVyIjpudWxsLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTg1ZjBmY2ZlMDcyMTY4MmU5ODkxYzQzZTdmYzE4OTAyNzdhZmFjZSIsInNpbXBsZXVpXzIwMjQwMTE2Ijp0cnVlfQ==', '2024-01-30 05:07:20.274073');
INSERT INTO `django_session` VALUES ('drfjzrnvzgr25cbue997gr9vg0mz3dd3', 'MTBhMTdhMDZjMGQ5YTNiOGU4OGIzMmRiYjc3OWYyYTFkNGI3ZDIwYTp7Im9yZGVyIjpudWxsLCJsb2dpbl9pbiI6dHJ1ZSwidXNlcl9pZCI6MTgwNywibmFtZSI6ImFkbWlucyJ9', '2024-01-22 05:34:18.003629');
INSERT INTO `django_session` VALUES ('i0eie7it7kplem3xxtgq250yopdr589l', 'ZjBjNTM5ZmFmNTY1NzI1OTM4ZGM0N2NiNjQ5YWZiZDI1ZDQ4OGJjYzp7Im9yZGVyIjpudWxsfQ==', '2021-05-28 15:56:10.861781');
INSERT INTO `django_session` VALUES ('ka70fvuwfdj3fdrvhmv447cg8j70noh9', 'MTBhMTdhMDZjMGQ5YTNiOGU4OGIzMmRiYjc3OWYyYTFkNGI3ZDIwYTp7Im9yZGVyIjpudWxsLCJsb2dpbl9pbiI6dHJ1ZSwidXNlcl9pZCI6MTgwNywibmFtZSI6ImFkbWlucyJ9', '2021-05-28 15:58:31.676601');
INSERT INTO `django_session` VALUES ('lz1y9fwk6e7l7zdg59j2hmmjya0kvck0', 'ZmM1NWM1MTQ5YWQyZGNjM2RhYjMwMmMwZmMwNTliMGEzNGZjNDIyNDp7Im9yZGVyIjpudWxsLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTRiNDIwMmU1YmZlNTYxNWE5YTJlOTQyNmM2ZjA5ZWM0YjBkZDI2NSIsInNpbXBsZXVpXzIwMjQwMTA4Ijp0cnVlfQ==', '2024-01-22 02:52:57.434069');
INSERT INTO `django_session` VALUES ('nxfshevgswhefktzvnnh19cy52k1vj6p', 'ZjBjNTM5ZmFmNTY1NzI1OTM4ZGM0N2NiNjQ5YWZiZDI1ZDQ4OGJjYzp7Im9yZGVyIjpudWxsfQ==', '2022-04-01 13:33:58.619504');
INSERT INTO `django_session` VALUES ('q9oxs6beowqo5bkalbgsb6rtvv5y42xe', 'MTBhMTdhMDZjMGQ5YTNiOGU4OGIzMmRiYjc3OWYyYTFkNGI3ZDIwYTp7Im9yZGVyIjpudWxsLCJsb2dpbl9pbiI6dHJ1ZSwidXNlcl9pZCI6MTgwNywibmFtZSI6ImFkbWlucyJ9', '2022-05-07 16:37:18.264386');
INSERT INTO `django_session` VALUES ('qp6s5hiajtkaogeax57yqztua3u2a7sy', 'ZjBjNTM5ZmFmNTY1NzI1OTM4ZGM0N2NiNjQ5YWZiZDI1ZDQ4OGJjYzp7Im9yZGVyIjpudWxsfQ==', '2024-01-22 03:31:43.116511');
INSERT INTO `django_session` VALUES ('sj53ctqlkxlyuvjpfv9gzwn9u2loqm5f', 'MTBhMTdhMDZjMGQ5YTNiOGU4OGIzMmRiYjc3OWYyYTFkNGI3ZDIwYTp7Im9yZGVyIjpudWxsLCJsb2dpbl9pbiI6dHJ1ZSwidXNlcl9pZCI6MTgwNywibmFtZSI6ImFkbWlucyJ9', '2022-05-07 16:10:49.532079');
INSERT INTO `django_session` VALUES ('szarf2vf200vaemr61h4qngt8li4ygru', 'ZjBjNTM5ZmFmNTY1NzI1OTM4ZGM0N2NiNjQ5YWZiZDI1ZDQ4OGJjYzp7Im9yZGVyIjpudWxsfQ==', '2021-06-09 09:25:59.505713');
INSERT INTO `django_session` VALUES ('uykdhjftp7tzmu26q9h761sus7llic1u', 'ZjBjNTM5ZmFmNTY1NzI1OTM4ZGM0N2NiNjQ5YWZiZDI1ZDQ4OGJjYzp7Im9yZGVyIjpudWxsfQ==', '2022-04-01 12:55:33.936597');
INSERT INTO `django_session` VALUES ('vhedynnu92638mttaeep62h9k4r3hjtq', 'MDcxNWJlZWU2NjE1MjQ0ZGI1ODQ3ZTQ2ZTYzY2U3ZWIwMDkyZTE2ODp7Im9yZGVyIjoibnVtcyJ9', '2022-04-03 15:40:25.457203');
INSERT INTO `django_session` VALUES ('vnk7a266lfjkbv7697hef22kkg7b7ngt', 'ODhhYWFlODI1YWVlMTFmZTM4YmY3N2ZkNDNjYzRhNjAzYTgzZDc3MDp7ImxvZ2luX2luIjp0cnVlLCJ1c2VyX2lkIjoxODA3LCJuYW1lIjoiYWRtaW5zIiwib3JkZXIiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NGI0MjAyZTViZmU1NjE1YTlhMmU5NDI2YzZmMDllYzRiMGRkMjY1Iiwic2ltcGxldWlfMjAyMTA1MTYiOnRydWV9', '2021-05-30 15:25:15.232478');
INSERT INTO `django_session` VALUES ('wwxl0d0eq3z82ehzn3amd612lh2js5m9', 'NmM1MjM2NzNkZDI4MzRhZTgyNzkzOTZkYTYwNGZiMDVhMGIxYWVlNjp7Im9yZGVyIjpudWxsLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTRiNDIwMmU1YmZlNTYxNWE5YTJlOTQyNmM2ZjA5ZWM0YjBkZDI2NSJ9', '2021-06-09 09:36:57.867351');
INSERT INTO `django_session` VALUES ('xif29gpd1cf3y5exau4uzay1kx0jai6k', 'MDg0MThjNDk5MTNmNGJjODFhMjM1NTg2NzM4NWMwZTliM2JlNDc1ZTp7ImxvZ2luX2luIjp0cnVlLCJ1c2VyX2lkIjoxODA3LCJuYW1lIjoiYWRtaW5zIiwib3JkZXIiOm51bGx9', '2021-05-28 16:01:08.895072');
INSERT INTO `django_session` VALUES ('z6bcy3gvluhmu4tawab4xtn5tpscamo1', 'ZTkxZjJlZTNkZDBkM2MyMzE2NzAwZTI4Y2JiMGUyZGFkNzdlMmFhNjp7Im9yZGVyIjpudWxsLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTRiNDIwMmU1YmZlNTYxNWE5YTJlOTQyNmM2ZjA5ZWM0YjBkZDI2NSIsInNpbXBsZXVpXzIwMjIwMzIwIjp0cnVlfQ==', '2022-04-03 15:50:28.729934');
INSERT INTO `django_session` VALUES ('zw1201wifi4ud2z76xz56la5op24p7qg', 'ZjBjNTM5ZmFmNTY1NzI1OTM4ZGM0N2NiNjQ5YWZiZDI1ZDQ4OGJjYzp7Im9yZGVyIjpudWxsfQ==', '2021-05-28 15:54:11.581720');

-- ----------------------------
-- Table structure for item_comment
-- ----------------------------
DROP TABLE IF EXISTS `item_comment`;
CREATE TABLE `item_comment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `movie_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_comment_movie_id_5e9638b9_fk_item_xiangmu_id`(`movie_id`) USING BTREE,
  INDEX `item_comment_user_id_a7bedcb3_fk_item_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `item_comment_movie_id_5e9638b9_fk_item_xiangmu_id` FOREIGN KEY (`movie_id`) REFERENCES `item_xiangmu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_comment_user_id_a7bedcb3_fk_item_user_id` FOREIGN KEY (`user_id`) REFERENCES `item_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_comment
-- ----------------------------
INSERT INTO `item_comment` VALUES (1, '66666666', '2024-01-08 09:34:27.693867', 6, 2);
INSERT INTO `item_comment` VALUES (2, '6666666', '2024-01-08 09:34:54.810737', 5, 2);
INSERT INTO `item_comment` VALUES (3, '6666666', '2024-01-16 03:24:19.341686', 17, 1);
INSERT INTO `item_comment` VALUES (4, '不错', '2024-01-16 05:05:46.282278', 266, 1);

-- ----------------------------
-- Table structure for item_likecomment
-- ----------------------------
DROP TABLE IF EXISTS `item_likecomment`;
CREATE TABLE `item_likecomment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `comment_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_likecomment_comment_id_5b1a5e9e_fk_item_comment_id`(`comment_id`) USING BTREE,
  INDEX `item_likecomment_user_id_c36f9bce_fk_item_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `item_likecomment_comment_id_5b1a5e9e_fk_item_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `item_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_likecomment_user_id_c36f9bce_fk_item_user_id` FOREIGN KEY (`user_id`) REFERENCES `item_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_likecomment
-- ----------------------------
INSERT INTO `item_likecomment` VALUES (1, 2, 2);

-- ----------------------------
-- Table structure for item_rate
-- ----------------------------
DROP TABLE IF EXISTS `item_rate`;
CREATE TABLE `item_rate`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `mark` double NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `movie_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_rate_movie_id_9e3241ad_fk_item_xiangmu_id`(`movie_id`) USING BTREE,
  INDEX `item_rate_user_id_17602d8f_fk_item_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `item_rate_movie_id_9e3241ad_fk_item_xiangmu_id` FOREIGN KEY (`movie_id`) REFERENCES `item_xiangmu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_rate_user_id_17602d8f_fk_item_user_id` FOREIGN KEY (`user_id`) REFERENCES `item_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_rate
-- ----------------------------
INSERT INTO `item_rate` VALUES (1, 5, '2024-01-08 09:24:03.587019', 7, 1);
INSERT INTO `item_rate` VALUES (2, 5, '2024-01-08 09:25:18.669583', 9, 1);
INSERT INTO `item_rate` VALUES (3, 5, '2024-01-08 09:28:02.976555', 6, 2);
INSERT INTO `item_rate` VALUES (4, 5, '2024-01-16 03:24:08.125308', 4, 1);
INSERT INTO `item_rate` VALUES (5, 3, '2024-01-16 03:24:12.524866', 17, 1);
INSERT INTO `item_rate` VALUES (6, 5, '2024-01-16 05:05:37.761928', 162, 1);
INSERT INTO `item_rate` VALUES (7, 5, '2024-01-16 05:06:36.713190', 20, 1);

-- ----------------------------
-- Table structure for item_tags
-- ----------------------------
DROP TABLE IF EXISTS `item_tags`;
CREATE TABLE `item_tags`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_tags
-- ----------------------------
INSERT INTO `item_tags` VALUES (19, '一汽-大众');
INSERT INTO `item_tags` VALUES (31, '一汽-大众奥迪');
INSERT INTO `item_tags` VALUES (51, '一汽丰田');
INSERT INTO `item_tags` VALUES (50, '一汽奔腾');
INSERT INTO `item_tags` VALUES (13, '一汽红旗');
INSERT INTO `item_tags` VALUES (17, '上汽大众');
INSERT INTO `item_tags` VALUES (47, '上汽大通');
INSERT INTO `item_tags` VALUES (30, '上汽奥迪');
INSERT INTO `item_tags` VALUES (1, '上汽通用五菱');
INSERT INTO `item_tags` VALUES (21, '上汽通用五菱（进口）');
INSERT INTO `item_tags` VALUES (23, '上汽通用凯迪拉克');
INSERT INTO `item_tags` VALUES (20, '上汽通用别克');
INSERT INTO `item_tags` VALUES (25, '上汽通用雪佛兰');
INSERT INTO `item_tags` VALUES (24, '上汽集团');
INSERT INTO `item_tags` VALUES (34, '东风小康');
INSERT INTO `item_tags` VALUES (48, '东风日产启辰');
INSERT INTO `item_tags` VALUES (38, '东风本田');
INSERT INTO `item_tags` VALUES (12, '东风汽车');
INSERT INTO `item_tags` VALUES (14, '保时捷');
INSERT INTO `item_tags` VALUES (53, '其他');
INSERT INTO `item_tags` VALUES (40, '创维汽车');
INSERT INTO `item_tags` VALUES (43, '前途汽车');
INSERT INTO `item_tags` VALUES (28, '北京奔驰');
INSERT INTO `item_tags` VALUES (49, '北京汽车');
INSERT INTO `item_tags` VALUES (41, '北京现代');
INSERT INTO `item_tags` VALUES (22, '北汽新能源');
INSERT INTO `item_tags` VALUES (16, '华晨宝马');
INSERT INTO `item_tags` VALUES (7, '合众汽车');
INSERT INTO `item_tags` VALUES (32, '合创汽车');
INSERT INTO `item_tags` VALUES (10, '奇瑞新能源');
INSERT INTO `item_tags` VALUES (52, '奥迪(进口)');
INSERT INTO `item_tags` VALUES (26, '宝马(进口)');
INSERT INTO `item_tags` VALUES (5, '小鹏汽车');
INSERT INTO `item_tags` VALUES (35, '广汽三菱');
INSERT INTO `item_tags` VALUES (37, '广汽丰田');
INSERT INTO `item_tags` VALUES (8, '广汽埃安新能源');
INSERT INTO `item_tags` VALUES (42, '广汽本田');
INSERT INTO `item_tags` VALUES (2, '比亚迪');
INSERT INTO `item_tags` VALUES (4, '比亚迪（进口）');
INSERT INTO `item_tags` VALUES (27, '江汽集团');
INSERT INTO `item_tags` VALUES (46, '江淮汽车');
INSERT INTO `item_tags` VALUES (44, '江铃福特');
INSERT INTO `item_tags` VALUES (39, '沃尔沃亚太');
INSERT INTO `item_tags` VALUES (45, '爱驰汽车');
INSERT INTO `item_tags` VALUES (11, '特斯拉(进口)');
INSERT INTO `item_tags` VALUES (3, '特斯拉中国');
INSERT INTO `item_tags` VALUES (18, '蔚来');
INSERT INTO `item_tags` VALUES (29, '路特斯');
INSERT INTO `item_tags` VALUES (9, '长城汽车');
INSERT INTO `item_tags` VALUES (6, '长安汽车');
INSERT INTO `item_tags` VALUES (15, '长安福特');
INSERT INTO `item_tags` VALUES (33, '长安马自达');
INSERT INTO `item_tags` VALUES (36, '雷克萨斯');

-- ----------------------------
-- Table structure for item_user
-- ----------------------------
DROP TABLE IF EXISTS `item_user`;
CREATE TABLE `item_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 383 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_user
-- ----------------------------
INSERT INTO `item_user` VALUES (1, 'admins', 'admins', 'admins@qq.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (2, 'user0001', 'user0001', 'user0001@qq.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (83, 'dvadt', 'dvadt', 'dvadt@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (84, 'twkbi', 'twkbi', 'twkbi@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (85, 'bzgbd', 'bzgbd', 'bzgbd@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (86, 'skksy', 'skksy', 'skksy@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (87, 'smile001', '123456', '123@qq.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (88, 'xgbke', 'xgbke', 'xgbke@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (89, 'goezp', 'goezp', 'goezp@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (90, '_e_po', '_e_po', '_e_po@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (91, 'prhms', 'prhms', 'prhms@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (92, 'xf_kw', 'xf_kw', 'xf_kw@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (93, 'g_wzu', 'g_wzu', 'g_wzu@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (94, 'jhssx', 'jhssx', 'jhssx@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (95, 'aeu_n', 'aeu_n', 'aeu_n@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (96, 'adpgc', 'adpgc', 'adpgc@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (97, 'nc_ka', 'nc_ka', 'nc_ka@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (98, 'ptgey', 'ptgey', 'ptgey@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (99, '_azna', '_azna', '_azna@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (100, 'uonjb', 'uonjb', 'uonjb@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (101, 'zyopa', 'zyopa', 'zyopa@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (102, 'qwugs', 'qwugs', 'qwugs@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (103, 'vdqmw', 'vdqmw', 'vdqmw@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (104, 'ino_m', 'ino_m', 'ino_m@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (105, 'igtjg', 'igtjg', 'igtjg@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (106, 'njmpi', 'njmpi', 'njmpi@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (107, 'yukhk', 'yukhk', 'yukhk@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (108, 'wyaod', 'wyaod', 'wyaod@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (109, 'ceufo', 'ceufo', 'ceufo@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (110, 'ogxec', 'ogxec', 'ogxec@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (111, 'rbhnj', 'rbhnj', 'rbhnj@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (112, 'hyovs', 'hyovs', 'hyovs@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (113, 'jknwn', 'jknwn', 'jknwn@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (114, 'kowgn', 'kowgn', 'kowgn@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (115, 'zxgjq', 'zxgjq', 'zxgjq@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (116, 'pntaz', 'pntaz', 'pntaz@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (117, 'eq_uj', 'eq_uj', 'eq_uj@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (118, 'quetq', 'quetq', 'quetq@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (119, 'bxvhr', 'bxvhr', 'bxvhr@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (120, 'mznpr', 'mznpr', 'mznpr@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (121, 'nnigz', 'nnigz', 'nnigz@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (122, 'cax_j', 'cax_j', 'cax_j@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (123, '_knkw', '_knkw', '_knkw@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (124, 'mpkue', 'mpkue', 'mpkue@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (125, 'pauzq', 'pauzq', 'pauzq@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (126, 'cjjya', 'cjjya', 'cjjya@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (127, 'frkyc', 'frkyc', 'frkyc@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (128, 'rsj_e', 'rsj_e', 'rsj_e@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (129, 'fvwdy', 'fvwdy', 'fvwdy@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (130, 'deedh', 'deedh', 'deedh@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (131, '_esdf', '_esdf', '_esdf@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (132, 'phmpw', 'phmpw', 'phmpw@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (133, 'wbs_s', 'wbs_s', 'wbs_s@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (134, 'rswqf', 'rswqf', 'rswqf@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (135, 'rbitd', 'rbitd', 'rbitd@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (136, 'fnamp', 'fnamp', 'fnamp@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (137, 'ytqbx', 'ytqbx', 'ytqbx@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (138, 'rgfkg', 'rgfkg', 'rgfkg@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (139, 'mdcqp', 'mdcqp', 'mdcqp@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (140, 'wewxh', 'wewxh', 'wewxh@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (141, 'rraes', 'rraes', 'rraes@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (142, 'ksdia', 'ksdia', 'ksdia@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (143, 'ftjvg', 'ftjvg', 'ftjvg@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (144, 'kkteg', 'kkteg', 'kkteg@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (145, 'rfkn_', 'rfkn_', 'rfkn_@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (146, 'zqv_r', 'zqv_r', 'zqv_r@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (147, 'pcyrr', 'pcyrr', 'pcyrr@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (148, 'drcmq', 'drcmq', 'drcmq@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (149, 'sjzm_', 'sjzm_', 'sjzm_@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (150, 'ofdef', 'ofdef', 'ofdef@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (151, 'ianhq', 'ianhq', 'ianhq@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (152, 'cqxoj', 'cqxoj', 'cqxoj@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (153, 'wjspg', 'wjspg', 'wjspg@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (154, 'eyktr', 'eyktr', 'eyktr@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (155, 'rcyg_', 'rcyg_', 'rcyg_@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (156, 'dfytb', 'dfytb', 'dfytb@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (157, 'pjuds', 'pjuds', 'pjuds@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (158, 'droek', 'droek', 'droek@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (159, 'fqaex', 'fqaex', 'fqaex@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (160, 'ttwoe', 'ttwoe', 'ttwoe@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (161, 'xdfon', 'xdfon', 'xdfon@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (162, 'hujda', 'hujda', 'hujda@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (163, 'ezshg', 'ezshg', 'ezshg@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (164, 'bscmv', 'bscmv', 'bscmv@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (165, 'ezcat', 'ezcat', 'ezcat@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (166, 'rkjud', 'rkjud', 'rkjud@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (167, 'ny_nm', 'ny_nm', 'ny_nm@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (168, 'piuwj', 'piuwj', 'piuwj@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (169, 'vuxhf', 'vuxhf', 'vuxhf@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (170, 'ebmh_', 'ebmh_', 'ebmh_@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (171, 'qases', 'qases', 'qases@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (172, 'qx_pt', 'qx_pt', 'qx_pt@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (173, 'nbxnt', 'nbxnt', 'nbxnt@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (174, 'jcbfy', 'jcbfy', 'jcbfy@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (175, 'hgzwf', 'hgzwf', 'hgzwf@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (176, 'csxxu', 'csxxu', 'csxxu@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (177, 'hg_rq', 'hg_rq', 'hg_rq@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (178, 'hroua', 'hroua', 'hroua@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (179, 'svfu_', 'svfu_', 'svfu_@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (180, 'zhrtr', 'zhrtr', 'zhrtr@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (181, 'zcqwe', 'zcqwe', 'zcqwe@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (182, 'q_vjz', 'q_vjz', 'q_vjz@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (183, 'fykya', 'fykya', 'fykya@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (184, 'zjuti', 'zjuti', 'zjuti@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (185, 'gkaom', 'gkaom', 'gkaom@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (186, 'yrbry', 'yrbry', 'yrbry@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (187, 'qmbvf', 'qmbvf', 'qmbvf@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (188, 'dyfxj', 'dyfxj', 'dyfxj@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (189, 'qgfhy', 'qgfhy', 'qgfhy@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (190, 'uyhmf', 'uyhmf', 'uyhmf@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (191, 'gwger', 'gwger', 'gwger@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (192, 'mtzcd', 'mtzcd', 'mtzcd@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (193, 'hvnpt', 'hvnpt', 'hvnpt@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (194, 'ruzjo', 'ruzjo', 'ruzjo@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (195, 'rid_j', 'rid_j', 'rid_j@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (196, 'mvzzj', 'mvzzj', 'mvzzj@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (197, 'xocdu', 'xocdu', 'xocdu@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (198, 'dwvww', 'dwvww', 'dwvww@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (199, 'sadss', 'sadss', 'sadss@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (200, 'd_ryi', 'd_ryi', 'd_ryi@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (201, 'cjce_', 'cjce_', 'cjce_@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (202, 'vaygv', 'vaygv', 'vaygv@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (203, 'xdcpd', 'xdcpd', 'xdcpd@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (204, 'yhgwk', 'yhgwk', 'yhgwk@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (205, 'wjwpd', 'wjwpd', 'wjwpd@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (206, 'nkydb', 'nkydb', 'nkydb@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (207, 'aqkev', 'aqkev', 'aqkev@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (208, 'mykwi', 'mykwi', 'mykwi@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (209, 'wqhfa', 'wqhfa', 'wqhfa@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (210, 'uzkro', 'uzkro', 'uzkro@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (211, 'egbpc', 'egbpc', 'egbpc@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (212, 'ywjkg', 'ywjkg', 'ywjkg@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (213, 'aktuj', 'aktuj', 'aktuj@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (214, 'dhqmt', 'dhqmt', 'dhqmt@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (215, 'bd_af', 'bd_af', 'bd_af@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (216, 'pxvcx', 'pxvcx', 'pxvcx@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (217, 'ojsqm', 'ojsqm', 'ojsqm@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (218, 't_vaj', 't_vaj', 't_vaj@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (219, '_shcn', '_shcn', '_shcn@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (220, 'preep', 'preep', 'preep@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (221, 'g_maj', 'g_maj', 'g_maj@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (222, 'kasmw', 'kasmw', 'kasmw@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (223, 'acptu', 'acptu', 'acptu@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (224, 'dwcvr', 'dwcvr', 'dwcvr@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (225, 'ueqkj', 'ueqkj', 'ueqkj@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (226, 'isdbz', 'isdbz', 'isdbz@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (227, 'puxqk', 'puxqk', 'puxqk@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (228, 'jciyg', 'jciyg', 'jciyg@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (229, 'k_oaq', 'k_oaq', 'k_oaq@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (230, 'kfajf', 'kfajf', 'kfajf@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (231, 'sd_qv', 'sd_qv', 'sd_qv@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (232, 'oeu_w', 'oeu_w', 'oeu_w@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (233, 'ttzqk', 'ttzqk', 'ttzqk@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (234, 'miniq', 'miniq', 'miniq@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (235, 'fxtgs', 'fxtgs', 'fxtgs@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (236, 'rjqrh', 'rjqrh', 'rjqrh@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (237, 'tbsdr', 'tbsdr', 'tbsdr@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (238, 'kiek_', 'kiek_', 'kiek_@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (239, 'ekaiw', 'ekaiw', 'ekaiw@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (240, 'npn_v', 'npn_v', 'npn_v@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (241, 'cuexz', 'cuexz', 'cuexz@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (242, 'cbhub', 'cbhub', 'cbhub@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (243, 'bpeym', 'bpeym', 'bpeym@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (244, 'dqgzq', 'dqgzq', 'dqgzq@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (245, 'wvtzv', 'wvtzv', 'wvtzv@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (246, 'ebzn_', 'ebzn_', 'ebzn_@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (247, 'expvh', 'expvh', 'expvh@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (248, 'ggjia', 'ggjia', 'ggjia@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (249, 'mvqpm', 'mvqpm', 'mvqpm@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (250, 'xtpmb', 'xtpmb', 'xtpmb@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (251, '_otwp', '_otwp', '_otwp@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (252, 'vfwir', 'vfwir', 'vfwir@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (253, 'rngjc', 'rngjc', 'rngjc@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (254, 'ekevm', 'ekevm', 'ekevm@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (255, 'qenaw', 'qenaw', 'qenaw@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (256, 'qggkk', 'qggkk', 'qggkk@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (257, 'pyyjo', 'pyyjo', 'pyyjo@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (258, 'wbupe', 'wbupe', 'wbupe@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (259, 'eegbq', 'eegbq', 'eegbq@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (260, 'gmrb_', 'gmrb_', 'gmrb_@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (261, 'tfxrr', 'tfxrr', 'tfxrr@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (262, 'eujzo', 'eujzo', 'eujzo@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (263, 'iswnq', 'iswnq', 'iswnq@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (264, 'ikzdn', 'ikzdn', 'ikzdn@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (265, 'awhen', 'awhen', 'awhen@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (266, 'ebmmk', 'ebmmk', 'ebmmk@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (267, 'rn_mn', 'rn_mn', 'rn_mn@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (268, 'em_xz', 'em_xz', 'em_xz@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (269, 'cbkdf', 'cbkdf', 'cbkdf@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (270, 'afzca', 'afzca', 'afzca@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (271, 'gvkqr', 'gvkqr', 'gvkqr@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (272, 'ibuc_', 'ibuc_', 'ibuc_@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (273, 'kwtjd', 'kwtjd', 'kwtjd@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (274, 'yhkun', 'yhkun', 'yhkun@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (275, 'cogyb', 'cogyb', 'cogyb@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (276, 'yp_vu', 'yp_vu', 'yp_vu@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (277, 'abogb', 'abogb', 'abogb@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (278, 'stgto', 'stgto', 'stgto@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (279, 'pwkea', 'pwkea', 'pwkea@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (280, 'ivibc', 'ivibc', 'ivibc@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (281, 'vofth', 'vofth', 'vofth@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (282, 'j_dtf', 'j_dtf', 'j_dtf@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (283, 'gmt__', 'gmt__', 'gmt__@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (284, 'fgqiy', 'fgqiy', 'fgqiy@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (285, 'eaozb', 'eaozb', 'eaozb@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (286, 'bxbfe', 'bxbfe', 'bxbfe@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (287, '_myux', '_myux', '_myux@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (288, 'ppzec', 'ppzec', 'ppzec@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (289, 'ovzds', 'ovzds', 'ovzds@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (290, 'mkenb', 'mkenb', 'mkenb@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (291, 'qcbs_', 'qcbs_', 'qcbs_@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (292, 'iwbg_', 'iwbg_', 'iwbg_@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (293, 'vtpbi', 'vtpbi', 'vtpbi@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (294, 'xwiiq', 'xwiiq', 'xwiiq@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (295, 'cozdh', 'cozdh', 'cozdh@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (296, 'wnxpn', 'wnxpn', 'wnxpn@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (297, 'pk_uu', 'pk_uu', 'pk_uu@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (298, 'hnpbb', 'hnpbb', 'hnpbb@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (299, 'bojqh', 'bojqh', 'bojqh@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (300, 'tvcds', 'tvcds', 'tvcds@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (301, 'eshnf', 'eshnf', 'eshnf@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (302, 'xkihh', 'xkihh', 'xkihh@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (303, 'oisqe', 'oisqe', 'oisqe@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (304, 'hagpu', 'hagpu', 'hagpu@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (305, 'oudvw', 'oudvw', 'oudvw@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (306, 'fwrqv', 'fwrqv', 'fwrqv@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (307, 'fkwfq', 'fkwfq', 'fkwfq@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (308, 'swxiv', 'swxiv', 'swxiv@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (309, 'qgnpr', 'qgnpr', 'qgnpr@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (310, 'ifdpu', 'ifdpu', 'ifdpu@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (311, 'xqrpu', 'xqrpu', 'xqrpu@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (312, 'xbezg', 'xbezg', 'xbezg@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (313, 'bqgou', 'bqgou', 'bqgou@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (314, 'qeeuv', 'qeeuv', 'qeeuv@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (315, 'sybqw', 'sybqw', 'sybqw@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (316, 'rosfp', 'rosfp', 'rosfp@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (317, 'oupac', 'oupac', 'oupac@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (318, 'opcnz', 'opcnz', 'opcnz@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (319, 'nyoeu', 'nyoeu', 'nyoeu@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (320, 'nioje', 'nioje', 'nioje@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (321, 'ejnoa', 'ejnoa', 'ejnoa@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (322, 'sxqdu', 'sxqdu', 'sxqdu@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (323, 'qnpks', 'qnpks', 'qnpks@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (324, 'zdixw', 'zdixw', 'zdixw@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (325, 'dedhu', 'dedhu', 'dedhu@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (326, 'kzvpt', 'kzvpt', 'kzvpt@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (327, 'jhynn', 'jhynn', 'jhynn@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (328, 'bssrr', 'bssrr', 'bssrr@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (329, 'iwgo_', 'iwgo_', 'iwgo_@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (330, 'vi_rx', 'vi_rx', 'vi_rx@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (331, 'ipbku', 'ipbku', 'ipbku@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (332, 'jbppb', 'jbppb', 'jbppb@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (333, 'pehja', 'pehja', 'pehja@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (334, 'kzvuq', 'kzvuq', 'kzvuq@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (335, 'yuwc_', 'yuwc_', 'yuwc_@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (336, '_hnby', '_hnby', '_hnby@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (337, 'uofci', 'uofci', 'uofci@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (338, 'putfz', 'putfz', 'putfz@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (339, 'bwsxh', 'bwsxh', 'bwsxh@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (340, 'eqjpd', 'eqjpd', 'eqjpd@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (341, 'inqvm', 'inqvm', 'inqvm@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (342, 'musbx', 'musbx', 'musbx@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (343, 'easyk', 'easyk', 'easyk@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (344, 'kjbmq', 'kjbmq', 'kjbmq@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (345, 'yvqpa', 'yvqpa', 'yvqpa@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (346, 'pizvq', 'pizvq', 'pizvq@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (347, 'igydb', 'igydb', 'igydb@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (348, 'm_urf', 'm_urf', 'm_urf@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (349, 'ttiux', 'ttiux', 'ttiux@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (350, '_mzj_', '_mzj_', '_mzj_@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (351, 'hnfyv', 'hnfyv', 'hnfyv@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (352, 'ccxeu', 'ccxeu', 'ccxeu@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (353, 'epsqv', 'epsqv', 'epsqv@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (354, 'df_bn', 'df_bn', 'df_bn@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (355, 'i_itf', 'i_itf', 'i_itf@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (356, 'jxqwp', 'jxqwp', 'jxqwp@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (357, 'eaoqw', 'eaoqw', 'eaoqw@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (358, 'atxdr', 'atxdr', 'atxdr@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (359, 'xgmec', 'xgmec', 'xgmec@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (360, 'rqqdx', 'rqqdx', 'rqqdx@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (361, 'qfxju', 'qfxju', 'qfxju@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (362, 'dhjqx', 'dhjqx', 'dhjqx@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (363, 'kyeib', 'kyeib', 'kyeib@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (364, 'ymaxi', 'ymaxi', 'ymaxi@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (365, 'zbfii', 'zbfii', 'zbfii@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (366, 'ygyaz', 'ygyaz', 'ygyaz@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (367, 'riguq', 'riguq', 'riguq@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (368, 'qz_fu', 'qz_fu', 'qz_fu@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (369, 'cqibf', 'cqibf', 'cqibf@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (370, 'sgwwm', 'sgwwm', 'sgwwm@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (371, 'vrzrb', 'vrzrb', 'vrzrb@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (372, 'tuxgr', 'tuxgr', 'tuxgr@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (373, 'muhky', 'muhky', 'muhky@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (374, 'aqonn', 'aqonn', 'aqonn@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (375, 'icdtd', 'icdtd', 'icdtd@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (376, 'kwvxx', 'kwvxx', 'kwvxx@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (377, 'zqhpj', 'zqhpj', 'zqhpj@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (378, 'iuewp', 'iuewp', 'iuewp@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (379, 'nxxei', 'nxxei', 'nxxei@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (380, '_e_we', '_e_we', '_e_we@163.com', '2024-01-08 09:23:26.919875');
INSERT INTO `item_user` VALUES (381, 'ziiwp', 'ziiwp', 'ziiwp@163.com', '2024-01-08 09:21:56.948515');
INSERT INTO `item_user` VALUES (382, 'qcjix', 'qcjix', 'qcjix@163.com', '2024-01-08 09:23:26.919875');

-- ----------------------------
-- Table structure for item_usertagprefer
-- ----------------------------
DROP TABLE IF EXISTS `item_usertagprefer`;
CREATE TABLE `item_usertagprefer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `score` double NOT NULL,
  `tag_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_usertagprefer_tag_id_347ce58b_fk_item_tags_id`(`tag_id`) USING BTREE,
  INDEX `item_usertagprefer_user_id_c5980334_fk_item_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `item_usertagprefer_tag_id_347ce58b_fk_item_tags_id` FOREIGN KEY (`tag_id`) REFERENCES `item_tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_usertagprefer_user_id_c5980334_fk_item_user_id` FOREIGN KEY (`user_id`) REFERENCES `item_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_usertagprefer
-- ----------------------------
INSERT INTO `item_usertagprefer` VALUES (1, 5, 1, 1);
INSERT INTO `item_usertagprefer` VALUES (2, 5, 1, 1);
INSERT INTO `item_usertagprefer` VALUES (3, 5, 1, 2);
INSERT INTO `item_usertagprefer` VALUES (4, 5, 3, 1);
INSERT INTO `item_usertagprefer` VALUES (5, 3, 10, 1);
INSERT INTO `item_usertagprefer` VALUES (6, 5, 34, 1);
INSERT INTO `item_usertagprefer` VALUES (7, 5, 5, 1);

-- ----------------------------
-- Table structure for item_xiangmu
-- ----------------------------
DROP TABLE IF EXISTS `item_xiangmu`;
CREATE TABLE `item_xiangmu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c4` date NOT NULL,
  `c5` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c6` int(0) NOT NULL,
  `c7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c8` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c9` int(0) NOT NULL,
  `c10` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c11` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c12` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_xiangmu
-- ----------------------------
INSERT INTO `item_xiangmu` VALUES (1, '五菱宏光MINIEV', '3.28-4.98万', '2022新款', '2024-03-01', '上汽通用五菱', 10000, '3.12', '********************车型总数：共14款车型********************车型级别：微型车********************纯电续航里程km：120********************充电时间h：慢充6.5小时********************', 50005, 'https://p3.dcarimg.com/img/motor-img/6efbde874de291b8176fa27814b9bef3~332x0.webp', 'picture/1.jpg', 'https://www.dongchedi.com/auto/series/4499');
INSERT INTO `item_xiangmu` VALUES (2, '汉EV', '21.48-28.45万', '中大型轿车销量NO.1', '2023-07-01', '比亚迪', 9999, '4.03', '********************车型总数：共7款车型********************车型级别：中大型车********************纯电续航里程km：506********************充电时间h：快充0.42小时********************', 50002, 'https://p3.dcarimg.com/img/motor-img/a12a522afc9ea8a0f30431023967ea9d~332x0.webp', 'picture/2.jpg', 'https://www.dongchedi.com/auto/series/4300');
INSERT INTO `item_xiangmu` VALUES (3, 'Model Y', '31.69-41.79万', '中型SUV销量NO.1', '2023-11-01', '特斯拉中国', 9998, '4.01', '********************车型总数：共3款车型********************车型级别：中型SUV********************纯电续航里程km：545********************充电时间h：快充1小时慢充10小时********************', 50007, 'https://p3.dcarimg.com/img/motor-img/369ece92bbd1c98470e0b22605b78f31~332x0.webp', 'picture/3.jpg', 'https://www.dongchedi.com/auto/series/4363');
INSERT INTO `item_xiangmu` VALUES (4, 'Model 3', '27.99-36.79万', '纯电动销量NO.8', '2023-11-01', '特斯拉中国', 9997, '4.01', '********************车型总数：共2款车型********************车型级别：中型车********************纯电续航里程km：556********************充电时间h：快充1小时慢充10小时********************', 50004, 'https://p3.dcarimg.com/img/motor-img/85cdbb2cddad619dc7cde59f7bf9d3a3~332x0.webp', 'picture/4.jpg', 'https://www.dongchedi.com/auto/series/3762');
INSERT INTO `item_xiangmu` VALUES (5, '海豚', '10.28-13.08万', '小型轿车销量NO.1', '2023-08-01', '比亚迪', 9996, '3.67', '********************车型总数：共4款车型********************车型级别：小型车********************纯电续航里程km：301********************充电时间h：快充0.5小时********************', 49996, 'https://p3.dcarimg.com/img/motor-img/0ac74e188937a245695428c2db36af92~332x0.webp', 'picture/5.jpg', 'https://www.dongchedi.com/auto/series/5008');
INSERT INTO `item_xiangmu` VALUES (6, '小鹏汽车P7', '23.99-42.99万', '纯电动销量NO.15', '2023-11-01', '小鹏汽车', 9995, '4.03', '********************车型总数：共16款车型********************车型级别：中型车********************纯电续航里程km：480********************充电时间h：快充0.45小时慢充5小时********************', 49995, 'https://p3.dcarimg.com/img/motor-img/5d49eb0e339b5f9a2d2ad0f9ff5f50aa~332x0.webp', 'picture/6.jpg', 'https://www.dongchedi.com/auto/series/3352');
INSERT INTO `item_xiangmu` VALUES (7, '元PLUS', '13.78-16.58万', '纯电动销量NO.9', '2024-02-01', '比亚迪', 9994, '3.63', '********************车型总数：共5款车型********************车型级别：紧凑型SUV********************纯电续航里程km：430********************充电时间h：快充0.5小时慢充7.13小时********************', 49994, 'https://p3.dcarimg.com/img/motor-img/73eaa859a85ce54d417dfdfc4b1e9f0b~332x0.webp', 'picture/7.jpg', 'https://www.dongchedi.com/auto/series/5248');
INSERT INTO `item_xiangmu` VALUES (8, '奔奔E-Star', '4.98-7.48万', '微型轿车销量NO.3', '2023-11-01', '长安汽车', 9993, '3.23', '********************车型总数：共9款车型********************车型级别：微型车********************纯电续航里程km：301********************充电时间h：慢充12小时********************', 49993, 'https://p3.dcarimg.com/img/motor-img/5a66c6bc0c1d71c7e6f68f53b902d1b9~332x0.webp', 'picture/8.jpg', 'https://www.dongchedi.com/auto/series/4416');
INSERT INTO `item_xiangmu` VALUES (9, 'ZEEKR 001', '29.90-36.80万', '中大型轿车销量NO.5', '2023-04-01', '极氪', 9992, '4.08', '********************车型总数：共3款车型********************车型级别：中大型车********************纯电续航里程km：712********************充电时间h：-********************', 49992, 'https://p3.dcarimg.com/img/motor-img/9aa00a322608729b00545efd63e9c137~332x0.webp', 'picture/9.jpg', 'https://www.dongchedi.com/auto/series/5015');
INSERT INTO `item_xiangmu` VALUES (10, '哪吒V', '7.49-12.08万', '2022新款', '2023-12-01', '合众汽车', 9991, '3.3', '********************车型总数：共9款车型********************车型级别：小型SUV********************纯电续航里程km：301********************充电时间h：快充0.5小时慢充12小时********************', 49991, 'https://p3.dcarimg.com/img/motor-img/b1c609f886fde261cd413819766215b7~332x0.webp', 'picture/10.jpg', 'https://www.dongchedi.com/auto/series/4629');
INSERT INTO `item_xiangmu` VALUES (11, 'AION S', '10.98-18.38万', '纯电动销量NO.17', '2024-01-01', '广汽埃安新能源', 9990, '3.78', '********************车型总数：共17款车型********************车型级别：紧凑型车********************纯电续航里程km：510********************充电时间h：快充0.7小时慢充10小时********************', 49990, 'https://p3.dcarimg.com/img/motor-img/7d99d3eef9fba8765615b27ad9825cd7~332x0.webp', 'picture/11.jpg', 'https://www.dongchedi.com/auto/series/3101');
INSERT INTO `item_xiangmu` VALUES (12, '欧拉好猫', '12.59-15.59万', '小型轿车销量NO.4', '2024-03-01', '长城汽车', 9989, '3.49', '********************车型总数：共6款车型********************车型级别：小型车********************纯电续航里程km：401********************充电时间h：快充0.5小时慢充8小时********************', 49989, 'https://p3.dcarimg.com/img/motor-img/087c1f33dbf8dce951660ed0c151942c~332x0.webp', 'picture/12.jpg', 'https://www.dongchedi.com/auto/series/4635');
INSERT INTO `item_xiangmu` VALUES (13, '海豹', '暂无报价', '', '2024-01-01', '比亚迪', 9988, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：********************充电时间h：-********************', 49988, 'https://p3.dcarimg.com/img/motor-img/ce2301d824a8069acf3ae15b8a9a8b1a~332x0.webp', 'picture/13.jpg', 'https://www.dongchedi.com/auto/series/5579');
INSERT INTO `item_xiangmu` VALUES (14, '秦PLUS EV', '13.88-17.58万', '纯电动销量NO.5', '2023-04-01', '比亚迪', 9987, '3.65', '********************车型总数：共6款车型********************车型级别：紧凑型车********************纯电续航里程km：400********************充电时间h：快充0.5小时********************', 49987, 'https://p3.dcarimg.com/img/motor-img/68a3930d446bee29c91048fa02cf7e87~332x0.webp', 'picture/14.jpg', 'https://www.dongchedi.com/auto/series/4899');
INSERT INTO `item_xiangmu` VALUES (15, 'AION Y', '12.96-16.76万', '', '2023-11-01', '广汽埃安新能源', 9986, '3.71', '********************车型总数：共6款车型********************车型级别：紧凑型SUV********************纯电续航里程km：500********************充电时间h：快充0.57小时慢充9.5小时********************', 49986, 'https://p3.dcarimg.com/img/motor-img/a5fa6ea169e529ef121b4d128912c523~332x0.webp', 'picture/15.jpg', 'https://www.dongchedi.com/auto/series/4814');
INSERT INTO `item_xiangmu` VALUES (16, '哪吒U', '11.78-20.18万', '2022新款', '2024-04-01', '合众汽车', 9985, '3.62', '********************车型总数：共13款车型********************车型级别：紧凑型SUV********************纯电续航里程km：400********************充电时间h：快充0.5小时慢充7小时********************', 49985, 'https://p3.dcarimg.com/img/motor-img/384ce2f15b9f963cec906a1a45b8b89e~332x0.webp', 'picture/16.jpg', 'https://www.dongchedi.com/auto/series/3275');
INSERT INTO `item_xiangmu` VALUES (17, 'QQ冰淇淋', '3.99-4.99万', '新增车型', '2024-04-01', '奇瑞新能源', 9984, '3.03', '********************车型总数：共3款车型********************车型级别：微型车********************纯电续航里程km：120********************充电时间h：慢充6小时********************', 49988, 'https://p3.dcarimg.com/img/motor-img/acd76bab1843fbf99d97777565157ab3~332x0.webp', 'picture/17.jpg', 'https://www.dongchedi.com/auto/series/5257');
INSERT INTO `item_xiangmu` VALUES (18, '唐EV', '27.95-31.48万', '', '2022-08-01', '比亚迪', 9983, '3.86', '********************车型总数：共5款车型********************车型级别：中型SUV********************纯电续航里程km：565********************充电时间h：快充0.5小时********************', 49983, 'https://p3.dcarimg.com/img/motor-img/791cefd5162d12d9a1c78be0949e6eca~332x0.webp', 'picture/18.jpg', 'https://www.dongchedi.com/auto/series/3077');
INSERT INTO `item_xiangmu` VALUES (19, '宋PLUS EV', '18.08-19.78万', '纯电动销量NO.14', '2023-04-01', '比亚迪', 9982, '3.74', '********************车型总数：共2款车型********************车型级别：紧凑型SUV********************纯电续航里程km：505********************充电时间h：快充0.5小时********************', 49982, 'https://p3.dcarimg.com/img/motor-img/04397f3a02b4fdb4ae10cd4687258e9a~332x0.webp', 'picture/19.jpg', 'https://www.dongchedi.com/auto/series/4540');
INSERT INTO `item_xiangmu` VALUES (20, '小鹏汽车P5', '17.79-24.29万', '', '2024-02-01', '小鹏汽车', 9981, '3.81', '********************车型总数：共10款车型********************车型级别：紧凑型车********************纯电续航里程km：450********************充电时间h：快充0.5小时********************', 49984, 'https://p3.dcarimg.com/img/motor-img/ee76bb9d0563701bfda81cf509b7d468~332x0.webp', 'picture/20.jpg', 'https://www.dongchedi.com/auto/series/5004');
INSERT INTO `item_xiangmu` VALUES (21, 'Model S', '88.99-105.99万', '', '2023-01-01', '特斯拉(进口)', 9980, '4.12', '********************车型总数：共2款车型********************车型级别：中大型车********************纯电续航里程km：652********************充电时间h：快充1小时慢充10小时********************', 49980, 'https://p3.dcarimg.com/img/motor-img/5ebd68f35ed0b19e54d40bdafe6e522b~332x0.webp', 'picture/21.jpg', 'https://www.dongchedi.com/auto/series/1254');
INSERT INTO `item_xiangmu` VALUES (22, '东风EV新能源EX1', '4.57-5.67万', '新增车型', '2023-12-01', '东风汽车', 9979, '3.14', '********************车型总数：共11款车型********************车型级别：小型SUV********************纯电续航里程km：301********************充电时间h：快充0.5小时慢充4小时********************', 49979, 'https://p3.dcarimg.com/img/motor-img/47eb34ef88ec9cb072f2eb11e9164fa2~332x0.webp', 'picture/22.jpg', 'https://www.dongchedi.com/auto/series/4125');
INSERT INTO `item_xiangmu` VALUES (23, '红旗E-HS9', '50.98-77.98万', '大型SUV销量NO.1', '2023-11-01', '一汽红旗', 9978, '4.1', '********************车型总数：共8款车型********************车型级别：大型SUV********************纯电续航里程km：690********************充电时间h：-********************', 49978, 'https://p3.dcarimg.com/img/motor-img/fb5c6d20cd6044b28f6eec55dcd6c61c~332x0.webp', 'picture/23.jpg', 'https://www.dongchedi.com/auto/series/4146');
INSERT INTO `item_xiangmu` VALUES (24, '岚图FREE', '31.36-36.36万', '中大型SUV销量NO.10', '2023-06-01', '岚图汽车', 9977, '4.04', '********************车型总数：共3款车型********************车型级别：中大型SUV********************纯电续航里程km：140********************充电时间h：快充0.75小时慢充3.75小时********************', 49977, 'https://p3.dcarimg.com/img/motor-img/41d91255dea939a4735db565318f18db~332x0.webp', 'picture/24.jpg', 'https://www.dongchedi.com/auto/series/4760');
INSERT INTO `item_xiangmu` VALUES (25, 'Taycan', '88.80-180.80万', '', '2023-07-01', '保时捷', 9976, '4.29', '********************车型总数：共8款车型********************车型级别：中大型车********************纯电续航里程km：414********************充电时间h：快充1.55小时慢充8小时********************', 49976, 'https://p3.dcarimg.com/img/motor-img/65a82e2994543103b5b364a614b1e278~332x0.webp', 'picture/25.jpg', 'https://www.dongchedi.com/auto/series/3663');
INSERT INTO `item_xiangmu` VALUES (26, 'Mustang Mach-E', '26.50-37.99万', '', '2023-04-01', '长安福特', 9975, '3.99', '********************车型总数：共6款车型********************车型级别：中型SUV********************纯电续航里程km：513********************充电时间h：快充0.45小时慢充4.5小时********************', 49975, 'https://p3.dcarimg.com/img/motor-img/37240f04743459c2d6ecd9e97a10b7fc~332x0.webp', 'picture/26.jpg', 'https://www.dongchedi.com/auto/series/4890');
INSERT INTO `item_xiangmu` VALUES (27, '小蚂蚁', '7.39-9.40万', '微型轿车销量NO.4', '2023-11-01', '奇瑞新能源', 9974, '3.27', '********************车型总数：共9款车型********************车型级别：微型车********************纯电续航里程km：301********************充电时间h：快充0.5小时慢充9小时********************', 49974, 'https://p3.dcarimg.com/img/motor-img/79ee7f0fbecbce84ac50369f1eba524e~332x0.webp', 'picture/27.jpg', 'https://www.dongchedi.com/auto/series/1101');
INSERT INTO `item_xiangmu` VALUES (28, '宝马i3', '34.99万', '全新车系', '2024-03-01', '华晨宝马', 9973, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：526********************充电时间h：快充0.58小时慢充6.75小时********************', 49973, 'https://p3.dcarimg.com/img/motor-img/792cdfadb28e19c2a6487b6e454fefa1~332x0.webp', 'picture/28.jpg', 'https://www.dongchedi.com/auto/series/4838');
INSERT INTO `item_xiangmu` VALUES (29, '零跑C11', '17.98-22.98万', '', '2023-12-01', '零跑汽车', 9972, '3.78', '********************车型总数：共4款车型********************车型级别：中型SUV********************纯电续航里程km：510********************充电时间h：快充0.67小时慢充6.5小时********************', 49972, 'https://p3.dcarimg.com/img/motor-img/2424e00978716b513ae9ec7537bf4db3~332x0.webp', 'picture/29.jpg', 'https://www.dongchedi.com/auto/series/4731');
INSERT INTO `item_xiangmu` VALUES (30, 'ID.4 X', '19.98-27.83万', '2022新款', '2024-03-01', '上汽大众', 9971, '3.84', '********************车型总数：共11款车型********************车型级别：紧凑型SUV********************纯电续航里程km：425********************充电时间h：快充0.67小时慢充8.5小时********************', 49971, 'https://p3.dcarimg.com/img/motor-img/f48fa054209fa14a777a8a7b615a852f~332x0.webp', 'picture/30.jpg', 'https://www.dongchedi.com/auto/series/4258');
INSERT INTO `item_xiangmu` VALUES (31, '蔚来ET5', '暂无报价', '', '2023-12-01', '蔚来', 9970, '0', '********************车型总数：共3款车型********************车型级别：中型车********************纯电续航里程km：550********************充电时间h：-********************', 49970, 'https://p3.dcarimg.com/img/motor-img/6b3472130dfd56454f65df80d9f461f6~332x0.webp', 'picture/31.jpg', 'https://www.dongchedi.com/auto/series/5409');
INSERT INTO `item_xiangmu` VALUES (32, 'ID.4 CROZZ', '暂无报价', '', '2023-01-01', '一汽-大众', 9969, '3.86', '********************车型总数：共12款车型********************车型级别：紧凑型SUV********************纯电续航里程km：405********************充电时间h：-********************', 49969, 'https://p3.dcarimg.com/img/motor-img/7e2fd510a9feb583b38a4ae9def165f9~332x0.webp', 'picture/32.jpg', 'https://www.dongchedi.com/auto/series/4586');
INSERT INTO `item_xiangmu` VALUES (33, '红旗E-QM5', '暂无报价', '2021新款', '2024-03-01', '一汽红旗', 9968, '0', '********************车型总数：共17款车型********************车型级别：中型车********************纯电续航里程km：431********************充电时间h：-********************', 49968, 'https://p3.dcarimg.com/img/motor-img/46e232d059138de1c1fb364914430f22~332x0.webp', 'picture/33.jpg', 'https://www.dongchedi.com/auto/series/5092');
INSERT INTO `item_xiangmu` VALUES (34, 'Model X', '暂无报价', '', '2023-01-01', '特斯拉(进口)', 9967, '4.07', '********************车型总数：共2款车型********************车型级别：中大型SUV********************纯电续航里程km：560********************充电时间h：快充1小时慢充10小时********************', 49967, 'https://p3.dcarimg.com/img/motor-img/9ef63b348cecad72e5ae732f2d653bf0~332x0.webp', 'picture/34.jpg', 'https://www.dongchedi.com/auto/series/1255');
INSERT INTO `item_xiangmu` VALUES (35, '比亚迪e1', '暂无报价', '', '2021-10-01', '比亚迪', 9966, '3.33', '********************车型总数：共5款车型********************车型级别：微型车********************纯电续航里程km：305********************充电时间h：快充0.5小时********************', 49967, 'https://p3.dcarimg.com/img/motor-img/71bb241f24d3e20b2ee3adca8b6559fe~332x0.webp', 'picture/35.jpg', 'https://www.dongchedi.com/auto/series/3174');
INSERT INTO `item_xiangmu` VALUES (36, '零跑T03', '暂无报价', '2022新款', '2024-03-01', '零跑汽车', 9965, '3.43', '********************车型总数：共5款车型********************车型级别：微型车********************纯电续航里程km：301********************充电时间h：快充0.6小时慢充2.75小时********************', 49965, 'https://p3.dcarimg.com/img/motor-img/846a572aec5fdc674e7cc599e765d102~332x0.webp', 'picture/36.jpg', 'https://www.dongchedi.com/auto/series/4272');
INSERT INTO `item_xiangmu` VALUES (37, '蔚来ES6', '暂无报价', '中型SUV销量NO.16', '2023-09-01', '蔚来', 9964, '4.07', '********************车型总数：共6款车型********************车型级别：中型SUV********************纯电续航里程km：455********************充电时间h：快充0.6小时慢充11.5小时********************', 49964, 'https://p3.dcarimg.com/img/motor-img/6c923efdd0639f2ae5e921325cb516f2~332x0.webp', 'picture/37.jpg', 'https://www.dongchedi.com/auto/series/2843');
INSERT INTO `item_xiangmu` VALUES (38, '宝马iX3', '暂无报价', '', '2023-09-01', '华晨宝马', 9963, '4.02', '********************车型总数：共2款车型********************车型级别：中型SUV********************纯电续航里程km：500********************充电时间h：快充0.75小时慢充7.5小时********************', 49963, 'https://p3.dcarimg.com/img/motor-img/6ed2508e2edf0fc8de32cb00897d2271~332x0.webp', 'picture/38.jpg', 'https://www.dongchedi.com/auto/series/4538');
INSERT INTO `item_xiangmu` VALUES (39, '元Pro', '暂无报价', '小型SUV销量NO.4', '2023-07-01', '比亚迪', 9962, '3.45', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：301********************充电时间h：快充0.5小时********************', 49962, 'https://p3.dcarimg.com/img/motor-img/83bf43c3cb8ae3e3aa7a4c2440847051~332x0.webp', 'picture/39.jpg', 'https://www.dongchedi.com/auto/series/4981');
INSERT INTO `item_xiangmu` VALUES (40, '比亚迪e2', '暂无报价', '', '2023-09-01', '比亚迪', 9961, '3.33', '********************车型总数：共6款车型********************车型级别：紧凑型车********************纯电续航里程km：301********************充电时间h：快充0.5小时********************', 49961, 'https://p3.dcarimg.com/img/motor-img/7a495b95fb3d60b2968bcca46084ace8~332x0.webp', 'picture/40.jpg', 'https://www.dongchedi.com/auto/series/3455');
INSERT INTO `item_xiangmu` VALUES (41, '蔚来ET7', '暂无报价', '', '2023-01-01', '蔚来', 9960, '0', '********************车型总数：共5款车型********************车型级别：中大型车********************纯电续航里程km：530********************充电时间h：-********************', 49960, 'https://p3.dcarimg.com/img/motor-img/2e2b72a022bcaa28f92546e9429d3e54~332x0.webp', 'picture/41.jpg', 'https://www.dongchedi.com/auto/series/3478');
INSERT INTO `item_xiangmu` VALUES (42, '大众ID.3', '暂无报价', '2022新款', '2024-03-01', '上汽大众', 9959, '3.77', '********************车型总数：共4款车型********************车型级别：紧凑型车********************纯电续航里程km：450********************充电时间h：快充0.67小时慢充8.5小时********************', 49959, 'https://p3.dcarimg.com/img/motor-img/661458d17198de2211cfbbd42d3694f1~332x0.webp', 'picture/42.jpg', 'https://www.dongchedi.com/auto/series/5217');
INSERT INTO `item_xiangmu` VALUES (43, '高合HiPhi X', '暂无报价', '', '2024-03-01', '华人运通', 9958, '4.13', '********************车型总数：共5款车型********************车型级别：中大型SUV********************纯电续航里程km：630********************充电时间h：快充0.75小时慢充9小时********************', 49958, 'https://p3.dcarimg.com/img/motor-img/ffeed63a3d77e832e4010a065fbf156c~332x0.webp', 'picture/43.jpg', 'https://www.dongchedi.com/auto/series/3975');
INSERT INTO `item_xiangmu` VALUES (44, 'AION LX', '暂无报价', '', '2024-01-01', '广汽埃安新能源', 9957, '3.92', '********************车型总数：共5款车型********************车型级别：中型SUV********************纯电续航里程km：650********************充电时间h：-********************', 49957, 'https://p3.dcarimg.com/img/motor-img/a3dad86701857afacb920e7123c4df1c~332x0.webp', 'picture/44.jpg', 'https://www.dongchedi.com/auto/series/3503');
INSERT INTO `item_xiangmu` VALUES (45, 'ID.6 X', '暂无报价', '2022新款', '2024-03-01', '上汽大众', 9956, '3.95', '********************车型总数：共12款车型********************车型级别：中大型SUV********************纯电续航里程km：460********************充电时间h：快充0.67小时慢充9.5小时********************', 49956, 'https://p3.dcarimg.com/img/motor-img/bc5400d7759589d05ac39a0f52362327~332x0.webp', 'picture/45.jpg', 'https://www.dongchedi.com/auto/series/4894');
INSERT INTO `item_xiangmu` VALUES (46, 'AION V', '暂无报价', '', '2023-09-01', '广汽埃安新能源', 9955, '3.8', '********************车型总数：共7款车型********************车型级别：紧凑型SUV********************纯电续航里程km：500********************充电时间h：快充0.5小时********************', 49955, 'https://p3.dcarimg.com/img/motor-img/0657da7550d5af0260ddc50c678e8c40~332x0.webp', 'picture/46.jpg', 'https://www.dongchedi.com/auto/series/4426');
INSERT INTO `item_xiangmu` VALUES (47, '比亚迪e9', '暂无报价', '', '2023-03-01', '比亚迪', 9954, '0', '********************车型总数：共1款车型********************车型级别：中大型车********************纯电续航里程km：506********************充电时间h：快充0.5小时********************', 49954, 'https://p3.dcarimg.com/img/motor-img/1fa7749798e5e6ea432d3b6c87e7be16~332x0.webp', 'picture/47.jpg', 'https://www.dongchedi.com/auto/series/4797');
INSERT INTO `item_xiangmu` VALUES (48, '微蓝6', '暂无报价', '', '2023-11-01', '上汽通用别克', 9953, '3.62', '********************车型总数：共4款车型********************车型级别：紧凑型车********************纯电续航里程km：518********************充电时间h：快充0.5小时慢充9.5小时********************', 49953, 'https://p3.dcarimg.com/img/motor-img/d0c37be52fb0043b08cb96540dd7a0d0~332x0.webp', 'picture/48.jpg', 'https://www.dongchedi.com/auto/series/3359');
INSERT INTO `item_xiangmu` VALUES (49, '宝骏KiWi EV', '暂无报价', '微型轿车销量NO.12', '2024-01-01', '上汽通用五菱', 9952, '3.38', '********************车型总数：共8款车型********************车型级别：微型车********************纯电续航里程km：305********************充电时间h：快充1小时慢充5小时********************', 49952, 'https://p3.dcarimg.com/img/motor-img/6a682ae3078b989518d735ecb6997785~332x0.webp', 'picture/49.jpg', 'https://www.dongchedi.com/auto/series/5093');
INSERT INTO `item_xiangmu` VALUES (50, 'EX3 功夫牛', '暂无报价', '小型SUV销量NO.12', '2023-11-01', '几何汽车', 9951, '3.28', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：322********************充电时间h：快充0.5小时慢充7小时********************', 49951, 'https://p3.dcarimg.com/img/motor-img/dfabb7f730a03aedabc2db4f512a8c41~332x0.webp', 'picture/50.jpg', 'https://www.dongchedi.com/auto/series/5353');
INSERT INTO `item_xiangmu` VALUES (51, '极狐 阿尔法S', '暂无报价', '中大型轿车销量NO.15', '2023-04-01', '北汽新能源', 9950, '3.97', '********************车型总数：共6款车型********************车型级别：中大型车********************纯电续航里程km：525********************充电时间h：快充0.5小时慢充11.5小时********************', 49950, 'https://p3.dcarimg.com/img/motor-img/434138527be4981719eaad42469e3fd2~332x0.webp', 'picture/51.jpg', 'https://www.dongchedi.com/auto/series/4637');
INSERT INTO `item_xiangmu` VALUES (52, '蔚来EC6', '暂无报价', '', '2023-09-01', '蔚来', 9949, '4.05', '********************车型总数：共6款车型********************车型级别：中型SUV********************纯电续航里程km：465********************充电时间h：快充0.6小时慢充11.5小时********************', 49949, 'https://p3.dcarimg.com/img/motor-img/7ee326810d8b5c4cd7ec4b12c72161e4~332x0.webp', 'picture/52.jpg', 'https://www.dongchedi.com/auto/series/4357');
INSERT INTO `item_xiangmu` VALUES (53, 'ID.6 CROZZ', '暂无报价', '中大型SUV销量NO.5', '2024-01-01', '一汽-大众', 9948, '3.95', '********************车型总数：共11款车型********************车型级别：中大型SUV********************纯电续航里程km：586********************充电时间h：-********************', 49948, 'https://p3.dcarimg.com/img/motor-img/6bed7b14097cb1b189b4c7f0fc120484~332x0.webp', 'picture/53.jpg', 'https://www.dongchedi.com/auto/series/4961');
INSERT INTO `item_xiangmu` VALUES (54, '芒果', '暂无报价', '微型轿车销量NO.9', '2023-12-01', '雷丁', 9947, '0', '********************车型总数：共13款车型********************车型级别：微型车********************纯电续航里程km：130********************充电时间h：慢充8小时********************', 49947, 'https://p3.dcarimg.com/img/motor-img/1966c05d3355af2bcd18e85c5dc32771~332x0.webp', 'picture/54.jpg', 'https://www.dongchedi.com/auto/series/4689');
INSERT INTO `item_xiangmu` VALUES (55, '小鹏汽车G3', '暂无报价', '', '2023-07-01', '小鹏汽车', 9946, '3.78', '********************车型总数：共6款车型********************车型级别：紧凑型SUV********************纯电续航里程km：460********************充电时间h：快充0.58小时慢充4.3小时********************', 49946, 'https://p3.dcarimg.com/img/motor-img/1235762f5264496df9e42c64b74b583a~332x0.webp', 'picture/55.jpg', 'https://www.dongchedi.com/auto/series/2819');
INSERT INTO `item_xiangmu` VALUES (56, '秦EV', '暂无报价', '', '2023-05-01', '比亚迪', 9945, '3.61', '********************车型总数：共5款车型********************车型级别：紧凑型车********************纯电续航里程km：450********************充电时间h：-********************', 49945, 'https://p3.dcarimg.com/img/motor-img/2918a9515f9f16994fe0278e036956a5~332x0.webp', 'picture/56.jpg', 'https://www.dongchedi.com/auto/series/1820');
INSERT INTO `item_xiangmu` VALUES (57, '奔驰EQS', '暂无报价', '', '2023-12-01', '梅赛德斯-EQ', 9944, '4.29', '********************车型总数：共4款车型********************车型级别：大型车********************纯电续航里程km：849********************充电时间h：快充0.62小时慢充10小时********************', 49944, 'https://p3.dcarimg.com/img/motor-img/70b8e1aa588558e8e2a74e3f94ac8a04~332x0.webp', 'picture/57.jpg', 'https://www.dongchedi.com/auto/series/4668');
INSERT INTO `item_xiangmu` VALUES (58, '蔚来ES8', '暂无报价', '中大型SUV销量NO.8', '2023-09-01', '蔚来', 9943, '4.1', '********************车型总数：共8款车型********************车型级别：中大型SUV********************纯电续航里程km：450********************充电时间h：快充0.6小时慢充11.5小时********************', 49943, 'https://p3.dcarimg.com/img/motor-img/7dd1bdb8fea294631e7d354e374f7c41~332x0.webp', 'picture/58.jpg', 'https://www.dongchedi.com/auto/series/1616');
INSERT INTO `item_xiangmu` VALUES (59, 'LYRIQ', '暂无报价', '即将上市', '2024-01-01', '上汽通用凯迪拉克', 9942, '0', '********************车型总数：共1款车型********************车型级别：中大型SUV********************纯电续航里程km：650********************充电时间h：快充0.67小时慢充15.5小时********************', 49942, 'https://p3.dcarimg.com/img/motor-img/63a843d4d3383b54d3a54f89dc2232cb~332x0.webp', 'picture/59.jpg', 'https://www.dongchedi.com/auto/series/5358');
INSERT INTO `item_xiangmu` VALUES (60, '几何A', '暂无报价', '', '2023-04-01', '几何汽车', 9941, '3.63', '********************车型总数：共7款车型********************车型级别：紧凑型车********************纯电续航里程km：430********************充电时间h：快充0.5小时慢充8.5小时********************', 49941, 'https://p3.dcarimg.com/img/motor-img/ef638ed8ed491bd5bb2a12337d91faa9~332x0.webp', 'picture/60.jpg', 'https://www.dongchedi.com/auto/series/3157');
INSERT INTO `item_xiangmu` VALUES (61, '几何C', '暂无报价', '', '2024-01-01', '几何汽车', 9940, '3.71', '********************车型总数：共8款车型********************车型级别：紧凑型SUV********************纯电续航里程km：400********************充电时间h：快充0.5小时慢充8.5小时********************', 49940, 'https://p3.dcarimg.com/img/motor-img/14800010db265dbb4e54b322efe6b9fb~332x0.webp', 'picture/61.jpg', 'https://www.dongchedi.com/auto/series/4380');
INSERT INTO `item_xiangmu` VALUES (62, '科莱威CLEVER', '暂无报价', '2022新款', '2024-03-01', '上汽集团', 9939, '3.21', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：311********************充电时间h：慢充5.5小时********************', 49939, 'https://p3.dcarimg.com/img/motor-img/0df783917aab490ada07cd607aa9dedf~332x0.webp', 'picture/62.jpg', 'https://www.dongchedi.com/auto/series/3710');
INSERT INTO `item_xiangmu` VALUES (63, '雪佛兰畅巡', '暂无报价', '', '2023-11-01', '上汽通用雪佛兰', 9938, '3.65', '********************车型总数：共18款车型********************车型级别：紧凑型车********************纯电续航里程km：518********************充电时间h：快充0.5小时慢充9.5小时********************', 49938, 'https://p3.dcarimg.com/img/motor-img/017ffe70e741c3fe352de81cc84795ce~332x0.webp', 'picture/63.jpg', 'https://www.dongchedi.com/auto/series/4081');
INSERT INTO `item_xiangmu` VALUES (64, '宝马i4', '暂无报价', '', '2024-02-01', '宝马(进口)', 9937, '0', '********************车型总数：共2款车型********************车型级别：中型车********************纯电续航里程km：625********************充电时间h：快充0.77小时慢充8.25小时********************', 49937, 'https://p3.dcarimg.com/img/motor-img/295e2c8b0e0692af1445206d311b31b3~332x0.webp', 'picture/64.jpg', 'https://www.dongchedi.com/auto/series/4211');
INSERT INTO `item_xiangmu` VALUES (65, '思皓E10X', '暂无报价', '新增车型', '2024-03-01', '江汽集团', 9936, '3.19', '********************车型总数：共4款车型********************车型级别：微型车********************纯电续航里程km：306********************充电时间h：慢充11小时********************', 49936, 'https://p3.dcarimg.com/img/motor-img/375dc44f975d6fca662b712e1b94371b~332x0.webp', 'picture/65.jpg', 'https://www.dongchedi.com/auto/series/4819');
INSERT INTO `item_xiangmu` VALUES (66, '智己L7', '暂无报价', '全新车系', '2024-03-01', '智己汽车', 9935, '0', '********************车型总数：共2款车型********************车型级别：中大型车********************纯电续航里程km：615********************充电时间h：-********************', 49935, 'https://p3.dcarimg.com/img/motor-img/96ab0d0d876d70291a4ee6e797556ccb~332x0.webp', 'picture/66.jpg', 'https://www.dongchedi.com/auto/series/4870');
INSERT INTO `item_xiangmu` VALUES (67, '奔驰EQC', '暂无报价', '', '2024-02-01', '北京奔驰', 9934, '4.01', '********************车型总数：共5款车型********************车型级别：中型SUV********************纯电续航里程km：440********************充电时间h：快充0.75小时慢充12小时********************', 49934, 'https://p3.dcarimg.com/img/motor-img/af9519c896135b4d911ee16d8d22743f~332x0.webp', 'picture/67.jpg', 'https://www.dongchedi.com/auto/series/3719');
INSERT INTO `item_xiangmu` VALUES (68, '五菱Nano EV', '暂无报价', '', '2023-11-01', '上汽通用五菱', 9933, '3.05', '********************车型总数：共7款车型********************车型级别：微型车********************纯电续航里程km：305********************充电时间h：快充4.5小时慢充13.5小时********************', 49933, 'https://p3.dcarimg.com/img/motor-img/91d0af2faeadb3a1ce07bee26159a802~332x0.webp', 'picture/68.jpg', 'https://www.dongchedi.com/auto/series/5047');
INSERT INTO `item_xiangmu` VALUES (69, '比亚迪D1', '暂无报价', '', '2023-03-01', '比亚迪', 9932, '3.73', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：418********************充电时间h：快充0.5小时********************', 49932, 'https://p3.dcarimg.com/img/motor-img/16a73f90c37db0a802139dd3bcb55a8b~332x0.webp', 'picture/69.jpg', 'https://www.dongchedi.com/auto/series/4638');
INSERT INTO `item_xiangmu` VALUES (70, 'Eletre', '暂无报价', '', '2024-01-01', '路特斯', 9931, '0', '********************车型总数：共1款车型********************车型级别：中大型SUV********************纯电续航里程km：600********************充电时间h：快充0.33小时********************', 49931, 'https://p3.dcarimg.com/img/motor-img/d1ed4b093f923b73fd8419f03964031e~332x0.webp', 'picture/70.jpg', 'https://www.dongchedi.com/auto/series/5825');
INSERT INTO `item_xiangmu` VALUES (71, '零跑S01', '暂无报价', '小型轿车销量NO.13', '2023-02-01', '零跑汽车', 9930, '3.28', '********************车型总数：共6款车型********************车型级别：小型车********************纯电续航里程km：451********************充电时间h：快充1小时慢充8小时********************', 49930, 'https://p3.dcarimg.com/img/motor-img/3b318ce984dc799f5fe64c2b8a74b54d~332x0.webp', 'picture/71.jpg', 'https://www.dongchedi.com/auto/series/1934');
INSERT INTO `item_xiangmu` VALUES (72, '秦Pro EV', '暂无报价', '', '2021-10-01', '比亚迪', 9929, '0', '********************车型总数：共8款车型********************车型级别：紧凑型车********************纯电续航里程km：401********************充电时间h：快充0.5小时********************', 49929, 'https://p3.dcarimg.com/img/motor-img/26e5b1872e03e71733c3dac33f3fb691~332x0.webp', 'picture/72.jpg', 'https://www.dongchedi.com/auto/series/3049');
INSERT INTO `item_xiangmu` VALUES (73, '奥迪Q5 e-tron', '暂无报价', '', '2024-02-01', '上汽奥迪', 9928, '0', '********************车型总数：共9款车型********************车型级别：中大型SUV********************纯电续航里程km：560********************充电时间h：-********************', 49928, 'https://p3.dcarimg.com/img/motor-img/6a288e43d3e85af91ecebda0776126cb~332x0.webp', 'picture/73.jpg', 'https://www.dongchedi.com/auto/series/5002');
INSERT INTO `item_xiangmu` VALUES (74, '奥迪Q2L e-tron', '暂无报价', '', '2023-12-01', '一汽-大众奥迪', 9927, '3.66', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：325********************充电时间h：快充0.62小时慢充17小时********************', 49927, 'https://p3.dcarimg.com/img/motor-img/5baddc755b3d04932ff63931b637f51d~332x0.webp', 'picture/74.jpg', 'https://www.dongchedi.com/auto/series/3337');
INSERT INTO `item_xiangmu` VALUES (75, '合创Z03', '暂无报价', '', '2023-10-01', '合创汽车', 9926, '3.69', '********************车型总数：共4款车型********************车型级别：紧凑型SUV********************纯电续航里程km：510********************充电时间h：快充0.6小时慢充10.7小时********************', 49926, 'https://p3.dcarimg.com/img/motor-img/f2de83d60273d3f173b3738128ea80f6~332x0.webp', 'picture/75.jpg', 'https://www.dongchedi.com/auto/series/5089');
INSERT INTO `item_xiangmu` VALUES (76, '欧拉好猫GT', '暂无报价', '新增车型', '2023-08-01', '长城汽车', 9925, '3.62', '********************车型总数：共2款车型********************车型级别：小型车********************纯电续航里程km：480********************充电时间h：快充0.5小时慢充8小时********************', 49925, 'https://p3.dcarimg.com/img/motor-img/9818f408968d5e7d5d56a24c184da24f~332x0.webp', 'picture/76.jpg', 'https://www.dongchedi.com/auto/series/5269');
INSERT INTO `item_xiangmu` VALUES (77, 'Polestar 2', '暂无报价', '', '2023-04-01', 'Polestar', 9924, '3.97', '********************车型总数：共3款车型********************车型级别：紧凑型车********************纯电续航里程km：485********************充电时间h：-********************', 49924, 'https://p3.dcarimg.com/img/motor-img/a37677a533fb3109e4502068cbf7c443~332x0.webp', 'picture/77.jpg', 'https://www.dongchedi.com/auto/series/3166');
INSERT INTO `item_xiangmu` VALUES (78, '奔驰EQA', '暂无报价', '', '2023-11-01', '北京奔驰', 9923, '3.9', '********************车型总数：共2款车型********************车型级别：紧凑型SUV********************纯电续航里程km：537********************充电时间h：快充0.75小时慢充10.25小时********************', 49923, 'https://p3.dcarimg.com/img/motor-img/50877667acb3597bcab48844464aeb96~332x0.webp', 'picture/78.jpg', 'https://www.dongchedi.com/auto/series/1729');
INSERT INTO `item_xiangmu` VALUES (79, '宝来·纯电', '暂无报价', '', '2023-04-01', '一汽-大众', 9922, '0', '********************车型总数：共2款车型********************车型级别：紧凑型车********************纯电续航里程km：346********************充电时间h：快充0.6小时慢充5小时********************', 49922, 'https://p3.dcarimg.com/img/motor-img/dcbb30a3957717b8ed4c2be87524bd5a~332x0.webp', 'picture/79.jpg', 'https://www.dongchedi.com/auto/series/3278');
INSERT INTO `item_xiangmu` VALUES (80, '马自达CX-30 EV', '暂无报价', '', '2023-09-01', '长安马自达', 9921, '3.64', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：450********************充电时间h：快充0.92小时慢充10小时********************', 49921, 'https://p3.dcarimg.com/img/motor-img/8490f3d69cf10d55a1b38698c0d560bc~332x0.webp', 'picture/80.jpg', 'https://www.dongchedi.com/auto/series/5069');
INSERT INTO `item_xiangmu` VALUES (81, '极狐 阿尔法T', '暂无报价', '', '2022-10-01', '北汽新能源', 9920, '3.98', '********************车型总数：共5款车型********************车型级别：中型SUV********************纯电续航里程km：480********************充电时间h：快充0.43小时慢充11.5小时********************', 49920, 'https://p3.dcarimg.com/img/motor-img/929f0f031ceb8130238fac5cc5db9f70~332x0.webp', 'picture/81.jpg', 'https://www.dongchedi.com/auto/series/4385');
INSERT INTO `item_xiangmu` VALUES (82, '风光MINIEV', '暂无报价', '', '2024-03-01', '东风小康', 9919, '0', '********************车型总数：共3款车型********************车型级别：微型车********************纯电续航里程km：120********************充电时间h：快充5小时********************', 49919, 'https://p3.dcarimg.com/img/motor-img/428a368dfe2f9138cfc1d93661e042e8~332x0.webp', 'picture/82.jpg', 'https://www.dongchedi.com/auto/series/5389');
INSERT INTO `item_xiangmu` VALUES (83, '阿图柯AIRTREK', '暂无报价', '全新车系', '2024-03-01', '广汽三菱', 9918, '0', '********************车型总数：共2款车型********************车型级别：紧凑型SUV********************纯电续航里程km：500********************充电时间h：快充0.53小时********************', 49918, 'https://p3.dcarimg.com/img/motor-img/43adb77a30bcc624f9d695245b1ae927~332x0.webp', 'picture/83.jpg', 'https://www.dongchedi.com/auto/series/5121');
INSERT INTO `item_xiangmu` VALUES (84, 'YOUNG光小新', '暂无报价', '微型轿车销量NO.15', '2023-08-01', '电动屋', 9917, '0', '********************车型总数：共3款车型********************车型级别：微型车********************纯电续航里程km：408********************充电时间h：快充0.6小时慢充10.5小时********************', 49917, 'https://p3.dcarimg.com/img/motor-img/e7d3dfb75860d5ec96051db4ae98213a~332x0.webp', 'picture/84.jpg', 'https://www.dongchedi.com/auto/series/5293');
INSERT INTO `item_xiangmu` VALUES (85, '雷克萨斯UX EV', '暂无报价', '', '2022-04-01', '雷克萨斯', 9916, '3.64', '********************车型总数：共2款车型********************车型级别：紧凑型SUV********************纯电续航里程km：400********************充电时间h：快充0.83小时慢充6.5小时********************', 49916, 'https://p3.dcarimg.com/img/motor-img/4765b61932b59e12064a9bf98154f0f6~332x0.webp', 'picture/85.jpg', 'https://www.dongchedi.com/auto/series/4281');
INSERT INTO `item_xiangmu` VALUES (86, '小虎FEV', '暂无报价', '2022新款', '2024-03-01', '宏瑞汽车', 9915, '0', '********************车型总数：共7款车型********************车型级别：微型车********************纯电续航里程km：170********************充电时间h：-********************', 49915, 'https://p3.dcarimg.com/img/motor-img/9265da77f9e501614776f2afe7afa78f~332x0.webp', 'picture/86.jpg', 'https://www.dongchedi.com/auto/series/5014');
INSERT INTO `item_xiangmu` VALUES (87, '比亚迪e3', '暂无报价', '', '2023-08-01', '比亚迪', 9914, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：401********************充电时间h：-********************', 49914, 'https://p3.dcarimg.com/img/motor-img/993f74dfdbd9feb7e14875c014b44163~332x0.webp', 'picture/87.jpg', 'https://www.dongchedi.com/auto/series/4076');
INSERT INTO `item_xiangmu` VALUES (88, '广汽丰田iA5', '暂无报价', '', '2024-03-01', '广汽丰田', 9913, '0', '********************车型总数：共7款车型********************车型级别：紧凑型车********************纯电续航里程km：510********************充电时间h：快充0.7小时慢充9.5小时********************', 49913, 'https://p3.dcarimg.com/img/motor-img/d615385354694acde6298b463af5aba7~332x0.webp', 'picture/88.jpg', 'https://www.dongchedi.com/auto/series/4087');
INSERT INTO `item_xiangmu` VALUES (89, '逸动EV', '暂无报价', '', '2024-01-01', '长安汽车', 9912, '3.59', '********************车型总数：共6款车型********************车型级别：紧凑型车********************纯电续航里程km：365********************充电时间h：快充1.3小时********************', 49912, 'https://p3.dcarimg.com/img/motor-img/436afddc96adbf1bea9ad5e693d13a35~332x0.webp', 'picture/89.jpg', 'https://www.dongchedi.com/auto/series/1456');
INSERT INTO `item_xiangmu` VALUES (90, '奥迪e-tron', '暂无报价', '', '2023-04-01', '一汽-大众奥迪', 9911, '3.99', '********************车型总数：共3款车型********************车型级别：中大型SUV********************纯电续航里程km：500********************充电时间h：快充0.67小时慢充9.5小时********************', 49911, 'https://p3.dcarimg.com/img/motor-img/427912331769d05a8427b4a08f0ccc35~332x0.webp', 'picture/90.jpg', 'https://www.dongchedi.com/auto/series/4543');
INSERT INTO `item_xiangmu` VALUES (91, '荣威i6 MAX EV', '暂无报价', '新增车型', '2024-01-01', '上汽集团', 9910, '0', '********************车型总数：共5款车型********************车型级别：紧凑型车********************纯电续航里程km：502********************充电时间h：快充0.5小时慢充9.5小时********************', 49910, 'https://p3.dcarimg.com/img/motor-img/7354d6f26478d7e9c9634036f3cf0441~332x0.webp', 'picture/91.jpg', 'https://www.dongchedi.com/auto/series/4582');
INSERT INTO `item_xiangmu` VALUES (92, '凌宝BOX', '暂无报价', '微型轿车销量NO.6', '2024-02-01', '吉麦新能源', 9909, '0', '********************车型总数：共12款车型********************车型级别：微型车********************纯电续航里程km：140********************充电时间h：慢充10小时********************', 49909, 'https://p3.dcarimg.com/img/motor-img/1d692412ef80155cd06733ab41c53041~332x0.webp', 'picture/92.jpg', 'https://www.dongchedi.com/auto/series/4503');
INSERT INTO `item_xiangmu` VALUES (93, '东风本田M-NV', '暂无报价', '', '2022-11-01', '东风本田', 9908, '3.59', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：480********************充电时间h：快充0.5小时慢充10小时********************', 49908, 'https://p3.dcarimg.com/img/motor-img/b20ad2749ca184a995d7d9b88d20b147~332x0.webp', 'picture/93.jpg', 'https://www.dongchedi.com/auto/series/4585');
INSERT INTO `item_xiangmu` VALUES (94, '沃尔沃XC40 RECHARGE', '暂无报价', '', '2024-02-01', '沃尔沃亚太', 9907, '3.81', '********************车型总数：共4款车型********************车型级别：紧凑型SUV********************纯电续航里程km：529********************充电时间h：快充0.67小时慢充10小时********************', 49907, 'https://p3.dcarimg.com/img/motor-img/31d2b6da640b935204b7bfc42e4206a2~332x0.webp', 'picture/94.jpg', 'https://www.dongchedi.com/auto/series/4738');
INSERT INTO `item_xiangmu` VALUES (95, '大蚂蚁', '暂无报价', '', '2023-10-01', '奇瑞新能源', 9906, '3.74', '********************车型总数：共3款车型********************车型级别：中型SUV********************纯电续航里程km：510********************充电时间h：快充0.5小时慢充13小时********************', 49906, 'https://p3.dcarimg.com/img/motor-img/db1039beb5b509e00edf8d706623e04d~332x0.webp', 'picture/95.jpg', 'https://www.dongchedi.com/auto/series/4384');
INSERT INTO `item_xiangmu` VALUES (96, '飞凡ER6', '暂无报价', '', '2023-09-01', '上汽集团', 9905, '3.48', '********************车型总数：共4款车型********************车型级别：紧凑型车********************纯电续航里程km：520********************充电时间h：快充0.5小时慢充9.5小时********************', 49905, 'https://p3.dcarimg.com/img/motor-img/05d3f61eeb3bfd0d18c21b7aeeb74a23~332x0.webp', 'picture/96.jpg', 'https://www.dongchedi.com/auto/series/4304');
INSERT INTO `item_xiangmu` VALUES (97, '奔驰EQB', '暂无报价', '', '2023-11-01', '北京奔驰', 9904, '0', '********************车型总数：共2款车型********************车型级别：紧凑型SUV********************纯电续航里程km：512********************充电时间h：快充0.75小时慢充10.25小时********************', 49904, 'https://p3.dcarimg.com/img/motor-img/c9ebe31e9989a4084bf6ad51f5a3b195~332x0.webp', 'picture/97.jpg', 'https://www.dongchedi.com/auto/series/3932');
INSERT INTO `item_xiangmu` VALUES (98, '羿', '暂无报价', '2022新款', '2024-04-01', '雷诺 江铃集团', 9903, '0', '********************车型总数：共4款车型********************车型级别：紧凑型车********************纯电续航里程km：400********************充电时间h：快充0.5小时慢充8小时********************', 49903, 'https://p3.dcarimg.com/img/motor-img/c53f4e31b5bc85aa0d8c14dec47cac09~332x0.webp', 'picture/98.jpg', 'https://www.dongchedi.com/auto/series/4858');
INSERT INTO `item_xiangmu` VALUES (99, '途岳EV', '暂无报价', '', '2022-10-01', '上汽大众', 9902, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：315********************充电时间h：快充0.87小时慢充6.5小时********************', 49902, 'https://p3.dcarimg.com/img/motor-img/aa8138c4ed52b4d4de406f3af3f97bfd~332x0.webp', 'picture/99.jpg', 'https://www.dongchedi.com/auto/series/4344');
INSERT INTO `item_xiangmu` VALUES (100, '威马EX5', '暂无报价', '新增车型', '2024-03-01', '威马汽车', 9901, '3.69', '********************车型总数：共3款车型********************车型级别：紧凑型SUV********************纯电续航里程km：403********************充电时间h：快充0.5小时慢充8.4小时********************', 49901, 'https://p3.dcarimg.com/img/motor-img/674ada0515737833a6fa6ad2d2b8f748~332x0.webp', 'picture/100.jpg', 'https://www.dongchedi.com/auto/series/1915');
INSERT INTO `item_xiangmu` VALUES (101, '芒果Pro', '暂无报价', '全新车系', '2024-03-01', '雷丁', 9900, '0', '********************车型总数：共6款车型********************车型级别：微型车********************纯电续航里程km：130********************充电时间h：慢充8小时********************', 49900, 'https://p3.dcarimg.com/img/motor-img/3722e28471aa13b8f8ce3aa13bee02d0~332x0.webp', 'picture/101.jpg', 'https://www.dongchedi.com/auto/series/5525');
INSERT INTO `item_xiangmu` VALUES (102, '宝马iX', '暂无报价', '', '2024-01-01', '宝马(进口)', 9899, '4.16', '********************车型总数：共3款车型********************车型级别：中大型SUV********************纯电续航里程km：455********************充电时间h：快充0.68小时慢充7.25小时********************', 49899, 'https://p3.dcarimg.com/img/motor-img/2305ca6d1b718c100e03f60d9e3c131a~332x0.webp', 'picture/102.jpg', 'https://www.dongchedi.com/auto/series/3023');
INSERT INTO `item_xiangmu` VALUES (103, '微蓝7', '暂无报价', '2022新款', '2024-03-01', '上汽通用别克', 9898, '3.61', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：500********************充电时间h：快充0.65小时慢充9.5小时********************', 49898, 'https://p3.dcarimg.com/img/motor-img/e3c9e58761031482824d91d0d05d3590~332x0.webp', 'picture/103.jpg', 'https://www.dongchedi.com/auto/series/4378');
INSERT INTO `item_xiangmu` VALUES (104, '威马E.5', '暂无报价', '2021新款', '2024-03-01', '威马汽车', 9897, '0', '********************车型总数：共4款车型********************车型级别：中型车********************纯电续航里程km：410********************充电时间h：快充0.55小时慢充9小时********************', 49897, 'https://p3.dcarimg.com/img/motor-img/561fc274c90a455fb0c9c2d914345c47~332x0.webp', 'picture/104.jpg', 'https://www.dongchedi.com/auto/series/5152');
INSERT INTO `item_xiangmu` VALUES (105, '帝豪EV', '暂无报价', '', '2023-01-01', '几何汽车', 9896, '0', '********************车型总数：共6款车型********************车型级别：紧凑型车********************纯电续航里程km：421********************充电时间h：快充0.5小时慢充9小时********************', 49896, 'https://p3.dcarimg.com/img/motor-img/0fd8b1fa3b9415afad38741c159dd3e5~332x0.webp', 'picture/105.jpg', 'https://www.dongchedi.com/auto/series/735');
INSERT INTO `item_xiangmu` VALUES (106, '创维汽车EV6', '暂无报价', '新增车型', '2024-04-01', '创维汽车', 9895, '0', '********************车型总数：共8款车型********************车型级别：中型SUV********************纯电续航里程km：410********************充电时间h：快充0.5小时慢充9小时********************', 49895, 'https://p3.dcarimg.com/img/motor-img/befd21fdbd9c3a2223eb499cf9a9e606~332x0.webp', 'picture/106.jpg', 'https://www.dongchedi.com/auto/series/5122');
INSERT INTO `item_xiangmu` VALUES (107, '红旗E-HS3', '暂无报价', '', '2021-08-01', '一汽红旗', 9894, '0', '********************车型总数：共2款车型********************车型级别：紧凑型SUV********************纯电续航里程km：407********************充电时间h：-********************', 49894, 'https://p3.dcarimg.com/img/motor-img/aeb1737f0f84e056a8e71d440b1a3b24~332x0.webp', 'picture/107.jpg', 'https://www.dongchedi.com/auto/series/2861');
INSERT INTO `item_xiangmu` VALUES (108, 'Evija', '暂无报价', '', '2021-11-01', '路特斯', 9893, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：400********************充电时间h：-********************', 49893, 'https://p3.dcarimg.com/img/motor-img/b2e9eeb3ce48d48a787cc8e5eaab325b~332x0.webp', 'picture/108.jpg', 'https://www.dongchedi.com/auto/series/3760');
INSERT INTO `item_xiangmu` VALUES (109, '菲斯塔 纯电动', '暂无报价', '', '2022-02-01', '北京现代', 9892, '3.66', '********************车型总数：共3款车型********************车型级别：紧凑型车********************纯电续航里程km：490********************充电时间h：快充0.67小时慢充9.5小时********************', 49892, 'https://p3.dcarimg.com/img/motor-img/6def6668eda5c8d394c50bffbcb0c134~332x0.webp', 'picture/109.jpg', 'https://www.dongchedi.com/auto/series/3759');
INSERT INTO `item_xiangmu` VALUES (110, '本田e:NP1', '暂无报价', '', '2024-01-01', '广汽本田', 9891, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：********************充电时间h：-********************', 49891, 'https://p3.dcarimg.com/img/motor-img/31240002bd2efd30bfaa4d5b4c64f729~332x0.webp', 'picture/110.jpg', 'https://www.dongchedi.com/auto/series/5392');
INSERT INTO `item_xiangmu` VALUES (111, 'MARVEL R', '暂无报价', '', '2023-02-01', '上汽集团', 9890, '3.77', '********************车型总数：共3款车型********************车型级别：中型SUV********************纯电续航里程km：505********************充电时间h：快充0.5小时慢充12小时********************', 49890, 'https://p3.dcarimg.com/img/motor-img/f32e8ee251a87005a4d0b6242cc5b278~332x0.webp', 'picture/111.jpg', 'https://www.dongchedi.com/auto/series/4529');
INSERT INTO `item_xiangmu` VALUES (112, '丰田C-HR EV', '暂无报价', '', '2022-04-01', '广汽丰田', 9889, '3.65', '********************车型总数：共5款车型********************车型级别：小型SUV********************纯电续航里程km：400********************充电时间h：快充0.83小时慢充6.5/24小时********************', 49889, 'https://p3.dcarimg.com/img/motor-img/2527b344582b3625823947122543bf78~332x0.webp', 'picture/112.jpg', 'https://www.dongchedi.com/auto/series/3338');
INSERT INTO `item_xiangmu` VALUES (113, '前途K50', '暂无报价', '', '2021-08-01', '前途汽车', 9888, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：380********************充电时间h：快充0.75小时慢充13小时********************', 49888, 'https://p3.dcarimg.com/img/motor-img/b0378f52b622d1d88574e059d5ca6163~332x0.webp', 'picture/113.jpg', 'https://www.dongchedi.com/auto/series/1139');
INSERT INTO `item_xiangmu` VALUES (114, '荣威Ei5', '暂无报价', '', '2023-03-01', '上汽集团', 9887, '3.49', '********************车型总数：共3款车型********************车型级别：紧凑型车********************纯电续航里程km：501********************充电时间h：快充0.5小时慢充9.5小时********************', 49887, 'https://p3.dcarimg.com/img/motor-img/f44c223bbfe4ddf0d92ef89139ae89bd~332x0.webp', 'picture/114.jpg', 'https://www.dongchedi.com/auto/series/1760');
INSERT INTO `item_xiangmu` VALUES (115, '北汽豹', '暂无报价', '', '2022-03-01', '北京汽车制造厂', 9886, '0', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：********************充电时间h：-********************', 49886, 'https://p3.dcarimg.com/img/motor-img/79e11500c18d923f40bcb7c961e7439e~332x0.webp', 'picture/115.jpg', 'https://www.dongchedi.com/auto/series/4394');
INSERT INTO `item_xiangmu` VALUES (116, '五菱荣光EV', '暂无报价', '2022新款', '2024-03-01', '上汽通用五菱', 9885, '0', '********************车型总数：共6款车型********************车型级别：微面********************纯电续航里程km：300********************充电时间h：-********************', 49885, 'https://p3.dcarimg.com/img/motor-img/839dcb62d7de394178f6d313060906da~332x0.webp', 'picture/116.jpg', 'https://www.dongchedi.com/auto/series/4320');
INSERT INTO `item_xiangmu` VALUES (117, '广汽本田VE-1', '暂无报价', '', '2023-09-01', '广汽本田', 9884, '3.6', '********************车型总数：共5款车型********************车型级别：小型SUV********************纯电续航里程km：480********************充电时间h：快充0.67小时慢充10.5小时********************', 49884, 'https://p3.dcarimg.com/img/motor-img/6b45b76df3eac473edc4da19a10ce8d7~332x0.webp', 'picture/117.jpg', 'https://www.dongchedi.com/auto/series/3096');
INSERT INTO `item_xiangmu` VALUES (118, '威马W6', '暂无报价', '', '2023-04-01', '威马汽车', 9883, '3.79', '********************车型总数：共4款车型********************车型级别：中型SUV********************纯电续航里程km：520********************充电时间h：快充0.67小时慢充9.5小时********************', 49883, 'https://p3.dcarimg.com/img/motor-img/e4399ede36e1a5443d96e2dd7188cab8~332x0.webp', 'picture/118.jpg', 'https://www.dongchedi.com/auto/series/3398');
INSERT INTO `item_xiangmu` VALUES (119, '北汽新能源EC5', '暂无报价', '', '2021-07-01', '北汽新能源', 9882, '3.27', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：403********************充电时间h：快充0.5小时慢充7.5小时********************', 49882, 'https://p3.dcarimg.com/img/motor-img/98616e7cb6f26f3b0b5820aa8a4fc7b7~332x0.webp', 'picture/119.jpg', 'https://www.dongchedi.com/auto/series/3348');
INSERT INTO `item_xiangmu` VALUES (120, '东风风神E70', '暂无报价', '纯电动销量NO.20', '2024-02-01', '东风乘用车', 9881, '0', '********************车型总数：共3款车型********************车型级别：紧凑型车********************纯电续航里程km：330********************充电时间h：-********************', 49881, 'https://p3.dcarimg.com/img/motor-img/3645e5106165def002a7ab1f2300c71c~332x0.webp', 'picture/120.jpg', 'https://www.dongchedi.com/auto/series/1655');
INSERT INTO `item_xiangmu` VALUES (121, '领界EV', '暂无报价', '', '2022-09-01', '江铃福特', 9880, '0', '********************车型总数：共2款车型********************车型级别：紧凑型SUV********************纯电续航里程km：435********************充电时间h：快充0.53小时慢充8.4小时********************', 49880, 'https://p3.dcarimg.com/img/motor-img/f69c69ea482582b16f04027993b31377~332x0.webp', 'picture/121.jpg', 'https://www.dongchedi.com/auto/series/3367');
INSERT INTO `item_xiangmu` VALUES (122, '爱驰U5', '暂无报价', '', '2023-03-01', '爱驰汽车', 9879, '3.66', '********************车型总数：共8款车型********************车型级别：中型SUV********************纯电续航里程km：405********************充电时间h：快充0.5小时慢充8.5小时********************', 49879, 'https://p3.dcarimg.com/img/motor-img/edb19de5227808630e9987f17c48b68f~332x0.webp', 'picture/122.jpg', 'https://www.dongchedi.com/auto/series/2818');
INSERT INTO `item_xiangmu` VALUES (123, '江淮iEV6E', '暂无报价', '', '2022-03-01', '江淮汽车', 9878, '0', '********************车型总数：共12款车型********************车型级别：微型车********************纯电续航里程km：310********************充电时间h：快充0.67小时********************', 49878, 'https://p3.dcarimg.com/img/motor-img/708b8066fcdeec0ec9983f5a03ed33aa~332x0.webp', 'picture/123.jpg', 'https://www.dongchedi.com/auto/series/749');
INSERT INTO `item_xiangmu` VALUES (124, '传祺GE3', '暂无报价', '', '2021-11-01', '广汽埃安新能源', 9877, '0', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：410********************充电时间h：-********************', 49877, 'https://p3.dcarimg.com/img/mosaic-legacy/beef0000981a1ee73393~332x0.webp', 'picture/124.jpg', 'https://www.dongchedi.com/auto/series/1598');
INSERT INTO `item_xiangmu` VALUES (125, '东风本田X-NV', '暂无报价', '', '2023-09-01', '东风本田', 9876, '3.49', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：465********************充电时间h：快充0.5小时慢充10小时********************', 49876, 'https://p3.dcarimg.com/img/motor-img/9ba4bdf407568878269fa3d35f3468be~332x0.webp', 'picture/125.jpg', 'https://www.dongchedi.com/auto/series/3480');
INSERT INTO `item_xiangmu` VALUES (126, '上汽大通MAXUS MIFA 9', '暂无报价', '', '2023-11-01', '上汽大通', 9875, '0', '********************车型总数：共3款车型********************车型级别：中型MPV********************纯电续航里程km：560********************充电时间h：-********************', 49875, 'https://p3.dcarimg.com/img/motor-img/149f3cd713fb650b0414ba133fad555a~332x0.webp', 'picture/126.jpg', 'https://www.dongchedi.com/auto/series/5063');
INSERT INTO `item_xiangmu` VALUES (127, '百智大熊', '暂无报价', '微型轿车销量NO.13', '2023-12-01', '领途汽车', 9874, '0', '********************车型总数：共7款车型********************车型级别：微型车********************纯电续航里程km：138********************充电时间h：慢充8小时********************', 49874, 'https://p3.dcarimg.com/img/motor-img/05eb24249b823a800141bae742dc6ff2~332x0.webp', 'picture/127.jpg', 'https://www.dongchedi.com/auto/series/5334');
INSERT INTO `item_xiangmu` VALUES (128, '启辰D60 EV', '暂无报价', '', '2023-12-01', '东风日产启辰', 9873, '0', '********************车型总数：共12款车型********************车型级别：紧凑型车********************纯电续航里程km：423********************充电时间h：快充1.05小时********************', 49873, 'https://p3.dcarimg.com/img/motor-img/7777d1faf81e5c399b3acafe3e04b76a~332x0.webp', 'picture/128.jpg', 'https://www.dongchedi.com/auto/series/3351');
INSERT INTO `item_xiangmu` VALUES (129, '北京EU5', '暂无报价', '', '2023-05-01', '北京汽车', 9872, '0', '********************车型总数：共9款车型********************车型级别：紧凑型车********************纯电续航里程km：350********************充电时间h：快充0.5小时********************', 49872, 'https://p3.dcarimg.com/img/motor-img/fac9641308c9c3c9b23765bdcbdd6697~332x0.webp', 'picture/129.jpg', 'https://www.dongchedi.com/auto/series/4074');
INSERT INTO `item_xiangmu` VALUES (130, '朋克多多', '暂无报价', '新增车型', '2023-11-01', '御捷新能源', 9871, '0', '********************车型总数：共5款车型********************车型级别：微型车********************纯电续航里程km：128********************充电时间h：慢充6小时********************', 49871, 'https://p3.dcarimg.com/img/motor-img/be6a91bbd5caff44e4aaca634a6d3b03~332x0.webp', 'picture/130.jpg', 'https://www.dongchedi.com/auto/series/4944');
INSERT INTO `item_xiangmu` VALUES (131, '奔腾NAT', '暂无报价', '紧凑型MPV销量NO.12', '2024-03-01', '一汽奔腾', 9870, '0', '********************车型总数：共16款车型********************车型级别：紧凑型MPV********************纯电续航里程km：419********************充电时间h：快充0.5小时********************', 49870, 'https://p3.dcarimg.com/img/motor-img/86e59b68321279091b353bb89ec0d411~332x0.webp', 'picture/131.jpg', 'https://www.dongchedi.com/auto/series/4861');
INSERT INTO `item_xiangmu` VALUES (132, '奕泽E进擎', '暂无报价', '', '2022-05-01', '一汽丰田', 9869, '3.64', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：400********************充电时间h：快充0.83小时慢充6.5小时********************', 49869, 'https://p3.dcarimg.com/img/motor-img/568afb3b5448751686b7f757408ced1b~332x0.webp', 'picture/132.jpg', 'https://www.dongchedi.com/auto/series/3339');
INSERT INTO `item_xiangmu` VALUES (133, '恒驰5', '暂无报价', '即将上市', '2024-01-01', '恒驰', 9868, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：602********************充电时间h：-********************', 49868, 'https://p3.dcarimg.com/img/motor-img/67caedf62c5440380ccd68cd58da3d14~332x0.webp', 'picture/133.jpg', 'https://www.dongchedi.com/auto/series/4678');
INSERT INTO `item_xiangmu` VALUES (134, '橙仕01', '暂无报价', '', '2023-11-01', '豪驰智能', 9867, '0', '********************车型总数：共9款车型********************车型级别：微面********************纯电续航里程km：120********************充电时间h：慢充7.5小时********************', 49867, 'https://p3.dcarimg.com/img/motor-img/7155d1c7661ddbff4740f709d9f86cfc~332x0.webp', 'picture/134.jpg', 'https://www.dongchedi.com/auto/series/4919');
INSERT INTO `item_xiangmu` VALUES (135, '奥迪e-tron Sportback(进口)', '暂无报价', '', '2023-12-01', '奥迪(进口)', 9866, '0', '********************车型总数：共3款车型********************车型级别：中大型SUV********************纯电续航里程km：500********************充电时间h：快充0.67小时********************', 49866, 'https://p3.dcarimg.com/img/motor-img/53b0d3710835177695ee94d1375228d1~332x0.webp', 'picture/135.jpg', 'https://www.dongchedi.com/auto/series/4962');
INSERT INTO `item_xiangmu` VALUES (136, '本田e:NS1', '暂无报价', '即将上市', '2024-04-01', '东风本田', 9865, '0', '********************车型总数：共4款车型********************车型级别：小型SUV********************纯电续航里程km：********************充电时间h：-********************', 49867, 'https://p3.dcarimg.com/img/motor-img/67348dec0a823646876c4e9ccd332d47~332x0.webp', 'picture/136.jpg', 'https://www.dongchedi.com/auto/series/5387');
INSERT INTO `item_xiangmu` VALUES (137, '凌宝COCO', '暂无报价', '', '2023-08-01', '吉麦新能源', 9864, '0', '********************车型总数：共5款车型********************车型级别：微型车********************纯电续航里程km：130********************充电时间h：慢充7小时********************', 49864, 'https://p3.dcarimg.com/img/motor-img/111284e8347160f59512ad08dab736a3~332x0.webp', 'picture/137.jpg', 'https://www.dongchedi.com/auto/series/5032');
INSERT INTO `item_xiangmu` VALUES (138, '帝豪GSe', '暂无报价', '', '2022-02-01', '几何汽车', 9863, '0', '********************车型总数：共5款车型********************车型级别：紧凑型SUV********************纯电续航里程km：400********************充电时间h：快充0.5小时慢充6.6小时********************', 49863, 'https://p3.dcarimg.com/img/motor-img/c5235ef465e95838cbaa27646a898626~332x0.webp', 'picture/138.jpg', 'https://www.dongchedi.com/auto/series/2920');
INSERT INTO `item_xiangmu` VALUES (139, '腾势X BEV', '暂无报价', '', '2021-11-01', '腾势汽车', 9862, '3.9', '********************车型总数：共4款车型********************车型级别：中型SUV********************纯电续航里程km：520********************充电时间h：快充0.5小时********************', 49862, 'https://p3.dcarimg.com/img/motor-img/3075c6e3fdaa9d8bd05946edcbda04cf~332x0.webp', 'picture/139.jpg', 'https://www.dongchedi.com/auto/series/4305');
INSERT INTO `item_xiangmu` VALUES (140, '启辰e30', '暂无报价', '', '2023-06-01', '东风日产启辰', 9861, '0', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：301********************充电时间h：快充0.5小时慢充4小时********************', 49861, 'https://p3.dcarimg.com/img/motor-img/30a646d6e4aba66fe6d6309c9e4f498a~332x0.webp', 'picture/140.jpg', 'https://www.dongchedi.com/auto/series/3452');
INSERT INTO `item_xiangmu` VALUES (141, '长安欧尚X7 EV', '暂无报价', '', '2022-08-01', '长安汽车', 9860, '0', '********************车型总数：共3款车型********************车型级别：紧凑型SUV********************纯电续航里程km：405********************充电时间h：快充0.5小时慢充9小时********************', 49860, 'https://p3.dcarimg.com/img/motor-img/3fe5e43030a9bd198042004bb7addcb8~332x0.webp', 'picture/141.jpg', 'https://www.dongchedi.com/auto/series/4202');
INSERT INTO `item_xiangmu` VALUES (142, '开云电皮卡', '暂无报价', '', '2021-01-01', '开云汽车', 9859, '0', '********************车型总数：共2款车型********************车型级别：迷你皮卡********************纯电续航里程km：110********************充电时间h：快充8小时慢充10小时********************', 49859, 'https://p3.dcarimg.com/img/motor-img/811303390159be1543376e44c29ffb6a~332x0.webp', 'picture/142.jpg', 'https://www.dongchedi.com/auto/series/3163');
INSERT INTO `item_xiangmu` VALUES (143, '机甲龙', '暂无报价', '', '2023-11-01', '长城汽车', 9858, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：********************充电时间h：-********************', 49858, 'https://p3.dcarimg.com/img/motor-img/7b0d0563435bf0523047b0c7dea54ac7~332x0.webp', 'picture/143.jpg', 'https://www.dongchedi.com/auto/series/5464');
INSERT INTO `item_xiangmu` VALUES (144, '名爵EZS纯电动', '暂无报价', '', '2021-03-01', '上汽集团', 9857, '0', '********************车型总数：共4款车型********************车型级别：小型SUV********************纯电续航里程km：335********************充电时间h：快充0.5小时慢充6.5小时********************', 49857, 'https://p3.dcarimg.com/img/motor-img/3557fd1cf1c63f3636675b38a4392b7c~332x0.webp', 'picture/144.jpg', 'https://www.dongchedi.com/auto/series/3080');
INSERT INTO `item_xiangmu` VALUES (145, '朋克美美', '暂无报价', '微型轿车销量NO.14', '2024-03-01', '御捷新能源', 9856, '0', '********************车型总数：共6款车型********************车型级别：微型车********************纯电续航里程km：116********************充电时间h：慢充8小时********************', 49856, 'https://p3.dcarimg.com/img/motor-img/60a10e5922963f11d17424a6c51dff36~332x0.webp', 'picture/145.jpg', 'https://www.dongchedi.com/auto/series/4871');
INSERT INTO `item_xiangmu` VALUES (146, '瑞虎3xe', '暂无报价', '', '2021-03-01', '奇瑞新能源', 9855, '0', '********************车型总数：共4款车型********************车型级别：小型SUV********************纯电续航里程km：401********************充电时间h：快充0.5小时慢充8小时********************', 49855, 'https://p3.dcarimg.com/img/motor-img/afcd49305b29d2757b5a158b6415d2de~332x0.webp', 'picture/146.jpg', 'https://www.dongchedi.com/auto/series/1818');
INSERT INTO `item_xiangmu` VALUES (147, '上汽大通MAXUS EUNIQ 5', '暂无报价', '紧凑型MPV销量NO.16', '2023-10-01', '上汽大通', 9854, '0', '********************车型总数：共11款车型********************车型级别：紧凑型MPV********************纯电续航里程km：510********************充电时间h：快充0.58小时慢充12小时********************', 49854, 'https://p3.dcarimg.com/img/motor-img/354c8a5c18eac800fb99bf243c49a57a~332x0.webp', 'picture/147.jpg', 'https://www.dongchedi.com/auto/series/3468');
INSERT INTO `item_xiangmu` VALUES (148, '长安欧尚A600 EV', '暂无报价', '', '2023-03-01', '长安汽车', 9853, '0', '********************车型总数：共5款车型********************车型级别：紧凑型MPV********************纯电续航里程km：402********************充电时间h：快充1小时慢充16小时********************', 49853, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000683b18094dbf~332x0.webp', 'picture/148.jpg', 'https://www.dongchedi.com/auto/series/2986');
INSERT INTO `item_xiangmu` VALUES (149, '风行S50 EV', '暂无报价', '', '2023-10-01', '东风风行', 9852, '0', '********************车型总数：共6款车型********************车型级别：紧凑型车********************纯电续航里程km：415********************充电时间h：快充0.5小时慢充11小时********************', 49852, 'https://p3.dcarimg.com/img/motor-img/7dc51c86c5c6d2541cadc95dcf4aa5d0~332x0.webp', 'picture/149.jpg', 'https://www.dongchedi.com/auto/series/1810');
INSERT INTO `item_xiangmu` VALUES (150, '炮EV', '暂无报价', '', '2022-09-01', '长城汽车', 9851, '0', '********************车型总数：共4款车型********************车型级别：中型皮卡********************纯电续航里程km：405********************充电时间h：-********************', 49851, 'https://p3.dcarimg.com/img/motor-img/cd572fcae15d8f970e61c968f299aa11~332x0.webp', 'picture/150.jpg', 'https://www.dongchedi.com/auto/series/3469');
INSERT INTO `item_xiangmu` VALUES (151, '起亚K3 EV', '暂无报价', '', '2023-06-01', '东风悦达起亚', 9850, '3.56', '********************车型总数：共4款车型********************车型级别：紧凑型车********************纯电续航里程km：410********************充电时间h：-********************', 49850, 'https://p3.dcarimg.com/img/motor-img/84eb314bb191ef1217b3dceb4b0a6db6~332x0.webp', 'picture/151.jpg', 'https://www.dongchedi.com/auto/series/4294');
INSERT INTO `item_xiangmu` VALUES (152, '悦虎', '暂无报价', '', '2022-05-01', '大运汽车', 9849, '0', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：300********************充电时间h：快充0.6小时********************', 49849, 'https://p3.dcarimg.com/img/motor-img/576f3fce4d4b5bfe6a717ccc1047eff5~332x0.webp', 'picture/152.jpg', 'https://www.dongchedi.com/auto/series/4388');
INSERT INTO `item_xiangmu` VALUES (153, '五菱EV50', '暂无报价', '', '2023-08-01', '五菱工业', 9848, '0', '********************车型总数：共12款车型********************车型级别：微面********************纯电续航里程km：300********************充电时间h：-********************', 49848, 'https://p3.dcarimg.com/img/motor-img/044382f4c36515d97cc11893f22e01f8~332x0.webp', 'picture/153.jpg', 'https://www.dongchedi.com/auto/series/4490');
INSERT INTO `item_xiangmu` VALUES (154, '易至EV3小雷达', '暂无报价', '微型轿车销量NO.18', '2023-12-01', '江铃集团新能源', 9847, '0', '********************车型总数：共2款车型********************车型级别：微型车********************纯电续航里程km：302********************充电时间h：快充0.5小时慢充10.6小时********************', 49847, 'https://p3.dcarimg.com/img/motor-img/486c35ff335c82c459a433101236db5d~332x0.webp', 'picture/154.jpg', 'https://www.dongchedi.com/auto/series/3028');
INSERT INTO `item_xiangmu` VALUES (155, '标致e-2008', '暂无报价', '', '2022-05-01', '东风标致', 9846, '3.64', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：360********************充电时间h：快充0.5小时慢充8小时********************', 49846, 'https://p3.dcarimg.com/img/motor-img/58c815f7081b5e55e7b78e54eb583e76~332x0.webp', 'picture/155.jpg', 'https://www.dongchedi.com/auto/series/4275');
INSERT INTO `item_xiangmu` VALUES (156, '北汽小猫', '暂无报价', '', '2022-06-01', '北京汽车制造厂', 9845, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49845, 'https://p3.dcarimg.com/img/motor-img/beba9a2fe3ed255bb5533d2ee0bbcf44~332x0.webp', 'picture/156.jpg', 'https://www.dongchedi.com/auto/series/4390');
INSERT INTO `item_xiangmu` VALUES (157, '威马EX6', '暂无报价', '', '2022-07-01', '威马汽车', 9844, '0', '********************车型总数：共3款车型********************车型级别：中型SUV********************纯电续航里程km：408********************充电时间h：快充0.5小时慢充9小时********************', 49844, 'https://p3.dcarimg.com/img/motor-img/71d62d7bf81d92aa020a9220ea24c1f1~332x0.webp', 'picture/157.jpg', 'https://www.dongchedi.com/auto/series/2846');
INSERT INTO `item_xiangmu` VALUES (158, '上汽大通MAXUS EUNIQ 6', '暂无报价', '', '2023-05-01', '上汽大通', 9843, '0', '********************车型总数：共4款车型********************车型级别：中型SUV********************纯电续航里程km：510********************充电时间h：快充0.55小时慢充11小时********************', 49843, 'https://p3.dcarimg.com/img/motor-img/eea0af8eaac3b4a0e837ec1c1833bd6d~332x0.webp', 'picture/158.jpg', 'https://www.dongchedi.com/auto/series/3464');
INSERT INTO `item_xiangmu` VALUES (159, '绎乐', '暂无报价', '', '2023-03-01', '广汽本田', 9842, '3.72', '********************车型总数：共2款车型********************车型级别：紧凑型车********************纯电续航里程km：510********************充电时间h：快充0.78小时慢充10小时********************', 49842, 'https://p3.dcarimg.com/img/motor-img/7c81468c2481b939613261d525bd1e8b~332x0.webp', 'picture/159.jpg', 'https://www.dongchedi.com/auto/series/4795');
INSERT INTO `item_xiangmu` VALUES (160, '天际ME7', '暂无报价', '', '2023-03-01', '天际汽车', 9841, '0', '********************车型总数：共2款车型********************车型级别：中型SUV********************纯电续航里程km：410********************充电时间h：快充0.75小时慢充10.9小时********************', 49841, 'https://p3.dcarimg.com/img/motor-img/dae10ce6e631acebd17a14662ee71d1b~332x0.webp', 'picture/160.jpg', 'https://www.dongchedi.com/auto/series/3075');
INSERT INTO `item_xiangmu` VALUES (161, '华晨新日i03', '暂无报价', '微型轿车销量NO.17', '2023-10-01', '华晨新日', 9840, '0', '********************车型总数：共2款车型********************车型级别：微型车********************纯电续航里程km：318********************充电时间h：快充0.75小时慢充12小时********************', 49840, 'https://p3.dcarimg.com/img/motor-img/6f94191738bca583a363b6a29c8a5c85~332x0.webp', 'picture/161.jpg', 'https://www.dongchedi.com/auto/series/4834');
INSERT INTO `item_xiangmu` VALUES (162, '东风小康EC36', '暂无报价', '2022新款', '2024-04-01', '东风小康', 9839, '0', '********************车型总数：共2款车型********************车型级别：微面********************纯电续航里程km：300********************充电时间h：-********************', 49843, 'https://p3.dcarimg.com/img/motor-img/822a1a609747067a12188eca055fa04f~332x0.webp', 'picture/162.jpg', 'https://www.dongchedi.com/auto/series/475');
INSERT INTO `item_xiangmu` VALUES (163, '名图 纯电动', '暂无报价', '', '2023-03-01', '北京现代', 9838, '3.66', '********************车型总数：共3款车型********************车型级别：中型车********************纯电续航里程km：520********************充电时间h：慢充9.5小时********************', 49838, 'https://p3.dcarimg.com/img/motor-img/b67b3eec8cfd60f7bff89c8e01f844a6~332x0.webp', 'picture/163.jpg', 'https://www.dongchedi.com/auto/series/4758');
INSERT INTO `item_xiangmu` VALUES (164, 'ID. Buzz', '暂无报价', '', '2024-01-01', '大众(进口)', 9837, '0', '********************车型总数：共1款车型********************车型级别：中型MPV********************纯电续航里程km：********************充电时间h：********************', 49837, 'https://p3.dcarimg.com/img/mosaic-legacy/bef5000050aa34b65ecb~332x0.webp', 'picture/164.jpg', 'https://www.dongchedi.com/auto/series/2121');
INSERT INTO `item_xiangmu` VALUES (165, 'Model Y(海外)', '暂无报价', '', '2024-01-01', '特斯拉(进口)', 9836, '0', '********************车型总数：共2款车型********************车型级别：中型SUV********************纯电续航里程km：505********************充电时间h：-********************', 49836, 'https://p3.dcarimg.com/img/mosaic-legacy/bef4000061619ac4963a~332x0.webp', 'picture/165.jpg', 'https://www.dongchedi.com/auto/series/3178');
INSERT INTO `item_xiangmu` VALUES (166, '艾瑞泽e', '暂无报价', '', '2023-04-01', '奇瑞新能源', 9835, '0', '********************车型总数：共7款车型********************车型级别：紧凑型车********************纯电续航里程km：401********************充电时间h：快充0.5小时慢充9小时********************', 49835, 'https://p3.dcarimg.com/img/motor-img/801fac00fa4a0818fc25e1fc20372dda~332x0.webp', 'picture/166.jpg', 'https://www.dongchedi.com/auto/series/4086');
INSERT INTO `item_xiangmu` VALUES (167, '海马爱尚EV', '暂无报价', '', '2022-12-01', '海马汽车', 9834, '0', '********************车型总数：共2款车型********************车型级别：微型车********************纯电续航里程km：100********************充电时间h：-********************', 49834, 'https://p3.dcarimg.com/img/motor-img/fd3ae8d2d731be26505bd843367f37cb~332x0.webp', 'picture/167.jpg', 'https://www.dongchedi.com/auto/series/1583');
INSERT INTO `item_xiangmu` VALUES (168, 'DS 3 EV', '暂无报价', '', '2023-05-01', 'DS(进口)', 9833, '0', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：360********************充电时间h：快充0.5小时慢充16小时********************', 49833, 'https://p3.dcarimg.com/img/motor-img/a1e11c23e112df16349895f8acdfbaf4~332x0.webp', 'picture/168.jpg', 'https://www.dongchedi.com/auto/series/3383');
INSERT INTO `item_xiangmu` VALUES (169, '风行S60 EV', '暂无报价', '', '2023-11-01', '东风风行', 9832, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：415********************充电时间h：快充0.5小时慢充11小时********************', 49832, 'https://p3.dcarimg.com/img/motor-img/389103cfe935e252d4fcc5ab3dc96ffe~332x0.webp', 'picture/169.jpg', 'https://www.dongchedi.com/auto/series/5453');
INSERT INTO `item_xiangmu` VALUES (170, '北京EU5 PLUS', '暂无报价', '', '2023-05-01', '北京汽车', 9831, '0', '********************车型总数：共4款车型********************车型级别：紧凑型车********************纯电续航里程km：416********************充电时间h：快充0.5小时慢充8.5小时********************', 49831, 'https://p3.dcarimg.com/img/motor-img/9179844258a6fc2676f8ee5a47a3c085~332x0.webp', 'picture/170.jpg', 'https://www.dongchedi.com/auto/series/5102');
INSERT INTO `item_xiangmu` VALUES (171, '瑞虎e', '暂无报价', '', '2022-10-01', '奇瑞新能源', 9830, '0', '********************车型总数：共8款车型********************车型级别：小型SUV********************纯电续航里程km：401********************充电时间h：快充0.5小时慢充8小时********************', 49830, 'https://p3.dcarimg.com/img/motor-img/47395e6141c3888a30ff8334b3a430d1~332x0.webp', 'picture/171.jpg', 'https://www.dongchedi.com/auto/series/3387');
INSERT INTO `item_xiangmu` VALUES (172, '恒润HRS1', '暂无报价', '2022新款', '2024-03-01', '恒润汽车', 9829, '0', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：305********************充电时间h：慢充12小时********************', 49829, 'https://p3.dcarimg.com/img/motor-img/ace22b91ea6900d1659b1928bb5c55c9~332x0.webp', 'picture/172.jpg', 'https://www.dongchedi.com/auto/series/5181');
INSERT INTO `item_xiangmu` VALUES (173, 'Modern in', '暂无报价', '', '2023-11-01', '摩登汽车', 9828, '0', '********************车型总数：共4款车型********************车型级别：紧凑型SUV********************纯电续航里程km：420********************充电时间h：快充0.5小时慢充7小时********************', 49828, 'https://p3.dcarimg.com/img/motor-img/de69d1f7fbcb1bd1e2d203600286a72b~332x0.webp', 'picture/173.jpg', 'https://www.dongchedi.com/auto/series/4837');
INSERT INTO `item_xiangmu` VALUES (174, '橙仕X2', '暂无报价', '', '2024-02-01', '豪驰智能', 9827, '0', '********************车型总数：共3款车型********************车型级别：微卡********************纯电续航里程km：120********************充电时间h：-********************', 49827, 'https://p3.dcarimg.com/img/motor-img/b7ef68707863f9bff89e426f594d69c4~332x0.webp', 'picture/174.jpg', 'https://www.dongchedi.com/auto/series/5822');
INSERT INTO `item_xiangmu` VALUES (175, '启辰T60 EV', '暂无报价', '', '2021-11-01', '东风日产启辰', 9826, '0', '********************车型总数：共4款车型********************车型级别：小型SUV********************纯电续航里程km：442********************充电时间h：快充0.5小时慢充6.8小时********************', 49826, 'https://p3.dcarimg.com/img/motor-img/8580d3841feffe043c2ca57c2cf034c7~332x0.webp', 'picture/175.jpg', 'https://www.dongchedi.com/auto/series/3453');
INSERT INTO `item_xiangmu` VALUES (176, '捷途X70S EV', '暂无报价', '', '2021-09-01', '奇瑞汽车', 9825, '0', '********************车型总数：共3款车型********************车型级别：中型SUV********************纯电续航里程km：401********************充电时间h：快充0.5小时慢充8小时********************', 49825, 'https://p3.dcarimg.com/img/motor-img/f4e6e2fbaa0cecf457663534e094c6f1~332x0.webp', 'picture/176.jpg', 'https://www.dongchedi.com/auto/series/3353');
INSERT INTO `item_xiangmu` VALUES (177, '五菱电卡', '暂无报价', '', '2023-05-01', '五菱工业', 9824, '0', '********************车型总数：共19款车型********************车型级别：微卡********************纯电续航里程km：300********************充电时间h：-********************', 49824, 'https://p3.dcarimg.com/img/motor-img/680206d0d7edd1a219254f95e5263824~332x0.webp', 'picture/177.jpg', 'https://www.dongchedi.com/auto/series/5145');
INSERT INTO `item_xiangmu` VALUES (178, 'KOMI', '暂无报价', '', '2023-12-01', '嘉远汽车', 9823, '0', '********************车型总数：共3款车型********************车型级别：微型车********************纯电续航里程km：170********************充电时间h：慢充8小时********************', 49823, 'https://p3.dcarimg.com/img/motor-img/8baeb687ac665ff25e5e81c61563c63e~332x0.webp', 'picture/178.jpg', 'https://www.dongchedi.com/auto/series/5546');
INSERT INTO `item_xiangmu` VALUES (179, '枫叶30X', '暂无报价', '', '2022-07-01', '睿蓝汽车', 9822, '3.33', '********************车型总数：共6款车型********************车型级别：小型SUV********************纯电续航里程km：306********************充电时间h：快充0.5小时慢充7小时********************', 49822, 'https://p3.dcarimg.com/img/motor-img/10ee0a7a5f264f45fd261eb0985a64ad~332x0.webp', 'picture/179.jpg', 'https://www.dongchedi.com/auto/series/4488');
INSERT INTO `item_xiangmu` VALUES (180, '合创汽车007', '暂无报价', '', '2023-05-01', '合创汽车', 9821, '3.73', '********************车型总数：共5款车型********************车型级别：中型SUV********************纯电续航里程km：523********************充电时间h：快充0.55小时慢充6.2小时********************', 49821, 'https://p3.dcarimg.com/img/motor-img/08a44355529f774514bb9aa8957929a2~332x0.webp', 'picture/180.jpg', 'https://www.dongchedi.com/auto/series/3723');
INSERT INTO `item_xiangmu` VALUES (181, '思皓E40X', '暂无报价', '', '2024-03-01', '江汽集团', 9820, '0', '********************车型总数：共6款车型********************车型级别：小型SUV********************纯电续航里程km：420********************充电时间h：快充0.75小时慢充9.5小时********************', 49820, 'https://p3.dcarimg.com/img/motor-img/f2d48c789b8f43889b689066027fc781~332x0.webp', 'picture/181.jpg', 'https://www.dongchedi.com/auto/series/4650');
INSERT INTO `item_xiangmu` VALUES (182, '枫叶60s', '暂无报价', '2022新款', '2024-03-01', '睿蓝汽车', 9819, '0', '********************车型总数：共8款车型********************车型级别：紧凑型车********************纯电续航里程km：407********************充电时间h：快充0.5小时********************', 49819, 'https://p3.dcarimg.com/img/motor-img/22ab00035ad9fd4ac71b8baf75aa7293~332x0.webp', 'picture/182.jpg', 'https://www.dongchedi.com/auto/series/5151');
INSERT INTO `item_xiangmu` VALUES (183, 'Terzo Millennio', '暂无报价', '', '2024-01-01', '兰博基尼', 9818, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49818, 'https://p3.dcarimg.com/img/mosaic-legacy/bef50000893be0a5adb4~332x0.webp', 'picture/183.jpg', 'https://www.dongchedi.com/auto/series/1961');
INSERT INTO `item_xiangmu` VALUES (184, '风光E3', '暂无报价', '', '2021-11-01', '东风小康', 9817, '0', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：100********************充电时间h：-********************', 49817, 'https://p3.dcarimg.com/img/motor-img/5d8239f3c0e1b3c8e2f32dc007831163~332x0.webp', 'picture/184.jpg', 'https://www.dongchedi.com/auto/series/3366');
INSERT INTO `item_xiangmu` VALUES (185, '菱智M5 EV', '暂无报价', '新增车型', '2024-03-01', '东风风行', 9816, '0', '********************车型总数：共13款车型********************车型级别：中型MPV********************纯电续航里程km：401********************充电时间h：快充0.58小时慢充13小时********************', 49816, 'https://p3.dcarimg.com/img/motor-img/15d17f467e2b685be5487fe2fcad8df9~332x0.webp', 'picture/185.jpg', 'https://www.dongchedi.com/auto/series/1793');
INSERT INTO `item_xiangmu` VALUES (186, '北京EU7', '暂无报价', '', '2023-12-01', '北京汽车', 9815, '3.71', '********************车型总数：共6款车型********************车型级别：中型车********************纯电续航里程km：475********************充电时间h：快充0.5小时慢充10小时********************', 49815, 'https://p3.dcarimg.com/img/motor-img/a89ebb93dfc879c3e9a1ed65c37a7388~332x0.webp', 'picture/186.jpg', 'https://www.dongchedi.com/auto/series/3349');
INSERT INTO `item_xiangmu` VALUES (187, 'FF 91', '暂无报价', '', '2024-01-01', 'Faraday Future', 9814, '0', '********************车型总数：共1款车型********************车型级别：中大型SUV********************纯电续航里程km：********************充电时间h：********************', 49814, 'https://p3.dcarimg.com/img/mosaic-legacy/bef20000bdf38c0cb1cf~332x0.webp', 'picture/187.jpg', 'https://www.dongchedi.com/auto/series/2785');
INSERT INTO `item_xiangmu` VALUES (188, '奔腾E01', '暂无报价', '', '2022-09-01', '一汽奔腾', 9813, '3.69', '********************车型总数：共5款车型********************车型级别：中型SUV********************纯电续航里程km：450********************充电时间h：快充0.5小时慢充9.5小时********************', 49815, 'https://p3.dcarimg.com/img/motor-img/3775b0fd779b392934bda5da3e46864d~332x0.webp', 'picture/188.jpg', 'https://www.dongchedi.com/auto/series/4278');
INSERT INTO `item_xiangmu` VALUES (189, '东风风神E60', '暂无报价', '', '2023-07-01', '东风乘用车', 9812, '0', '********************车型总数：共3款车型********************车型级别：紧凑型车********************纯电续航里程km：330********************充电时间h：-********************', 49812, 'https://p3.dcarimg.com/img/motor-img/3645e5106165def002a7ab1f2300c71c~332x0.webp', 'picture/189.jpg', 'https://www.dongchedi.com/auto/series/5265');
INSERT INTO `item_xiangmu` VALUES (190, '风光E1', '暂无报价', '', '2021-11-01', '东风小康', 9811, '0', '********************车型总数：共4款车型********************车型级别：小型SUV********************纯电续航里程km：271********************充电时间h：快充0.5小时慢充4小时********************', 49811, 'https://p3.dcarimg.com/img/motor-img/7bcdf06c41ff8ef6a44d542f8e4ad19d~332x0.webp', 'picture/190.jpg', 'https://www.dongchedi.com/auto/series/4224');
INSERT INTO `item_xiangmu` VALUES (191, '远志M1', '暂无报价', '2022新款', '2024-03-01', '大运汽车', 9810, '0', '********************车型总数：共30款车型********************车型级别：中型MPV********************纯电续航里程km：450********************充电时间h：快充0.6小时********************', 49810, 'https://p3.dcarimg.com/img/motor-img/1391df865bb70731fc6a7ad8cce7f124~332x0.webp', 'picture/191.jpg', 'https://www.dongchedi.com/auto/series/4542');
INSERT INTO `item_xiangmu` VALUES (192, '江淮iEV7S', '暂无报价', '', '2022-03-01', '江淮汽车', 9809, '0', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：301********************充电时间h：快充0.67小时慢充8小时********************', 49809, 'https://p3.dcarimg.com/img/mosaic-legacy/bef100011a1657fb2ace~332x0.webp', 'picture/192.jpg', 'https://www.dongchedi.com/auto/series/1706');
INSERT INTO `item_xiangmu` VALUES (193, '野马EC60', '暂无报价', '', '2023-06-01', '野马新能源', 9808, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：470********************充电时间h：快充0.67小时慢充8小时********************', 49808, 'https://p3.dcarimg.com/img/motor-img/2994b6d63d826dff413de1878ef2f367~332x0.webp', 'picture/193.jpg', 'https://www.dongchedi.com/auto/series/3003');
INSERT INTO `item_xiangmu` VALUES (194, '上汽大通MAXUS EV30', '暂无报价', '', '2023-04-01', '上汽大通', 9807, '0', '********************车型总数：共2款车型********************车型级别：微面********************纯电续航里程km：312********************充电时间h：快充0.75小时********************', 49807, 'https://p3.dcarimg.com/img/motor-img/e9b0db1b997ae80b84d981f309b8de8d~332x0.webp', 'picture/194.jpg', 'https://www.dongchedi.com/auto/series/3151');
INSERT INTO `item_xiangmu` VALUES (195, '思皓E50A', '暂无报价', '', '2023-04-01', '江汽集团', 9806, '0', '********************车型总数：共2款车型********************车型级别：紧凑型车********************纯电续航里程km：402********************充电时间h：快充0.6小时慢充6.5小时********************', 49806, 'https://p3.dcarimg.com/img/motor-img/0dbcd61f17f435d63484d04c4eb76344~332x0.webp', 'picture/195.jpg', 'https://www.dongchedi.com/auto/series/4649');
INSERT INTO `item_xiangmu` VALUES (196, '上汽大通MAXUS T90 EV', '暂无报价', '新增车型', '2023-03-01', '上汽大通', 9805, '0', '********************车型总数：共2款车型********************车型级别：中型皮卡********************纯电续航里程km：535********************充电时间h：-********************', 49805, 'https://p3.dcarimg.com/img/motor-img/08b128c2e655aed1c6a102cd44372c10~332x0.webp', 'picture/196.jpg', 'https://www.dongchedi.com/auto/series/4821');
INSERT INTO `item_xiangmu` VALUES (197, '力帆枫叶80V', '暂无报价', '', '2023-08-01', '力帆汽车', 9804, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：415********************充电时间h：快充0.5小时********************', 49804, 'https://p3.dcarimg.com/img/motor-img/b395b40c147711ebf5aea138d010a6e5~332x0.webp', 'picture/197.jpg', 'https://www.dongchedi.com/auto/series/5313');
INSERT INTO `item_xiangmu` VALUES (198, '海豚EV', '暂无报价', '', '2023-02-01', '开瑞汽车', 9803, '0', '********************车型总数：共6款车型********************车型级别：微面********************纯电续航里程km：271********************充电时间h：-********************', 49803, 'https://p3.dcarimg.com/img/motor-img/0c1239dd3c751242b71841094e65683f~332x0.webp', 'picture/198.jpg', 'https://www.dongchedi.com/auto/series/4154');
INSERT INTO `item_xiangmu` VALUES (199, '华晨新日i03A', '暂无报价', '微型轿车销量NO.19', '2023-10-01', '华晨新日', 9802, '0', '********************车型总数：共2款车型********************车型级别：微型车********************纯电续航里程km：318********************充电时间h：快充0.75小时慢充12小时********************', 49802, 'https://p3.dcarimg.com/img/motor-img/76b290a10547a7aa87424d1f5e02ef78~332x0.webp', 'picture/199.jpg', 'https://www.dongchedi.com/auto/series/5407');
INSERT INTO `item_xiangmu` VALUES (200, '华梓1号', '暂无报价', '', '2023-10-01', '华梓汽车', 9801, '0', '********************车型总数：共3款车型********************车型级别：微型车********************纯电续航里程km：101********************充电时间h：慢充6小时********************', 49801, 'https://p3.dcarimg.com/img/motor-img/d26cf2200b991b4bc5dea8392b8919be~332x0.webp', 'picture/200.jpg', 'https://www.dongchedi.com/auto/series/5415');
INSERT INTO `item_xiangmu` VALUES (201, 'MINI ELECTRIC', '暂无报价', '', '2024-01-01', 'MINI', 9800, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：********************', 49800, 'https://p3.dcarimg.com/img/motor-img/a92dff04887b9606aa5b7e94f478e54d~332x0.webp', 'picture/201.jpg', 'https://www.dongchedi.com/auto/series/1740');
INSERT INTO `item_xiangmu` VALUES (202, '炫界Pro EV', '暂无报价', '', '2023-09-01', '凯翼汽车', 9799, '0', '********************车型总数：共3款车型********************车型级别：紧凑型SUV********************纯电续航里程km：401********************充电时间h：快充0.5小时慢充8小时********************', 49799, 'https://p3.dcarimg.com/img/motor-img/ada16f272a4281f98f988a28fa6ff226~332x0.webp', 'picture/202.jpg', 'https://www.dongchedi.com/auto/series/5367');
INSERT INTO `item_xiangmu` VALUES (203, 'Nils', '暂无报价', '', '2024-01-01', '大众(进口)', 9798, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49798, 'https://p3.dcarimg.com/img/motor-img/e1e315d1e04d74ebeba0b9e549071e03~332x0.webp', 'picture/203.jpg', 'https://www.dongchedi.com/auto/series/2374');
INSERT INTO `item_xiangmu` VALUES (204, '沃尔沃C40 RECHARGE', '暂无报价', '即将上市', '2024-01-01', '沃尔沃亚太', 9797, '0', '********************车型总数：共3款车型********************车型级别：紧凑型SUV********************纯电续航里程km：550********************充电时间h：快充0.67小时慢充10小时********************', 49797, 'https://p3.dcarimg.com/img/motor-img/25b623aecf243d53b60b711589594248~332x0.webp', 'picture/204.jpg', 'https://www.dongchedi.com/auto/series/4924');
INSERT INTO `item_xiangmu` VALUES (205, '瑞驰EC35', '暂无报价', '', '2023-09-01', '瑞驰新能源', 9796, '0', '********************车型总数：共8款车型********************车型级别：微面********************纯电续航里程km：260********************充电时间h：-********************', 49796, 'https://p3.dcarimg.com/img/motor-img/6b911d7d4df3fc67e1b572f2eda5389e~332x0.webp', 'picture/205.jpg', 'https://www.dongchedi.com/auto/series/1910');
INSERT INTO `item_xiangmu` VALUES (206, 'Nexo', '暂无报价', '', '2024-01-01', '现代(进口)', 9795, '0', '********************车型总数：共1款车型********************车型级别：中大型SUV********************纯电续航里程km：********************充电时间h：********************', 49795, 'https://p3.dcarimg.com/img/mosaic-legacy/1767500005ad00811f0ef~332x0.webp', 'picture/206.jpg', 'https://www.dongchedi.com/auto/series/1956');
INSERT INTO `item_xiangmu` VALUES (207, '小鹏汽车BETA版', '暂无报价', '', '2024-01-01', '小鹏汽车', 9794, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：300********************充电时间h：-********************', 49794, 'https://p3.dcarimg.com/img/mosaic-legacy/bef700002ccb4e2d9bce~332x0.webp', 'picture/207.jpg', 'https://www.dongchedi.com/auto/series/1776');
INSERT INTO `item_xiangmu` VALUES (208, '九龙E6', '暂无报价', '', '2023-12-01', '九龙汽车', 9793, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：220********************充电时间h：快充2小时********************', 49794, 'https://p3.dcarimg.com/img/mosaic-legacy/9b130001200eb94997b0~332x0.webp', 'picture/208.jpg', 'https://www.dongchedi.com/auto/series/1830');
INSERT INTO `item_xiangmu` VALUES (209, 'LEVC TX', '暂无报价', '新增车型', '2024-03-01', 'LEVC', 9792, '0', '********************车型总数：共3款车型********************车型级别：中型MPV********************纯电续航里程km：410********************充电时间h：-********************', 49792, 'https://p3.dcarimg.com/img/motor-img/0ab4fbed99a45047ef11569679f95caf~332x0.webp', 'picture/209.jpg', 'https://www.dongchedi.com/auto/series/4779');
INSERT INTO `item_xiangmu` VALUES (210, '枫叶80V', '暂无报价', '', '2023-03-01', '睿蓝汽车', 9791, '0', '********************车型总数：共2款车型********************车型级别：紧凑型MPV********************纯电续航里程km：415********************充电时间h：快充0.5小时********************', 49791, 'https://p3.dcarimg.com/img/motor-img/7686d8b65af80d29a3f9525a4ae15ecf~332x0.webp', 'picture/210.jpg', 'https://www.dongchedi.com/auto/series/4688');
INSERT INTO `item_xiangmu` VALUES (211, 'smart EQ forfour', '暂无报价', '', '2024-01-01', 'smart', 9790, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：********************', 49790, 'https://p3.dcarimg.com/img/motor-img/ce26f85891c01346103d2dc0e58d3dcb~332x0.webp', 'picture/211.jpg', 'https://www.dongchedi.com/auto/series/2055');
INSERT INTO `item_xiangmu` VALUES (212, '长安之星9 EV', '暂无报价', '新增车型', '2024-03-01', '长安轻型车', 9789, '0', '********************车型总数：共6款车型********************车型级别：微面********************纯电续航里程km：260********************充电时间h：-********************', 49789, 'https://p3.dcarimg.com/img/mosaic-legacy/bef00000a6ab8f8f8c29~332x0.webp', 'picture/212.jpg', 'https://www.dongchedi.com/auto/series/3022');
INSERT INTO `item_xiangmu` VALUES (213, '思皓E20X', '暂无报价', '', '2021-09-01', '大众汽车（安徽）', 9788, '0', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：402********************充电时间h：快充0.83小时慢充8.5小时********************', 49788, 'https://p3.dcarimg.com/img/motor-img/5436aa5e924692ba00ca5ce4858f5070~332x0.webp', 'picture/213.jpg', 'https://www.dongchedi.com/auto/series/2866');
INSERT INTO `item_xiangmu` VALUES (214, '欧拉', '暂无报价', '', '2024-01-01', '长城汽车', 9787, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49787, 'https://p3.dcarimg.com/img/mosaic-legacy/bef600002eda814f7a18~332x0.webp', 'picture/214.jpg', 'https://www.dongchedi.com/auto/series/2303');
INSERT INTO `item_xiangmu` VALUES (215, '北京EX3', '暂无报价', '', '2022-02-01', '北京汽车', 9786, '0', '********************车型总数：共8款车型********************车型级别：小型SUV********************纯电续航里程km：421********************充电时间h：快充0.5小时慢充8.5小时********************', 49786, 'https://p3.dcarimg.com/img/motor-img/8f7efd07d70431529dba2f035bfb6359~332x0.webp', 'picture/215.jpg', 'https://www.dongchedi.com/auto/series/3347');
INSERT INTO `item_xiangmu` VALUES (216, '北汽EC100', '暂无报价', '', '2023-03-01', '北汽昌河', 9785, '0', '********************车型总数：共2款车型********************车型级别：微型车********************纯电续航里程km：100********************充电时间h：慢充4小时********************', 49785, 'https://p3.dcarimg.com/img/motor-img/76e9586ddd0aef031be9fcab5635503a~332x0.webp', 'picture/216.jpg', 'https://www.dongchedi.com/auto/series/2039');
INSERT INTO `item_xiangmu` VALUES (217, '成功V2E', '暂无报价', '', '2021-09-01', '成功汽车', 9784, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：240********************充电时间h：快充3小时慢充12小时********************', 49784, 'https://p3.dcarimg.com/img/mosaic-legacy/beef00009aa911600fb5~332x0.webp', 'picture/217.jpg', 'https://www.dongchedi.com/auto/series/1737');
INSERT INTO `item_xiangmu` VALUES (218, '江淮iEV7', '暂无报价', '', '2023-08-01', '江淮汽车', 9783, '0', '********************车型总数：共3款车型********************车型级别：小型车********************纯电续航里程km：320********************充电时间h：快充0.75小时慢充12小时********************', 49783, 'https://p3.dcarimg.com/img/motor-img/4d1deeb1daad3a5a6c44ea50917922f8~332x0.webp', 'picture/218.jpg', 'https://www.dongchedi.com/auto/series/3587');
INSERT INTO `item_xiangmu` VALUES (219, 'e爱丽舍', '暂无报价', '', '2023-03-01', '神龙汽车', 9782, '0', '********************车型总数：共4款车型********************车型级别：紧凑型车********************纯电续航里程km：301********************充电时间h：快充2小时慢充12小时********************', 49782, 'https://p3.dcarimg.com/img/motor-img/9ceefa4a99be7a2c74240137c1d04568~332x0.webp', 'picture/219.jpg', 'https://www.dongchedi.com/auto/series/4391');
INSERT INTO `item_xiangmu` VALUES (220, '富康ES600', '暂无报价', '全新车系', '2024-03-01', '神龙汽车', 9781, '0', '********************车型总数：共3款车型********************车型级别：紧凑型车********************纯电续航里程km：430********************充电时间h：快充0.6小时慢充10小时********************', 49781, 'https://p3.dcarimg.com/img/motor-img/9d0422fde61435579a20862d9847eecf~332x0.webp', 'picture/220.jpg', 'https://www.dongchedi.com/auto/series/5580');
INSERT INTO `item_xiangmu` VALUES (221, '宇通T7E', '暂无报价', '', '2022-07-01', '宇通客车', 9780, '0', '********************车型总数：共3款车型********************车型级别：轻客********************纯电续航里程km：********************充电时间h：快充1.2小时********************', 49780, 'https://p3.dcarimg.com/img/motor-img/4bc1edbbefc2f31738454f2270e0d317~332x0.webp', 'picture/221.jpg', 'https://www.dongchedi.com/auto/series/4623');
INSERT INTO `item_xiangmu` VALUES (222, '比亚迪E-SEED', '暂无报价', '', '2024-01-01', '比亚迪', 9779, '0', '********************车型总数：共1款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：-********************', 49779, 'https://p3.dcarimg.com/img/mosaic-legacy/bef50000c5f683a1d2b3~332x0.webp', 'picture/222.jpg', 'https://www.dongchedi.com/auto/series/2876');
INSERT INTO `item_xiangmu` VALUES (223, '比亚迪T3', '暂无报价', '', '2024-01-01', '比亚迪', 9778, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：********************充电时间h：快充1小时慢充6-13小时********************', 49778, 'https://p3.dcarimg.com/img/mosaic-legacy/bef3000141179cac1d4b~332x0.webp', 'picture/223.jpg', 'https://www.dongchedi.com/auto/series/2110');
INSERT INTO `item_xiangmu` VALUES (224, 'ARCFOX-7', '暂无报价', '', '2024-01-01', '北汽新能源', 9777, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：400********************充电时间h：-********************', 49777, 'https://p3.dcarimg.com/img/mosaic-legacy/17675000018353e0564ac~332x0.webp', 'picture/224.jpg', 'https://www.dongchedi.com/auto/series/2014');
INSERT INTO `item_xiangmu` VALUES (225, '北汽EV2', '暂无报价', '', '2023-03-01', '北汽昌河', 9776, '0', '********************车型总数：共6款车型********************车型级别：微型车********************纯电续航里程km：80********************充电时间h：慢充4.5小时********************', 49776, 'https://p3.dcarimg.com/img/motor-img/6973be3ae33285e912f8e5ec89de3193~332x0.webp', 'picture/225.jpg', 'https://www.dongchedi.com/auto/series/4175');
INSERT INTO `item_xiangmu` VALUES (226, '睿行EM80', '暂无报价', '新增车型', '2024-03-01', '长安轻型车', 9775, '0', '********************车型总数：共5款车型********************车型级别：轻客********************纯电续航里程km：260********************充电时间h：快充2小时慢充12小时********************', 49775, 'https://p3.dcarimg.com/img/mosaic-legacy/bef100009958556a14cb~332x0.webp', 'picture/226.jpg', 'https://www.dongchedi.com/auto/series/2972');
INSERT INTO `item_xiangmu` VALUES (227, '域虎EV', '暂无报价', '', '2021-12-01', '江铃汽车', 9774, '0', '********************车型总数：共2款车型********************车型级别：中型皮卡********************纯电续航里程km：320********************充电时间h：快充1小时慢充10小时********************', 49774, 'https://p3.dcarimg.com/img/motor-img/c17c8c4df789fd7f0b31838dee3f3c3c~332x0.webp', 'picture/227.jpg', 'https://www.dongchedi.com/auto/series/3210');
INSERT INTO `item_xiangmu` VALUES (228, '顺达EV', '暂无报价', '', '2023-07-01', '江铃汽车', 9773, '0', '********************车型总数：共6款车型********************车型级别：微卡********************纯电续航里程km：180********************充电时间h：快充1.2小时********************', 49773, 'https://p3.dcarimg.com/img/motor-img/a16872d547957b28d196f936b12c219c~332x0.webp', 'picture/228.jpg', 'https://www.dongchedi.com/auto/series/5233');
INSERT INTO `item_xiangmu` VALUES (229, '大众XL1', '暂无报价', '', '2024-01-01', '大众(进口)', 9772, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：255********************充电时间h：快充0.7小时慢充6小时********************', 49772, 'https://p3.dcarimg.com/img/mosaic-legacy/1767500002a64703d70db~332x0.webp', 'picture/229.jpg', 'https://www.dongchedi.com/auto/series/2353');
INSERT INTO `item_xiangmu` VALUES (230, '优优EV', '暂无报价', '', '2023-02-01', '开瑞汽车', 9771, '0', '********************车型总数：共3款车型********************车型级别：微面********************纯电续航里程km：266********************充电时间h：-********************', 49771, 'https://p3.dcarimg.com/img/mosaic-legacy/beef00009af087aa6cce~332x0.webp', 'picture/230.jpg', 'https://www.dongchedi.com/auto/series/2257');
INSERT INTO `item_xiangmu` VALUES (231, '东风风神e.π', '暂无报价', '', '2024-01-01', '东风乘用车', 9770, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49770, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000f5aea1599edb~332x0.webp', 'picture/231.jpg', 'https://www.dongchedi.com/auto/series/2856');
INSERT INTO `item_xiangmu` VALUES (232, '江淮iC5', '暂无报价', '', '2022-05-01', '江淮汽车', 9769, '0', '********************车型总数：共4款车型********************车型级别：紧凑型车********************纯电续航里程km：450********************充电时间h：快充0.7小时慢充8小时********************', 49770, 'https://p3.dcarimg.com/img/motor-img/7ccd70e4cd36cb53bf88c19f07cc8dae~332x0.webp', 'picture/232.jpg', 'https://www.dongchedi.com/auto/series/4297');
INSERT INTO `item_xiangmu` VALUES (233, '奇瑞@ANT', '暂无报价', '', '2024-01-01', '奇瑞汽车', 9768, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49768, 'https://p3.dcarimg.com/img/mosaic-legacy/bef600006c0adc640396~332x0.webp', 'picture/233.jpg', 'https://www.dongchedi.com/auto/series/2550');
INSERT INTO `item_xiangmu` VALUES (234, '北汽EV5', '暂无报价', '', '2021-09-01', '北汽昌河', 9767, '0', '********************车型总数：共2款车型********************车型级别：微面********************纯电续航里程km：210********************充电时间h：快充0.6小时慢充6小时********************', 49767, 'https://p3.dcarimg.com/img/motor-img/f49e241532567e75a0dca881994522a9~332x0.webp', 'picture/234.jpg', 'https://www.dongchedi.com/auto/series/2858');
INSERT INTO `item_xiangmu` VALUES (235, '睿行EM60', '暂无报价', '2022新款', '2024-03-01', '长安轻型车', 9766, '0', '********************车型总数：共5款车型********************车型级别：微面********************纯电续航里程km：260********************充电时间h：-********************', 49766, 'https://p3.dcarimg.com/img/motor-img/d52bf915d67b594d20e5757cf8445077~332x0.webp', 'picture/235.jpg', 'https://www.dongchedi.com/auto/series/4205');
INSERT INTO `item_xiangmu` VALUES (236, '云度π1', '暂无报价', '', '2021-09-01', '云度新能源', 9765, '0', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：430********************充电时间h：快充0.5小时慢充8小时********************', 49765, 'https://p3.dcarimg.com/img/motor-img/652f56b898e09c8a47fb22bee05b47be~332x0.webp', 'picture/236.jpg', 'https://www.dongchedi.com/auto/series/1713');
INSERT INTO `item_xiangmu` VALUES (237, '迈图', '暂无报价', '', '2021-06-01', '恒源电动汽车', 9764, '0', '********************车型总数：共2款车型********************车型级别：微卡********************纯电续航里程km：150********************充电时间h：快充2小时慢充10小时********************', 49764, 'https://p3.dcarimg.com/img/mosaic-legacy/9b130000000e44d246eb~332x0.webp', 'picture/237.jpg', 'https://www.dongchedi.com/auto/series/2966');
INSERT INTO `item_xiangmu` VALUES (238, 'Vision Tokyo', '暂无报价', '', '2024-01-01', '奔驰(进口)', 9763, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：********************充电时间h：-********************', 49763, 'https://p3.dcarimg.com/img/motor-img/c37c41c02bbc7b87cfc840bd601e2881~332x0.webp', 'picture/238.jpg', 'https://www.dongchedi.com/auto/series/2173');
INSERT INTO `item_xiangmu` VALUES (239, '依维柯褒迪EV', '暂无报价', '', '2023-08-01', '南京依维柯', 9762, '0', '********************车型总数：共5款车型********************车型级别：轻客********************纯电续航里程km：********************充电时间h：-********************', 49762, 'https://p3.dcarimg.com/img/mosaic-legacy/bef20000876f2bf8d1be~332x0.webp', 'picture/239.jpg', 'https://www.dongchedi.com/auto/series/3127');
INSERT INTO `item_xiangmu` VALUES (240, '江淮iEVS4', '暂无报价', '', '2021-08-01', '江淮汽车', 9761, '0', '********************车型总数：共3款车型********************车型级别：小型SUV********************纯电续航里程km：402********************充电时间h：快充0.75小时慢充9.5小时********************', 49761, 'https://p3.dcarimg.com/img/motor-img/6bf610c5ad1a84dc5673d93799decea4~332x0.webp', 'picture/240.jpg', 'https://www.dongchedi.com/auto/series/3093');
INSERT INTO `item_xiangmu` VALUES (241, '拓陆者EV', '暂无报价', '', '2024-02-01', '福田汽车', 9760, '0', '********************车型总数：共2款车型********************车型级别：中型皮卡********************纯电续航里程km：536********************充电时间h：-********************', 49760, 'https://p3.dcarimg.com/img/motor-img/44742b993fe0660030c7c0958a5540c9~332x0.webp', 'picture/241.jpg', 'https://www.dongchedi.com/auto/series/5808');
INSERT INTO `item_xiangmu` VALUES (242, '国机智骏GC2', '暂无报价', '', '2022-10-01', '国机智骏', 9759, '0', '********************车型总数：共5款车型********************车型级别：微型车********************纯电续航里程km：368********************充电时间h：快充0.5小时慢充12小时********************', 49759, 'https://p3.dcarimg.com/img/motor-img/ede9f9bb9abfee8fa5edc40e0113712c~332x0.webp', 'picture/242.jpg', 'https://www.dongchedi.com/auto/series/3410');
INSERT INTO `item_xiangmu` VALUES (243, '东风·瑞泰特EM10', '暂无报价', '', '2021-08-01', '西安新青年', 9758, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：215********************充电时间h：快充1小时慢充12小时********************', 49758, 'https://p3.dcarimg.com/img/mosaic-legacy/9b130001225dfd683c72~332x0.webp', 'picture/243.jpg', 'https://www.dongchedi.com/auto/series/3012');
INSERT INTO `item_xiangmu` VALUES (244, '奥迪PB18', '暂无报价', '', '2024-01-01', '奥迪(进口)', 9757, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：快充0小时慢充0小时********************', 49757, 'https://p3.dcarimg.com/img/mosaic-legacy/bef6000001142cfde14b~332x0.webp', 'picture/244.jpg', 'https://www.dongchedi.com/auto/series/2994');
INSERT INTO `item_xiangmu` VALUES (245, '名爵E-motion', '暂无报价', '', '2024-01-01', '上汽集团', 9756, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49756, 'https://p3.dcarimg.com/img/motor-img/b0b69508bc70bea11e449165265c1040~332x0.webp', 'picture/245.jpg', 'https://www.dongchedi.com/auto/series/2232');
INSERT INTO `item_xiangmu` VALUES (246, '跨越星V5新能源', '暂无报价', '', '2023-09-01', '长安跨越', 9755, '0', '********************车型总数：共16款车型********************车型级别：微面********************纯电续航里程km：300********************充电时间h：快充1.25小时********************', 49755, 'https://p3.dcarimg.com/img/motor-img/07e41bc9e56e5ef28ea033f381bbbb6d~332x0.webp', 'picture/246.jpg', 'https://www.dongchedi.com/auto/series/5299');
INSERT INTO `item_xiangmu` VALUES (247, '拓陆者智蓝', '暂无报价', '', '2023-02-01', '福田汽车', 9754, '0', '********************车型总数：共2款车型********************车型级别：中型皮卡********************纯电续航里程km：305********************充电时间h：快充1.2小时慢充7小时********************', 49754, 'https://p3.dcarimg.com/img/mosaic-legacy/bef30000dbd2dad65f79~332x0.webp', 'picture/247.jpg', 'https://www.dongchedi.com/auto/series/3645');
INSERT INTO `item_xiangmu` VALUES (248, '国机智骏GC1', '暂无报价', '', '2022-10-01', '国机智骏', 9753, '0', '********************车型总数：共3款车型********************车型级别：微型车********************纯电续航里程km：305********************充电时间h：快充0.5小时慢充10小时********************', 49753, 'https://p3.dcarimg.com/img/motor-img/1fc424ba1769179dc31bbfc7bd24c272~332x0.webp', 'picture/248.jpg', 'https://www.dongchedi.com/auto/series/3409');
INSERT INTO `item_xiangmu` VALUES (249, '北京EX5', '暂无报价', '', '2021-01-01', '北京汽车', 9752, '0', '********************车型总数：共4款车型********************车型级别：紧凑型SUV********************纯电续航里程km：415********************充电时间h：快充0.5小时慢充10.5小时********************', 49752, 'https://p3.dcarimg.com/img/motor-img/ea816a2efab35d3d9c242e876757c4ac~332x0.webp', 'picture/249.jpg', 'https://www.dongchedi.com/auto/series/3158');
INSERT INTO `item_xiangmu` VALUES (250, '富康ES500', '暂无报价', '', '2022-12-01', '神龙汽车', 9751, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：420********************充电时间h：快充0.5小时慢充8小时********************', 49751, 'https://p3.dcarimg.com/img/mosaic-legacy/bef3000098390fb9d847~332x0.webp', 'picture/250.jpg', 'https://www.dongchedi.com/auto/series/3076');
INSERT INTO `item_xiangmu` VALUES (251, '上汽大通MAXUS EV90', '暂无报价', '', '2023-12-01', '上汽大通', 9750, '0', '********************车型总数：共9款车型********************车型级别：轻客********************纯电续航里程km：215********************充电时间h：快充0.6小时慢充6小时********************', 49750, 'https://p3.dcarimg.com/img/motor-img/ef061fa5661f2c7c259275c203fcd6ee~332x0.webp', 'picture/251.jpg', 'https://www.dongchedi.com/auto/series/4708');
INSERT INTO `item_xiangmu` VALUES (252, '哪吒E-TAKE', '暂无报价', '', '2024-01-01', '合众汽车', 9749, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：500********************充电时间h：快充0.5小时慢充6-8小时********************', 49749, 'https://p3.dcarimg.com/img/mosaic-legacy/1767400002cdb9063982a~332x0.webp', 'picture/252.jpg', 'https://www.dongchedi.com/auto/series/1911');
INSERT INTO `item_xiangmu` VALUES (253, '江淮iEVA50', '暂无报价', '', '2023-06-01', '江淮汽车', 9748, '0', '********************车型总数：共4款车型********************车型级别：紧凑型车********************纯电续航里程km：350********************充电时间h：快充0.6小时慢充7小时********************', 49748, 'https://p3.dcarimg.com/img/motor-img/c85420f90d04489131ae6c51aad6faa2~332x0.webp', 'picture/253.jpg', 'https://www.dongchedi.com/auto/series/2311');
INSERT INTO `item_xiangmu` VALUES (254, 'Mission E', '暂无报价', '', '2024-01-01', '保时捷', 9747, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：500********************充电时间h：-********************', 49747, 'https://p3.dcarimg.com/img/motor-img/d1ced4957cb30b0388cc79fb85ec0d7c~332x0.webp', 'picture/254.jpg', 'https://www.dongchedi.com/auto/series/2126');
INSERT INTO `item_xiangmu` VALUES (255, '雪佛兰EN-V', '暂无报价', '', '2024-01-01', '雪佛兰(进口)', 9746, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49746, 'https://p3.dcarimg.com/img/mosaic-legacy/17675000068eb3a6c78eb~332x0.webp', 'picture/255.jpg', 'https://www.dongchedi.com/auto/series/2265');
INSERT INTO `item_xiangmu` VALUES (256, '翼刻ET300', '暂无报价', '', '2024-01-01', '国新新能源', 9745, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：302********************充电时间h：快充1小时慢充14小时********************', 49745, 'https://p3.dcarimg.com/img/motor-img/a5f493c83999d487023cc1d77c0e72ea~332x0.webp', 'picture/256.jpg', 'https://www.dongchedi.com/auto/series/5792');
INSERT INTO `item_xiangmu` VALUES (257, '锐骐6 EV', '暂无报价', '2022新款', '2024-04-01', '郑州日产', 9744, '0', '********************车型总数：共3款车型********************车型级别：中型皮卡********************纯电续航里程km：350********************充电时间h：快充1.5小时慢充9小时********************', 49745, 'https://p3.dcarimg.com/img/motor-img/14ff833009f4fc035e78f9a4d82362fb~332x0.webp', 'picture/257.jpg', 'https://www.dongchedi.com/auto/series/3713');
INSERT INTO `item_xiangmu` VALUES (258, '蔚来EVE', '暂无报价', '', '2024-01-01', '蔚来', 9743, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49743, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000cf3311c0c2d2~332x0.webp', 'picture/258.jpg', 'https://www.dongchedi.com/auto/series/2077');
INSERT INTO `item_xiangmu` VALUES (259, '依维柯欧胜EV', '暂无报价', '', '2023-08-01', '南京依维柯', 9742, '0', '********************车型总数：共4款车型********************车型级别：轻客********************纯电续航里程km：230********************充电时间h：快充0.75小时慢充10小时********************', 49742, 'https://p3.dcarimg.com/img/mosaic-legacy/bef20000fdf33c265bc3~332x0.webp', 'picture/259.jpg', 'https://www.dongchedi.com/auto/series/3718');
INSERT INTO `item_xiangmu` VALUES (260, '奇瑞FV2030', '暂无报价', '', '2024-01-01', '奇瑞汽车', 9741, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49743, 'https://p3.dcarimg.com/img/mosaic-legacy/bef3000143caca22af05~332x0.webp', 'picture/260.jpg', 'https://www.dongchedi.com/auto/series/2237');
INSERT INTO `item_xiangmu` VALUES (261, '斯派卡EV', '暂无报价', '紧凑型MPV销量NO.17', '2023-06-01', '野马汽车', 9740, '0', '********************车型总数：共2款车型********************车型级别：紧凑型MPV********************纯电续航里程km：350********************充电时间h：快充0.67小时慢充8小时********************', 49740, 'https://p3.dcarimg.com/img/motor-img/2429e897feec01509cab30e2c1b9154b~332x0.webp', 'picture/261.jpg', 'https://www.dongchedi.com/auto/series/4465');
INSERT INTO `item_xiangmu` VALUES (262, '长安星卡EV', '暂无报价', '', '2023-06-01', '长安轻型车', 9739, '0', '********************车型总数：共2款车型********************车型级别：微卡********************纯电续航里程km：190********************充电时间h：-********************', 49739, 'https://p3.dcarimg.com/img/mosaic-legacy/bef400001d2a41831f3b~332x0.webp', 'picture/262.jpg', 'https://www.dongchedi.com/auto/series/3015');
INSERT INTO `item_xiangmu` VALUES (263, '云度π3', '暂无报价', '', '2022-12-01', '云度新能源', 9738, '0', '********************车型总数：共4款车型********************车型级别：小型SUV********************纯电续航里程km：401********************充电时间h：快充0.58小时慢充8小时********************', 49738, 'https://p3.dcarimg.com/img/motor-img/d36fbeed762d384c1b90690bc00149df~332x0.webp', 'picture/263.jpg', 'https://www.dongchedi.com/auto/series/1714');
INSERT INTO `item_xiangmu` VALUES (264, '九龙EM3', '暂无报价', '', '2021-10-01', '九龙汽车', 9737, '0', '********************车型总数：共2款车型********************车型级别：微面********************纯电续航里程km：250********************充电时间h：快充2.5小时慢充9小时********************', 49737, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800003ba46fbdebb1~332x0.webp', 'picture/264.jpg', 'https://www.dongchedi.com/auto/series/3090');
INSERT INTO `item_xiangmu` VALUES (265, '艾康尼克七系', '暂无报价', '', '2024-01-01', '艾康尼克ICONIQ Motors', 9736, '0', '********************车型总数：共1款车型********************车型级别：中型MPV********************纯电续航里程km：400********************充电时间h：-********************', 49736, 'https://p3.dcarimg.com/img/mosaic-legacy/bef20000cf6c3266bfc5~332x0.webp', 'picture/265.jpg', 'https://www.dongchedi.com/auto/series/2770');
INSERT INTO `item_xiangmu` VALUES (266, '远程E5', '暂无报价', '', '2024-03-01', '吉利远程', 9735, '0', '********************车型总数：共2款车型********************车型级别：微面********************纯电续航里程km：280********************充电时间h：快充1.5小时慢充12小时********************', 49738, 'https://p3.dcarimg.com/img/motor-img/28ad6c0ccd1ad0b962285d49668eb55c~332x0.webp', 'picture/266.jpg', 'https://www.dongchedi.com/auto/series/3766');
INSERT INTO `item_xiangmu` VALUES (267, '特顺EV', '暂无报价', '', '2021-09-01', '江铃汽车', 9734, '0', '********************车型总数：共2款车型********************车型级别：轻客********************纯电续航里程km：200********************充电时间h：快充0.66小时慢充7小时********************', 49734, 'https://p3.dcarimg.com/img/mosaic-legacy/beef000145914644d5fd~332x0.webp', 'picture/267.jpg', 'https://www.dongchedi.com/auto/series/3005');
INSERT INTO `item_xiangmu` VALUES (268, '金旅海狮EV', '暂无报价', '', '2023-08-01', '厦门金旅', 9733, '0', '********************车型总数：共20款车型********************车型级别：轻客********************纯电续航里程km：280********************充电时间h：-********************', 49733, 'https://p3.dcarimg.com/img/mosaic-legacy/beef00009ad3a55bf057~332x0.webp', 'picture/268.jpg', 'https://www.dongchedi.com/auto/series/1838');
INSERT INTO `item_xiangmu` VALUES (269, '远程星享V', '暂无报价', '', '2024-03-01', '吉利远程', 9732, '0', '********************车型总数：共8款车型********************车型级别：微面********************纯电续航里程km：260********************充电时间h：快充1.5小时慢充12小时********************', 49732, 'https://p3.dcarimg.com/img/motor-img/201d7a16232df54772db4fbf1d02d208~332x0.webp', 'picture/269.jpg', 'https://www.dongchedi.com/auto/series/5794');
INSERT INTO `item_xiangmu` VALUES (270, '凯翼E5 EV', '暂无报价', '', '2023-06-01', '凯翼汽车', 9731, '0', '********************车型总数：共3款车型********************车型级别：紧凑型车********************纯电续航里程km：401********************充电时间h：快充0.5小时慢充9小时********************', 49731, 'https://p3.dcarimg.com/img/motor-img/804559657b9ec5b0009d85f4e0638cd2~332x0.webp', 'picture/270.jpg', 'https://www.dongchedi.com/auto/series/4709');
INSERT INTO `item_xiangmu` VALUES (271, '聆风', '暂无报价', '', '2024-01-01', '日产(进口)', 9730, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：********************', 49730, 'https://p3.dcarimg.com/img/motor-img/7c1f9a1b3479068b92de187859767ff4~332x0.webp', 'picture/271.jpg', 'https://www.dongchedi.com/auto/series/1716');
INSERT INTO `item_xiangmu` VALUES (272, '上汽大通MAXUS EV80', '暂无报价', '', '2021-01-01', '上汽大通', 9729, '0', '********************车型总数：共4款车型********************车型级别：轻客********************纯电续航里程km：180********************充电时间h：快充1.8小时********************', 49729, 'https://p3.dcarimg.com/img/motor-img/a411c7969b963b8c28647b318477e834~332x0.webp', 'picture/272.jpg', 'https://www.dongchedi.com/auto/series/1825');
INSERT INTO `item_xiangmu` VALUES (273, '易至EX5', '暂无报价', '', '2021-09-01', '江铃集团新能源', 9728, '0', '********************车型总数：共4款车型********************车型级别：小型SUV********************纯电续航里程km：405********************充电时间h：快充1小时慢充8小时********************', 49728, 'https://p3.dcarimg.com/img/mosaic-legacy/17675000005bb087cc43b~332x0.webp', 'picture/273.jpg', 'https://www.dongchedi.com/auto/series/1587');
INSERT INTO `item_xiangmu` VALUES (274, '御风EV', '暂无报价', '', '2023-04-01', '东风汽车', 9727, '0', '********************车型总数：共5款车型********************车型级别：轻客********************纯电续航里程km：240********************充电时间h：-********************', 49727, 'https://p3.dcarimg.com/img/motor-img/848e60c12f79839bc51011988bef4c3b~332x0.webp', 'picture/274.jpg', 'https://www.dongchedi.com/auto/series/427');
INSERT INTO `item_xiangmu` VALUES (275, '风景G7新能源', '暂无报价', '', '2023-09-01', '福田汽车', 9726, '0', '********************车型总数：共4款车型********************车型级别：轻客********************纯电续航里程km：235********************充电时间h：-********************', 49726, 'https://p3.dcarimg.com/img/motor-img/9363200b0798f18e95c57947cf80ce41~332x0.webp', 'picture/275.jpg', 'https://www.dongchedi.com/auto/series/5247');
INSERT INTO `item_xiangmu` VALUES (276, '新海狮EV', '暂无报价', '', '2023-03-01', '华晨鑫源新能源', 9725, '0', '********************车型总数：共3款车型********************车型级别：微面********************纯电续航里程km：305********************充电时间h：-********************', 49725, 'https://p3.dcarimg.com/img/motor-img/0a74400a76f63118d3640c7b6367eeb0~332x0.webp', 'picture/276.jpg', 'https://www.dongchedi.com/auto/series/1772');
INSERT INTO `item_xiangmu` VALUES (277, '北汽新能源D80 EV', '暂无报价', '', '2024-01-01', '北汽新能源', 9724, '0', '********************车型总数：共1款车型********************车型级别：中大型车********************纯电续航里程km：300********************充电时间h：-********************', 49724, 'https://p3.dcarimg.com/img/mosaic-legacy/bef700006aa291f42611~332x0.webp', 'picture/277.jpg', 'https://www.dongchedi.com/auto/series/2097');
INSERT INTO `item_xiangmu` VALUES (278, '迈乔', '暂无报价', '', '2021-10-01', '恒源电动汽车', 9723, '0', '********************车型总数：共1款车型********************车型级别：微卡********************纯电续航里程km：220********************充电时间h：-********************', 49723, 'https://p3.dcarimg.com/img/motor-img/59834aef05ec32087b60a3406eaf0e5f~332x0.webp', 'picture/278.jpg', 'https://www.dongchedi.com/auto/series/4171');
INSERT INTO `item_xiangmu` VALUES (279, 'smart Vision EQ fortwo', '暂无报价', '', '2024-01-01', 'smart', 9722, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：300********************充电时间h：-********************', 49722, 'https://p3.dcarimg.com/img/mosaic-legacy/bef700002ea9f359c847~332x0.webp', 'picture/279.jpg', 'https://www.dongchedi.com/auto/series/1744');
INSERT INTO `item_xiangmu` VALUES (280, '瑞驰EC31', '暂无报价', '', '2023-09-01', '瑞驰新能源', 9721, '0', '********************车型总数：共9款车型********************车型级别：微卡********************纯电续航里程km：300********************充电时间h：-********************', 49721, 'https://p3.dcarimg.com/img/motor-img/07d8319ed183c96b0765abd15797b3ef~332x0.webp', 'picture/280.jpg', 'https://www.dongchedi.com/auto/series/3132');
INSERT INTO `item_xiangmu` VALUES (281, '国机智骏GX5', '暂无报价', '', '2022-10-01', '国机智骏', 9720, '0', '********************车型总数：共6款车型********************车型级别：小型SUV********************纯电续航里程km：338********************充电时间h：快充0.67小时慢充7.5小时********************', 49720, 'https://p3.dcarimg.com/img/motor-img/d82d94ee62b66a881f61ae95ad0544d3~332x0.webp', 'picture/281.jpg', 'https://www.dongchedi.com/auto/series/3408');
INSERT INTO `item_xiangmu` VALUES (282, 'Enverge', '暂无报价', '', '2024-01-01', '广汽乘用车', 9719, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：595********************充电时间h：-********************', 49719, 'https://p3.dcarimg.com/img/motor-img/7869e8e2fd66be27546a9a265b9e3121~332x0.webp', 'picture/282.jpg', 'https://www.dongchedi.com/auto/series/1948');
INSERT INTO `item_xiangmu` VALUES (283, '远程E6', '暂无报价', '', '2024-03-01', '吉利远程', 9718, '0', '********************车型总数：共4款车型********************车型级别：轻客********************纯电续航里程km：235********************充电时间h：快充0.75小时慢充9小时********************', 49718, 'https://p3.dcarimg.com/img/mosaic-legacy/176740000550fed2cdeeb~332x0.webp', 'picture/283.jpg', 'https://www.dongchedi.com/auto/series/3767');
INSERT INTO `item_xiangmu` VALUES (284, '远程锋锐F3E', '暂无报价', '', '2024-03-01', '吉利远程', 9717, '0', '********************车型总数：共2款车型********************车型级别：微卡********************纯电续航里程km：310********************充电时间h：快充1小时慢充9小时********************', 49717, 'https://p3.dcarimg.com/img/motor-img/30a4b097eeacd8bbcd8eb555088ffe76~332x0.webp', 'picture/284.jpg', 'https://www.dongchedi.com/auto/series/5372');
INSERT INTO `item_xiangmu` VALUES (285, '奔驰EQC(海外)', '暂无报价', '', '2024-01-01', '梅赛德斯-EQ', 9716, '0', '********************车型总数：共2款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：********************', 49716, 'https://p3.dcarimg.com/img/mosaic-legacy/bef200009811458e92c4~332x0.webp', 'picture/285.jpg', 'https://www.dongchedi.com/auto/series/3011');
INSERT INTO `item_xiangmu` VALUES (286, 'H2 Speed', '暂无报价', '', '2024-01-01', '宾尼法利纳', 9715, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49715, 'https://p3.dcarimg.com/img/mosaic-legacy/176750000147bc9e20ae1~332x0.webp', 'picture/286.jpg', 'https://www.dongchedi.com/auto/series/2737');
INSERT INTO `item_xiangmu` VALUES (287, 'EXP 12 Speed 6e', '暂无报价', '', '2024-01-01', '宾利', 9714, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49714, 'https://p3.dcarimg.com/img/mosaic-legacy/bef700006aa0df09ea45~332x0.webp', 'picture/287.jpg', 'https://www.dongchedi.com/auto/series/1998');
INSERT INTO `item_xiangmu` VALUES (288, '宝马iX3(海外)', '暂无报价', '', '2024-01-01', '宝马(进口)', 9713, '0', '********************车型总数：共1款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：-********************', 49713, 'https://p3.dcarimg.com/img/motor-img/8059ddfdc1bbce4b6f9cffcb09f18c74~332x0.webp', 'picture/288.jpg', 'https://www.dongchedi.com/auto/series/2874');
INSERT INTO `item_xiangmu` VALUES (289, '神骐T10 EV', '暂无报价', '', '2023-07-01', '长安轻型车', 9712, '0', '********************车型总数：共6款车型********************车型级别：微卡********************纯电续航里程km：255********************充电时间h：-********************', 49712, 'https://p3.dcarimg.com/img/motor-img/3ffd7a27a2f63d5b03506eec0c9a237c~332x0.webp', 'picture/289.jpg', 'https://www.dongchedi.com/auto/series/4221');
INSERT INTO `item_xiangmu` VALUES (290, 'EQ Silver Arrow', '暂无报价', '', '2024-01-01', '梅赛德斯-EQ', 9711, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：400********************充电时间h：-********************', 49711, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000f7ded78d36f8~332x0.webp', 'picture/290.jpg', 'https://www.dongchedi.com/auto/series/2998');
INSERT INTO `item_xiangmu` VALUES (291, '游侠 X', '暂无报价', '', '2024-01-01', '游侠电车', 9710, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：********************充电时间h：-********************', 49710, 'https://p3.dcarimg.com/img/motor-img/21fc490f1c51b032c315ae39e842519e~332x0.webp', 'picture/291.jpg', 'https://www.dongchedi.com/auto/series/1935');
INSERT INTO `item_xiangmu` VALUES (292, '思迈尔', '暂无报价', '', '2024-01-01', '刺猬汽车', 9709, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：********************充电时间h：-********************', 49709, 'https://p3.dcarimg.com/img/mosaic-legacy/bef700002cf6e065c05f~332x0.webp', 'picture/292.jpg', 'https://www.dongchedi.com/auto/series/2839');
INSERT INTO `item_xiangmu` VALUES (293, 'Vision-E', '暂无报价', '', '2024-01-01', '上汽集团', 9708, '0', '********************车型总数：共1款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：-********************', 49708, 'https://p3.dcarimg.com/img/motor-img/7bf44b8be186cab07747141c2252be6a~332x0.webp', 'picture/293.jpg', 'https://www.dongchedi.com/auto/series/2068');
INSERT INTO `item_xiangmu` VALUES (294, '龙耀8', '暂无报价', '', '2024-01-01', '厦门金龙', 9707, '0', '********************车型总数：共5款车型********************车型级别：轻客********************纯电续航里程km：280********************充电时间h：快充2小时慢充8小时********************', 49707, 'https://p3.dcarimg.com/img/motor-img/573090d5ab4d8bf95e95a39ddba94321~332x0.webp', 'picture/294.jpg', 'https://www.dongchedi.com/auto/series/4562');
INSERT INTO `item_xiangmu` VALUES (295, '飞碟Q2V', '暂无报价', '', '2022-09-01', '飞碟汽车', 9706, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：290********************充电时间h：快充1.5小时慢充8小时********************', 49706, 'https://p3.dcarimg.com/img/motor-img/0b907019d081cd107dc8d5d5c658fb58~332x0.webp', 'picture/295.jpg', 'https://www.dongchedi.com/auto/series/4744');
INSERT INTO `item_xiangmu` VALUES (296, '东风风神AX5 EV', '暂无报价', '', '2024-01-01', '东风乘用车', 9705, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：300********************充电时间h：快充1小时慢充8小时********************', 49705, 'https://p3.dcarimg.com/img/mosaic-legacy/bef500006f62a1208d19~332x0.webp', 'picture/296.jpg', 'https://www.dongchedi.com/auto/series/1841');
INSERT INTO `item_xiangmu` VALUES (297, 'E-Tense', '暂无报价', '', '2024-01-01', 'DS(进口)', 9704, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49704, 'https://p3.dcarimg.com/img/motor-img/2f77d90782123569cd87ba1da12d27d7~332x0.webp', 'picture/297.jpg', 'https://www.dongchedi.com/auto/series/2031');
INSERT INTO `item_xiangmu` VALUES (298, 'Ray EV', '暂无报价', '', '2024-01-01', '起亚(进口)', 9703, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49703, 'https://p3.dcarimg.com/img/mosaic-legacy/bef700006aceda5386ea~332x0.webp', 'picture/298.jpg', 'https://www.dongchedi.com/auto/series/2951');
INSERT INTO `item_xiangmu` VALUES (299, 'EV-Ster', '暂无报价', '', '2024-01-01', '本田(进口)', 9702, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49702, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000e664d53dbedc~332x0.webp', 'picture/299.jpg', 'https://www.dongchedi.com/auto/series/2454');
INSERT INTO `item_xiangmu` VALUES (300, 'BYTON M-Byte', '暂无报价', '', '2024-01-01', '拜腾', 9701, '0', '********************车型总数：共4款车型********************车型级别：中型SUV********************纯电续航里程km：430********************充电时间h：快充0.58小时********************', 49701, 'https://p3.dcarimg.com/img/mosaic-legacy/bef2000147345dffe60c~332x0.webp', 'picture/300.jpg', 'https://www.dongchedi.com/auto/series/1927');
INSERT INTO `item_xiangmu` VALUES (301, '奔驰EQA(海外)', '暂无报价', '', '2024-01-01', '梅赛德斯-EQ', 9700, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：********************', 49700, 'https://p3.dcarimg.com/img/motor-img/a42d4712d70fa84b5277a1b5043d40ae~332x0.webp', 'picture/301.jpg', 'https://www.dongchedi.com/auto/series/5107');
INSERT INTO `item_xiangmu` VALUES (302, 'e-EVOLUTION', '暂无报价', '', '2024-01-01', '三菱(进口)', 9699, '0', '********************车型总数：共1款车型********************车型级别：中大型SUV********************纯电续航里程km：********************充电时间h：-********************', 49699, 'https://p3.dcarimg.com/img/motor-img/2e494e4ec93a3664e5efb6061b3601ef~332x0.webp', 'picture/302.jpg', 'https://www.dongchedi.com/auto/series/1947');
INSERT INTO `item_xiangmu` VALUES (303, 'GR Super Sport', '暂无报价', '', '2024-01-01', '丰田(进口)', 9698, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49698, 'https://p3.dcarimg.com/img/mosaic-legacy/bef3000143d2fd6b7852~332x0.webp', 'picture/303.jpg', 'https://www.dongchedi.com/auto/series/1951');
INSERT INTO `item_xiangmu` VALUES (304, '北汽幻速S5-EV', '暂无报价', '', '2024-01-01', '北汽新能源', 9697, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49697, 'https://p3.dcarimg.com/img/motor-img/e2064952667c0bc19132048509065b46~332x0.webp', 'picture/304.jpg', 'https://www.dongchedi.com/auto/series/2092');
INSERT INTO `item_xiangmu` VALUES (305, '图雅诺新能源', '暂无报价', '', '2023-09-01', '福田汽车', 9696, '0', '********************车型总数：共7款车型********************车型级别：轻客********************纯电续航里程km：350********************充电时间h：-********************', 49696, 'https://p3.dcarimg.com/img/motor-img/7ed8bed189545b1fd4fc832c49ded254~332x0.webp', 'picture/305.jpg', 'https://www.dongchedi.com/auto/series/1826');
INSERT INTO `item_xiangmu` VALUES (306, '鑫源T50 EV', '暂无报价', '', '2022-09-01', '华晨鑫源新能源', 9695, '0', '********************车型总数：共10款车型********************车型级别：微卡********************纯电续航里程km：280********************充电时间h：-********************', 49695, 'https://p3.dcarimg.com/img/motor-img/b1ef0b41ffe841ff662134e7d69af50f~332x0.webp', 'picture/306.jpg', 'https://www.dongchedi.com/auto/series/4301');
INSERT INTO `item_xiangmu` VALUES (307, 'Emerg-E', '暂无报价', '', '2024-01-01', '英菲尼迪(进口)', 9694, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49694, 'https://p3.dcarimg.com/img/motor-img/935bacb657b73baecf6650c6cc8a53a1~332x0.webp', 'picture/307.jpg', 'https://www.dongchedi.com/auto/series/2451');
INSERT INTO `item_xiangmu` VALUES (308, '风诺', '暂无报价', '', '2024-01-01', '东风雷诺', 9693, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：300********************充电时间h：快充1小时慢充6-8小时********************', 49693, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800001b4d5161fc4d~332x0.webp', 'picture/308.jpg', 'https://www.dongchedi.com/auto/series/2129');
INSERT INTO `item_xiangmu` VALUES (309, '三菱i', '暂无报价', '', '2024-01-01', '三菱(进口)', 9692, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49692, 'https://p3.dcarimg.com/img/mosaic-legacy/bef50000970dff15a426~332x0.webp', 'picture/309.jpg', 'https://www.dongchedi.com/auto/series/2299');
INSERT INTO `item_xiangmu` VALUES (310, '日产e-NV200(海外)', '暂无报价', '', '2024-01-01', '日产(进口)', 9691, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：********************充电时间h：-********************', 49691, 'https://p3.dcarimg.com/img/mosaic-legacy/bef1000088788c12c428~332x0.webp', 'picture/310.jpg', 'https://www.dongchedi.com/auto/series/2713');
INSERT INTO `item_xiangmu` VALUES (311, '开沃D07创业者', '暂无报价', '', '2022-03-01', '开沃汽车', 9690, '0', '********************车型总数：共5款车型********************车型级别：微面********************纯电续航里程km：301********************充电时间h：-********************', 49690, 'https://p3.dcarimg.com/img/motor-img/76fde65ffaf4b6ad8612df646ff6e004~332x0.webp', 'picture/311.jpg', 'https://www.dongchedi.com/auto/series/1921');
INSERT INTO `item_xiangmu` VALUES (312, '雷诺ZOE', '暂无报价', '', '2024-01-01', '雷诺(进口)', 9689, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：********************', 49689, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800006b270b0c9431~332x0.webp', 'picture/312.jpg', 'https://www.dongchedi.com/auto/series/2572');
INSERT INTO `item_xiangmu` VALUES (313, '佳宝V80 EV', '暂无报价', '', '2022-05-01', '一汽吉林', 9688, '0', '********************车型总数：共3款车型********************车型级别：微面********************纯电续航里程km：纯电动82马力********************充电时间h：300********************', 49688, 'https://p3.dcarimg.com/img/mosaic-legacy/bef00000866ae7a18838~332x0.webp', 'picture/313.jpg', 'https://www.dongchedi.com/auto/series/3133');
INSERT INTO `item_xiangmu` VALUES (314, '飞碟Q2T', '暂无报价', '', '2022-09-01', '飞碟汽车', 9687, '0', '********************车型总数：共2款车型********************车型级别：微卡********************纯电续航里程km：285********************充电时间h：快充1.5小时慢充8小时********************', 49687, 'https://p3.dcarimg.com/img/motor-img/e640dd0c4fbc921a9f367fc0cc29e6e4~332x0.webp', 'picture/314.jpg', 'https://www.dongchedi.com/auto/series/4733');
INSERT INTO `item_xiangmu` VALUES (315, 'OSHAN', '暂无报价', '', '2024-01-01', '长安汽车', 9686, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49686, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800002be0a365b93e~332x0.webp', 'picture/315.jpg', 'https://www.dongchedi.com/auto/series/2895');
INSERT INTO `item_xiangmu` VALUES (316, '小海狮 EV', '暂无报价', '', '2023-10-01', '华晨鑫源新能源', 9685, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：305********************充电时间h：-********************', 49685, 'https://p3.dcarimg.com/img/motor-img/7df239b6a9abc510dcb8cd2fdcc30692~332x0.webp', 'picture/316.jpg', 'https://www.dongchedi.com/auto/series/4293');
INSERT INTO `item_xiangmu` VALUES (317, '魏牌-X', '暂无报价', '', '2024-01-01', '长城汽车', 9684, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：********************', 49684, 'https://p3.dcarimg.com/img/mosaic-legacy/9b13000100e94a3d3843~332x0.webp', 'picture/317.jpg', 'https://www.dongchedi.com/auto/series/2852');
INSERT INTO `item_xiangmu` VALUES (318, 'Cross Coupe', '暂无报价', '', '2024-01-01', '大众(进口)', 9683, '0', '********************车型总数：共1款车型********************车型级别：大型SUV********************纯电续航里程km：********************充电时间h：-********************', 49683, 'https://p3.dcarimg.com/img/mosaic-legacy/1767400002cdcdc677d52~332x0.webp', 'picture/318.jpg', 'https://www.dongchedi.com/auto/series/1946');
INSERT INTO `item_xiangmu` VALUES (319, '日产IDS', '暂无报价', '', '2024-01-01', '日产(进口)', 9682, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49682, 'https://p3.dcarimg.com/img/mosaic-legacy/bef8000017018474b21e~332x0.webp', 'picture/319.jpg', 'https://www.dongchedi.com/auto/series/2246');
INSERT INTO `item_xiangmu` VALUES (320, '大众MOIA', '暂无报价', '', '2024-01-01', '大众(进口)', 9681, '0', '********************车型总数：共1款车型********************车型级别：大型MPV********************纯电续航里程km：300********************充电时间h：快充0.5小时********************', 49681, 'https://p3.dcarimg.com/img/mosaic-legacy/bef8000066ef73e488f5~332x0.webp', 'picture/320.jpg', 'https://www.dongchedi.com/auto/series/2721');
INSERT INTO `item_xiangmu` VALUES (321, '哪吒Eureka 01', '暂无报价', '', '2024-01-01', '合众汽车', 9680, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49680, 'https://p3.dcarimg.com/img/mosaic-legacy/17674000015a6b8be5e9b~332x0.webp', 'picture/321.jpg', 'https://www.dongchedi.com/auto/series/2988');
INSERT INTO `item_xiangmu` VALUES (322, '银隆5024 EV', '暂无报价', '', '2021-05-01', '银隆新能源', 9679, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：343********************充电时间h：快充2小时慢充8小时********************', 49679, 'https://p3.dcarimg.com/img/motor-img/b20125736888150ccbae8f560c6e594b~332x0.webp', 'picture/322.jpg', 'https://www.dongchedi.com/auto/series/3898');
INSERT INTO `item_xiangmu` VALUES (323, '优劲EV', '暂无报价', '', '2023-02-01', '开瑞汽车', 9678, '0', '********************车型总数：共3款车型********************车型级别：微卡********************纯电续航里程km：238********************充电时间h：-********************', 49678, 'https://p3.dcarimg.com/img/motor-img/1a91e12b9dc61f1f6622339bd0e81257~332x0.webp', 'picture/323.jpg', 'https://www.dongchedi.com/auto/series/2922');
INSERT INTO `item_xiangmu` VALUES (324, '开沃D10', '暂无报价', '', '2022-03-01', '开沃汽车', 9677, '0', '********************车型总数：共12款车型********************车型级别：轻客********************纯电续航里程km：292********************充电时间h：-********************', 49677, 'https://p3.dcarimg.com/img/mosaic-legacy/beef0000a6fd671bc69d~332x0.webp', 'picture/324.jpg', 'https://www.dongchedi.com/auto/series/1924');
INSERT INTO `item_xiangmu` VALUES (325, '电牛2号', '暂无报价', '', '2023-11-01', '陕汽通家', 9676, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：255********************充电时间h：快充2.5小时********************', 49676, 'https://p3.dcarimg.com/img/motor-img/6ed375431972a4ebfe83305aad8b7ab4~332x0.webp', 'picture/325.jpg', 'https://www.dongchedi.com/auto/series/5465');
INSERT INTO `item_xiangmu` VALUES (326, '新龙马汽车启腾M70 EV', '暂无报价', '', '2023-12-01', '新龙马汽车', 9675, '0', '********************车型总数：共4款车型********************车型级别：微面********************纯电续航里程km：280********************充电时间h：快充0.75小时慢充12小时********************', 49675, 'https://p3.dcarimg.com/img/mosaic-legacy/bef3000098439d18fa56~332x0.webp', 'picture/326.jpg', 'https://www.dongchedi.com/auto/series/1739');
INSERT INTO `item_xiangmu` VALUES (327, 'SERES SF7', '暂无报价', '', '2024-01-01', '金康赛力斯', 9674, '0', '********************车型总数：共1款车型********************车型级别：中大型SUV********************纯电续航里程km：********************充电时间h：-********************', 49674, 'https://p3.dcarimg.com/img/mosaic-legacy/9b1300004e6b96b92062~332x0.webp', 'picture/327.jpg', 'https://www.dongchedi.com/auto/series/2985');
INSERT INTO `item_xiangmu` VALUES (328, 'VISION NEXT 100', '暂无报价', '', '2024-01-01', '宝马(进口)', 9673, '0', '********************车型总数：共1款车型********************车型级别：中大型车********************纯电续航里程km：********************充电时间h：-********************', 49673, 'https://p3.dcarimg.com/img/mosaic-legacy/bef600002cfa0d355acd~332x0.webp', 'picture/328.jpg', 'https://www.dongchedi.com/auto/series/2065');
INSERT INTO `item_xiangmu` VALUES (329, '新龙马汽车启腾EX7', '暂无报价', '', '2022-11-01', '新龙马汽车', 9672, '0', '********************车型总数：共2款车型********************车型级别：紧凑型SUV********************纯电续航里程km：450********************充电时间h：快充1小时慢充11小时********************', 49672, 'https://p3.dcarimg.com/img/motor-img/87eda9f29b6f0b18c61a9262bba50406~332x0.webp', 'picture/329.jpg', 'https://www.dongchedi.com/auto/series/4806');
INSERT INTO `item_xiangmu` VALUES (330, '俊风EJ30', '暂无报价', '', '2024-01-01', '东风汽车', 9671, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49671, 'https://p3.dcarimg.com/img/mosaic-legacy/65de00004a7f001da650~332x0.webp', 'picture/330.jpg', 'https://www.dongchedi.com/auto/series/2772');
INSERT INTO `item_xiangmu` VALUES (331, '好运1号', '暂无报价', '', '2023-03-01', '华晨鑫源新能源', 9670, '0', '********************车型总数：共2款车型********************车型级别：微面********************纯电续航里程km：305********************充电时间h：-********************', 49670, 'https://p3.dcarimg.com/img/motor-img/bce97a58ad16bba1c6ac30c24643c9ab~332x0.webp', 'picture/331.jpg', 'https://www.dongchedi.com/auto/series/1771');
INSERT INTO `item_xiangmu` VALUES (332, '龙耀6', '暂无报价', '', '2024-01-01', '厦门金龙', 9669, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：240********************充电时间h：快充2小时慢充10小时********************', 49669, 'https://p3.dcarimg.com/img/motor-img/14ee3d78d3ba94e6432d9be829eceb14~332x0.webp', 'picture/332.jpg', 'https://www.dongchedi.com/auto/series/5790');
INSERT INTO `item_xiangmu` VALUES (333, '成功BEV6', '暂无报价', '', '2021-03-01', '成功汽车', 9668, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：306********************充电时间h：-********************', 49668, 'https://p3.dcarimg.com/img/motor-img/c78f8ea0f6e32501274d62872c14bea3~332x0.webp', 'picture/333.jpg', 'https://www.dongchedi.com/auto/series/3201');
INSERT INTO `item_xiangmu` VALUES (334, 'Modular Vehicle System', '暂无报价', '', '2024-01-01', 'AEV ROBOTICS', 9667, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：********************充电时间h：-********************', 49667, 'https://p3.dcarimg.com/img/motor-img/80ac66336d78be9c446b310dc972270f~332x0.webp', 'picture/334.jpg', 'https://www.dongchedi.com/auto/series/3160');
INSERT INTO `item_xiangmu` VALUES (335, '北汽新能源EX400L', '暂无报价', '', '2024-01-01', '北汽新能源', 9666, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：400********************充电时间h：-********************', 49666, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800003bc21ce6d0ec~332x0.webp', 'picture/335.jpg', 'https://www.dongchedi.com/auto/series/2103');
INSERT INTO `item_xiangmu` VALUES (336, 'Prototype 10', '暂无报价', '', '2024-01-01', '英菲尼迪(进口)', 9665, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49665, 'https://p3.dcarimg.com/img/mosaic-legacy/bef600006c0f13619b45~332x0.webp', 'picture/336.jpg', 'https://www.dongchedi.com/auto/series/2997');
INSERT INTO `item_xiangmu` VALUES (337, '前途Concept 1', '暂无报价', '', '2024-01-01', '前途汽车', 9664, '0', '********************车型总数：共1款车型********************车型级别：中大型车********************纯电续航里程km：********************充电时间h：-********************', 49664, 'https://p3.dcarimg.com/img/mosaic-legacy/17675000068f256077474~332x0.webp', 'picture/337.jpg', 'https://www.dongchedi.com/auto/series/2838');
INSERT INTO `item_xiangmu` VALUES (338, '北汽新能源ET400', '暂无报价', '', '2024-01-01', '北汽新能源', 9663, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49663, 'https://p3.dcarimg.com/img/mosaic-legacy/bef8000066dc7a0e9167~332x0.webp', 'picture/338.jpg', 'https://www.dongchedi.com/auto/series/1967');
INSERT INTO `item_xiangmu` VALUES (339, '本田Urban EV', '暂无报价', '', '2024-01-01', '本田(进口)', 9662, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49662, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000bf9ca2859347~332x0.webp', 'picture/339.jpg', 'https://www.dongchedi.com/auto/series/1743');
INSERT INTO `item_xiangmu` VALUES (340, '威途X35', '暂无报价', '', '2021-08-01', '陆地方舟', 9661, '0', '********************车型总数：共5款车型********************车型级别：微面********************纯电续航里程km：220********************充电时间h：-********************', 49661, 'https://p3.dcarimg.com/img/mosaic-legacy/65de000108d8e451b89d~332x0.webp', 'picture/340.jpg', 'https://www.dongchedi.com/auto/series/1630');
INSERT INTO `item_xiangmu` VALUES (341, '劲玛', '暂无报价', '', '2024-01-01', '陆地方舟', 9660, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：********************充电时间h：-********************', 49660, 'https://p3.dcarimg.com/img/mosaic-legacy/bef000013ffb176ae1e2~332x0.webp', 'picture/341.jpg', 'https://www.dongchedi.com/auto/series/2689');
INSERT INTO `item_xiangmu` VALUES (342, 'Enspire', '暂无报价', '', '2024-01-01', '上汽通用别克', 9659, '0', '********************车型总数：共1款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：-********************', 49659, 'https://p3.dcarimg.com/img/mosaic-legacy/1767400003b705b7f8e12~332x0.webp', 'picture/342.jpg', 'https://www.dongchedi.com/auto/series/2822');
INSERT INTO `item_xiangmu` VALUES (343, '奇点T2', '暂无报价', '', '2024-01-01', '奇点汽车', 9658, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49658, 'https://p3.dcarimg.com/img/mosaic-legacy/17675000031a6c1485e40~332x0.webp', 'picture/343.jpg', 'https://www.dongchedi.com/auto/series/2903');
INSERT INTO `item_xiangmu` VALUES (344, 'iSPACE', '暂无报价', '', '2024-01-01', '广汽乘用车', 9657, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49657, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800002d72c7d4d943~332x0.webp', 'picture/344.jpg', 'https://www.dongchedi.com/auto/series/1803');
INSERT INTO `item_xiangmu` VALUES (345, 'Sedric Concept', '暂无报价', '', '2024-01-01', '大众(进口)', 9656, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：********************充电时间h：-********************', 49656, 'https://p3.dcarimg.com/img/mosaic-legacy/bef300013c89dfa61ea4~332x0.webp', 'picture/345.jpg', 'https://www.dongchedi.com/auto/series/2053');
INSERT INTO `item_xiangmu` VALUES (346, '鑫源T2S EV', '暂无报价', '', '2023-10-01', '华晨鑫源新能源', 9655, '0', '********************车型总数：共3款车型********************车型级别：微卡********************纯电续航里程km：310********************充电时间h：-********************', 49655, 'https://p3.dcarimg.com/img/motor-img/af66731530790a593374e0897d89ef77~332x0.webp', 'picture/346.jpg', 'https://www.dongchedi.com/auto/series/5410');
INSERT INTO `item_xiangmu` VALUES (347, 'C-Zero', '暂无报价', '', '2024-01-01', '雪铁龙(进口)', 9654, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49654, 'https://p3.dcarimg.com/img/motor-img/3068f9df284661c24606cffe02141fad~332x0.webp', 'picture/347.jpg', 'https://www.dongchedi.com/auto/series/2361');
INSERT INTO `item_xiangmu` VALUES (348, '前途K20', '暂无报价', '', '2024-01-01', '前途汽车', 9653, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49653, 'https://p3.dcarimg.com/img/motor-img/bded9dc9e77f80b3c58512642d4e8251~332x0.webp', 'picture/348.jpg', 'https://www.dongchedi.com/auto/series/2837');
INSERT INTO `item_xiangmu` VALUES (349, 'Lagonda Vision Concept', '暂无报价', '', '2024-01-01', '阿斯顿·马丁', 9652, '0', '********************车型总数：共1款车型********************车型级别：大型车********************纯电续航里程km：634********************充电时间h：-********************', 49652, 'https://p3.dcarimg.com/img/mosaic-legacy/bef400011ab509a347e8~332x0.webp', 'picture/349.jpg', 'https://www.dongchedi.com/auto/series/2719');
INSERT INTO `item_xiangmu` VALUES (350, 'EVision', '暂无报价', '', '2024-01-01', '塔塔', 9651, '0', '********************车型总数：共1款车型********************车型级别：中大型车********************纯电续航里程km：********************充电时间h：-********************', 49651, 'https://p3.dcarimg.com/img/mosaic-legacy/beef00007d81bacc92a0~332x0.webp', 'picture/350.jpg', 'https://www.dongchedi.com/auto/series/2724');
INSERT INTO `item_xiangmu` VALUES (351, '海格H6V', '暂无报价', '', '2023-10-01', '苏州金龙', 9650, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：155********************充电时间h：快充2小时慢充10小时********************', 49650, 'https://p3.dcarimg.com/img/mosaic-legacy/9b13000122561857cc77~332x0.webp', 'picture/351.jpg', 'https://www.dongchedi.com/auto/series/660');
INSERT INTO `item_xiangmu` VALUES (352, 'Nevera', '暂无报价', '', '2024-01-01', 'Rimac', 9649, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：慢充0.5小时********************', 49649, 'https://p3.dcarimg.com/img/motor-img/de5a40d0a6f1abc608e5db57dbefc6c6~332x0.webp', 'picture/352.jpg', 'https://www.dongchedi.com/auto/series/5192');
INSERT INTO `item_xiangmu` VALUES (353, 'e-tron Concept', '暂无报价', '', '2024-01-01', '奥迪(进口)', 9648, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49648, 'https://p3.dcarimg.com/img/mosaic-legacy/bef30001410a0b02a5cb~332x0.webp', 'picture/353.jpg', 'https://www.dongchedi.com/auto/series/2312');
INSERT INTO `item_xiangmu` VALUES (354, '东风·瑞泰特EM30', '暂无报价', '', '2021-05-01', '西安新青年', 9647, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：306********************充电时间h：快充2.5小时慢充13小时********************', 49647, 'https://p3.dcarimg.com/img/mosaic-legacy/bef300009836014ad858~332x0.webp', 'picture/354.jpg', 'https://www.dongchedi.com/auto/series/2796');
INSERT INTO `item_xiangmu` VALUES (355, '宏远EM60', '暂无报价', '', '2022-12-01', '宏远汽车', 9646, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：284********************充电时间h：-********************', 49646, 'https://p3.dcarimg.com/img/motor-img/e1bfb3ef22799b3c4707cb39bf3a0b0a~332x0.webp', 'picture/355.jpg', 'https://www.dongchedi.com/auto/series/4856');
INSERT INTO `item_xiangmu` VALUES (356, '雪佛兰FNR', '暂无报价', '', '2024-01-01', '雪佛兰(进口)', 9645, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49645, 'https://p3.dcarimg.com/img/mosaic-legacy/65de00000d1280e22de6~332x0.webp', 'picture/356.jpg', 'https://www.dongchedi.com/auto/series/2267');
INSERT INTO `item_xiangmu` VALUES (357, '缤歌', '暂无报价', '', '2024-01-01', '猎豹汽车', 9644, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：********************', 49644, 'https://p3.dcarimg.com/img/mosaic-legacy/bef4000106f9e91ba1ab~332x0.webp', 'picture/357.jpg', 'https://www.dongchedi.com/auto/series/2872');
INSERT INTO `item_xiangmu` VALUES (358, 'MINI VISION Next100', '暂无报价', '', '2024-01-01', 'MINI', 9643, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49643, 'https://p3.dcarimg.com/img/motor-img/1d0aa496d2a2612dba3c429c2c3434a3~332x0.webp', 'picture/358.jpg', 'https://www.dongchedi.com/auto/series/2044');
INSERT INTO `item_xiangmu` VALUES (359, 'ID. Vizzion', '暂无报价', '', '2024-01-01', '大众(进口)', 9642, '0', '********************车型总数：共1款车型********************车型级别：大型车********************纯电续航里程km：665********************充电时间h：-********************', 49642, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000f970de7cc64b~332x0.webp', 'picture/359.jpg', 'https://www.dongchedi.com/auto/series/2720');
INSERT INTO `item_xiangmu` VALUES (360, '瑞驰EK07S', '暂无报价', '', '2023-06-01', '瑞驰新能源', 9641, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：280********************充电时间h：-********************', 49641, 'https://p3.dcarimg.com/img/motor-img/d6cdfa4e57eee26eac73171f7ca1acf3~332x0.webp', 'picture/360.jpg', 'https://www.dongchedi.com/auto/series/4685');
INSERT INTO `item_xiangmu` VALUES (361, '瑞驰EK01S', '暂无报价', '', '2023-06-01', '瑞驰新能源', 9640, '0', '********************车型总数：共2款车型********************车型级别：微卡********************纯电续航里程km：280********************充电时间h：-********************', 49640, 'https://p3.dcarimg.com/img/motor-img/dfee8a5d687845bd38737b0773d165f0~332x0.webp', 'picture/361.jpg', 'https://www.dongchedi.com/auto/series/5226');
INSERT INTO `item_xiangmu` VALUES (362, 'Honda Design C 001', '暂无报价', '', '2024-01-01', '本田(进口)', 9639, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：********************充电时间h：-********************', 49639, 'https://p3.dcarimg.com/img/motor-img/95cca982f4a10bd3053f8c6cf74dc663~332x0.webp', 'picture/362.jpg', 'https://www.dongchedi.com/auto/series/1952');
INSERT INTO `item_xiangmu` VALUES (363, 'Chaparral 2X Vision', '暂无报价', '', '2024-01-01', '雪佛兰(进口)', 9638, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49638, 'https://p3.dcarimg.com/img/mosaic-legacy/bef50000967e1f83bdc5~332x0.webp', 'picture/363.jpg', 'https://www.dongchedi.com/auto/series/2579');
INSERT INTO `item_xiangmu` VALUES (364, 'E Concept', '暂无报价', '', '2024-01-01', '广汽乘用车', 9637, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49637, 'https://p3.dcarimg.com/img/mosaic-legacy/bef6000034e37855613c~332x0.webp', 'picture/364.jpg', 'https://www.dongchedi.com/auto/series/1819');
INSERT INTO `item_xiangmu` VALUES (365, '日产IMx', '暂无报价', '', '2024-01-01', '日产(进口)', 9636, '0', '********************车型总数：共1款车型********************车型级别：中型SUV********************纯电续航里程km：600********************充电时间h：-********************', 49636, 'https://p3.dcarimg.com/img/mosaic-legacy/176750000396addf451ae~332x0.webp', 'picture/365.jpg', 'https://www.dongchedi.com/auto/series/1985');
INSERT INTO `item_xiangmu` VALUES (366, '奥迪Elaine', '暂无报价', '', '2024-01-01', '奥迪(进口)', 9635, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49635, 'https://p3.dcarimg.com/img/mosaic-legacy/bef6000004a45a9ecf60~332x0.webp', 'picture/366.jpg', 'https://www.dongchedi.com/auto/series/1741');
INSERT INTO `item_xiangmu` VALUES (367, '智行盒子BM-400', '暂无报价', '即将上市', '2024-01-01', '智行盒子', 9634, '0', '********************车型总数：共1款车型********************车型级别：中型MPV********************纯电续航里程km：530********************充电时间h：-********************', 49634, 'https://p3.dcarimg.com/img/motor-img/932ec03328540f037bff972e5ef4c0ec~332x0.webp', 'picture/367.jpg', 'https://www.dongchedi.com/auto/series/5522');
INSERT INTO `item_xiangmu` VALUES (368, '北汽小河马', '暂无报价', '', '2022-09-01', '北京汽车制造厂', 9633, '0', '********************车型总数：共2款车型********************车型级别：微面********************纯电续航里程km：270********************充电时间h：快充1.5小时********************', 49633, 'https://p3.dcarimg.com/img/motor-img/4c379786112490c7a01a77d92e234f85~332x0.webp', 'picture/368.jpg', 'https://www.dongchedi.com/auto/series/4723');
INSERT INTO `item_xiangmu` VALUES (369, 'i-Road', '暂无报价', '', '2024-01-01', '丰田(进口)', 9632, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49632, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800006b25db6fa00b~332x0.webp', 'picture/369.jpg', 'https://www.dongchedi.com/auto/series/2473');
INSERT INTO `item_xiangmu` VALUES (370, 'DST神州5号', '暂无报价', '', '2022-10-01', '航天神舟汽车', 9631, '0', '********************车型总数：共2款车型********************车型级别：微面********************纯电续航里程km：300********************充电时间h：快充1小时慢充12小时********************', 49631, 'https://p3.dcarimg.com/img/motor-img/3624ffe2227c02b2e5990d6192d00e82~332x0.webp', 'picture/370.jpg', 'https://www.dongchedi.com/auto/series/4785');
INSERT INTO `item_xiangmu` VALUES (371, '瑞驰EC55', '暂无报价', '全新车系', '2024-03-01', '瑞驰新能源', 9630, '0', '********************车型总数：共4款车型********************车型级别：微面********************纯电续航里程km：********************充电时间h：-********************', 49630, 'https://p3.dcarimg.com/img/motor-img/8fe32e6e097a47598d3b03107a23dccf~332x0.webp', 'picture/371.jpg', 'https://www.dongchedi.com/auto/series/5863');
INSERT INTO `item_xiangmu` VALUES (372, '航天金龙', '暂无报价', '', '2022-07-01', '航天神舟汽车', 9629, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：320********************充电时间h：-********************', 49630, 'https://p3.dcarimg.com/img/motor-img/5c58db7a23d8d9b291b97f43b6915aba~332x0.webp', 'picture/372.jpg', 'https://www.dongchedi.com/auto/series/4641');
INSERT INTO `item_xiangmu` VALUES (373, '恒好EV1', '暂无报价', '', '2021-11-01', '恒天汽车', 9628, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：310********************充电时间h：快充2小时慢充10小时********************', 49628, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000dc40cdd0e4e7~332x0.webp', 'picture/373.jpg', 'https://www.dongchedi.com/auto/series/3135');
INSERT INTO `item_xiangmu` VALUES (374, '瑞驰EC71', '暂无报价', '', '2023-08-01', '瑞驰新能源', 9627, '0', '********************车型总数：共5款车型********************车型级别：微卡********************纯电续航里程km：********************充电时间h：-********************', 49627, 'https://p3.dcarimg.com/img/motor-img/06c58201a89065c88625b7eb0da36004~332x0.webp', 'picture/374.jpg', 'https://www.dongchedi.com/auto/series/5270');
INSERT INTO `item_xiangmu` VALUES (375, '九龙EW5', '暂无报价', '', '2023-07-01', '九龙汽车', 9626, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：********************充电时间h：慢充0.5小时********************', 49626, 'https://p3.dcarimg.com/img/motor-img/e349fe90dfecb8cb22703853eebd1e7c~332x0.webp', 'picture/375.jpg', 'https://www.dongchedi.com/auto/series/5261');
INSERT INTO `item_xiangmu` VALUES (376, '海马E5', '暂无报价', '', '2024-01-01', '海马汽车', 9625, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49625, 'https://p3.dcarimg.com/img/mosaic-legacy/bef7000066b57bc8100d~332x0.webp', 'picture/376.jpg', 'https://www.dongchedi.com/auto/series/2865');
INSERT INTO `item_xiangmu` VALUES (377, '清行400', '暂无报价', '', '2024-01-01', '北京清行', 9624, '0', '********************车型总数：共2款车型********************车型级别：小型SUV********************纯电续航里程km：305********************充电时间h：快充1小时慢充8小时********************', 49624, 'https://p3.dcarimg.com/img/mosaic-legacy/beef00009aef9f6195cd~332x0.webp', 'picture/377.jpg', 'https://www.dongchedi.com/auto/series/2929');
INSERT INTO `item_xiangmu` VALUES (378, '摩根EV3', '暂无报价', '', '2024-01-01', '摩根', 9623, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49623, 'https://p3.dcarimg.com/img/mosaic-legacy/bef60000145a45774b19~332x0.webp', 'picture/378.jpg', 'https://www.dongchedi.com/auto/series/1651');
INSERT INTO `item_xiangmu` VALUES (379, 'Generation EQ', '暂无报价', '', '2024-01-01', '梅赛德斯-EQ', 9622, '0', '********************车型总数：共1款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：-********************', 49622, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000f7695739975f~332x0.webp', 'picture/379.jpg', 'https://www.dongchedi.com/auto/series/1761');
INSERT INTO `item_xiangmu` VALUES (380, '御捷330', '暂无报价', '', '2024-01-01', '御捷新能源', 9621, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49621, 'https://p3.dcarimg.com/img/mosaic-legacy/1767400006a5083bf9b65~332x0.webp', 'picture/380.jpg', 'https://www.dongchedi.com/auto/series/2268');
INSERT INTO `item_xiangmu` VALUES (381, '新龙马汽车启腾N50 EV', '暂无报价', '', '2023-12-01', '新龙马汽车', 9620, '0', '********************车型总数：共8款车型********************车型级别：微卡********************纯电续航里程km：261********************充电时间h：快充1小时慢充12小时********************', 49620, 'https://p3.dcarimg.com/img/motor-img/c4e95daea01dfb20dd8514cd96faf19c~332x0.webp', 'picture/381.jpg', 'https://www.dongchedi.com/auto/series/4774');
INSERT INTO `item_xiangmu` VALUES (382, '申龙DST神州5号', '暂无报价', '', '2023-09-01', '申龙客车', 9619, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：********************充电时间h：快充1.5小时慢充15小时********************', 49619, 'https://p3.dcarimg.com/img/motor-img/3624ffe2227c02b2e5990d6192d00e82~332x0.webp', 'picture/382.jpg', 'https://www.dongchedi.com/auto/series/5320');
INSERT INTO `item_xiangmu` VALUES (383, 'Commendatore GT', '暂无报价', '', '2024-01-01', '威马汽车', 9618, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49618, 'https://p3.dcarimg.com/img/mosaic-legacy/bef30000777fb88b7216~332x0.webp', 'picture/383.jpg', 'https://www.dongchedi.com/auto/series/2888');
INSERT INTO `item_xiangmu` VALUES (384, 'KONA EV', '暂无报价', '', '2024-01-01', '现代(进口)', 9617, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：470********************充电时间h：快充0.9小时慢充9.7小时********************', 49617, 'https://p3.dcarimg.com/img/motor-img/738ef39b906c67fda248e6c0c0415dd0~332x0.webp', 'picture/384.jpg', 'https://www.dongchedi.com/auto/series/2708');
INSERT INTO `item_xiangmu` VALUES (385, '江淮iEV7E', '暂无报价', '', '2024-01-01', '江淮汽车', 9616, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：152********************充电时间h：快充1小时慢充10小时********************', 49616, 'https://p3.dcarimg.com/img/mosaic-legacy/bef10000033efa1d5983~332x0.webp', 'picture/385.jpg', 'https://www.dongchedi.com/auto/series/1817');
INSERT INTO `item_xiangmu` VALUES (386, '瑞驰ED71', '暂无报价', '全新车系', '2024-03-01', '瑞驰新能源', 9615, '0', '********************车型总数：共2款车型********************车型级别：微卡********************纯电续航里程km：310********************充电时间h：-********************', 49615, 'https://p3.dcarimg.com/img/motor-img/678f7c22a385ef41f536d1cf9aa13e3f~332x0.webp', 'picture/386.jpg', 'https://www.dongchedi.com/auto/series/5862');
INSERT INTO `item_xiangmu` VALUES (387, '360c Concept', '暂无报价', '', '2024-01-01', '沃尔沃(进口)', 9614, '0', '********************车型总数：共1款车型********************车型级别：中大型车********************纯电续航里程km：********************充电时间h：-********************', 49614, 'https://p3.dcarimg.com/img/mosaic-legacy/bef60000145f8985feeb~332x0.webp', 'picture/387.jpg', 'https://www.dongchedi.com/auto/series/3013');
INSERT INTO `item_xiangmu` VALUES (388, '金星', '暂无报价', '', '2024-01-01', '绿驰汽车', 9613, '0', '********************车型总数：共1款车型********************车型级别：大型车********************纯电续航里程km：652********************充电时间h：-********************', 49613, 'https://p3.dcarimg.com/img/mosaic-legacy/bef500008ee73fd4c5c5~332x0.webp', 'picture/388.jpg', 'https://www.dongchedi.com/auto/series/2704');
INSERT INTO `item_xiangmu` VALUES (389, '福美来E7', '暂无报价', '', '2024-01-01', '一汽海马', 9612, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：********************充电时间h：-********************', 49612, 'https://p3.dcarimg.com/img/mosaic-legacy/9b13000046f2ee62fc34~332x0.webp', 'picture/389.jpg', 'https://www.dongchedi.com/auto/series/2863');
INSERT INTO `item_xiangmu` VALUES (390, 'Sports EV Concept', '暂无报价', '', '2024-01-01', '本田(进口)', 9611, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49611, 'https://p3.dcarimg.com/img/mosaic-legacy/bef0000141e2225cb3cb~332x0.webp', 'picture/390.jpg', 'https://www.dongchedi.com/auto/series/1960');
INSERT INTO `item_xiangmu` VALUES (391, 'ARCFOX-1', '暂无报价', '', '2024-01-01', '北汽新能源', 9610, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：150********************充电时间h：快充0.5小时慢充6.5小时********************', 49610, 'https://p3.dcarimg.com/img/motor-img/9e60a6543929a35ee3dedd77e5297b62~332x0.webp', 'picture/391.jpg', 'https://www.dongchedi.com/auto/series/2013');
INSERT INTO `item_xiangmu` VALUES (392, '长江B级概念车', '暂无报价', '', '2024-01-01', '长江汽车', 9609, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49609, 'https://p3.dcarimg.com/img/mosaic-legacy/bef80000189a3746e097~332x0.webp', 'picture/392.jpg', 'https://www.dongchedi.com/auto/series/2893');
INSERT INTO `item_xiangmu` VALUES (393, 'e-Survivor', '暂无报价', '', '2024-01-01', '铃木(进口)', 9608, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49608, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000c9e9ebc56449~332x0.webp', 'picture/393.jpg', 'https://www.dongchedi.com/auto/series/1949');
INSERT INTO `item_xiangmu` VALUES (394, '捷顺', '暂无报价', '', '2024-01-01', '御捷新能源', 9607, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：150********************充电时间h：-********************', 49607, 'https://p3.dcarimg.com/img/mosaic-legacy/bef50000c5e441e200a1~332x0.webp', 'picture/394.jpg', 'https://www.dongchedi.com/auto/series/2209');
INSERT INTO `item_xiangmu` VALUES (395, 'e-Co-Motion', '暂无报价', '', '2024-01-01', '大众(进口)', 9606, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：********************充电时间h：-********************', 49606, 'https://p3.dcarimg.com/img/mosaic-legacy/bef10001437dfe87fe21~332x0.webp', 'picture/395.jpg', 'https://www.dongchedi.com/auto/series/2450');
INSERT INTO `item_xiangmu` VALUES (396, '小老虎EV', '暂无报价', '', '2024-01-01', '中兴汽车', 9605, '0', '********************车型总数：共1款车型********************车型级别：迷你皮卡********************纯电续航里程km：********************充电时间h：-********************', 49605, 'https://p3.dcarimg.com/img/mosaic-legacy/bef600002cfde056c92b~332x0.webp', 'picture/396.jpg', 'https://www.dongchedi.com/auto/series/2242');
INSERT INTO `item_xiangmu` VALUES (397, '开沃D11 EV', '暂无报价', '', '2022-03-01', '开沃汽车', 9604, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：305********************充电时间h：快充2小时慢充13小时********************', 49604, 'https://p3.dcarimg.com/img/mosaic-legacy/bef20000d7c1c4d6dff6~332x0.webp', 'picture/397.jpg', 'https://www.dongchedi.com/auto/series/1828');
INSERT INTO `item_xiangmu` VALUES (398, 'Concept Two', '暂无报价', '', '2024-01-01', 'Rimac', 9603, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49603, 'https://p3.dcarimg.com/img/mosaic-legacy/17674000034101a76f6fb~332x0.webp', 'picture/398.jpg', 'https://www.dongchedi.com/auto/series/2710');
INSERT INTO `item_xiangmu` VALUES (399, '观致MILE 1', '暂无报价', '', '2024-01-01', '观致汽车', 9602, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49602, 'https://p3.dcarimg.com/img/mosaic-legacy/bef6000067f308640f7e~332x0.webp', 'picture/399.jpg', 'https://www.dongchedi.com/auto/series/2877');
INSERT INTO `item_xiangmu` VALUES (400, 'Wonder-Capsule', '暂无报价', '', '2024-01-01', '丰田(进口)', 9601, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49601, 'https://p3.dcarimg.com/img/motor-img/0815c4e8082f683d1abd65483928af69~332x0.webp', 'picture/400.jpg', 'https://www.dongchedi.com/auto/series/1966');
INSERT INTO `item_xiangmu` VALUES (401, 'NeuV', '暂无报价', '', '2024-01-01', '本田(进口)', 9600, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49600, 'https://p3.dcarimg.com/img/mosaic-legacy/bef700002e9e2869a07b~332x0.webp', 'picture/401.jpg', 'https://www.dongchedi.com/auto/series/2047');
INSERT INTO `item_xiangmu` VALUES (402, '路盛E70 EV', '暂无报价', '', '2024-01-01', '华泰新能源', 9599, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：196********************充电时间h：慢充8小时********************', 49599, 'https://p3.dcarimg.com/img/mosaic-legacy/88830000b2db654ab6a2~332x0.webp', 'picture/402.jpg', 'https://www.dongchedi.com/auto/series/1837');
INSERT INTO `item_xiangmu` VALUES (403, 'thunder power', '暂无报价', '', '2024-01-01', '昶洧', 9598, '0', '********************车型总数：共1款车型********************车型级别：中大型车********************纯电续航里程km：********************充电时间h：-********************', 49598, 'https://p3.dcarimg.com/img/mosaic-legacy/bef0000143f0368c117b~332x0.webp', 'picture/403.jpg', 'https://www.dongchedi.com/auto/series/2780');
INSERT INTO `item_xiangmu` VALUES (404, '恒好EV7', '暂无报价', '', '2021-11-01', '恒天汽车', 9597, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：335********************充电时间h：快充2小时慢充10小时********************', 49597, 'https://p3.dcarimg.com/img/mosaic-legacy/1767500000f38c2db9c4f~332x0.webp', 'picture/404.jpg', 'https://www.dongchedi.com/auto/series/3136');
INSERT INTO `item_xiangmu` VALUES (405, 'i Vision Dynamics', '暂无报价', '', '2024-01-01', '宝马(进口)', 9596, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：600********************充电时间h：-********************', 49596, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000df1a5cd420cf~332x0.webp', 'picture/405.jpg', 'https://www.dongchedi.com/auto/series/1732');
INSERT INTO `item_xiangmu` VALUES (406, '逸酷', '暂无报价', '', '2024-01-01', '长江汽车', 9595, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：200********************充电时间h：快充1小时慢充7.7小时********************', 49595, 'https://p3.dcarimg.com/img/motor-img/527ffa8d89cd4b20e94709637429ae71~332x0.webp', 'picture/406.jpg', 'https://www.dongchedi.com/auto/series/2783');
INSERT INTO `item_xiangmu` VALUES (407, '长江C级概念车', '暂无报价', '', '2024-01-01', '长江汽车', 9594, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：********************充电时间h：-********************', 49594, 'https://p3.dcarimg.com/img/mosaic-legacy/176740000667114b0cbaa~332x0.webp', 'picture/407.jpg', 'https://www.dongchedi.com/auto/series/2892');
INSERT INTO `item_xiangmu` VALUES (408, 'Fine-Comfort Ride', '暂无报价', '', '2024-01-01', '丰田(进口)', 9593, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：********************充电时间h：-********************', 49593, 'https://p3.dcarimg.com/img/mosaic-legacy/bef600001a9c50332eb6~332x0.webp', 'picture/408.jpg', 'https://www.dongchedi.com/auto/series/1950');
INSERT INTO `item_xiangmu` VALUES (409, 'Model K-EV', '暂无报价', '', '2024-01-01', '观致汽车', 9592, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：********************充电时间h：-********************', 49592, 'https://p3.dcarimg.com/img/mosaic-legacy/1767400005c8280a9c9e2~332x0.webp', 'picture/409.jpg', 'https://www.dongchedi.com/auto/series/2045');
INSERT INTO `item_xiangmu` VALUES (410, 'VISION E', '暂无报价', '', '2024-01-01', '斯柯达(进口)', 9591, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49591, 'https://p3.dcarimg.com/img/mosaic-legacy/1767400006a2e2757620a~332x0.webp', 'picture/410.jpg', 'https://www.dongchedi.com/auto/series/2063');
INSERT INTO `item_xiangmu` VALUES (411, 'Airstream', '暂无报价', '', '2024-01-01', '福特(进口)', 9590, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：491********************充电时间h：-********************', 49590, 'https://p3.dcarimg.com/img/mosaic-legacy/1767400006a51eed0815c~332x0.webp', 'picture/411.jpg', 'https://www.dongchedi.com/auto/series/2540');
INSERT INTO `item_xiangmu` VALUES (412, 'Esflow', '暂无报价', '', '2024-01-01', '日产(进口)', 9589, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49589, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800002ed7477775f3~332x0.webp', 'picture/412.jpg', 'https://www.dongchedi.com/auto/series/2364');
INSERT INTO `item_xiangmu` VALUES (413, 'TARANTULA', '暂无报价', '', '2024-01-01', '上汽大通', 9588, '0', '********************车型总数：共1款车型********************车型级别：中大型SUV********************纯电续航里程km：********************充电时间h：-********************', 49588, 'https://p3.dcarimg.com/img/mosaic-legacy/176760000159d640a0ad4~332x0.webp', 'picture/413.jpg', 'https://www.dongchedi.com/auto/series/2886');
INSERT INTO `item_xiangmu` VALUES (414, '领特EV', '暂无报价', '', '2022-07-01', '厦门金旅', 9587, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：355********************充电时间h：快充2小时慢充10小时********************', 49587, 'https://p3.dcarimg.com/img/motor-img/385fc50502ff89ac0ef8b1a22808d169~332x0.webp', 'picture/414.jpg', 'https://www.dongchedi.com/auto/series/4660');
INSERT INTO `item_xiangmu` VALUES (415, 'EX概念车', '暂无报价', '', '2024-01-01', '北汽新能源', 9586, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：150********************充电时间h：快充0.5小时慢充6.5小时********************', 49586, 'https://p3.dcarimg.com/img/motor-img/0e540e76f50500ea75a77a8deb7acd0f~332x0.webp', 'picture/415.jpg', 'https://www.dongchedi.com/auto/series/2191');
INSERT INTO `item_xiangmu` VALUES (416, '三菱eX', '暂无报价', '', '2024-01-01', '三菱(进口)', 9585, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49585, 'https://p3.dcarimg.com/img/motor-img/3d4665154f03c643377a7aa97b95ae3b~332x0.webp', 'picture/416.jpg', 'https://www.dongchedi.com/auto/series/2260');
INSERT INTO `item_xiangmu` VALUES (417, 'LSEV', '暂无报价', '', '2024-01-01', '江淮汽车', 9584, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49584, 'https://p3.dcarimg.com/img/mosaic-legacy/bef0000143f7bc4c1560~332x0.webp', 'picture/417.jpg', 'https://www.dongchedi.com/auto/series/2896');
INSERT INTO `item_xiangmu` VALUES (418, '瑞途EV', '暂无报价', '', '2022-10-01', '曙光汽车', 9583, '0', '********************车型总数：共1款车型********************车型级别：轻客********************纯电续航里程km：********************充电时间h：-********************', 49583, 'https://p3.dcarimg.com/img/motor-img/35a18e4d5245275e336438a11df7dc37~332x0.webp', 'picture/418.jpg', 'https://www.dongchedi.com/auto/series/4786');
INSERT INTO `item_xiangmu` VALUES (419, 'NEVS 93', '暂无报价', '', '2024-01-01', 'NEVS', 9582, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：355********************充电时间h：快充0.5小时慢充7小时********************', 49582, 'https://p3.dcarimg.com/img/mosaic-legacy/bef000011821ae834386~332x0.webp', 'picture/419.jpg', 'https://www.dongchedi.com/auto/series/1912');
INSERT INTO `item_xiangmu` VALUES (420, 'ID.概念车', '暂无报价', '', '2024-01-01', '大众(进口)', 9581, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：665********************充电时间h：-********************', 49581, 'https://p3.dcarimg.com/img/mosaic-legacy/bef2000145da874d130b~332x0.webp', 'picture/420.jpg', 'https://www.dongchedi.com/auto/series/2118');
INSERT INTO `item_xiangmu` VALUES (421, '英菲尼迪LE', '暂无报价', '', '2024-01-01', '英菲尼迪(进口)', 9580, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：********************充电时间h：-********************', 49580, 'https://p3.dcarimg.com/img/mosaic-legacy/bef500005959678f714c~332x0.webp', 'picture/421.jpg', 'https://www.dongchedi.com/auto/series/2934');
INSERT INTO `item_xiangmu` VALUES (422, 'MEV100', '暂无报价', '', '2024-01-01', '新特汽车', 9579, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49579, 'https://p3.dcarimg.com/img/motor-img/2c1f59f187a80c15abfcd6d6d80d271e~332x0.webp', 'picture/422.jpg', 'https://www.dongchedi.com/auto/series/4158');
INSERT INTO `item_xiangmu` VALUES (423, 'E-more概念车', '暂无报价', '', '2024-01-01', '广汽三菱', 9578, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：********************充电时间h：-********************', 49580, 'https://p3.dcarimg.com/img/mosaic-legacy/17675000064c57a5573b2~332x0.webp', 'picture/423.jpg', 'https://www.dongchedi.com/auto/series/2878');
INSERT INTO `item_xiangmu` VALUES (424, '路盛S5', '暂无报价', '', '2024-01-01', '华泰新能源', 9577, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：196********************充电时间h：慢充8小时********************', 49577, 'https://p3.dcarimg.com/img/mosaic-legacy/bef600005e0a5e283abf~332x0.webp', 'picture/424.jpg', 'https://www.dongchedi.com/auto/series/2231');
INSERT INTO `item_xiangmu` VALUES (425, '丰田LQ', '暂无报价', '', '2024-01-01', '丰田(进口)', 9576, '0', '********************车型总数：共2款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49576, 'https://p3.dcarimg.com/img/motor-img/8756d17b1b937a241c0ffdc13b41d721~332x0.webp', 'picture/425.jpg', 'https://www.dongchedi.com/auto/series/2021');
INSERT INTO `item_xiangmu` VALUES (426, 'OffSpace SUIT', '暂无报价', '', '2024-01-01', '北京汽车', 9575, '0', '********************车型总数：共1款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：-********************', 49575, 'https://p3.dcarimg.com/img/mosaic-legacy/1767500002c58d5bc17d7~332x0.webp', 'picture/426.jpg', 'https://www.dongchedi.com/auto/series/2914');
INSERT INTO `item_xiangmu` VALUES (427, '云度V01L', '暂无报价', '', '2022-08-01', '云度新能源', 9574, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：261********************充电时间h：快充0.75小时慢充10-11小时********************', 49574, 'https://p3.dcarimg.com/img/motor-img/b830ab4f4d3bbc62c26d885484f64e00~332x0.webp', 'picture/427.jpg', 'https://www.dongchedi.com/auto/series/4686');
INSERT INTO `item_xiangmu` VALUES (428, 'e-Racer', '暂无报价', '', '2024-01-01', '西雅特', 9573, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49573, 'https://p3.dcarimg.com/img/motor-img/88b4da81b52020200a501fc4a66e5338~332x0.webp', 'picture/428.jpg', 'https://www.dongchedi.com/auto/series/2706');
INSERT INTO `item_xiangmu` VALUES (429, '奇点iS6', '暂无报价', '', '2024-01-01', '奇点汽车', 9572, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：********************', 49572, 'https://p3.dcarimg.com/img/mosaic-legacy/bef400000bb9e608fb30~332x0.webp', 'picture/429.jpg', 'https://www.dongchedi.com/auto/series/2776');
INSERT INTO `item_xiangmu` VALUES (430, 'ME.WE', '暂无报价', '', '2024-01-01', '丰田(进口)', 9571, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49571, 'https://p3.dcarimg.com/img/mosaic-legacy/1767400003418644e528a~332x0.webp', 'picture/430.jpg', 'https://www.dongchedi.com/auto/series/2395');
INSERT INTO `item_xiangmu` VALUES (431, '丰田1X', '暂无报价', '', '2024-01-01', '丰田(进口)', 9570, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49570, 'https://p3.dcarimg.com/img/mosaic-legacy/bef3000144671c1299bb~332x0.webp', 'picture/431.jpg', 'https://www.dongchedi.com/auto/series/2497');
INSERT INTO `item_xiangmu` VALUES (432, '丰田FCV', '暂无报价', '', '2024-01-01', '丰田(进口)', 9569, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：********************充电时间h：-********************', 49569, 'https://p3.dcarimg.com/img/mosaic-legacy/47480000728a79ec335e~332x0.webp', 'picture/432.jpg', 'https://www.dongchedi.com/auto/series/2286');
INSERT INTO `item_xiangmu` VALUES (433, 'TREZOR', '暂无报价', '', '2024-01-01', '雷诺(进口)', 9568, '0', '********************车型总数：共1款车型********************车型级别：跑车********************纯电续航里程km：********************充电时间h：-********************', 49568, 'https://p3.dcarimg.com/img/mosaic-legacy/176750000616a7fc03afb~332x0.webp', 'picture/433.jpg', 'https://www.dongchedi.com/auto/series/2061');
INSERT INTO `item_xiangmu` VALUES (434, '丰田RiN', '暂无报价', '', '2024-01-01', '丰田(进口)', 9567, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49567, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800002ecfce9cfb07~332x0.webp', 'picture/434.jpg', 'https://www.dongchedi.com/auto/series/2507');
INSERT INTO `item_xiangmu` VALUES (435, 'Blue2', '暂无报价', '', '2024-01-01', '现代(进口)', 9566, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49566, 'https://p3.dcarimg.com/img/mosaic-legacy/1767500002a6224fd0463~332x0.webp', 'picture/435.jpg', 'https://www.dongchedi.com/auto/series/2324');
INSERT INTO `item_xiangmu` VALUES (436, 'NEVS 9-3X', '暂无报价', '', '2024-01-01', 'NEVS', 9565, '0', '********************车型总数：共1款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：-********************', 49565, 'https://p3.dcarimg.com/img/mosaic-legacy/47470000b4585d6492e2~332x0.webp', 'picture/436.jpg', 'https://www.dongchedi.com/auto/series/2915');
INSERT INTO `item_xiangmu` VALUES (437, '丰田FT-EV', '暂无报价', '', '2024-01-01', '丰田(进口)', 9564, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49564, 'https://p3.dcarimg.com/img/mosaic-legacy/1767600000779c216b697~332x0.webp', 'picture/437.jpg', 'https://www.dongchedi.com/auto/series/2743');
INSERT INTO `item_xiangmu` VALUES (438, '长江SUV概念车', '暂无报价', '', '2024-01-01', '长江汽车', 9563, '0', '********************车型总数：共1款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：-********************', 49563, 'https://p3.dcarimg.com/img/motor-img/ac9a133ca2c03697d31473184c0839c9~332x0.webp', 'picture/438.jpg', 'https://www.dongchedi.com/auto/series/2891');
INSERT INTO `item_xiangmu` VALUES (439, '三菱CA-MiEV', '暂无报价', '', '2024-01-01', '三菱(进口)', 9562, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49562, 'https://p3.dcarimg.com/img/mosaic-legacy/bef7000004d99c62c5fb~332x0.webp', 'picture/439.jpg', 'https://www.dongchedi.com/auto/series/2563');
INSERT INTO `item_xiangmu` VALUES (440, '丰田FCV-R', '暂无报价', '', '2024-01-01', '丰田(进口)', 9561, '0', '********************车型总数：共1款车型********************车型级别：中型车********************纯电续航里程km：********************充电时间h：-********************', 49561, 'https://p3.dcarimg.com/img/motor-img/8503b79fae616d8cfb9510db2e1bb570~332x0.webp', 'picture/440.jpg', 'https://www.dongchedi.com/auto/series/2498');
INSERT INTO `item_xiangmu` VALUES (441, 'EMotion', '暂无报价', '', '2024-01-01', 'Fisker', 9560, '0', '********************车型总数：共1款车型********************车型级别：中大型车********************纯电续航里程km：********************充电时间h：-********************', 49560, 'https://p3.dcarimg.com/img/mosaic-legacy/bef80000671fa625d1cf~332x0.webp', 'picture/441.jpg', 'https://www.dongchedi.com/auto/series/2918');
INSERT INTO `item_xiangmu` VALUES (442, 'CONCEPT-爱i Ride', '暂无报价', '', '2024-01-01', '丰田(进口)', 9559, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49559, 'https://p3.dcarimg.com/img/mosaic-legacy/176760000112eb4f74c75~332x0.webp', 'picture/442.jpg', 'https://www.dongchedi.com/auto/series/1944');
INSERT INTO `item_xiangmu` VALUES (443, '云度Xπ', '暂无报价', '', '2024-01-01', '云度新能源', 9558, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：********************充电时间h：-********************', 49558, 'https://p3.dcarimg.com/img/motor-img/8c619ae7221869afb987886f38bd956b~332x0.webp', 'picture/443.jpg', 'https://www.dongchedi.com/auto/series/2256');
INSERT INTO `item_xiangmu` VALUES (444, 'Instinct', '暂无报价', '', '2024-01-01', '标致(进口)', 9557, '0', '********************车型总数：共1款车型********************车型级别：中大型车********************纯电续航里程km：********************充电时间h：-********************', 49557, 'https://p3.dcarimg.com/img/mosaic-legacy/1767400000039795cff3b~332x0.webp', 'picture/444.jpg', 'https://www.dongchedi.com/auto/series/2007');
INSERT INTO `item_xiangmu` VALUES (445, '卡威E20', '暂无报价', '', '2024-01-01', '卡威汽车', 9556, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：180********************充电时间h：-********************', 49556, 'https://p3.dcarimg.com/img/mosaic-legacy/bef800002ef0fe396653~332x0.webp', 'picture/445.jpg', 'https://www.dongchedi.com/auto/series/1974');
INSERT INTO `item_xiangmu` VALUES (446, 'EZ-GO', '暂无报价', '', '2024-01-01', '雷诺(进口)', 9555, '0', '********************车型总数：共1款车型********************车型级别：紧凑型车********************纯电续航里程km：********************充电时间h：-********************', 49555, 'https://p3.dcarimg.com/img/mosaic-legacy/1767500001204b1cf8b8a~332x0.webp', 'picture/446.jpg', 'https://www.dongchedi.com/auto/series/2722');
INSERT INTO `item_xiangmu` VALUES (447, '圣达菲2', '暂无报价', '', '2024-01-01', '华泰新能源', 9554, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：********************充电时间h：-********************', 49554, 'https://p3.dcarimg.com/img/mosaic-legacy/bef40000bf9e4db7e4c4~332x0.webp', 'picture/447.jpg', 'https://www.dongchedi.com/auto/series/1813');
INSERT INTO `item_xiangmu` VALUES (448, 'Portal', '暂无报价', '', '2024-01-01', '克莱斯勒(进口)', 9553, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：********************充电时间h：-********************', 49553, 'https://p3.dcarimg.com/img/motor-img/cd77da9a17dd156489f504079719bdde~332x0.webp', 'picture/448.jpg', 'https://www.dongchedi.com/auto/series/2049');
INSERT INTO `item_xiangmu` VALUES (449, '丰田Hi-CT', '暂无报价', '', '2024-01-01', '丰田(进口)', 9552, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49552, 'https://p3.dcarimg.com/img/mosaic-legacy/bef600001c9ca51a0dea~332x0.webp', 'picture/449.jpg', 'https://www.dongchedi.com/auto/series/2503');
INSERT INTO `item_xiangmu` VALUES (450, 'Symbioz', '暂无报价', '', '2024-01-01', '雷诺(进口)', 9551, '0', '********************车型总数：共1款车型********************车型级别：小型车********************纯电续航里程km：********************充电时间h：-********************', 49551, 'https://p3.dcarimg.com/img/motor-img/9abddd842b54a05b37efd43491081fc4~332x0.webp', 'picture/450.jpg', 'https://www.dongchedi.com/auto/series/1982');
INSERT INTO `item_xiangmu` VALUES (451, '卡威E10', '暂无报价', '', '2024-01-01', '卡威汽车', 9550, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：350********************充电时间h：-********************', 49550, 'https://p3.dcarimg.com/img/mosaic-legacy/1767500002783b87bf3e9~332x0.webp', 'picture/451.jpg', 'https://www.dongchedi.com/auto/series/1973');
INSERT INTO `item_xiangmu` VALUES (452, '圣达菲5 EV', '暂无报价', '', '2024-01-01', '华泰新能源', 9549, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49549, 'https://p3.dcarimg.com/img/mosaic-legacy/bef700006acddc9d63d2~332x0.webp', 'picture/452.jpg', 'https://www.dongchedi.com/auto/series/2904');
INSERT INTO `item_xiangmu` VALUES (453, 'FE Fuel Cell', '暂无报价', '', '2024-01-01', '现代(进口)', 9548, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：800********************充电时间h：-********************', 49548, 'https://p3.dcarimg.com/img/motor-img/6944f0af675b9c0c8d14865331012d3e~332x0.webp', 'picture/453.jpg', 'https://www.dongchedi.com/auto/series/2003');
INSERT INTO `item_xiangmu` VALUES (454, '奇点iM8', '暂无报价', '', '2024-01-01', '奇点汽车', 9547, '0', '********************车型总数：共1款车型********************车型级别：紧凑型MPV********************纯电续航里程km：********************充电时间h：-********************', 49547, 'https://p3.dcarimg.com/img/mosaic-legacy/bef700005022fd820e9a~332x0.webp', 'picture/454.jpg', 'https://www.dongchedi.com/auto/series/2902');
INSERT INTO `item_xiangmu` VALUES (455, '瑞驰EC72', '暂无报价', '', '2023-09-01', '瑞驰新能源', 9546, '0', '********************车型总数：共1款车型********************车型级别：微卡********************纯电续航里程km：********************充电时间h：-********************', 49546, 'https://p3.dcarimg.com/img/motor-img/85cefa24945edcfb9b577087443193bc~332x0.webp', 'picture/455.jpg', 'https://www.dongchedi.com/auto/series/5354');
INSERT INTO `item_xiangmu` VALUES (456, '双龙e-SIV', '暂无报价', '', '2024-01-01', '双龙汽车', 9545, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：450********************充电时间h：-********************', 49545, 'https://p3.dcarimg.com/img/mosaic-legacy/beef00013ce49054d72a~332x0.webp', 'picture/456.jpg', 'https://www.dongchedi.com/auto/series/2729');
INSERT INTO `item_xiangmu` VALUES (457, '圣达菲7 EV', '暂无报价', '', '2024-01-01', '华泰新能源', 9544, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：********************充电时间h：-********************', 49544, 'https://p3.dcarimg.com/img/mosaic-legacy/17674000019f88231b74c~332x0.webp', 'picture/457.jpg', 'https://www.dongchedi.com/auto/series/2899');
INSERT INTO `item_xiangmu` VALUES (458, 'E-MEHARI', '暂无报价', '', '2024-01-01', '雪铁龙(进口)', 9543, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：********************充电时间h：-********************', 49543, 'https://p3.dcarimg.com/img/motor-img/5e1940feaccf3c0ffca813e851ee6aa3~332x0.webp', 'picture/458.jpg', 'https://www.dongchedi.com/auto/series/2028');
INSERT INTO `item_xiangmu` VALUES (459, '圣达菲EV', '暂无报价', '', '2024-01-01', '华泰新能源', 9542, '0', '********************车型总数：共1款车型********************车型级别：紧凑型SUV********************纯电续航里程km：266********************充电时间h：慢充8小时********************', 49542, 'https://p3.dcarimg.com/img/mosaic-legacy/9b13000044782c0531ed~332x0.webp', 'picture/459.jpg', 'https://www.dongchedi.com/auto/series/1835');
INSERT INTO `item_xiangmu` VALUES (460, '智点F101微面', '暂无报价', '即将上市', '2024-01-01', '智点汽车', 9541, '0', '********************车型总数：共1款车型********************车型级别：微面********************纯电续航里程km：150********************充电时间h：慢充6小时********************', 49541, 'https://p3.dcarimg.com/img/motor-img/428974985a99ebf7478b5e52c7d663a1~332x0.webp', 'picture/460.jpg', 'https://www.dongchedi.com/auto/series/5397');
INSERT INTO `item_xiangmu` VALUES (461, '智点F101微卡', '暂无报价', '即将上市', '2024-01-01', '智点汽车', 9540, '0', '********************车型总数：共1款车型********************车型级别：微卡********************纯电续航里程km：100********************充电时间h：慢充3小时********************', 49540, 'https://p3.dcarimg.com/img/motor-img/b8f36d60dc1c7a9b5c0a4f39aa869735~332x0.webp', 'picture/461.jpg', 'https://www.dongchedi.com/auto/series/5398');
INSERT INTO `item_xiangmu` VALUES (462, '瑞迈EV', '暂无报价', '即将上市', '2024-01-01', '江西五十铃', 9539, '0', '********************车型总数：共1款车型********************车型级别：中型皮卡********************纯电续航里程km：320********************充电时间h：快充1小时慢充8.3小时********************', 49539, 'https://p3.dcarimg.com/img/mosaic-legacy/beef0000c8b6a7f337b8~332x0.webp', 'picture/462.jpg', 'https://www.dongchedi.com/auto/series/3140');
INSERT INTO `item_xiangmu` VALUES (463, '朋克啦啦', '暂无报价', '即将上市', '2024-01-01', '御捷新能源', 9538, '0', '********************车型总数：共1款车型********************车型级别：微型车********************纯电续航里程km：170********************充电时间h：慢充8小时********************', 49538, 'https://p3.dcarimg.com/img/motor-img/037eba72712598c6a37fa77586b31c1a~332x0.webp', 'picture/463.jpg', 'https://www.dongchedi.com/auto/series/4945');
INSERT INTO `item_xiangmu` VALUES (464, '智点K201', '暂无报价', '即将上市', '2024-01-01', '智点汽车', 9537, '0', '********************车型总数：共4款车型********************车型级别：中型皮卡********************纯电续航里程km：250********************充电时间h：快充0.8小时慢充8小时********************', 49537, 'https://p3.dcarimg.com/img/motor-img/729ff75c97d817d6030e01adb04d0d48~332x0.webp', 'picture/464.jpg', 'https://www.dongchedi.com/auto/series/5399');
INSERT INTO `item_xiangmu` VALUES (465, '风行T1 EV', '暂无报价', '即将上市', '2024-01-01', '东风风行', 9536, '0', '********************车型总数：共1款车型********************车型级别：小型SUV********************纯电续航里程km：271********************充电时间h：快充0.5小时慢充4小时********************', 49536, 'https://p3.dcarimg.com/img/motor-img/5e8a9ae23b6efed51f6570d63016d3ae~332x0.webp', 'picture/465.jpg', 'https://www.dongchedi.com/auto/series/3399');
INSERT INTO `item_xiangmu` VALUES (466, '思皓爱跑', '暂无报价', '即将上市', '2024-01-01', '江汽集团', 9535, '0', '********************车型总数：共6款车型********************车型级别：紧凑型车********************纯电续航里程km：460********************充电时间h：快充0.8小时慢充6.5小时********************', 49535, 'https://p3.dcarimg.com/img/motor-img/af5af7888ea7a514777bf379c4ceb31f~332x0.webp', 'picture/466.jpg', 'https://www.dongchedi.com/auto/series/5868');
INSERT INTO `item_xiangmu` VALUES (467, '风骏7 EV', '暂无报价', '即将上市', '2024-01-01', '长城汽车', 9534, '0', '********************车型总数：共2款车型********************车型级别：中型皮卡********************纯电续航里程km：300********************充电时间h：快充0.83小时慢充10.5小时********************', 49534, 'https://p3.dcarimg.com/img/motor-img/61541616bc445e94d72af661cacda958~332x0.webp', 'picture/467.jpg', 'https://www.dongchedi.com/auto/series/4139');
INSERT INTO `item_xiangmu` VALUES (468, '爱驰U6', '暂无报价', '即将上市', '2024-01-01', '爱驰汽车', 9533, '0', '********************车型总数：共3款车型********************车型级别：中型SUV********************纯电续航里程km：********************充电时间h：快充0.5小时慢充14.5小时********************', 49533, 'https://p3.dcarimg.com/img/motor-img/613f505971876116f26b80727ce3515a~332x0.webp', 'picture/468.jpg', 'https://www.dongchedi.com/auto/series/4464');
INSERT INTO `item_xiangmu` VALUES (469, '智行盒子BM-600', '暂无报价', '即将上市', '2024-01-01', '智行盒子', 9532, '0', '********************车型总数：共1款车型********************车型级别：大型MPV********************纯电续航里程km：600********************充电时间h：-********************', 49532, 'https://p3.dcarimg.com/img/motor-img/b0fef77517ea829b9ccf7ca758f07091~332x0.webp', 'picture/469.jpg', 'https://www.dongchedi.com/auto/series/5540');
INSERT INTO `item_xiangmu` VALUES (470, 'Cybertruck', '暂无报价', '即将上市', '2024-01-01', '特斯拉(进口)', 9531, '0', '********************车型总数：共3款车型********************车型级别：全尺寸皮卡********************纯电续航里程km：402********************充电时间h：-********************', 49531, 'https://p3.dcarimg.com/img/motor-img/7b39b4fa2ab1886aaf3df4454550a58e~332x0.webp', 'picture/470.jpg', 'https://www.dongchedi.com/auto/series/4306');
INSERT INTO `item_xiangmu` VALUES (471, 'Roadster', '暂无报价', '即将上市', '2024-01-01', '特斯拉(进口)', 9530, '0', '********************车型总数：共2款车型********************车型级别：跑车********************纯电续航里程km：1000********************充电时间h：-********************', 49530, 'https://p3.dcarimg.com/img/mosaic-legacy/bef10000dd22b88f8e09~332x0.webp', 'picture/471.jpg', 'https://www.dongchedi.com/auto/series/2339');

-- ----------------------------
-- Table structure for item_xiangmu_collect
-- ----------------------------
DROP TABLE IF EXISTS `item_xiangmu_collect`;
CREATE TABLE `item_xiangmu_collect`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `xiangmu_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `item_xiangmu_collect_xiangmu_id_user_id_6a986770_uniq`(`xiangmu_id`, `user_id`) USING BTREE,
  INDEX `item_xiangmu_collect_user_id_673f95c5_fk_item_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `item_xiangmu_collect_user_id_673f95c5_fk_item_user_id` FOREIGN KEY (`user_id`) REFERENCES `item_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_xiangmu_collect_xiangmu_id_a1d2a1c4_fk_item_xiangmu_id` FOREIGN KEY (`xiangmu_id`) REFERENCES `item_xiangmu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_xiangmu_collect
-- ----------------------------
INSERT INTO `item_xiangmu_collect` VALUES (3, 6, 2);
INSERT INTO `item_xiangmu_collect` VALUES (1, 7, 1);
INSERT INTO `item_xiangmu_collect` VALUES (2, 9, 1);
INSERT INTO `item_xiangmu_collect` VALUES (5, 17, 1);
INSERT INTO `item_xiangmu_collect` VALUES (8, 20, 1);
INSERT INTO `item_xiangmu_collect` VALUES (6, 162, 1);
INSERT INTO `item_xiangmu_collect` VALUES (7, 266, 1);

-- ----------------------------
-- Table structure for item_xiangmu_tags
-- ----------------------------
DROP TABLE IF EXISTS `item_xiangmu_tags`;
CREATE TABLE `item_xiangmu_tags`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `xiangmu_id` int(0) NOT NULL,
  `tags_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `item_xiangmu_tags_xiangmu_id_tags_id_8b64d436_uniq`(`xiangmu_id`, `tags_id`) USING BTREE,
  INDEX `item_xiangmu_tags_tags_id_aab19d6e_fk_item_tags_id`(`tags_id`) USING BTREE,
  CONSTRAINT `item_xiangmu_tags_tags_id_aab19d6e_fk_item_tags_id` FOREIGN KEY (`tags_id`) REFERENCES `item_tags` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_xiangmu_tags_xiangmu_id_7dab2cfa_fk_item_xiangmu_id` FOREIGN KEY (`xiangmu_id`) REFERENCES `item_xiangmu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item_xiangmu_tags
-- ----------------------------
INSERT INTO `item_xiangmu_tags` VALUES (1, 1, 1);
INSERT INTO `item_xiangmu_tags` VALUES (2, 2, 2);
INSERT INTO `item_xiangmu_tags` VALUES (3, 3, 3);
INSERT INTO `item_xiangmu_tags` VALUES (4, 4, 3);
INSERT INTO `item_xiangmu_tags` VALUES (5, 5, 2);
INSERT INTO `item_xiangmu_tags` VALUES (6, 6, 5);
INSERT INTO `item_xiangmu_tags` VALUES (7, 7, 2);
INSERT INTO `item_xiangmu_tags` VALUES (8, 8, 6);
INSERT INTO `item_xiangmu_tags` VALUES (9, 9, 53);
INSERT INTO `item_xiangmu_tags` VALUES (10, 10, 7);
INSERT INTO `item_xiangmu_tags` VALUES (11, 11, 8);
INSERT INTO `item_xiangmu_tags` VALUES (12, 12, 9);
INSERT INTO `item_xiangmu_tags` VALUES (13, 13, 2);
INSERT INTO `item_xiangmu_tags` VALUES (14, 14, 2);
INSERT INTO `item_xiangmu_tags` VALUES (15, 15, 8);
INSERT INTO `item_xiangmu_tags` VALUES (16, 16, 7);
INSERT INTO `item_xiangmu_tags` VALUES (17, 17, 10);
INSERT INTO `item_xiangmu_tags` VALUES (18, 18, 2);
INSERT INTO `item_xiangmu_tags` VALUES (19, 19, 2);
INSERT INTO `item_xiangmu_tags` VALUES (20, 20, 5);
INSERT INTO `item_xiangmu_tags` VALUES (21, 21, 11);
INSERT INTO `item_xiangmu_tags` VALUES (22, 22, 12);
INSERT INTO `item_xiangmu_tags` VALUES (23, 23, 13);
INSERT INTO `item_xiangmu_tags` VALUES (24, 24, 53);
INSERT INTO `item_xiangmu_tags` VALUES (25, 25, 14);
INSERT INTO `item_xiangmu_tags` VALUES (26, 26, 15);
INSERT INTO `item_xiangmu_tags` VALUES (27, 27, 10);
INSERT INTO `item_xiangmu_tags` VALUES (28, 28, 16);
INSERT INTO `item_xiangmu_tags` VALUES (29, 29, 53);
INSERT INTO `item_xiangmu_tags` VALUES (30, 30, 17);
INSERT INTO `item_xiangmu_tags` VALUES (31, 31, 18);
INSERT INTO `item_xiangmu_tags` VALUES (32, 32, 19);
INSERT INTO `item_xiangmu_tags` VALUES (33, 33, 13);
INSERT INTO `item_xiangmu_tags` VALUES (34, 34, 11);
INSERT INTO `item_xiangmu_tags` VALUES (35, 35, 2);
INSERT INTO `item_xiangmu_tags` VALUES (36, 36, 53);
INSERT INTO `item_xiangmu_tags` VALUES (37, 37, 18);
INSERT INTO `item_xiangmu_tags` VALUES (38, 38, 16);
INSERT INTO `item_xiangmu_tags` VALUES (39, 39, 2);
INSERT INTO `item_xiangmu_tags` VALUES (40, 40, 2);
INSERT INTO `item_xiangmu_tags` VALUES (41, 41, 18);
INSERT INTO `item_xiangmu_tags` VALUES (42, 42, 17);
INSERT INTO `item_xiangmu_tags` VALUES (43, 43, 53);
INSERT INTO `item_xiangmu_tags` VALUES (44, 44, 8);
INSERT INTO `item_xiangmu_tags` VALUES (45, 45, 17);
INSERT INTO `item_xiangmu_tags` VALUES (46, 46, 8);
INSERT INTO `item_xiangmu_tags` VALUES (47, 47, 2);
INSERT INTO `item_xiangmu_tags` VALUES (48, 48, 20);
INSERT INTO `item_xiangmu_tags` VALUES (49, 49, 1);
INSERT INTO `item_xiangmu_tags` VALUES (50, 50, 53);
INSERT INTO `item_xiangmu_tags` VALUES (51, 51, 22);
INSERT INTO `item_xiangmu_tags` VALUES (52, 52, 18);
INSERT INTO `item_xiangmu_tags` VALUES (53, 53, 19);
INSERT INTO `item_xiangmu_tags` VALUES (54, 54, 53);
INSERT INTO `item_xiangmu_tags` VALUES (55, 55, 5);
INSERT INTO `item_xiangmu_tags` VALUES (56, 56, 2);
INSERT INTO `item_xiangmu_tags` VALUES (57, 57, 53);
INSERT INTO `item_xiangmu_tags` VALUES (58, 58, 18);
INSERT INTO `item_xiangmu_tags` VALUES (59, 59, 23);
INSERT INTO `item_xiangmu_tags` VALUES (60, 60, 53);
INSERT INTO `item_xiangmu_tags` VALUES (61, 61, 53);
INSERT INTO `item_xiangmu_tags` VALUES (62, 62, 24);
INSERT INTO `item_xiangmu_tags` VALUES (63, 63, 25);
INSERT INTO `item_xiangmu_tags` VALUES (64, 64, 26);
INSERT INTO `item_xiangmu_tags` VALUES (65, 65, 27);
INSERT INTO `item_xiangmu_tags` VALUES (66, 66, 53);
INSERT INTO `item_xiangmu_tags` VALUES (67, 67, 28);
INSERT INTO `item_xiangmu_tags` VALUES (68, 68, 1);
INSERT INTO `item_xiangmu_tags` VALUES (69, 69, 2);
INSERT INTO `item_xiangmu_tags` VALUES (70, 70, 29);
INSERT INTO `item_xiangmu_tags` VALUES (71, 71, 53);
INSERT INTO `item_xiangmu_tags` VALUES (72, 72, 2);
INSERT INTO `item_xiangmu_tags` VALUES (73, 73, 30);
INSERT INTO `item_xiangmu_tags` VALUES (74, 74, 31);
INSERT INTO `item_xiangmu_tags` VALUES (75, 75, 32);
INSERT INTO `item_xiangmu_tags` VALUES (76, 76, 9);
INSERT INTO `item_xiangmu_tags` VALUES (77, 77, 53);
INSERT INTO `item_xiangmu_tags` VALUES (78, 78, 28);
INSERT INTO `item_xiangmu_tags` VALUES (79, 79, 19);
INSERT INTO `item_xiangmu_tags` VALUES (80, 80, 33);
INSERT INTO `item_xiangmu_tags` VALUES (81, 81, 22);
INSERT INTO `item_xiangmu_tags` VALUES (82, 82, 34);
INSERT INTO `item_xiangmu_tags` VALUES (83, 83, 35);
INSERT INTO `item_xiangmu_tags` VALUES (84, 84, 53);
INSERT INTO `item_xiangmu_tags` VALUES (85, 85, 36);
INSERT INTO `item_xiangmu_tags` VALUES (86, 86, 53);
INSERT INTO `item_xiangmu_tags` VALUES (87, 87, 2);
INSERT INTO `item_xiangmu_tags` VALUES (88, 88, 37);
INSERT INTO `item_xiangmu_tags` VALUES (89, 89, 6);
INSERT INTO `item_xiangmu_tags` VALUES (90, 90, 31);
INSERT INTO `item_xiangmu_tags` VALUES (91, 91, 24);
INSERT INTO `item_xiangmu_tags` VALUES (92, 92, 53);
INSERT INTO `item_xiangmu_tags` VALUES (93, 93, 38);
INSERT INTO `item_xiangmu_tags` VALUES (94, 94, 39);
INSERT INTO `item_xiangmu_tags` VALUES (95, 95, 10);
INSERT INTO `item_xiangmu_tags` VALUES (96, 96, 24);
INSERT INTO `item_xiangmu_tags` VALUES (97, 97, 28);
INSERT INTO `item_xiangmu_tags` VALUES (98, 98, 53);
INSERT INTO `item_xiangmu_tags` VALUES (99, 99, 17);
INSERT INTO `item_xiangmu_tags` VALUES (100, 100, 53);
INSERT INTO `item_xiangmu_tags` VALUES (101, 101, 53);
INSERT INTO `item_xiangmu_tags` VALUES (102, 102, 26);
INSERT INTO `item_xiangmu_tags` VALUES (103, 103, 20);
INSERT INTO `item_xiangmu_tags` VALUES (104, 104, 53);
INSERT INTO `item_xiangmu_tags` VALUES (105, 105, 53);
INSERT INTO `item_xiangmu_tags` VALUES (106, 106, 40);
INSERT INTO `item_xiangmu_tags` VALUES (107, 107, 13);
INSERT INTO `item_xiangmu_tags` VALUES (108, 108, 29);
INSERT INTO `item_xiangmu_tags` VALUES (109, 109, 41);
INSERT INTO `item_xiangmu_tags` VALUES (110, 110, 42);
INSERT INTO `item_xiangmu_tags` VALUES (111, 111, 24);
INSERT INTO `item_xiangmu_tags` VALUES (112, 112, 37);
INSERT INTO `item_xiangmu_tags` VALUES (113, 113, 43);
INSERT INTO `item_xiangmu_tags` VALUES (114, 114, 24);
INSERT INTO `item_xiangmu_tags` VALUES (115, 115, 53);
INSERT INTO `item_xiangmu_tags` VALUES (116, 116, 1);
INSERT INTO `item_xiangmu_tags` VALUES (117, 117, 42);
INSERT INTO `item_xiangmu_tags` VALUES (118, 118, 53);
INSERT INTO `item_xiangmu_tags` VALUES (119, 119, 22);
INSERT INTO `item_xiangmu_tags` VALUES (120, 120, 53);
INSERT INTO `item_xiangmu_tags` VALUES (121, 121, 44);
INSERT INTO `item_xiangmu_tags` VALUES (122, 122, 45);
INSERT INTO `item_xiangmu_tags` VALUES (123, 123, 46);
INSERT INTO `item_xiangmu_tags` VALUES (124, 124, 8);
INSERT INTO `item_xiangmu_tags` VALUES (125, 125, 38);
INSERT INTO `item_xiangmu_tags` VALUES (126, 126, 47);
INSERT INTO `item_xiangmu_tags` VALUES (127, 127, 53);
INSERT INTO `item_xiangmu_tags` VALUES (128, 128, 48);
INSERT INTO `item_xiangmu_tags` VALUES (129, 129, 49);
INSERT INTO `item_xiangmu_tags` VALUES (130, 130, 53);
INSERT INTO `item_xiangmu_tags` VALUES (131, 131, 50);
INSERT INTO `item_xiangmu_tags` VALUES (132, 132, 51);
INSERT INTO `item_xiangmu_tags` VALUES (133, 133, 53);
INSERT INTO `item_xiangmu_tags` VALUES (134, 134, 53);
INSERT INTO `item_xiangmu_tags` VALUES (135, 135, 52);
INSERT INTO `item_xiangmu_tags` VALUES (136, 136, 38);
INSERT INTO `item_xiangmu_tags` VALUES (137, 137, 53);
INSERT INTO `item_xiangmu_tags` VALUES (138, 138, 53);
INSERT INTO `item_xiangmu_tags` VALUES (139, 139, 53);
INSERT INTO `item_xiangmu_tags` VALUES (140, 140, 48);
INSERT INTO `item_xiangmu_tags` VALUES (141, 141, 6);
INSERT INTO `item_xiangmu_tags` VALUES (142, 142, 53);
INSERT INTO `item_xiangmu_tags` VALUES (143, 143, 9);
INSERT INTO `item_xiangmu_tags` VALUES (144, 144, 24);
INSERT INTO `item_xiangmu_tags` VALUES (145, 145, 53);
INSERT INTO `item_xiangmu_tags` VALUES (146, 146, 10);
INSERT INTO `item_xiangmu_tags` VALUES (147, 147, 47);
INSERT INTO `item_xiangmu_tags` VALUES (148, 148, 6);
INSERT INTO `item_xiangmu_tags` VALUES (149, 149, 53);
INSERT INTO `item_xiangmu_tags` VALUES (150, 150, 9);
INSERT INTO `item_xiangmu_tags` VALUES (151, 151, 53);
INSERT INTO `item_xiangmu_tags` VALUES (152, 152, 53);
INSERT INTO `item_xiangmu_tags` VALUES (153, 153, 53);
INSERT INTO `item_xiangmu_tags` VALUES (154, 154, 53);
INSERT INTO `item_xiangmu_tags` VALUES (155, 155, 53);
INSERT INTO `item_xiangmu_tags` VALUES (156, 156, 53);
INSERT INTO `item_xiangmu_tags` VALUES (157, 157, 53);
INSERT INTO `item_xiangmu_tags` VALUES (158, 158, 47);
INSERT INTO `item_xiangmu_tags` VALUES (159, 159, 42);
INSERT INTO `item_xiangmu_tags` VALUES (160, 160, 53);
INSERT INTO `item_xiangmu_tags` VALUES (161, 161, 53);
INSERT INTO `item_xiangmu_tags` VALUES (162, 162, 34);
INSERT INTO `item_xiangmu_tags` VALUES (163, 163, 41);
INSERT INTO `item_xiangmu_tags` VALUES (164, 164, 53);
INSERT INTO `item_xiangmu_tags` VALUES (165, 165, 11);
INSERT INTO `item_xiangmu_tags` VALUES (166, 166, 10);
INSERT INTO `item_xiangmu_tags` VALUES (167, 167, 53);
INSERT INTO `item_xiangmu_tags` VALUES (168, 168, 53);
INSERT INTO `item_xiangmu_tags` VALUES (169, 169, 53);
INSERT INTO `item_xiangmu_tags` VALUES (170, 170, 49);
INSERT INTO `item_xiangmu_tags` VALUES (171, 171, 10);
INSERT INTO `item_xiangmu_tags` VALUES (172, 172, 53);
INSERT INTO `item_xiangmu_tags` VALUES (173, 173, 53);
INSERT INTO `item_xiangmu_tags` VALUES (174, 174, 53);
INSERT INTO `item_xiangmu_tags` VALUES (175, 175, 48);
INSERT INTO `item_xiangmu_tags` VALUES (176, 176, 53);
INSERT INTO `item_xiangmu_tags` VALUES (177, 177, 53);
INSERT INTO `item_xiangmu_tags` VALUES (178, 178, 53);
INSERT INTO `item_xiangmu_tags` VALUES (179, 179, 53);
INSERT INTO `item_xiangmu_tags` VALUES (180, 180, 32);
INSERT INTO `item_xiangmu_tags` VALUES (181, 181, 27);
INSERT INTO `item_xiangmu_tags` VALUES (182, 182, 53);
INSERT INTO `item_xiangmu_tags` VALUES (183, 183, 53);
INSERT INTO `item_xiangmu_tags` VALUES (184, 184, 34);
INSERT INTO `item_xiangmu_tags` VALUES (185, 185, 53);
INSERT INTO `item_xiangmu_tags` VALUES (186, 186, 49);
INSERT INTO `item_xiangmu_tags` VALUES (187, 187, 53);
INSERT INTO `item_xiangmu_tags` VALUES (188, 188, 50);
INSERT INTO `item_xiangmu_tags` VALUES (189, 189, 53);
INSERT INTO `item_xiangmu_tags` VALUES (190, 190, 34);
INSERT INTO `item_xiangmu_tags` VALUES (191, 191, 53);
INSERT INTO `item_xiangmu_tags` VALUES (192, 192, 46);
INSERT INTO `item_xiangmu_tags` VALUES (193, 193, 53);
INSERT INTO `item_xiangmu_tags` VALUES (194, 194, 47);
INSERT INTO `item_xiangmu_tags` VALUES (195, 195, 27);
INSERT INTO `item_xiangmu_tags` VALUES (196, 196, 47);
INSERT INTO `item_xiangmu_tags` VALUES (197, 197, 53);
INSERT INTO `item_xiangmu_tags` VALUES (198, 198, 53);
INSERT INTO `item_xiangmu_tags` VALUES (199, 199, 53);
INSERT INTO `item_xiangmu_tags` VALUES (200, 200, 53);
INSERT INTO `item_xiangmu_tags` VALUES (201, 201, 53);
INSERT INTO `item_xiangmu_tags` VALUES (202, 202, 53);
INSERT INTO `item_xiangmu_tags` VALUES (203, 203, 53);
INSERT INTO `item_xiangmu_tags` VALUES (204, 204, 39);
INSERT INTO `item_xiangmu_tags` VALUES (205, 205, 53);
INSERT INTO `item_xiangmu_tags` VALUES (206, 206, 53);
INSERT INTO `item_xiangmu_tags` VALUES (207, 207, 5);
INSERT INTO `item_xiangmu_tags` VALUES (208, 208, 53);
INSERT INTO `item_xiangmu_tags` VALUES (209, 209, 53);
INSERT INTO `item_xiangmu_tags` VALUES (210, 210, 53);
INSERT INTO `item_xiangmu_tags` VALUES (211, 211, 53);
INSERT INTO `item_xiangmu_tags` VALUES (212, 212, 53);
INSERT INTO `item_xiangmu_tags` VALUES (213, 213, 53);
INSERT INTO `item_xiangmu_tags` VALUES (214, 214, 9);
INSERT INTO `item_xiangmu_tags` VALUES (215, 215, 49);
INSERT INTO `item_xiangmu_tags` VALUES (216, 216, 53);
INSERT INTO `item_xiangmu_tags` VALUES (217, 217, 53);
INSERT INTO `item_xiangmu_tags` VALUES (218, 218, 46);
INSERT INTO `item_xiangmu_tags` VALUES (219, 219, 53);
INSERT INTO `item_xiangmu_tags` VALUES (220, 220, 53);
INSERT INTO `item_xiangmu_tags` VALUES (221, 221, 53);
INSERT INTO `item_xiangmu_tags` VALUES (222, 222, 2);
INSERT INTO `item_xiangmu_tags` VALUES (223, 223, 2);
INSERT INTO `item_xiangmu_tags` VALUES (224, 224, 22);
INSERT INTO `item_xiangmu_tags` VALUES (225, 225, 53);
INSERT INTO `item_xiangmu_tags` VALUES (226, 226, 53);
INSERT INTO `item_xiangmu_tags` VALUES (227, 227, 53);
INSERT INTO `item_xiangmu_tags` VALUES (228, 228, 53);
INSERT INTO `item_xiangmu_tags` VALUES (229, 229, 53);
INSERT INTO `item_xiangmu_tags` VALUES (230, 230, 53);
INSERT INTO `item_xiangmu_tags` VALUES (231, 231, 53);
INSERT INTO `item_xiangmu_tags` VALUES (232, 232, 46);
INSERT INTO `item_xiangmu_tags` VALUES (233, 233, 53);
INSERT INTO `item_xiangmu_tags` VALUES (234, 234, 53);
INSERT INTO `item_xiangmu_tags` VALUES (235, 235, 53);
INSERT INTO `item_xiangmu_tags` VALUES (236, 236, 53);
INSERT INTO `item_xiangmu_tags` VALUES (237, 237, 53);
INSERT INTO `item_xiangmu_tags` VALUES (238, 238, 53);
INSERT INTO `item_xiangmu_tags` VALUES (239, 239, 53);
INSERT INTO `item_xiangmu_tags` VALUES (240, 240, 46);
INSERT INTO `item_xiangmu_tags` VALUES (241, 241, 53);
INSERT INTO `item_xiangmu_tags` VALUES (242, 242, 53);
INSERT INTO `item_xiangmu_tags` VALUES (243, 243, 53);
INSERT INTO `item_xiangmu_tags` VALUES (244, 244, 52);
INSERT INTO `item_xiangmu_tags` VALUES (245, 245, 24);
INSERT INTO `item_xiangmu_tags` VALUES (246, 246, 53);
INSERT INTO `item_xiangmu_tags` VALUES (247, 247, 53);
INSERT INTO `item_xiangmu_tags` VALUES (248, 248, 53);
INSERT INTO `item_xiangmu_tags` VALUES (249, 249, 49);
INSERT INTO `item_xiangmu_tags` VALUES (250, 250, 53);
INSERT INTO `item_xiangmu_tags` VALUES (251, 251, 47);
INSERT INTO `item_xiangmu_tags` VALUES (252, 252, 7);
INSERT INTO `item_xiangmu_tags` VALUES (253, 253, 46);
INSERT INTO `item_xiangmu_tags` VALUES (254, 254, 14);
INSERT INTO `item_xiangmu_tags` VALUES (255, 255, 53);
INSERT INTO `item_xiangmu_tags` VALUES (256, 256, 53);
INSERT INTO `item_xiangmu_tags` VALUES (257, 257, 53);
INSERT INTO `item_xiangmu_tags` VALUES (258, 258, 18);
INSERT INTO `item_xiangmu_tags` VALUES (259, 259, 53);
INSERT INTO `item_xiangmu_tags` VALUES (260, 260, 53);
INSERT INTO `item_xiangmu_tags` VALUES (261, 261, 53);
INSERT INTO `item_xiangmu_tags` VALUES (262, 262, 53);
INSERT INTO `item_xiangmu_tags` VALUES (263, 263, 53);
INSERT INTO `item_xiangmu_tags` VALUES (264, 264, 53);
INSERT INTO `item_xiangmu_tags` VALUES (265, 265, 53);
INSERT INTO `item_xiangmu_tags` VALUES (266, 266, 53);
INSERT INTO `item_xiangmu_tags` VALUES (267, 267, 53);
INSERT INTO `item_xiangmu_tags` VALUES (268, 268, 53);
INSERT INTO `item_xiangmu_tags` VALUES (269, 269, 53);
INSERT INTO `item_xiangmu_tags` VALUES (270, 270, 53);
INSERT INTO `item_xiangmu_tags` VALUES (271, 271, 53);
INSERT INTO `item_xiangmu_tags` VALUES (272, 272, 47);
INSERT INTO `item_xiangmu_tags` VALUES (273, 273, 53);
INSERT INTO `item_xiangmu_tags` VALUES (274, 274, 12);
INSERT INTO `item_xiangmu_tags` VALUES (275, 275, 53);
INSERT INTO `item_xiangmu_tags` VALUES (276, 276, 53);
INSERT INTO `item_xiangmu_tags` VALUES (277, 277, 22);
INSERT INTO `item_xiangmu_tags` VALUES (278, 278, 53);
INSERT INTO `item_xiangmu_tags` VALUES (279, 279, 53);
INSERT INTO `item_xiangmu_tags` VALUES (280, 280, 53);
INSERT INTO `item_xiangmu_tags` VALUES (281, 281, 53);
INSERT INTO `item_xiangmu_tags` VALUES (282, 282, 53);
INSERT INTO `item_xiangmu_tags` VALUES (283, 283, 53);
INSERT INTO `item_xiangmu_tags` VALUES (284, 284, 53);
INSERT INTO `item_xiangmu_tags` VALUES (285, 285, 53);
INSERT INTO `item_xiangmu_tags` VALUES (286, 286, 53);
INSERT INTO `item_xiangmu_tags` VALUES (287, 287, 53);
INSERT INTO `item_xiangmu_tags` VALUES (288, 288, 26);
INSERT INTO `item_xiangmu_tags` VALUES (289, 289, 53);
INSERT INTO `item_xiangmu_tags` VALUES (290, 290, 53);
INSERT INTO `item_xiangmu_tags` VALUES (291, 291, 53);
INSERT INTO `item_xiangmu_tags` VALUES (292, 292, 53);
INSERT INTO `item_xiangmu_tags` VALUES (293, 293, 24);
INSERT INTO `item_xiangmu_tags` VALUES (294, 294, 53);
INSERT INTO `item_xiangmu_tags` VALUES (295, 295, 53);
INSERT INTO `item_xiangmu_tags` VALUES (296, 296, 53);
INSERT INTO `item_xiangmu_tags` VALUES (297, 297, 53);
INSERT INTO `item_xiangmu_tags` VALUES (298, 298, 53);
INSERT INTO `item_xiangmu_tags` VALUES (299, 299, 53);
INSERT INTO `item_xiangmu_tags` VALUES (300, 300, 53);
INSERT INTO `item_xiangmu_tags` VALUES (301, 301, 53);
INSERT INTO `item_xiangmu_tags` VALUES (302, 302, 53);
INSERT INTO `item_xiangmu_tags` VALUES (303, 303, 53);
INSERT INTO `item_xiangmu_tags` VALUES (304, 304, 22);
INSERT INTO `item_xiangmu_tags` VALUES (305, 305, 53);
INSERT INTO `item_xiangmu_tags` VALUES (306, 306, 53);
INSERT INTO `item_xiangmu_tags` VALUES (307, 307, 53);
INSERT INTO `item_xiangmu_tags` VALUES (308, 308, 53);
INSERT INTO `item_xiangmu_tags` VALUES (309, 309, 53);
INSERT INTO `item_xiangmu_tags` VALUES (310, 310, 53);
INSERT INTO `item_xiangmu_tags` VALUES (311, 311, 53);
INSERT INTO `item_xiangmu_tags` VALUES (312, 312, 53);
INSERT INTO `item_xiangmu_tags` VALUES (313, 313, 53);
INSERT INTO `item_xiangmu_tags` VALUES (314, 314, 53);
INSERT INTO `item_xiangmu_tags` VALUES (315, 315, 6);
INSERT INTO `item_xiangmu_tags` VALUES (316, 316, 53);
INSERT INTO `item_xiangmu_tags` VALUES (317, 317, 9);
INSERT INTO `item_xiangmu_tags` VALUES (318, 318, 53);
INSERT INTO `item_xiangmu_tags` VALUES (319, 319, 53);
INSERT INTO `item_xiangmu_tags` VALUES (320, 320, 53);
INSERT INTO `item_xiangmu_tags` VALUES (321, 321, 7);
INSERT INTO `item_xiangmu_tags` VALUES (322, 322, 53);
INSERT INTO `item_xiangmu_tags` VALUES (323, 323, 53);
INSERT INTO `item_xiangmu_tags` VALUES (324, 324, 53);
INSERT INTO `item_xiangmu_tags` VALUES (325, 325, 53);
INSERT INTO `item_xiangmu_tags` VALUES (326, 326, 53);
INSERT INTO `item_xiangmu_tags` VALUES (327, 327, 53);
INSERT INTO `item_xiangmu_tags` VALUES (328, 328, 26);
INSERT INTO `item_xiangmu_tags` VALUES (329, 329, 53);
INSERT INTO `item_xiangmu_tags` VALUES (330, 330, 12);
INSERT INTO `item_xiangmu_tags` VALUES (331, 331, 53);
INSERT INTO `item_xiangmu_tags` VALUES (332, 332, 53);
INSERT INTO `item_xiangmu_tags` VALUES (333, 333, 53);
INSERT INTO `item_xiangmu_tags` VALUES (334, 334, 53);
INSERT INTO `item_xiangmu_tags` VALUES (335, 335, 22);
INSERT INTO `item_xiangmu_tags` VALUES (336, 336, 53);
INSERT INTO `item_xiangmu_tags` VALUES (337, 337, 43);
INSERT INTO `item_xiangmu_tags` VALUES (338, 338, 22);
INSERT INTO `item_xiangmu_tags` VALUES (339, 339, 53);
INSERT INTO `item_xiangmu_tags` VALUES (340, 340, 53);
INSERT INTO `item_xiangmu_tags` VALUES (341, 341, 53);
INSERT INTO `item_xiangmu_tags` VALUES (342, 342, 20);
INSERT INTO `item_xiangmu_tags` VALUES (343, 343, 53);
INSERT INTO `item_xiangmu_tags` VALUES (344, 344, 53);
INSERT INTO `item_xiangmu_tags` VALUES (345, 345, 53);
INSERT INTO `item_xiangmu_tags` VALUES (346, 346, 53);
INSERT INTO `item_xiangmu_tags` VALUES (347, 347, 53);
INSERT INTO `item_xiangmu_tags` VALUES (348, 348, 43);
INSERT INTO `item_xiangmu_tags` VALUES (349, 349, 53);
INSERT INTO `item_xiangmu_tags` VALUES (350, 350, 53);
INSERT INTO `item_xiangmu_tags` VALUES (351, 351, 53);
INSERT INTO `item_xiangmu_tags` VALUES (352, 352, 53);
INSERT INTO `item_xiangmu_tags` VALUES (353, 353, 52);
INSERT INTO `item_xiangmu_tags` VALUES (354, 354, 53);
INSERT INTO `item_xiangmu_tags` VALUES (355, 355, 53);
INSERT INTO `item_xiangmu_tags` VALUES (356, 356, 53);
INSERT INTO `item_xiangmu_tags` VALUES (357, 357, 53);
INSERT INTO `item_xiangmu_tags` VALUES (358, 358, 53);
INSERT INTO `item_xiangmu_tags` VALUES (359, 359, 53);
INSERT INTO `item_xiangmu_tags` VALUES (360, 360, 53);
INSERT INTO `item_xiangmu_tags` VALUES (361, 361, 53);
INSERT INTO `item_xiangmu_tags` VALUES (362, 362, 53);
INSERT INTO `item_xiangmu_tags` VALUES (363, 363, 53);
INSERT INTO `item_xiangmu_tags` VALUES (364, 364, 53);
INSERT INTO `item_xiangmu_tags` VALUES (365, 365, 53);
INSERT INTO `item_xiangmu_tags` VALUES (366, 366, 52);
INSERT INTO `item_xiangmu_tags` VALUES (367, 367, 53);
INSERT INTO `item_xiangmu_tags` VALUES (368, 368, 53);
INSERT INTO `item_xiangmu_tags` VALUES (369, 369, 53);
INSERT INTO `item_xiangmu_tags` VALUES (370, 370, 53);
INSERT INTO `item_xiangmu_tags` VALUES (371, 371, 53);
INSERT INTO `item_xiangmu_tags` VALUES (372, 372, 53);
INSERT INTO `item_xiangmu_tags` VALUES (373, 373, 53);
INSERT INTO `item_xiangmu_tags` VALUES (374, 374, 53);
INSERT INTO `item_xiangmu_tags` VALUES (375, 375, 53);
INSERT INTO `item_xiangmu_tags` VALUES (376, 376, 53);
INSERT INTO `item_xiangmu_tags` VALUES (377, 377, 53);
INSERT INTO `item_xiangmu_tags` VALUES (378, 378, 53);
INSERT INTO `item_xiangmu_tags` VALUES (379, 379, 53);
INSERT INTO `item_xiangmu_tags` VALUES (380, 380, 53);
INSERT INTO `item_xiangmu_tags` VALUES (381, 381, 53);
INSERT INTO `item_xiangmu_tags` VALUES (382, 382, 53);
INSERT INTO `item_xiangmu_tags` VALUES (383, 383, 53);
INSERT INTO `item_xiangmu_tags` VALUES (384, 384, 53);
INSERT INTO `item_xiangmu_tags` VALUES (385, 385, 46);
INSERT INTO `item_xiangmu_tags` VALUES (386, 386, 53);
INSERT INTO `item_xiangmu_tags` VALUES (387, 387, 53);
INSERT INTO `item_xiangmu_tags` VALUES (388, 388, 53);
INSERT INTO `item_xiangmu_tags` VALUES (389, 389, 53);
INSERT INTO `item_xiangmu_tags` VALUES (390, 390, 53);
INSERT INTO `item_xiangmu_tags` VALUES (391, 391, 22);
INSERT INTO `item_xiangmu_tags` VALUES (392, 392, 53);
INSERT INTO `item_xiangmu_tags` VALUES (393, 393, 53);
INSERT INTO `item_xiangmu_tags` VALUES (394, 394, 53);
INSERT INTO `item_xiangmu_tags` VALUES (395, 395, 53);
INSERT INTO `item_xiangmu_tags` VALUES (396, 396, 53);
INSERT INTO `item_xiangmu_tags` VALUES (397, 397, 53);
INSERT INTO `item_xiangmu_tags` VALUES (398, 398, 53);
INSERT INTO `item_xiangmu_tags` VALUES (399, 399, 53);
INSERT INTO `item_xiangmu_tags` VALUES (400, 400, 53);
INSERT INTO `item_xiangmu_tags` VALUES (401, 401, 53);
INSERT INTO `item_xiangmu_tags` VALUES (402, 402, 53);
INSERT INTO `item_xiangmu_tags` VALUES (403, 403, 53);
INSERT INTO `item_xiangmu_tags` VALUES (404, 404, 53);
INSERT INTO `item_xiangmu_tags` VALUES (405, 405, 26);
INSERT INTO `item_xiangmu_tags` VALUES (406, 406, 53);
INSERT INTO `item_xiangmu_tags` VALUES (407, 407, 53);
INSERT INTO `item_xiangmu_tags` VALUES (408, 408, 53);
INSERT INTO `item_xiangmu_tags` VALUES (409, 409, 53);
INSERT INTO `item_xiangmu_tags` VALUES (410, 410, 53);
INSERT INTO `item_xiangmu_tags` VALUES (411, 411, 53);
INSERT INTO `item_xiangmu_tags` VALUES (412, 412, 53);
INSERT INTO `item_xiangmu_tags` VALUES (413, 413, 47);
INSERT INTO `item_xiangmu_tags` VALUES (414, 414, 53);
INSERT INTO `item_xiangmu_tags` VALUES (415, 415, 22);
INSERT INTO `item_xiangmu_tags` VALUES (416, 416, 53);
INSERT INTO `item_xiangmu_tags` VALUES (417, 417, 46);
INSERT INTO `item_xiangmu_tags` VALUES (418, 418, 53);
INSERT INTO `item_xiangmu_tags` VALUES (419, 419, 53);
INSERT INTO `item_xiangmu_tags` VALUES (420, 420, 53);
INSERT INTO `item_xiangmu_tags` VALUES (421, 421, 53);
INSERT INTO `item_xiangmu_tags` VALUES (422, 422, 53);
INSERT INTO `item_xiangmu_tags` VALUES (423, 423, 35);
INSERT INTO `item_xiangmu_tags` VALUES (424, 424, 53);
INSERT INTO `item_xiangmu_tags` VALUES (425, 425, 53);
INSERT INTO `item_xiangmu_tags` VALUES (426, 426, 49);
INSERT INTO `item_xiangmu_tags` VALUES (427, 427, 53);
INSERT INTO `item_xiangmu_tags` VALUES (428, 428, 53);
INSERT INTO `item_xiangmu_tags` VALUES (429, 429, 53);
INSERT INTO `item_xiangmu_tags` VALUES (430, 430, 53);
INSERT INTO `item_xiangmu_tags` VALUES (431, 431, 53);
INSERT INTO `item_xiangmu_tags` VALUES (432, 432, 53);
INSERT INTO `item_xiangmu_tags` VALUES (433, 433, 53);
INSERT INTO `item_xiangmu_tags` VALUES (434, 434, 53);
INSERT INTO `item_xiangmu_tags` VALUES (435, 435, 53);
INSERT INTO `item_xiangmu_tags` VALUES (436, 436, 53);
INSERT INTO `item_xiangmu_tags` VALUES (437, 437, 53);
INSERT INTO `item_xiangmu_tags` VALUES (438, 438, 53);
INSERT INTO `item_xiangmu_tags` VALUES (439, 439, 53);
INSERT INTO `item_xiangmu_tags` VALUES (440, 440, 53);
INSERT INTO `item_xiangmu_tags` VALUES (441, 441, 53);
INSERT INTO `item_xiangmu_tags` VALUES (442, 442, 53);
INSERT INTO `item_xiangmu_tags` VALUES (443, 443, 53);
INSERT INTO `item_xiangmu_tags` VALUES (444, 444, 53);
INSERT INTO `item_xiangmu_tags` VALUES (445, 445, 53);
INSERT INTO `item_xiangmu_tags` VALUES (446, 446, 53);
INSERT INTO `item_xiangmu_tags` VALUES (447, 447, 53);
INSERT INTO `item_xiangmu_tags` VALUES (448, 448, 53);
INSERT INTO `item_xiangmu_tags` VALUES (449, 449, 53);
INSERT INTO `item_xiangmu_tags` VALUES (450, 450, 53);
INSERT INTO `item_xiangmu_tags` VALUES (451, 451, 53);
INSERT INTO `item_xiangmu_tags` VALUES (452, 452, 53);
INSERT INTO `item_xiangmu_tags` VALUES (453, 453, 53);
INSERT INTO `item_xiangmu_tags` VALUES (454, 454, 53);
INSERT INTO `item_xiangmu_tags` VALUES (455, 455, 53);
INSERT INTO `item_xiangmu_tags` VALUES (456, 456, 53);
INSERT INTO `item_xiangmu_tags` VALUES (457, 457, 53);
INSERT INTO `item_xiangmu_tags` VALUES (458, 458, 53);
INSERT INTO `item_xiangmu_tags` VALUES (459, 459, 53);
INSERT INTO `item_xiangmu_tags` VALUES (460, 460, 53);
INSERT INTO `item_xiangmu_tags` VALUES (461, 461, 53);
INSERT INTO `item_xiangmu_tags` VALUES (462, 462, 53);
INSERT INTO `item_xiangmu_tags` VALUES (463, 463, 53);
INSERT INTO `item_xiangmu_tags` VALUES (464, 464, 53);
INSERT INTO `item_xiangmu_tags` VALUES (465, 465, 53);
INSERT INTO `item_xiangmu_tags` VALUES (466, 466, 27);
INSERT INTO `item_xiangmu_tags` VALUES (467, 467, 9);
INSERT INTO `item_xiangmu_tags` VALUES (468, 468, 45);
INSERT INTO `item_xiangmu_tags` VALUES (469, 469, 53);
INSERT INTO `item_xiangmu_tags` VALUES (470, 470, 11);
INSERT INTO `item_xiangmu_tags` VALUES (471, 471, 11);

SET FOREIGN_KEY_CHECKS = 1;
