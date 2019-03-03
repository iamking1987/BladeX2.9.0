ALTER TABLE `bladex`.`blade_notice`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_dept`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_dict`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_menu`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_role`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_role_menu`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_param`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_user`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_log_api`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_log_error`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
ALTER TABLE `bladex`.`blade_log_usual`
    ADD COLUMN `tenant_code` varchar(12) NULL DEFAULT '000000' COMMENT '租户编号' AFTER `id`;
