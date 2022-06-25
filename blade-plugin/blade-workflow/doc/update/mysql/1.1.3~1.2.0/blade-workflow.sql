SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blade_wf_model_scope
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_model_scope`;
CREATE TABLE `blade_wf_model_scope` (
                                        `id` bigint(64) NOT NULL,
                                        `model_id` varchar(255) DEFAULT NULL COMMENT '模型id',
                                        `model_key` varchar(255) DEFAULT NULL COMMENT '模型key',
                                        `type` varchar(255) DEFAULT NULL COMMENT '类型 user用户 role角色 dept部门 post职位',
                                        `val` varchar(255) DEFAULT NULL COMMENT '用户/角色/部门/职位 id集合',
                                        `text` varchar(255) DEFAULT NULL COMMENT '用户/角色/部门/职位 name集合',
                                        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程模型权限';

-- ----------------------------
-- Records of blade_wf_model_scope
-- ----------------------------
BEGIN;
INSERT INTO `blade_wf_model_scope` VALUES (1418455767366799361, '2f6b3b6de24354bb5df5aad3a87789af', 'leave', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO `blade_wf_model_scope` VALUES (1418457955400978434, '0676f2277420b7dc67f69dd3a0ec1164', 'ex-leave', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO `blade_wf_model_scope` VALUES (1418457988913467393, '5b7a367e1139f1ab5cb1e6210685fa91', 'demo-multi-instance', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO `blade_wf_model_scope` VALUES (1418458020752429058, 'fb4c1a6a8c4588779a2519a547966846', 'test-default-values', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
