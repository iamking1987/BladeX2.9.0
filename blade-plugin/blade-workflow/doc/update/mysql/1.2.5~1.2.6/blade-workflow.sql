ALTER TABLE blade_wf_button ADD COLUMN display TINYINT(1) DEFAULT NULL COMMENT '默认是否显示' AFTER `name`;
UPDATE blade_wf_button SET display = TRUE;
