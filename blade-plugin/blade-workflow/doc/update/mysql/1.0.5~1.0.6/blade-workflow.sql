SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blade_wf_form_default_values
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_form_default_values`;
CREATE TABLE `blade_wf_form_default_values` (
                                                `id` bigint(64) NOT NULL,
                                                `name` varchar(255) DEFAULT NULL COMMENT '名称',
                                                `content` varchar(255) DEFAULT NULL COMMENT '内容',
                                                `field_type` varchar(255) DEFAULT NULL COMMENT '字段类型',
                                                `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
                                                `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
                                                `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
                                                `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                                `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
                                                `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
                                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程表单字段默认值';

-- ----------------------------
-- Records of blade_wf_form_default_values
-- ----------------------------
BEGIN;
INSERT INTO `blade_wf_form_default_values` VALUES (1399346112331087873, '当前操作人姓名', '${this.$store.getters.userInfo.nick_name}', 'input', 1123598821738675201, 1123598813738675201, '2021-05-31 20:44:46', 1123598821738675201, '2021-05-31 20:56:32', '1', 0);
INSERT INTO `blade_wf_form_default_values` VALUES (1399347906465595393, '当前操作人部门', '${this.$store.getters.userInfo.dept_name}', 'input', 1123598821738675201, 1123598813738675201, '2021-05-31 20:51:54', 1123598821738675201, '2021-05-31 20:56:41', '1', 0);
INSERT INTO `blade_wf_form_default_values` VALUES (1399717069960855553, '当前日期', '${this.dateFormat(new Date(),\"yyyy-MM-dd\")}', 'input', 1123598821738675201, 1123598813738675201, '2021-06-01 21:18:50', 1123598821738675201, '2021-06-01 21:34:25', '1', 0);
INSERT INTO `blade_wf_form_default_values` VALUES (1399717187904684034, '当前操作人职位', '${this.$store.getters.userInfo.post_name}', 'input', 1123598821738675201, 1123598813738675201, '2021-06-01 21:19:18', 1123598821738675201, '2021-06-01 21:19:18', '1', 0);
INSERT INTO `blade_wf_form_default_values` VALUES (1399717285564858369, '当前时间', '${this.dateFormat(new Date(),\"hh:mm:ss\")}', 'input', 1123598821738675201, 1123598813738675201, '2021-06-01 21:19:41', 1123598821738675201, '2021-06-01 21:34:34', '1', 0);
INSERT INTO `blade_wf_form_default_values` VALUES (1399718803940655106, '当前操作人姓名和日期', '${this.$store.getters.userInfo.nick_name} - ${this.dateFormat(new Date(),\"yyyy-MM-dd\")}', 'input', 1123598821738675201, 1123598813738675201, '2021-06-01 21:25:43', 1123598821738675201, '2021-06-01 21:34:40', '1', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
