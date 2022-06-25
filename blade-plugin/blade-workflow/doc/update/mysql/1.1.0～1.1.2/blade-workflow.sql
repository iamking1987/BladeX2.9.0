ALTER TABLE blade_wf_form DROP INDEX `key`;
ALTER TABLE blade_wf_form ADD UNIQUE INDEX WF_IDX_FORM_KEY (`key`, `tenant_id`);

ALTER TABLE blade_wf_condition DROP INDEX uni;
ALTER TABLE blade_wf_condition ADD UNIQUE INDEX WF_IDX_EXPRESSION (`expression`, `type`, `tenant_id`);

ALTER TABLE ACT_DE_MODEL DROP INDEX model_key;
ALTER TABLE ACT_DE_MODEL ADD UNIQUE INDEX WF_IDX_MODEL_KEY (`model_key`, `tenant_id`);

ALTER TABLE blade_wf_copy ADD COLUMN `form_key` VARCHAR(255) DEFAULT NULL COMMENT '外置表单key' AFTER `process_id`;
ALTER TABLE blade_wf_copy ADD COLUMN `form_url` VARCHAR(255) DEFAULT NULL COMMENT '外置表单url' AFTER `form_key`;

