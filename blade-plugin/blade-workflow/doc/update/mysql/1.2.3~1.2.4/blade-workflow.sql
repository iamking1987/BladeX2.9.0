SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blade_wf_draft
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_draft`;
CREATE TABLE `blade_wf_draft` (
                                  `id` bigint(64) NOT NULL,
                                  `user_id` bigint(64) DEFAULT NULL COMMENT '用户id',
                                  `form_key` varchar(255) DEFAULT NULL COMMENT '表单key',
                                  `process_def_id` varchar(255) DEFAULT NULL COMMENT '流程定义id',
                                  `variables` text COMMENT '表单变量',
                                  `platform` varchar(255) DEFAULT NULL COMMENT '平台 pc/app',
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `WF_IDX_DRAFT_UNI` (`user_id`,`process_def_id`,`platform`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程草稿箱';

SET FOREIGN_KEY_CHECKS = 1;
