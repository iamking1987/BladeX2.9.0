/*
 Navicat Premium Data Transfer

 Source Server         : mysql_localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : bladex_boot

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 24/05/2019 13:55:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blade_oss
-- ----------------------------
DROP TABLE IF EXISTS `blade_oss`;
CREATE TABLE `blade_oss`  (
`id` bigint(64) NOT NULL COMMENT '主键',
`tenant_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '租户编号',
`category` int(2) NULL DEFAULT NULL COMMENT '分类',
`endpoint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源地址',
`access_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'accessKey',
`secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'secretKey',
`bucket_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '空间名',
`remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
`create_user` bigint(64) NULL DEFAULT NULL COMMENT '创建人',
`create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
`update_user` bigint(64) NULL DEFAULT NULL COMMENT '修改人',
`update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
`status` int(2) NULL DEFAULT NULL COMMENT '状态',
`is_deleted` int(2) NULL DEFAULT 0 COMMENT '是否已删除',
PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;


-- ----------------------------
-- 菜单数据
-- ----------------------------
INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`) VALUES (1123598815738675298, 0, 'resource', '资源管理', 'menu', '/resource', 'bg-colors', 6, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`) VALUES (1123598815738675299, 1123598815738675298, 'oss', '对象存储', 'menu', '/resource/oss', NULL, 1, 1, 0, 1, NULL, 0);
INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`) VALUES (1123598815738675301, 1123598815738675299, 'oss_add', '新增', 'add', '/resource/oss/add', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`) VALUES (1123598815738675302, 1123598815738675299, 'oss_edit', '修改', 'edit', '/resource/oss/edit', 'form', 2, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`) VALUES (1123598815738675303, 1123598815738675299, 'oss_delete', '删除', 'delete', '/api/blade-resource/oss/remove', 'delete', 3, 2, 3, 3, NULL, 0);
INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`) VALUES (1123598815738675304, 1123598815738675299, 'oss_view', '查看', 'view', '/resource/oss/view', 'file-text', 4, 2, 2, 2, NULL, 0);
INSERT INTO `blade_menu`(`id`, `parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`) VALUES (1123598815738675305, 1123598815738675299, 'oss_enable', '启用', 'enable', '/api/blade-resource/oss/enable', 'key', 5, 2, 2, 2, NULL, 0);

-- ----------------------------
-- 字典数据
-- ----------------------------
INSERT INTO `blade_dict`(`id`, `parent_id`, `code`, `dict_key`, `dict_value`, `sort`, `remark`, `is_deleted`) VALUES (1123598814738675224, 0, 'oss', -1, '对象存储类型', 6, NULL, 0);
INSERT INTO `blade_dict`(`id`, `parent_id`, `code`, `dict_key`, `dict_value`, `sort`, `remark`, `is_deleted`) VALUES (1123598814738675225, 1123598814738675224, 'oss', 1, 'minio', 1, NULL, 0);
INSERT INTO `blade_dict`(`id`, `parent_id`, `code`, `dict_key`, `dict_value`, `sort`, `remark`, `is_deleted`) VALUES (1123598814738675226, 1123598814738675224, 'oss', 2, 'qiniu', 2, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;


