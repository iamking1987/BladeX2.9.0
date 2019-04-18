-- ----------------------------
-- 流程菜单增加
-- ----------------------------
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (0, 'flow', '流程管理', 'menu', '/flow', 'stock', 5, 1, 0, 1, NULL, 0);

set @flowid = (SELECT LAST_INSERT_ID());
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@flowid, 'flow_model', '模型管理', 'menu', '/flow/model', NULL, 1, 1, 0, 1, NULL, 0);
set @modelid = (SELECT LAST_INSERT_ID());
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@modelid, 'flow_model_create', '创建', 'create', 'http://localhost:9999/index.html', 'plus', 1, 2, 1, 1, NULL, 0);
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@modelid, 'flow_model_update', '编辑', 'update', 'http://localhost:9999/index.html#/editor', 'form', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@modelid, 'flow_model_deploy', '部署', 'deploy', '', 'cloud-upload', 3, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@modelid, 'flow_model_download', '下载', 'download', 'http://localhost:9999/app/rest/models', 'download', 4, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@modelid, 'flow_model_delete', '删除', 'delete', '/api/blade-flowable/model/remove', 'delete', 5, 2, 3, 1, NULL, 0);

INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@flowid, 'flow_deploy', '流程部署', 'menu', '/flow/deploy', NULL, 2, 1, 0, 1, NULL, 0);

INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@flowid, 'flow_manager', '流程管理', 'menu', '/flow/manager', NULL, 3, 1, 0, 1, NULL, 0);
set @managerid = (SELECT LAST_INSERT_ID());
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
    VALUES (@managerid, 'flow_manager_image', '流程图', 'image', 'http://localhost:9999/index.html#/processes', 'image', 1, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@managerid, 'flow_manager_state', '变更状态', 'state', '', 'plus', 2, 2, 2, 1, NULL, 0);
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@managerid, 'flow_model_delete', '删除', 'delete', '', 'delete', 3, 2, 3, 1, NULL, 0);

INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@flowid, 'flow_status', '流程状态', 'menu', '/flow/status', NULL, 4, 1, 0, 1, NULL, 0);
set @statueid = (SELECT LAST_INSERT_ID());
INSERT INTO `blade_menu`(`parent_id`, `code`, `name`, `alias`, `path`, `source`, `sort`, `category`, `action`, `is_open`, `remark`, `is_deleted`)
VALUES (@statueid, 'flow_status_delete', '删除', 'delete', '', 'delete', 1, 2, 3, 1, NULL, 0);



-- ----------------------------
-- 字典数据增加
-- ----------------------------
INSERT INTO `blade_dict`(`parent_id`, `code`, `dict_key`, `dict_value`, `sort`, `remark`, `is_deleted`)
VALUES (0, 'flow', -1, '流程类型', 5, NULL, 0);
set @dictid = (SELECT LAST_INSERT_ID());
INSERT INTO `bladex`.`blade_dict`(`parent_id`, `code`, `dict_key`, `dict_value`, `sort`, `remark`, `is_deleted`)
VALUES (@dictid, 'flow', 1, '请假流程', 1, NULL, 0);
INSERT INTO `bladex`.`blade_dict`(`parent_id`, `code`, `dict_key`, `dict_value`, `sort`, `remark`, `is_deleted`)
VALUES (@dictid, 'flow', 2, '报销流程', 2, NULL, 0);
