ALTER TABLE `blade_wf_form` ADD COLUMN `category_id` bigint(64) NULL COMMENT '分类id' AFTER `version`;
ALTER TABLE `blade_wf_form_history` ADD COLUMN `category_id` bigint(64) NULL DEFAULT NULL COMMENT '分类id' AFTER `version`;
ALTER TABLE `ACT_DE_MODEL` ADD COLUMN `category_id` bigint(64) NULL DEFAULT NULL COMMENT '分类id' AFTER `form_key`;
ALTER TABLE `ACT_DE_MODEL_HISTORY` ADD COLUMN `category_id` bigint(64) NULL DEFAULT NULL COMMENT '分类id' AFTER `form_key`;
