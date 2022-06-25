SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blade_wf_serial
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_serial`;
CREATE TABLE `blade_wf_serial` (
                                   `id` bigint(64) NOT NULL,
                                   `deployment_id` varchar(255) DEFAULT NULL COMMENT '部署id',
                                   `name` varchar(255) DEFAULT NULL COMMENT '名称',
                                   `prefix` varchar(255) DEFAULT NULL COMMENT '前缀',
                                   `date_format` varchar(255) DEFAULT NULL COMMENT '日期格式化',
                                   `suffix_length` int(11) DEFAULT NULL COMMENT '后缀位数',
                                   `start_sequence` int(11) DEFAULT NULL COMMENT '初始数值',
                                   `connector` varchar(255) DEFAULT NULL COMMENT '连接符',
                                   `sequence` int(11) DEFAULT NULL COMMENT '当前序列',
                                   `cycle` varchar(255) DEFAULT NULL COMMENT '重置周期 none不重置 day天 week周 month月 year年',
                                   `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
                                   `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
                                   `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                   `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
                                   `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                   `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
                                   `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
                                   PRIMARY KEY (`id`),
                                   UNIQUE KEY `uni` (`deployment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程流水号';

SET FOREIGN_KEY_CHECKS = 1;
