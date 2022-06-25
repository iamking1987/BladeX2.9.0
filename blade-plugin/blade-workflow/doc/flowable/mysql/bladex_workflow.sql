SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ACT_DE_MODEL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DE_MODEL`;
CREATE TABLE `ACT_DE_MODEL` (
                                `id` varchar(255) NOT NULL,
                                `name` varchar(400) NOT NULL COMMENT '名称',
                                `model_key` varchar(400) NOT NULL COMMENT '模型标识',
                                `form_key` varchar(255) DEFAULT NULL COMMENT '表单标识',
                                `category_id` bigint(64) DEFAULT NULL COMMENT '分类id',
                                `description` varchar(4000) DEFAULT NULL COMMENT '描述',
                                `model_comment` varchar(4000) DEFAULT NULL COMMENT '评论',
                                `created` datetime(6) DEFAULT NULL COMMENT '创建时间',
                                `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
                                `last_updated` datetime(6) DEFAULT NULL COMMENT '最后更新时间',
                                `last_updated_by` varchar(255) DEFAULT NULL COMMENT '最后更新人',
                                `version` int(11) DEFAULT NULL COMMENT '版本',
                                `xml` longtext COMMENT 'xml',
                                `model_editor_json` longtext COMMENT 'flowable-ui编辑器json',
                                `thumbnail` longblob COMMENT '缩略图',
                                `model_type` int(11) DEFAULT NULL COMMENT '类型',
                                `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
                                PRIMARY KEY (`id`) USING BTREE,
                                UNIQUE KEY `WF_IDX_MODEL_KEY` (`model_key`,`tenant_id`),
                                KEY `idx_proc_mod_created` (`created_by`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程 - 定义 - 模型';

-- ----------------------------
-- Records of ACT_DE_MODEL
-- ----------------------------
BEGIN;
INSERT INTO `ACT_DE_MODEL` VALUES ('0676f2277420b7dc67f69dd3a0ec1164', '请假流程 - 外置表单', 'ex-leave', 'wf_ex_Leave', NULL, NULL, NULL, '2021-06-08 08:40:51.901000', '1123598821738675201', '2021-10-11 21:19:07.045000', '1123598821738675201', 1, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" targetNamespace=\"http://bpmn.io/schema/bpmn\">\n  <process id=\"ex-leave\" name=\"请假流程 - 外置表单\" isExecutable=\"true\" flowable:skipFirstNode=\"true\" flowable:rollbackNode=\"Activity_1bvvbi2\">\n    <extensionElements>\n      <flowable:serial name=\"测试流水号\" prefix=\"SQ\" dateFormat=\"yyyyMMdd\" suffixLength=\"5\" startSequence=\"0\" connector=\"\" cycle=\"none\" />\n    </extensionElements>\n    <startEvent id=\"startEvent_1\" name=\"开始\" flowable:exFormKey=\"Leave\">\n      <extensionElements>\n        <flowable:exFormKey value=\"Leave\" />\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"true\" />\n      </extensionElements>\n      <outgoing>Flow_1itpbiu</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_1bvvbi2\" name=\"发起人\" flowable:exFormKey=\"Leave\" flowable:assignee=\"${applyUser}\" flowable:hideCopy=\"true\">\n      <extensionElements>\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_1itpbiu</incoming>\n      <outgoing>Flow_0eeuztq</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1itpbiu\" sourceRef=\"startEvent_1\" targetRef=\"Activity_1bvvbi2\" />\n    <userTask id=\"Activity_0xqgcpk\" name=\"人事\" flowable:exFormKey=\"Leave\" flowable:candidateUsers=\"1123598821738675202\">\n      <extensionElements>\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"false\" />\n      </extensionElements>\n      <incoming>Flow_0eeuztq</incoming>\n      <outgoing>Flow_1vu0qon</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0eeuztq\" sourceRef=\"Activity_1bvvbi2\" targetRef=\"Activity_0xqgcpk\" />\n    <userTask id=\"Activity_0k0fyan\" name=\"经理\" flowable:exFormKey=\"Leave\" flowable:candidateUsers=\"1123598821738675203\">\n      <extensionElements>\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"false\" />\n      </extensionElements>\n      <incoming>Flow_1vu0qon</incoming>\n      <outgoing>Flow_1d63z9m</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1vu0qon\" sourceRef=\"Activity_0xqgcpk\" targetRef=\"Activity_0k0fyan\" />\n    <endEvent id=\"Event_06z26fy\">\n      <incoming>Flow_1d63z9m</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_1d63z9m\" sourceRef=\"Activity_0k0fyan\" targetRef=\"Event_06z26fy\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"ex-leave\">\n      <bpmndi:BPMNEdge id=\"Flow_1d63z9m_di\" bpmnElement=\"Flow_1d63z9m\">\n        <di:waypoint x=\"720\" y=\"215\" />\n        <di:waypoint x=\"772\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1vu0qon_di\" bpmnElement=\"Flow_1vu0qon\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"620\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0eeuztq_di\" bpmnElement=\"Flow_0eeuztq\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1itpbiu_di\" bpmnElement=\"Flow_1itpbiu\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"BPMNShape_startEvent_1\" bpmnElement=\"startEvent_1\">\n        <dc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"243\" y=\"237\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1bvvbi2_di\" bpmnElement=\"Activity_1bvvbi2\">\n        <dc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0xqgcpk_di\" bpmnElement=\"Activity_0xqgcpk\">\n        <dc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0k0fyan_di\" bpmnElement=\"Activity_0k0fyan\">\n        <dc:Bounds x=\"620\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_06z26fy_di\" bpmnElement=\"Event_06z26fy\">\n        <dc:Bounds x=\"772\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n', '{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"ex-leave\",\"name\":\"请假流程 - 外置表单\",\"process_namespace\":\"http://bpmn.io/schema/bpmn\",\"iseagerexecutionfetch\":false,\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[],\"escalationdefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":270.0,\"y\":230.0},\"upperLeft\":{\"x\":240.0,\"y\":200.0}},\"resourceId\":\"startEvent_1\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"startEvent_1\",\"name\":\"开始\",\"interrupting\":true,\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1itpbiu\"}]},{\"bounds\":{\"lowerRight\":{\"x\":420.0,\"y\":255.0},\"upperLeft\":{\"x\":320.0,\"y\":175.0}},\"resourceId\":\"Activity_1bvvbi2\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_1bvvbi2\",\"name\":\"发起人\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"${applyUser}\"}},\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0eeuztq\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1itpbiu\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":15.0,\"y\":15.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_1bvvbi2\"}],\"target\":{\"resourceId\":\"Activity_1bvvbi2\"},\"properties\":{\"overrideid\":\"Flow_1itpbiu\"}},{\"bounds\":{\"lowerRight\":{\"x\":570.0,\"y\":255.0},\"upperLeft\":{\"x\":470.0,\"y\":175.0}},\"resourceId\":\"Activity_0xqgcpk\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_0xqgcpk\",\"name\":\"人事\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"candidateUsers\":[{\"value\":\"1123598821738675202\"}]}},\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1vu0qon\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0eeuztq\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_0xqgcpk\"}],\"target\":{\"resourceId\":\"Activity_0xqgcpk\"},\"properties\":{\"overrideid\":\"Flow_0eeuztq\"}},{\"bounds\":{\"lowerRight\":{\"x\":720.0,\"y\":255.0},\"upperLeft\":{\"x\":620.0,\"y\":175.0}},\"resourceId\":\"Activity_0k0fyan\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_0k0fyan\",\"name\":\"经理\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"candidateUsers\":[{\"value\":\"1123598821738675203\"}]}},\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1d63z9m\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1vu0qon\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_0k0fyan\"}],\"target\":{\"resourceId\":\"Activity_0k0fyan\"},\"properties\":{\"overrideid\":\"Flow_1vu0qon\"}},{\"bounds\":{\"lowerRight\":{\"x\":808.0,\"y\":233.0},\"upperLeft\":{\"x\":772.0,\"y\":197.0}},\"resourceId\":\"Event_06z26fy\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"Event_06z26fy\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1d63z9m\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":18.0,\"y\":18.0}],\"outgoing\":[{\"resourceId\":\"Event_06z26fy\"}],\"target\":{\"resourceId\":\"Event_06z26fy\"},\"properties\":{\"overrideid\":\"Flow_1d63z9m\"}}]}', NULL, 0, '000000');
INSERT INTO `ACT_DE_MODEL` VALUES ('2f6b3b6de24354bb5df5aad3a87789af', '请假流程', 'leave', 'leave', NULL, NULL, NULL, '2021-06-01 22:14:07.363000', '1123598821738675201', '2021-07-29 10:05:57.100000', '1123598821738675201', 1, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" targetNamespace=\"http://bpmn.io/schema/bpmn\">\n  <process id=\"leave\" name=\"请假流程\" isExecutable=\"true\" flowable:skipFirstNode=\"true\" flowable:rollbackNode=\"Activity_0u3ywm0\">\n    <extensionElements>\n      <flowable:serial name=\"请假流水号\" prefix=\"Leave\" dateFormat=\"yyyyMMdd\" suffixLength=\"5\" startSequence=\"0\" connector=\"\" cycle=\"none\" />\n    </extensionElements>\n    <startEvent id=\"startEvent_1\" name=\"开始\">\n      <extensionElements>\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"true\" />\n      </extensionElements>\n      <outgoing>Flow_0myeljb</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0u3ywm0\" name=\"发起人\">\n      <extensionElements>\n        <flowable:assignee type=\"custom\" value=\"applyUser\" text=\"流程发起人\" />\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0myeljb</incoming>\n      <outgoing>Flow_0bz2pj7</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0myeljb\" sourceRef=\"startEvent_1\" targetRef=\"Activity_0u3ywm0\" />\n    <userTask id=\"Activity_1hmjyx7\" name=\"人事\">\n      <extensionElements>\n        <flowable:assignee type=\"role\" value=\"1123598816738675203\" text=\"人事\" />\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"false\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0bz2pj7</incoming>\n      <outgoing>Flow_1pf3fia</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0bz2pj7\" sourceRef=\"Activity_0u3ywm0\" targetRef=\"Activity_1hmjyx7\" />\n    <exclusiveGateway id=\"Gateway_1qc70vy\">\n      <incoming>Flow_1pf3fia</incoming>\n      <outgoing>Flow_0of3zct</outgoing>\n      <outgoing>Flow_139q6po</outgoing>\n    </exclusiveGateway>\n    <sequenceFlow id=\"Flow_1pf3fia\" sourceRef=\"Activity_1hmjyx7\" targetRef=\"Gateway_1qc70vy\" />\n    <userTask id=\"Activity_1r4xgdo\" name=\"经理\">\n      <extensionElements>\n        <flowable:assignee type=\"role\" value=\"1123598816738675204\" text=\"经理\" />\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"false\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0of3zct</incoming>\n      <outgoing>Flow_1dmv86y</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0of3zct\" name=\"小于5天\" sourceRef=\"Gateway_1qc70vy\" targetRef=\"Activity_1r4xgdo\">\n      <conditionExpression xsi:type=\"tFormalExpression\">${days&lt;5}</conditionExpression>\n    </sequenceFlow>\n    <userTask id=\"Activity_1bt0gzy\" name=\"老板\">\n      <extensionElements>\n        <flowable:assignee type=\"role\" value=\"1123598816738675205\" text=\"老板\" />\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"false\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_139q6po</incoming>\n      <outgoing>Flow_1bugorc</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_139q6po\" name=\"大于5天\" sourceRef=\"Gateway_1qc70vy\" targetRef=\"Activity_1bt0gzy\">\n      <conditionExpression xsi:type=\"tFormalExpression\">${days&gt;=5}</conditionExpression>\n    </sequenceFlow>\n    <exclusiveGateway id=\"Gateway_0ciyfci\">\n      <incoming>Flow_1dmv86y</incoming>\n      <incoming>Flow_1bugorc</incoming>\n      <outgoing>Flow_0vtl8w4</outgoing>\n    </exclusiveGateway>\n    <sequenceFlow id=\"Flow_1dmv86y\" sourceRef=\"Activity_1r4xgdo\" targetRef=\"Gateway_0ciyfci\" />\n    <sequenceFlow id=\"Flow_1bugorc\" sourceRef=\"Activity_1bt0gzy\" targetRef=\"Gateway_0ciyfci\" />\n    <endEvent id=\"Event_1j9xjra\" name=\"结束\">\n      <incoming>Flow_0vtl8w4</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0vtl8w4\" sourceRef=\"Gateway_0ciyfci\" targetRef=\"Event_1j9xjra\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"leave\">\n      <bpmndi:BPMNEdge id=\"Flow_0vtl8w4_di\" bpmnElement=\"Flow_0vtl8w4\">\n        <di:waypoint x=\"925\" y=\"215\" />\n        <di:waypoint x=\"992\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1bugorc_di\" bpmnElement=\"Flow_1bugorc\">\n        <di:waypoint x=\"830\" y=\"330\" />\n        <di:waypoint x=\"900\" y=\"330\" />\n        <di:waypoint x=\"900\" y=\"240\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1dmv86y_di\" bpmnElement=\"Flow_1dmv86y\">\n        <di:waypoint x=\"830\" y=\"110\" />\n        <di:waypoint x=\"900\" y=\"110\" />\n        <di:waypoint x=\"900\" y=\"190\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_139q6po_di\" bpmnElement=\"Flow_139q6po\">\n        <di:waypoint x=\"650\" y=\"240\" />\n        <di:waypoint x=\"650\" y=\"330\" />\n        <di:waypoint x=\"730\" y=\"330\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"600\" y=\"282\" width=\"40\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0of3zct_di\" bpmnElement=\"Flow_0of3zct\">\n        <di:waypoint x=\"650\" y=\"190\" />\n        <di:waypoint x=\"650\" y=\"110\" />\n        <di:waypoint x=\"730\" y=\"110\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"600\" y=\"147\" width=\"40\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1pf3fia_di\" bpmnElement=\"Flow_1pf3fia\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"625\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0bz2pj7_di\" bpmnElement=\"Flow_0bz2pj7\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0myeljb_di\" bpmnElement=\"Flow_0myeljb\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"BPMNShape_startEvent_1\" bpmnElement=\"startEvent_1\">\n        <dc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"243\" y=\"237\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0u3ywm0_di\" bpmnElement=\"Activity_0u3ywm0\">\n        <dc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1hmjyx7_di\" bpmnElement=\"Activity_1hmjyx7\">\n        <dc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_1qc70vy_di\" bpmnElement=\"Gateway_1qc70vy\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"625\" y=\"190\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1r4xgdo_di\" bpmnElement=\"Activity_1r4xgdo\">\n        <dc:Bounds x=\"730\" y=\"70\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1bt0gzy_di\" bpmnElement=\"Activity_1bt0gzy\">\n        <dc:Bounds x=\"730\" y=\"290\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_0ciyfci_di\" bpmnElement=\"Gateway_0ciyfci\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"875\" y=\"190\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1j9xjra_di\" bpmnElement=\"Event_1j9xjra\">\n        <dc:Bounds x=\"992\" y=\"197\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"999\" y=\"240\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n', '{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"leave\",\"name\":\"请假流程\",\"process_namespace\":\"http://bpmn.io/schema/bpmn\",\"iseagerexecutionfetch\":false,\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[],\"escalationdefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":270.0,\"y\":230.0},\"upperLeft\":{\"x\":240.0,\"y\":200.0}},\"resourceId\":\"startEvent_1\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"startEvent_1\",\"name\":\"开始\",\"interrupting\":true,\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0myeljb\"}]},{\"bounds\":{\"lowerRight\":{\"x\":420.0,\"y\":255.0},\"upperLeft\":{\"x\":320.0,\"y\":175.0}},\"resourceId\":\"Activity_0u3ywm0\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_0u3ywm0\",\"name\":\"发起人\",\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0bz2pj7\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0myeljb\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":15.0,\"y\":15.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_0u3ywm0\"}],\"target\":{\"resourceId\":\"Activity_0u3ywm0\"},\"properties\":{\"overrideid\":\"Flow_0myeljb\"}},{\"bounds\":{\"lowerRight\":{\"x\":570.0,\"y\":255.0},\"upperLeft\":{\"x\":470.0,\"y\":175.0}},\"resourceId\":\"Activity_1hmjyx7\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_1hmjyx7\",\"name\":\"人事\",\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1pf3fia\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0bz2pj7\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_1hmjyx7\"}],\"target\":{\"resourceId\":\"Activity_1hmjyx7\"},\"properties\":{\"overrideid\":\"Flow_0bz2pj7\"}},{\"bounds\":{\"lowerRight\":{\"x\":675.0,\"y\":240.0},\"upperLeft\":{\"x\":625.0,\"y\":190.0}},\"resourceId\":\"Gateway_1qc70vy\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"Gateway_1qc70vy\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0of3zct\"},{\"resourceId\":\"Flow_139q6po\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1pf3fia\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":25.0,\"y\":25.0}],\"outgoing\":[{\"resourceId\":\"Gateway_1qc70vy\"}],\"target\":{\"resourceId\":\"Gateway_1qc70vy\"},\"properties\":{\"overrideid\":\"Flow_1pf3fia\"}},{\"bounds\":{\"lowerRight\":{\"x\":830.0,\"y\":150.0},\"upperLeft\":{\"x\":730.0,\"y\":70.0}},\"resourceId\":\"Activity_1r4xgdo\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_1r4xgdo\",\"name\":\"经理\",\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1dmv86y\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0of3zct\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":25.0,\"y\":25.0},{\"x\":650.0,\"y\":110.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_1r4xgdo\"}],\"target\":{\"resourceId\":\"Activity_1r4xgdo\"},\"properties\":{\"overrideid\":\"Flow_0of3zct\",\"name\":\"小于5天\",\"conditionsequenceflow\":\"${days<5}\"}},{\"bounds\":{\"lowerRight\":{\"x\":830.0,\"y\":370.0},\"upperLeft\":{\"x\":730.0,\"y\":290.0}},\"resourceId\":\"Activity_1bt0gzy\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_1bt0gzy\",\"name\":\"老板\",\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1bugorc\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_139q6po\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":25.0,\"y\":25.0},{\"x\":650.0,\"y\":330.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_1bt0gzy\"}],\"target\":{\"resourceId\":\"Activity_1bt0gzy\"},\"properties\":{\"overrideid\":\"Flow_139q6po\",\"name\":\"大于5天\",\"conditionsequenceflow\":\"${days>=5}\"}},{\"bounds\":{\"lowerRight\":{\"x\":925.0,\"y\":240.0},\"upperLeft\":{\"x\":875.0,\"y\":190.0}},\"resourceId\":\"Gateway_0ciyfci\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"Gateway_0ciyfci\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0vtl8w4\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1dmv86y\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":900.0,\"y\":110.0},{\"x\":25.0,\"y\":25.0}],\"outgoing\":[{\"resourceId\":\"Gateway_0ciyfci\"}],\"target\":{\"resourceId\":\"Gateway_0ciyfci\"},\"properties\":{\"overrideid\":\"Flow_1dmv86y\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1bugorc\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":900.0,\"y\":330.0},{\"x\":25.0,\"y\":25.0}],\"outgoing\":[{\"resourceId\":\"Gateway_0ciyfci\"}],\"target\":{\"resourceId\":\"Gateway_0ciyfci\"},\"properties\":{\"overrideid\":\"Flow_1bugorc\"}},{\"bounds\":{\"lowerRight\":{\"x\":1028.0,\"y\":233.0},\"upperLeft\":{\"x\":992.0,\"y\":197.0}},\"resourceId\":\"Event_1j9xjra\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"Event_1j9xjra\",\"name\":\"结束\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0vtl8w4\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":25.0,\"y\":25.0},{\"x\":18.0,\"y\":18.0}],\"outgoing\":[{\"resourceId\":\"Event_1j9xjra\"}],\"target\":{\"resourceId\":\"Event_1j9xjra\"},\"properties\":{\"overrideid\":\"Flow_0vtl8w4\"}}]}', NULL, 0, '000000');
INSERT INTO `ACT_DE_MODEL` VALUES ('5b7a367e1139f1ab5cb1e6210685fa91', '多实例示例', 'demo-multi-instance', 'demo-test', NULL, NULL, NULL, '2021-06-25 20:35:27.522000', '1123598821738675201', '2021-06-25 21:12:43.852000', '1123598821738675201', 1, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" targetNamespace=\"http://bpmn.io/schema/bpmn\">\n  <process id=\"demo-multi-instance\" name=\"多实例示例\" isExecutable=\"true\" flowable:skipFirstNode=\"true\" flowable:rollbackNode=\"Activity_0srhxhz\">\n    <extensionElements>\n      <flowable:serial name=\"多实例流水号\" prefix=\"MT\" dateFormat=\"yyyyMMdd\" suffixLength=\"4\" startSequence=\"0\" connector=\"\" cycle=\"none\" />\n    </extensionElements>\n    <startEvent id=\"startEvent_1\" name=\"开始\">\n      <extensionElements>\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n      </extensionElements>\n      <outgoing>Flow_1i5g9nh</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0srhxhz\" name=\"发起人\">\n      <extensionElements>\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n        <flowable:assignee type=\"custom\" value=\"applyUser\" text=\"流程发起人\" />\n      </extensionElements>\n      <incoming>Flow_1i5g9nh</incoming>\n      <outgoing>Flow_15l5hak</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1i5g9nh\" sourceRef=\"startEvent_1\" targetRef=\"Activity_0srhxhz\" />\n    <userTask id=\"Activity_1qj1out\" name=\"多实例（串行）\" flowable:assignee=\"${assignee}\">\n      <extensionElements>\n        <flowable:assignee type=\"custom\" value=\"leader\" text=\"上级部门领导\" />\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_15l5hak</incoming>\n      <outgoing>Flow_0afq5tt</outgoing>\n      <multiInstanceLoopCharacteristics isSequential=\"true\" flowable:collection=\"${wfMultiInstanceHandler.getList(execution)}\" flowable:elementVariable=\"assignee\">\n        <completionCondition xsi:type=\"tFormalExpression\">${nrOfCompletedInstances/nrOfInstances &gt;= 0.5}</completionCondition>\n      </multiInstanceLoopCharacteristics>\n    </userTask>\n    <sequenceFlow id=\"Flow_15l5hak\" sourceRef=\"Activity_0srhxhz\" targetRef=\"Activity_1qj1out\" />\n    <userTask id=\"Activity_0oh31om\" name=\"多实例（并行）\" flowable:assignee=\"${assignee}\">\n      <extensionElements>\n        <flowable:assignee type=\"dept\" value=\"1123598813738675202\" text=\"常州刀锋\" />\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0afq5tt</incoming>\n      <outgoing>Flow_0dera7k</outgoing>\n      <multiInstanceLoopCharacteristics flowable:collection=\"${wfMultiInstanceHandler.getList(execution)}\" flowable:elementVariable=\"assignee\">\n        <completionCondition xsi:type=\"tFormalExpression\">${nrOfCompletedInstances/nrOfInstances &gt;= 1}</completionCondition>\n      </multiInstanceLoopCharacteristics>\n    </userTask>\n    <sequenceFlow id=\"Flow_0afq5tt\" sourceRef=\"Activity_1qj1out\" targetRef=\"Activity_0oh31om\" />\n    <endEvent id=\"Event_02858i0\" name=\"结束\">\n      <incoming>Flow_0dera7k</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0dera7k\" sourceRef=\"Activity_0oh31om\" targetRef=\"Event_02858i0\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"demo-multi-instance\">\n      <bpmndi:BPMNEdge id=\"Flow_0dera7k_di\" bpmnElement=\"Flow_0dera7k\">\n        <di:waypoint x=\"720\" y=\"215\" />\n        <di:waypoint x=\"772\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0afq5tt_di\" bpmnElement=\"Flow_0afq5tt\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"620\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_15l5hak_di\" bpmnElement=\"Flow_15l5hak\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1i5g9nh_di\" bpmnElement=\"Flow_1i5g9nh\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"BPMNShape_startEvent_1\" bpmnElement=\"startEvent_1\">\n        <dc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"243\" y=\"237\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0srhxhz_di\" bpmnElement=\"Activity_0srhxhz\">\n        <dc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1qj1out_di\" bpmnElement=\"Activity_1qj1out\">\n        <dc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0oh31om_di\" bpmnElement=\"Activity_0oh31om\">\n        <dc:Bounds x=\"620\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_02858i0_di\" bpmnElement=\"Event_02858i0\">\n        <dc:Bounds x=\"772\" y=\"197\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"779\" y=\"240\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n', '{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"demo-multi-instance\",\"name\":\"多实例示例\",\"process_namespace\":\"http://bpmn.io/schema/bpmn\",\"iseagerexecutionfetch\":false,\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[],\"escalationdefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":270.0,\"y\":230.0},\"upperLeft\":{\"x\":240.0,\"y\":200.0}},\"resourceId\":\"startEvent_1\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"startEvent_1\",\"name\":\"开始\",\"interrupting\":true,\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1i5g9nh\"}]},{\"bounds\":{\"lowerRight\":{\"x\":420.0,\"y\":255.0},\"upperLeft\":{\"x\":320.0,\"y\":175.0}},\"resourceId\":\"Activity_0srhxhz\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_0srhxhz\",\"name\":\"发起人\",\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_15l5hak\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1i5g9nh\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":15.0,\"y\":15.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_0srhxhz\"}],\"target\":{\"resourceId\":\"Activity_0srhxhz\"},\"properties\":{\"overrideid\":\"Flow_1i5g9nh\"}},{\"bounds\":{\"lowerRight\":{\"x\":570.0,\"y\":255.0},\"upperLeft\":{\"x\":470.0,\"y\":175.0}},\"resourceId\":\"Activity_1qj1out\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_1qj1out\",\"name\":\"多实例（串行）\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"${assignee}\"}},\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"multiinstance_type\":\"Sequential\",\"multiinstance_collection\":\"${wfMultiInstanceHandler.getList(execution)}\",\"multiinstance_variable\":\"assignee\",\"multiinstance_condition\":\"${nrOfCompletedInstances/nrOfInstances >= 0.5}\",\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0afq5tt\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_15l5hak\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_1qj1out\"}],\"target\":{\"resourceId\":\"Activity_1qj1out\"},\"properties\":{\"overrideid\":\"Flow_15l5hak\"}},{\"bounds\":{\"lowerRight\":{\"x\":720.0,\"y\":255.0},\"upperLeft\":{\"x\":620.0,\"y\":175.0}},\"resourceId\":\"Activity_0oh31om\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_0oh31om\",\"name\":\"多实例（并行）\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"${assignee}\"}},\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"multiinstance_type\":\"Parallel\",\"multiinstance_collection\":\"${wfMultiInstanceHandler.getList(execution)}\",\"multiinstance_variable\":\"assignee\",\"multiinstance_condition\":\"${nrOfCompletedInstances/nrOfInstances >= 1}\",\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0dera7k\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0afq5tt\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_0oh31om\"}],\"target\":{\"resourceId\":\"Activity_0oh31om\"},\"properties\":{\"overrideid\":\"Flow_0afq5tt\"}},{\"bounds\":{\"lowerRight\":{\"x\":808.0,\"y\":233.0},\"upperLeft\":{\"x\":772.0,\"y\":197.0}},\"resourceId\":\"Event_02858i0\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"Event_02858i0\",\"name\":\"结束\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0dera7k\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":18.0,\"y\":18.0}],\"outgoing\":[{\"resourceId\":\"Event_02858i0\"}],\"target\":{\"resourceId\":\"Event_02858i0\"},\"properties\":{\"overrideid\":\"Flow_0dera7k\"}}]}', NULL, 0, '000000');
INSERT INTO `ACT_DE_MODEL` VALUES ('89d9c299dfed64a7834fdb7caccc913f', '字段联动', 'field-linkage', 'field-linkage', NULL, '表单字段联动示例', NULL, '2021-08-23 13:22:16.481000', '1123598821738675201', '2021-08-23 13:25:32.180000', '1123598821738675201', 1, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" targetNamespace=\"http://bpmn.io/schema/bpmn\">\n  <process id=\"field-linkage\" name=\"字段联动\" isExecutable=\"true\">\n    <documentation>表单字段联动示例</documentation>\n    <startEvent id=\"startEvent_1\" name=\"开始\">\n      <extensionElements>\n        <flowable:formProperty id=\"1629695558953_19833\" name=\"控制显隐\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"input\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1629695859796_23456\" name=\"值改变\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"input2\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n      </extensionElements>\n      <outgoing>Flow_0ij25wf</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_1tlsc5z\" name=\"1\">\n      <extensionElements>\n        <flowable:assignee type=\"user\" value=\"1123598821738675201\" text=\"管理员\" />\n        <flowable:formProperty id=\"1629695558953_19833\" name=\"控制显隐\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"input\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1629695859796_23456\" name=\"值改变\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"input2\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0ij25wf</incoming>\n      <outgoing>Flow_0vq4xed</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0ij25wf\" sourceRef=\"startEvent_1\" targetRef=\"Activity_1tlsc5z\" />\n    <endEvent id=\"Event_1ettf2b\">\n      <incoming>Flow_0vq4xed</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_0vq4xed\" sourceRef=\"Activity_1tlsc5z\" targetRef=\"Event_1ettf2b\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"field-linkage\">\n      <bpmndi:BPMNEdge id=\"Flow_0vq4xed_di\" bpmnElement=\"Flow_0vq4xed\">\n        <di:waypoint x=\"430\" y=\"218\" />\n        <di:waypoint x=\"492\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0ij25wf_di\" bpmnElement=\"Flow_0ij25wf\">\n        <di:waypoint x=\"276\" y=\"218\" />\n        <di:waypoint x=\"330\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"BPMNShape_startEvent_1\" bpmnElement=\"startEvent_1\">\n        <dc:Bounds x=\"240\" y=\"200\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"247\" y=\"243\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1tlsc5z_di\" bpmnElement=\"Activity_1tlsc5z\">\n        <dc:Bounds x=\"330\" y=\"178\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1ettf2b_di\" bpmnElement=\"Event_1ettf2b\">\n        <dc:Bounds x=\"492\" y=\"200\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n', '{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"field-linkage\",\"name\":\"字段联动\",\"documentation\":\"表单字段联动示例\",\"process_namespace\":\"http://bpmn.io/schema/bpmn\",\"iseagerexecutionfetch\":false,\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[],\"escalationdefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":276.0,\"y\":236.0},\"upperLeft\":{\"x\":240.0,\"y\":200.0}},\"resourceId\":\"startEvent_1\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"startEvent_1\",\"name\":\"开始\",\"interrupting\":true,\"formproperties\":{\"formProperties\":[{\"id\":\"1629695558953_19833\",\"name\":\"控制显隐\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"input\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1629695859796_23456\",\"name\":\"值改变\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"input2\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0ij25wf\"}]},{\"bounds\":{\"lowerRight\":{\"x\":430.0,\"y\":258.0},\"upperLeft\":{\"x\":330.0,\"y\":178.0}},\"resourceId\":\"Activity_1tlsc5z\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_1tlsc5z\",\"name\":\"1\",\"formproperties\":{\"formProperties\":[{\"id\":\"1629695558953_19833\",\"name\":\"控制显隐\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"input\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1629695859796_23456\",\"name\":\"值改变\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"input2\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0vq4xed\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0ij25wf\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":18.0,\"y\":18.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_1tlsc5z\"}],\"target\":{\"resourceId\":\"Activity_1tlsc5z\"},\"properties\":{\"overrideid\":\"Flow_0ij25wf\"}},{\"bounds\":{\"lowerRight\":{\"x\":528.0,\"y\":236.0},\"upperLeft\":{\"x\":492.0,\"y\":200.0}},\"resourceId\":\"Event_1ettf2b\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"Event_1ettf2b\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0vq4xed\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":18.0,\"y\":18.0}],\"outgoing\":[{\"resourceId\":\"Event_1ettf2b\"}],\"target\":{\"resourceId\":\"Event_1ettf2b\"},\"properties\":{\"overrideid\":\"Flow_0vq4xed\"}}]}', NULL, 0, '000000');
INSERT INTO `ACT_DE_MODEL` VALUES ('d71049b6ba4eda39cacf9baf984274ac', '节点独立表单示例', 'indep-form', 'wf_indep_default-value', NULL, NULL, NULL, '2021-10-11 21:32:41.567000', '1123598821738675201', '2021-10-11 21:32:41.567000', '1123598821738675201', 1, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" targetNamespace=\"http://bpmn.io/schema/bpmn\">\n  <process id=\"indep-form\" name=\"节点独立表单示例\" isExecutable=\"true\">\n    <startEvent id=\"startEvent_1\" name=\"开始\">\n      <extensionElements>\n        <flowable:indepFormKey value=\"default-value\" />\n        <flowable:formProperty id=\"1622472547203_21841\" name=\"人事姓名\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622553629767_65211\" name=\"人事职位\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472547375_86557\" name=\"人事部门\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622553629949_3168\" name=\"当前日期\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622553631752_15562\" name=\"当前时间\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622553691156_69886\" name=\"人事姓名和日期\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472547780_5707\" name=\"经理姓名\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472547975_90560\" name=\"经理部门\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472548372_60141\" name=\"老板姓名\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472548560_32474\" name=\"老板部门\" readable=\"true\" writable=\"true\" />\n      </extensionElements>\n      <outgoing>Flow_0u2w7hr</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0a06fpe\" name=\"节点1\" flowable:indepFormKey=\"leave\" flowable:indepFormSummary=\"0\">\n      <extensionElements>\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n        <flowable:formProperty id=\"datetime\" name=\"请假时间\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"days\" name=\"请假天数\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"reason\" name=\"请假理由\" readable=\"true\" writable=\"true\" />\n        <flowable:assignee type=\"user\" value=\"1123598821738675201\" text=\"管理员\" />\n      </extensionElements>\n      <incoming>Flow_0u2w7hr</incoming>\n      <outgoing>Flow_1gfy6oq</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0u2w7hr\" sourceRef=\"startEvent_1\" targetRef=\"Activity_0a06fpe\" />\n    <userTask id=\"Activity_0k3kp91\" name=\"节点2\" flowable:indepFormKey=\"demo-test\" flowable:indepFormSummary=\"0\">\n      <extensionElements>\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n        <flowable:assignee type=\"user\" value=\"1123598821738675201\" text=\"管理员\" />\n      </extensionElements>\n      <incoming>Flow_1gfy6oq</incoming>\n      <outgoing>Flow_016wlba</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1gfy6oq\" sourceRef=\"Activity_0a06fpe\" targetRef=\"Activity_0k3kp91\" />\n    <userTask id=\"Activity_1yv7km2\" name=\"汇总\" flowable:indepFormSummary=\"1\">\n      <extensionElements>\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n        <flowable:assignee type=\"user\" value=\"1123598821738675201\" text=\"管理员\" />\n      </extensionElements>\n      <incoming>Flow_016wlba</incoming>\n      <outgoing>Flow_1omx17n</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_016wlba\" sourceRef=\"Activity_0k3kp91\" targetRef=\"Activity_1yv7km2\" />\n    <endEvent id=\"Event_1vr1neq\" name=\"结束\">\n      <incoming>Flow_1omx17n</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_1omx17n\" sourceRef=\"Activity_1yv7km2\" targetRef=\"Event_1vr1neq\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"indep-form\">\n      <bpmndi:BPMNEdge id=\"Flow_0u2w7hr_di\" bpmnElement=\"Flow_0u2w7hr\">\n        <di:waypoint x=\"276\" y=\"218\" />\n        <di:waypoint x=\"330\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1gfy6oq_di\" bpmnElement=\"Flow_1gfy6oq\">\n        <di:waypoint x=\"430\" y=\"218\" />\n        <di:waypoint x=\"490\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_016wlba_di\" bpmnElement=\"Flow_016wlba\">\n        <di:waypoint x=\"590\" y=\"218\" />\n        <di:waypoint x=\"650\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1omx17n_di\" bpmnElement=\"Flow_1omx17n\">\n        <di:waypoint x=\"750\" y=\"218\" />\n        <di:waypoint x=\"812\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"BPMNShape_startEvent_1\" bpmnElement=\"startEvent_1\">\n        <dc:Bounds x=\"240\" y=\"200\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"247\" y=\"243\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0a06fpe_di\" bpmnElement=\"Activity_0a06fpe\">\n        <dc:Bounds x=\"330\" y=\"178\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0k3kp91_di\" bpmnElement=\"Activity_0k3kp91\">\n        <dc:Bounds x=\"490\" y=\"178\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1yv7km2_di\" bpmnElement=\"Activity_1yv7km2\">\n        <dc:Bounds x=\"650\" y=\"178\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_1vr1neq_di\" bpmnElement=\"Event_1vr1neq\">\n        <dc:Bounds x=\"812\" y=\"200\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"819\" y=\"243\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n', '{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"indep-form\",\"name\":\"节点独立表单示例\",\"process_namespace\":\"http://bpmn.io/schema/bpmn\",\"iseagerexecutionfetch\":false,\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[],\"escalationdefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":276.0,\"y\":236.0},\"upperLeft\":{\"x\":240.0,\"y\":200.0}},\"resourceId\":\"startEvent_1\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"startEvent_1\",\"name\":\"开始\",\"interrupting\":true,\"formproperties\":{\"formProperties\":[{\"id\":\"1622472547203_21841\",\"name\":\"人事姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622553629767_65211\",\"name\":\"人事职位\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472547375_86557\",\"name\":\"人事部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622553629949_3168\",\"name\":\"当前日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622553631752_15562\",\"name\":\"当前时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622553691156_69886\",\"name\":\"人事姓名和日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472547780_5707\",\"name\":\"经理姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472547975_90560\",\"name\":\"经理部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472548372_60141\",\"name\":\"老板姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472548560_32474\",\"name\":\"老板部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0u2w7hr\"}]},{\"bounds\":{\"lowerRight\":{\"x\":430.0,\"y\":258.0},\"upperLeft\":{\"x\":330.0,\"y\":178.0}},\"resourceId\":\"Activity_0a06fpe\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_0a06fpe\",\"name\":\"节点1\",\"formproperties\":{\"formProperties\":[{\"id\":\"datetime\",\"name\":\"请假时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"days\",\"name\":\"请假天数\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"reason\",\"name\":\"请假理由\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1gfy6oq\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0u2w7hr\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":18.0,\"y\":18.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_0a06fpe\"}],\"target\":{\"resourceId\":\"Activity_0a06fpe\"},\"properties\":{\"overrideid\":\"Flow_0u2w7hr\"}},{\"bounds\":{\"lowerRight\":{\"x\":590.0,\"y\":258.0},\"upperLeft\":{\"x\":490.0,\"y\":178.0}},\"resourceId\":\"Activity_0k3kp91\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_0k3kp91\",\"name\":\"节点2\",\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_016wlba\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1gfy6oq\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_0k3kp91\"}],\"target\":{\"resourceId\":\"Activity_0k3kp91\"},\"properties\":{\"overrideid\":\"Flow_1gfy6oq\"}},{\"bounds\":{\"lowerRight\":{\"x\":750.0,\"y\":258.0},\"upperLeft\":{\"x\":650.0,\"y\":178.0}},\"resourceId\":\"Activity_1yv7km2\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_1yv7km2\",\"name\":\"汇总\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1omx17n\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_016wlba\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_1yv7km2\"}],\"target\":{\"resourceId\":\"Activity_1yv7km2\"},\"properties\":{\"overrideid\":\"Flow_016wlba\"}},{\"bounds\":{\"lowerRight\":{\"x\":848.0,\"y\":236.0},\"upperLeft\":{\"x\":812.0,\"y\":200.0}},\"resourceId\":\"Event_1vr1neq\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"Event_1vr1neq\",\"name\":\"结束\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1omx17n\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":18.0,\"y\":18.0}],\"outgoing\":[{\"resourceId\":\"Event_1vr1neq\"}],\"target\":{\"resourceId\":\"Event_1vr1neq\"},\"properties\":{\"overrideid\":\"Flow_1omx17n\"}}]}', NULL, 0, '000000');
INSERT INTO `ACT_DE_MODEL` VALUES ('fb4c1a6a8c4588779a2519a547966846', '测试默认值', 'test-default-values', 'default-value', NULL, NULL, NULL, '2021-05-31 21:39:46.545000', '1123598821738675201', '2021-07-23 14:22:04.176000', '1123598821738675201', 1, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" targetNamespace=\"http://bpmn.io/schema/bpmn\">\n  <process id=\"test-default-values\" name=\"测试默认值\" isExecutable=\"true\" flowable:rollbackNode=\"Activity_0p2hxfq\">\n    <startEvent id=\"startEvent_1\" name=\"开始\">\n      <extensionElements>\n        <flowable:formProperty id=\"1622472547203_21841\" name=\"人事姓名\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553629767_65211\" name=\"人事职位\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472547375_86557\" name=\"人事部门\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553629949_3168\" name=\"当前日期\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553631752_15562\" name=\"当前时间\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553691156_69886\" name=\"人事姓名和日期\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472547780_5707\" name=\"经理姓名\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472547975_90560\" name=\"经理部门\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472548372_60141\" name=\"老板姓名\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472548560_32474\" name=\"老板部门\" readable=\"true\" writable=\"false\" />\n      </extensionElements>\n      <outgoing>Flow_0c932wc</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_0p2hxfq\" name=\"人事\" flowable:assignee=\"1123598821738675201\">\n      <extensionElements>\n        <flowable:formProperty id=\"1622472547203_21841\" name=\"人事姓名\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622553629767_65211\" name=\"人事职位\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472547375_86557\" name=\"人事部门\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622553629949_3168\" name=\"当前日期\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622553631752_15562\" name=\"当前时间\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622553691156_69886\" name=\"人事姓名和日期\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472547780_5707\" name=\"经理姓名\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472547975_90560\" name=\"经理部门\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472548372_60141\" name=\"老板姓名\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472548560_32474\" name=\"老板部门\" readable=\"true\" writable=\"false\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0c932wc</incoming>\n      <outgoing>Flow_042y9oy</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0c932wc\" sourceRef=\"startEvent_1\" targetRef=\"Activity_0p2hxfq\" />\n    <userTask id=\"Activity_0p0q6jd\" name=\"经理\" flowable:assignee=\"1123598821738675203\">\n      <extensionElements>\n        <flowable:formProperty id=\"1622472547203_21841\" name=\"人事姓名\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553629767_65211\" name=\"人事职位\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472547375_86557\" name=\"人事部门\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553629949_3168\" name=\"当前日期\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553631752_15562\" name=\"当前时间\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553691156_69886\" name=\"人事姓名和日期\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472547780_5707\" name=\"经理姓名\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472547975_90560\" name=\"经理部门\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472548372_60141\" name=\"老板姓名\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472548560_32474\" name=\"老板部门\" readable=\"true\" writable=\"false\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_042y9oy</incoming>\n      <outgoing>Flow_0c47aum</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_042y9oy\" sourceRef=\"Activity_0p2hxfq\" targetRef=\"Activity_0p0q6jd\" />\n    <userTask id=\"Activity_1dj1hpj\" name=\"老板\" flowable:assignee=\"1123598821738675204\">\n      <extensionElements>\n        <flowable:formProperty id=\"1622472547203_21841\" name=\"人事姓名\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553629767_65211\" name=\"人事职位\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472547375_86557\" name=\"人事部门\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553629949_3168\" name=\"当前日期\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553631752_15562\" name=\"当前时间\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622553691156_69886\" name=\"人事姓名和日期\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472547780_5707\" name=\"经理姓名\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472547975_90560\" name=\"经理部门\" readable=\"true\" writable=\"false\" />\n        <flowable:formProperty id=\"1622472548372_60141\" name=\"老板姓名\" readable=\"true\" writable=\"true\" />\n        <flowable:formProperty id=\"1622472548560_32474\" name=\"老板部门\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0c47aum</incoming>\n      <outgoing>Flow_1ehhsly</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0c47aum\" sourceRef=\"Activity_0p0q6jd\" targetRef=\"Activity_1dj1hpj\" />\n    <endEvent id=\"Event_03anpp1\">\n      <incoming>Flow_1ehhsly</incoming>\n    </endEvent>\n    <sequenceFlow id=\"Flow_1ehhsly\" sourceRef=\"Activity_1dj1hpj\" targetRef=\"Event_03anpp1\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"test-default-values\">\n      <bpmndi:BPMNEdge id=\"Flow_1ehhsly_di\" bpmnElement=\"Flow_1ehhsly\">\n        <di:waypoint x=\"720\" y=\"215\" />\n        <di:waypoint x=\"772\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0c47aum_di\" bpmnElement=\"Flow_0c47aum\">\n        <di:waypoint x=\"570\" y=\"215\" />\n        <di:waypoint x=\"620\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_042y9oy_di\" bpmnElement=\"Flow_042y9oy\">\n        <di:waypoint x=\"420\" y=\"215\" />\n        <di:waypoint x=\"470\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0c932wc_di\" bpmnElement=\"Flow_0c932wc\">\n        <di:waypoint x=\"270\" y=\"215\" />\n        <di:waypoint x=\"320\" y=\"215\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"BPMNShape_startEvent_1\" bpmnElement=\"startEvent_1\">\n        <dc:Bounds x=\"240\" y=\"200\" width=\"30\" height=\"30\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"243\" y=\"237\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0p2hxfq_di\" bpmnElement=\"Activity_0p2hxfq\">\n        <dc:Bounds x=\"320\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_0p0q6jd_di\" bpmnElement=\"Activity_0p0q6jd\">\n        <dc:Bounds x=\"470\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1dj1hpj_di\" bpmnElement=\"Activity_1dj1hpj\">\n        <dc:Bounds x=\"620\" y=\"175\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_03anpp1_di\" bpmnElement=\"Event_03anpp1\">\n        <dc:Bounds x=\"772\" y=\"197\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n', '{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"test-default-values\",\"name\":\"测试默认值\",\"process_namespace\":\"http://bpmn.io/schema/bpmn\",\"iseagerexecutionfetch\":false,\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[],\"escalationdefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":270.0,\"y\":230.0},\"upperLeft\":{\"x\":240.0,\"y\":200.0}},\"resourceId\":\"startEvent_1\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"startEvent_1\",\"name\":\"开始\",\"interrupting\":true,\"formproperties\":{\"formProperties\":[{\"id\":\"1622472547203_21841\",\"name\":\"人事姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553629767_65211\",\"name\":\"人事职位\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472547375_86557\",\"name\":\"人事部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553629949_3168\",\"name\":\"当前日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553631752_15562\",\"name\":\"当前时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553691156_69886\",\"name\":\"人事姓名和日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472547780_5707\",\"name\":\"经理姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472547975_90560\",\"name\":\"经理部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472548372_60141\",\"name\":\"老板姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472548560_32474\",\"name\":\"老板部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0c932wc\"}]},{\"bounds\":{\"lowerRight\":{\"x\":420.0,\"y\":255.0},\"upperLeft\":{\"x\":320.0,\"y\":175.0}},\"resourceId\":\"Activity_0p2hxfq\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_0p2hxfq\",\"name\":\"人事\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"1123598821738675201\"}},\"formproperties\":{\"formProperties\":[{\"id\":\"1622472547203_21841\",\"name\":\"人事姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622553629767_65211\",\"name\":\"人事职位\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472547375_86557\",\"name\":\"人事部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622553629949_3168\",\"name\":\"当前日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622553631752_15562\",\"name\":\"当前时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622553691156_69886\",\"name\":\"人事姓名和日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472547780_5707\",\"name\":\"经理姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472547975_90560\",\"name\":\"经理部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472548372_60141\",\"name\":\"老板姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472548560_32474\",\"name\":\"老板部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_042y9oy\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0c932wc\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":15.0,\"y\":15.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_0p2hxfq\"}],\"target\":{\"resourceId\":\"Activity_0p2hxfq\"},\"properties\":{\"overrideid\":\"Flow_0c932wc\"}},{\"bounds\":{\"lowerRight\":{\"x\":570.0,\"y\":255.0},\"upperLeft\":{\"x\":470.0,\"y\":175.0}},\"resourceId\":\"Activity_0p0q6jd\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_0p0q6jd\",\"name\":\"经理\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"1123598821738675203\"}},\"formproperties\":{\"formProperties\":[{\"id\":\"1622472547203_21841\",\"name\":\"人事姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553629767_65211\",\"name\":\"人事职位\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472547375_86557\",\"name\":\"人事部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553629949_3168\",\"name\":\"当前日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553631752_15562\",\"name\":\"当前时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553691156_69886\",\"name\":\"人事姓名和日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472547780_5707\",\"name\":\"经理姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472547975_90560\",\"name\":\"经理部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472548372_60141\",\"name\":\"老板姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472548560_32474\",\"name\":\"老板部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0c47aum\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_042y9oy\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_0p0q6jd\"}],\"target\":{\"resourceId\":\"Activity_0p0q6jd\"},\"properties\":{\"overrideid\":\"Flow_042y9oy\"}},{\"bounds\":{\"lowerRight\":{\"x\":720.0,\"y\":255.0},\"upperLeft\":{\"x\":620.0,\"y\":175.0}},\"resourceId\":\"Activity_1dj1hpj\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_1dj1hpj\",\"name\":\"老板\",\"usertaskassignment\":{\"assignment\":{\"type\":\"static\",\"assignee\":\"1123598821738675204\"}},\"formproperties\":{\"formProperties\":[{\"id\":\"1622472547203_21841\",\"name\":\"人事姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553629767_65211\",\"name\":\"人事职位\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472547375_86557\",\"name\":\"人事部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553629949_3168\",\"name\":\"当前日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553631752_15562\",\"name\":\"当前时间\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622553691156_69886\",\"name\":\"人事姓名和日期\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472547780_5707\",\"name\":\"经理姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472547975_90560\",\"name\":\"经理部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":false},{\"id\":\"1622472548372_60141\",\"name\":\"老板姓名\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true},{\"id\":\"1622472548560_32474\",\"name\":\"老板部门\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1ehhsly\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0c47aum\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_1dj1hpj\"}],\"target\":{\"resourceId\":\"Activity_1dj1hpj\"},\"properties\":{\"overrideid\":\"Flow_0c47aum\"}},{\"bounds\":{\"lowerRight\":{\"x\":808.0,\"y\":233.0},\"upperLeft\":{\"x\":772.0,\"y\":197.0}},\"resourceId\":\"Event_03anpp1\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"Event_03anpp1\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1ehhsly\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":18.0,\"y\":18.0}],\"outgoing\":[{\"resourceId\":\"Event_03anpp1\"}],\"target\":{\"resourceId\":\"Event_03anpp1\"},\"properties\":{\"overrideid\":\"Flow_1ehhsly\"}}]}', NULL, 0, '000000');
INSERT INTO `ACT_DE_MODEL` VALUES ('617167d80b6051708484bbedfb72a137', '人员/流转调用自定义方法示例', 'demo-custom-method', 'demo-test', NULL, '人员/流转调用自定义方法示例', NULL, '2021-11-29 09:42:20.068000', '1123598821738675201', '2021-12-01 19:18:18.463000', '1123598821738675201', 1, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:dc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:di=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:camunda=\"http://camunda.org/schema/1.0/bpmn\" targetNamespace=\"http://bpmn.io/schema/bpmn\">\n  <process id=\"demo-custom-method\" name=\"人员/流转调用自定义方法示例\" isExecutable=\"true\" flowable:skipFirstNode=\"true\" flowable:rollbackNode=\"Activity_06t0e98\">\n    <documentation>人员/流转调用自定义方法示例</documentation>\n    <startEvent id=\"startEvent_1\" name=\"开始\">\n      <extensionElements>\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n      </extensionElements>\n      <outgoing>Flow_0yhobgw</outgoing>\n    </startEvent>\n    <userTask id=\"Activity_06t0e98\" name=\"发起人\">\n      <extensionElements>\n        <flowable:assignee type=\"custom\" value=\"applyUser\" text=\"流程发起人\" />\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0yhobgw</incoming>\n      <outgoing>Flow_1t6zwdf</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0yhobgw\" sourceRef=\"startEvent_1\" targetRef=\"Activity_06t0e98\" />\n    <userTask id=\"Activity_07ghy8s\" name=\"方式1\">\n      <extensionElements>\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n        <flowable:assignee type=\"custom\" value=\"${wfCustomUserHandler.userList(execution, &#39;自定义参数&#39;)}\" text=\"${wfCustomUserHandler.userList(execution, &#39;自定义参数&#39;)}\" />\n      </extensionElements>\n      <incoming>Flow_1t6zwdf</incoming>\n      <outgoing>Flow_0kxxs74</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_1t6zwdf\" sourceRef=\"Activity_06t0e98\" targetRef=\"Activity_07ghy8s\" />\n    <userTask id=\"Activity_10810pv\" name=\"方式2\">\n      <extensionElements>\n        <flowable:assignee type=\"custom\" value=\"${wfCustomUserHandler.strList(execution, &#39;自定义参数&#39;)}\" text=\"${wfCustomUserHandler.strList(execution, &#39;自定义参数&#39;)}\" />\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0kxxs74</incoming>\n      <outgoing>Flow_01h467o</outgoing>\n    </userTask>\n    <sequenceFlow id=\"Flow_0kxxs74\" sourceRef=\"Activity_07ghy8s\" targetRef=\"Activity_10810pv\" />\n    <userTask id=\"Activity_1i46ta4\" name=\"方式3\">\n      <extensionElements>\n        <flowable:assignee type=\"custom\" value=\"${wfCustomUserHandler.longList(execution, &#39;自定义参数&#39;)}\" text=\"${wfCustomUserHandler.longList(execution, &#39;自定义参数&#39;)}\" />\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0kdt4xu</incoming>\n      <outgoing>Flow_1x5wxzy</outgoing>\n    </userTask>\n    <userTask id=\"Activity_03trwm6\" name=\"方式4\">\n      <extensionElements>\n        <flowable:assignee type=\"custom\" value=\"${wfCustomUserHandler.str(execution, &#39;自定义参数&#39;)}\" text=\"${wfCustomUserHandler.str(execution, &#39;自定义参数&#39;)}\" />\n        <flowable:formProperty id=\"1624624365132_23209\" name=\"单行文本\" readable=\"true\" writable=\"true\" />\n        <flowable:button label=\"通过\" prop=\"wf_pass\" display=\"true\" />\n        <flowable:button label=\"驳回\" prop=\"wf_reject\" display=\"true\" />\n        <flowable:button label=\"打印\" prop=\"wf_print\" display=\"true\" />\n        <flowable:button label=\"转办\" prop=\"wf_transfer\" display=\"true\" />\n        <flowable:button label=\"委托\" prop=\"wf_delegate\" display=\"true\" />\n        <flowable:button label=\"终止\" prop=\"wf_terminate\" display=\"true\" />\n        <flowable:button label=\"加签\" prop=\"wf_add_instance\" display=\"true\" />\n        <flowable:button label=\"减签\" prop=\"wf_del_instance\" display=\"true\" />\n        <flowable:button label=\"指定回退\" prop=\"wf_rollback\" display=\"true\" />\n      </extensionElements>\n      <incoming>Flow_0jw1ae2</incoming>\n      <outgoing>Flow_00r5t9o</outgoing>\n    </userTask>\n    <endEvent id=\"Event_0uefnoo\">\n      <incoming>Flow_1fun2ye</incoming>\n    </endEvent>\n    <exclusiveGateway id=\"Gateway_0mtj57e\">\n      <incoming>Flow_01h467o</incoming>\n      <outgoing>Flow_0kdt4xu</outgoing>\n      <outgoing>Flow_0jw1ae2</outgoing>\n    </exclusiveGateway>\n    <sequenceFlow id=\"Flow_01h467o\" sourceRef=\"Activity_10810pv\" targetRef=\"Gateway_0mtj57e\" />\n    <sequenceFlow id=\"Flow_0kdt4xu\" sourceRef=\"Gateway_0mtj57e\" targetRef=\"Activity_1i46ta4\">\n      <conditionExpression xsi:type=\"tFormalExpression\">${wfCustomUserHandler.condition(execution, \'对\')}</conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"Flow_0jw1ae2\" sourceRef=\"Gateway_0mtj57e\" targetRef=\"Activity_03trwm6\">\n      <conditionExpression xsi:type=\"tFormalExpression\">${wfCustomUserHandler.condition(execution, \'错\')}</conditionExpression>\n    </sequenceFlow>\n    <exclusiveGateway id=\"Gateway_0ha0m7b\">\n      <incoming>Flow_1x5wxzy</incoming>\n      <incoming>Flow_00r5t9o</incoming>\n      <outgoing>Flow_1fun2ye</outgoing>\n    </exclusiveGateway>\n    <sequenceFlow id=\"Flow_1x5wxzy\" sourceRef=\"Activity_1i46ta4\" targetRef=\"Gateway_0ha0m7b\" />\n    <sequenceFlow id=\"Flow_1fun2ye\" sourceRef=\"Gateway_0ha0m7b\" targetRef=\"Event_0uefnoo\" />\n    <sequenceFlow id=\"Flow_00r5t9o\" sourceRef=\"Activity_03trwm6\" targetRef=\"Gateway_0ha0m7b\" />\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_flow\">\n    <bpmndi:BPMNPlane id=\"BPMNPlane_flow\" bpmnElement=\"demo-custom-method\">\n      <bpmndi:BPMNEdge id=\"Flow_0kxxs74_di\" bpmnElement=\"Flow_0kxxs74\">\n        <di:waypoint x=\"590\" y=\"218\" />\n        <di:waypoint x=\"650\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1t6zwdf_di\" bpmnElement=\"Flow_1t6zwdf\">\n        <di:waypoint x=\"430\" y=\"218\" />\n        <di:waypoint x=\"490\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0yhobgw_di\" bpmnElement=\"Flow_0yhobgw\">\n        <di:waypoint x=\"276\" y=\"218\" />\n        <di:waypoint x=\"330\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_01h467o_di\" bpmnElement=\"Flow_01h467o\">\n        <di:waypoint x=\"750\" y=\"218\" />\n        <di:waypoint x=\"815\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0kdt4xu_di\" bpmnElement=\"Flow_0kdt4xu\">\n        <di:waypoint x=\"840\" y=\"193\" />\n        <di:waypoint x=\"840\" y=\"90\" />\n        <di:waypoint x=\"910\" y=\"90\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_0jw1ae2_di\" bpmnElement=\"Flow_0jw1ae2\">\n        <di:waypoint x=\"840\" y=\"243\" />\n        <di:waypoint x=\"840\" y=\"360\" />\n        <di:waypoint x=\"910\" y=\"360\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1x5wxzy_di\" bpmnElement=\"Flow_1x5wxzy\">\n        <di:waypoint x=\"1010\" y=\"90\" />\n        <di:waypoint x=\"1080\" y=\"90\" />\n        <di:waypoint x=\"1080\" y=\"193\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_1fun2ye_di\" bpmnElement=\"Flow_1fun2ye\">\n        <di:waypoint x=\"1105\" y=\"218\" />\n        <di:waypoint x=\"1142\" y=\"218\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge id=\"Flow_00r5t9o_di\" bpmnElement=\"Flow_00r5t9o\">\n        <di:waypoint x=\"1010\" y=\"360\" />\n        <di:waypoint x=\"1080\" y=\"360\" />\n        <di:waypoint x=\"1080\" y=\"243\" />\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNShape id=\"BPMNShape_startEvent_1\" bpmnElement=\"startEvent_1\">\n        <dc:Bounds x=\"240\" y=\"200\" width=\"36\" height=\"36\" />\n        <bpmndi:BPMNLabel>\n          <dc:Bounds x=\"248\" y=\"243\" width=\"22\" height=\"14\" />\n        </bpmndi:BPMNLabel>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_06t0e98_di\" bpmnElement=\"Activity_06t0e98\">\n        <dc:Bounds x=\"330\" y=\"178\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_07ghy8s_di\" bpmnElement=\"Activity_07ghy8s\">\n        <dc:Bounds x=\"490\" y=\"178\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_10810pv_di\" bpmnElement=\"Activity_10810pv\">\n        <dc:Bounds x=\"650\" y=\"178\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_0mtj57e_di\" bpmnElement=\"Gateway_0mtj57e\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"815\" y=\"193\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_1i46ta4_di\" bpmnElement=\"Activity_1i46ta4\">\n        <dc:Bounds x=\"910\" y=\"50\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Activity_03trwm6_di\" bpmnElement=\"Activity_03trwm6\">\n        <dc:Bounds x=\"910\" y=\"320\" width=\"100\" height=\"80\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Gateway_0ha0m7b_di\" bpmnElement=\"Gateway_0ha0m7b\" isMarkerVisible=\"true\">\n        <dc:Bounds x=\"1055\" y=\"193\" width=\"50\" height=\"50\" />\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape id=\"Event_0uefnoo_di\" bpmnElement=\"Event_0uefnoo\">\n        <dc:Bounds x=\"1142\" y=\"200\" width=\"36\" height=\"36\" />\n      </bpmndi:BPMNShape>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n', '{\"bounds\":{\"lowerRight\":{\"x\":1485.0,\"y\":700.0},\"upperLeft\":{\"x\":0.0,\"y\":0.0}},\"resourceId\":\"canvas\",\"stencil\":{\"id\":\"BPMNDiagram\"},\"stencilset\":{\"namespace\":\"http://b3mn.org/stencilset/bpmn2.0#\",\"url\":\"../editor/stencilsets/bpmn2.0/bpmn2.0.json\"},\"properties\":{\"process_id\":\"demo-custom-method\",\"name\":\"人员/流转调用自定义方法示例\",\"documentation\":\"人员/流转调用自定义方法示例\",\"process_namespace\":\"http://bpmn.io/schema/bpmn\",\"iseagerexecutionfetch\":false,\"messages\":[],\"executionlisteners\":{\"executionListeners\":[]},\"eventlisteners\":{\"eventListeners\":[]},\"signaldefinitions\":[],\"messagedefinitions\":[],\"escalationdefinitions\":[]},\"childShapes\":[{\"bounds\":{\"lowerRight\":{\"x\":276.0,\"y\":236.0},\"upperLeft\":{\"x\":240.0,\"y\":200.0}},\"resourceId\":\"startEvent_1\",\"childShapes\":[],\"stencil\":{\"id\":\"StartNoneEvent\"},\"properties\":{\"overrideid\":\"startEvent_1\",\"name\":\"开始\",\"interrupting\":true,\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0yhobgw\"}]},{\"bounds\":{\"lowerRight\":{\"x\":430.0,\"y\":258.0},\"upperLeft\":{\"x\":330.0,\"y\":178.0}},\"resourceId\":\"Activity_06t0e98\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_06t0e98\",\"name\":\"发起人\",\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1t6zwdf\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0yhobgw\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":18.0,\"y\":18.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_06t0e98\"}],\"target\":{\"resourceId\":\"Activity_06t0e98\"},\"properties\":{\"overrideid\":\"Flow_0yhobgw\"}},{\"bounds\":{\"lowerRight\":{\"x\":590.0,\"y\":258.0},\"upperLeft\":{\"x\":490.0,\"y\":178.0}},\"resourceId\":\"Activity_07ghy8s\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_07ghy8s\",\"name\":\"方式1\",\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0kxxs74\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1t6zwdf\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_07ghy8s\"}],\"target\":{\"resourceId\":\"Activity_07ghy8s\"},\"properties\":{\"overrideid\":\"Flow_1t6zwdf\"}},{\"bounds\":{\"lowerRight\":{\"x\":750.0,\"y\":258.0},\"upperLeft\":{\"x\":650.0,\"y\":178.0}},\"resourceId\":\"Activity_10810pv\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_10810pv\",\"name\":\"方式2\",\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_01h467o\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0kxxs74\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_10810pv\"}],\"target\":{\"resourceId\":\"Activity_10810pv\"},\"properties\":{\"overrideid\":\"Flow_0kxxs74\"}},{\"bounds\":{\"lowerRight\":{\"x\":1010.0,\"y\":130.0},\"upperLeft\":{\"x\":910.0,\"y\":50.0}},\"resourceId\":\"Activity_1i46ta4\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_1i46ta4\",\"name\":\"方式3\",\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1x5wxzy\"}]},{\"bounds\":{\"lowerRight\":{\"x\":1010.0,\"y\":400.0},\"upperLeft\":{\"x\":910.0,\"y\":320.0}},\"resourceId\":\"Activity_03trwm6\",\"childShapes\":[],\"stencil\":{\"id\":\"UserTask\"},\"properties\":{\"overrideid\":\"Activity_03trwm6\",\"name\":\"方式4\",\"formproperties\":{\"formProperties\":[{\"id\":\"1624624365132_23209\",\"name\":\"单行文本\",\"type\":null,\"expression\":null,\"variable\":null,\"default\":null,\"required\":false,\"readable\":true,\"writable\":true}]},\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"isforcompensation\":false,\"tasklisteners\":{\"taskListeners\":[]},\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_00r5t9o\"}]},{\"bounds\":{\"lowerRight\":{\"x\":1178.0,\"y\":236.0},\"upperLeft\":{\"x\":1142.0,\"y\":200.0}},\"resourceId\":\"Event_0uefnoo\",\"childShapes\":[],\"stencil\":{\"id\":\"EndNoneEvent\"},\"properties\":{\"overrideid\":\"Event_0uefnoo\",\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[]},{\"bounds\":{\"lowerRight\":{\"x\":865.0,\"y\":243.0},\"upperLeft\":{\"x\":815.0,\"y\":193.0}},\"resourceId\":\"Gateway_0mtj57e\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"Gateway_0mtj57e\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_0kdt4xu\"},{\"resourceId\":\"Flow_0jw1ae2\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_01h467o\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":25.0,\"y\":25.0}],\"outgoing\":[{\"resourceId\":\"Gateway_0mtj57e\"}],\"target\":{\"resourceId\":\"Gateway_0mtj57e\"},\"properties\":{\"overrideid\":\"Flow_01h467o\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0kdt4xu\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":25.0,\"y\":25.0},{\"x\":840.0,\"y\":90.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_1i46ta4\"}],\"target\":{\"resourceId\":\"Activity_1i46ta4\"},\"properties\":{\"overrideid\":\"Flow_0kdt4xu\",\"conditionsequenceflow\":\"${wfCustomUserHandler.condition(execution, \'对\')}\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_0jw1ae2\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":25.0,\"y\":25.0},{\"x\":840.0,\"y\":360.0},{\"x\":50.0,\"y\":40.0}],\"outgoing\":[{\"resourceId\":\"Activity_03trwm6\"}],\"target\":{\"resourceId\":\"Activity_03trwm6\"},\"properties\":{\"overrideid\":\"Flow_0jw1ae2\",\"conditionsequenceflow\":\"${wfCustomUserHandler.condition(execution, \'错\')}\"}},{\"bounds\":{\"lowerRight\":{\"x\":1105.0,\"y\":243.0},\"upperLeft\":{\"x\":1055.0,\"y\":193.0}},\"resourceId\":\"Gateway_0ha0m7b\",\"childShapes\":[],\"stencil\":{\"id\":\"ExclusiveGateway\"},\"properties\":{\"overrideid\":\"Gateway_0ha0m7b\",\"asynchronousdefinition\":false,\"exclusivedefinition\":true,\"executionlisteners\":{\"executionListeners\":[]}},\"outgoing\":[{\"resourceId\":\"Flow_1fun2ye\"}]},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1x5wxzy\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":1080.0,\"y\":90.0},{\"x\":25.0,\"y\":25.0}],\"outgoing\":[{\"resourceId\":\"Gateway_0ha0m7b\"}],\"target\":{\"resourceId\":\"Gateway_0ha0m7b\"},\"properties\":{\"overrideid\":\"Flow_1x5wxzy\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_1fun2ye\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":25.0,\"y\":25.0},{\"x\":18.0,\"y\":18.0}],\"outgoing\":[{\"resourceId\":\"Event_0uefnoo\"}],\"target\":{\"resourceId\":\"Event_0uefnoo\"},\"properties\":{\"overrideid\":\"Flow_1fun2ye\"}},{\"bounds\":{\"lowerRight\":{\"x\":172.0,\"y\":212.0},\"upperLeft\":{\"x\":128.0,\"y\":212.0}},\"resourceId\":\"Flow_00r5t9o\",\"childShapes\":[],\"stencil\":{\"id\":\"SequenceFlow\"},\"dockers\":[{\"x\":50.0,\"y\":40.0},{\"x\":1080.0,\"y\":360.0},{\"x\":25.0,\"y\":25.0}],\"outgoing\":[{\"resourceId\":\"Gateway_0ha0m7b\"}],\"target\":{\"resourceId\":\"Gateway_0ha0m7b\"},\"properties\":{\"overrideid\":\"Flow_00r5t9o\"}}]}', NULL, 0, '000000');
COMMIT;

-- ----------------------------
-- Table structure for ACT_DE_MODEL_HISTORY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DE_MODEL_HISTORY`;
CREATE TABLE `ACT_DE_MODEL_HISTORY` (
                                        `id` varchar(255) NOT NULL,
                                        `name` varchar(400) NOT NULL COMMENT '名称',
                                        `model_key` varchar(400) NOT NULL COMMENT '模型标识',
                                        `form_key` varchar(255) DEFAULT NULL COMMENT '表单标识',
                                        `category_id` bigint(64) DEFAULT NULL COMMENT '分类id',
                                        `description` varchar(4000) DEFAULT NULL COMMENT '描述',
                                        `model_comment` varchar(4000) DEFAULT NULL COMMENT '注释',
                                        `created` datetime(6) DEFAULT NULL COMMENT '创建时间',
                                        `created_by` varchar(255) DEFAULT NULL COMMENT '创建人',
                                        `last_updated` datetime(6) DEFAULT NULL COMMENT '最后更新时间',
                                        `last_updated_by` varchar(255) DEFAULT NULL COMMENT '最后更新人',
                                        `removal_date` datetime(6) DEFAULT NULL COMMENT '移除时间',
                                        `version` int(11) DEFAULT NULL COMMENT '版本',
                                        `xml` longtext COMMENT 'xml',
                                        `model_editor_json` longtext COMMENT 'flowable-ui编辑器json',
                                        `model_id` varchar(255) NOT NULL COMMENT 'modelId',
                                        `model_type` int(11) DEFAULT NULL COMMENT '类型',
                                        `tenant_id` varchar(255) DEFAULT NULL COMMENT '租户id',
                                        PRIMARY KEY (`id`) USING BTREE,
                                        KEY `idx_proc_mod_history_proc` (`model_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程 - 定义 - 模型历史';

-- ----------------------------
-- Records of ACT_DE_MODEL_HISTORY
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_DE_MODEL_RELATION
-- ----------------------------
DROP TABLE IF EXISTS `ACT_DE_MODEL_RELATION`;
CREATE TABLE `ACT_DE_MODEL_RELATION` (
                                         `id` varchar(255) NOT NULL,
                                         `parent_model_id` varchar(255) DEFAULT NULL,
                                         `model_id` varchar(255) DEFAULT NULL,
                                         `relation_type` varchar(255) DEFAULT NULL,
                                         PRIMARY KEY (`id`) USING BTREE,
                                         KEY `fk_relation_parent` (`parent_model_id`) USING BTREE,
                                         KEY `fk_relation_child` (`model_id`) USING BTREE,
                                         CONSTRAINT `act_de_model_relation_ibfk_1` FOREIGN KEY (`model_id`) REFERENCES `ACT_DE_MODEL` (`id`),
                                         CONSTRAINT `act_de_model_relation_ibfk_2` FOREIGN KEY (`parent_model_id`) REFERENCES `ACT_DE_MODEL` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ACT_DE_MODEL_RELATION
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_EVT_LOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_EVT_LOG`;
CREATE TABLE `ACT_EVT_LOG` (
                               `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
                               `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
                               `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `DATA_` longblob,
                               `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
                               `IS_PROCESSED_` tinyint(4) DEFAULT '0',
                               PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_EVT_LOG
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_GE_BYTEARRAY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_BYTEARRAY`;
CREATE TABLE `ACT_GE_BYTEARRAY` (
                                    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                    `REV_` int(11) DEFAULT NULL,
                                    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `BYTES_` longblob,
                                    `GENERATED_` tinyint(4) DEFAULT NULL,
                                    PRIMARY KEY (`ID_`),
                                    KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
                                    CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_GE_BYTEARRAY
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_GE_PROPERTY
-- ----------------------------
DROP TABLE IF EXISTS `ACT_GE_PROPERTY`;
CREATE TABLE `ACT_GE_PROPERTY` (
                                   `NAME_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
                                   `REV_` int(11) DEFAULT NULL,
                                   PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_GE_PROPERTY
-- ----------------------------
BEGIN;
INSERT INTO `ACT_GE_PROPERTY` VALUES ('batch.schema.version', '6.6.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('cfg.execution-related-entities-count', 'true', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('cfg.task-related-entities-count', 'true', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('common.schema.version', '6.6.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('entitylink.schema.version', '6.6.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('eventsubscription.schema.version', '6.6.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('identitylink.schema.version', '6.6.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('job.schema.version', '6.6.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('next.dbid', '1', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('schema.history', 'create(6.6.0.0)', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('schema.version', '6.6.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('task.schema.version', '6.6.0.0', 1);
INSERT INTO `ACT_GE_PROPERTY` VALUES ('variable.schema.version', '6.6.0.0', 1);
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_ACTINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ACTINST`;
CREATE TABLE `ACT_HI_ACTINST` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `REV_` int(11) DEFAULT '1',
                                  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `START_TIME_` datetime(3) NOT NULL,
                                  `END_TIME_` datetime(3) DEFAULT NULL,
                                  `TRANSACTION_ORDER_` int(11) DEFAULT NULL,
                                  `DURATION_` bigint(20) DEFAULT NULL,
                                  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
                                  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
                                  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
                                  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_ACTINST
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_ATTACHMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ATTACHMENT`;
CREATE TABLE `ACT_HI_ATTACHMENT` (
                                     `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `REV_` int(11) DEFAULT NULL,
                                     `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                     `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                     `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `TIME_` datetime(3) DEFAULT NULL,
                                     PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_ATTACHMENT
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_COMMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_COMMENT`;
CREATE TABLE `ACT_HI_COMMENT` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `TIME_` datetime(3) NOT NULL,
                                  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `FULL_MSG_` longblob,
                                  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_COMMENT
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_DETAIL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_DETAIL`;
CREATE TABLE `ACT_HI_DETAIL` (
                                 `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                 `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                 `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
                                 `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                 `REV_` int(11) DEFAULT NULL,
                                 `TIME_` datetime(3) NOT NULL,
                                 `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                 `DOUBLE_` double DEFAULT NULL,
                                 `LONG_` bigint(20) DEFAULT NULL,
                                 `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                 `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                 PRIMARY KEY (`ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
                                 KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
                                 KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
                                 KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_DETAIL
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_ENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_ENTITYLINK`;
CREATE TABLE `ACT_HI_ENTITYLINK` (
                                     `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `CREATE_TIME_` datetime(3) DEFAULT NULL,
                                     `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     PRIMARY KEY (`ID_`),
                                     KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
                                     KEY `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
                                     KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_ENTITYLINK
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_IDENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_IDENTITYLINK`;
CREATE TABLE `ACT_HI_IDENTITYLINK` (
                                       `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `CREATE_TIME_` datetime(3) DEFAULT NULL,
                                       `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       PRIMARY KEY (`ID_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
                                       KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_IDENTITYLINK
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_PROCINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_PROCINST`;
CREATE TABLE `ACT_HI_PROCINST` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `REV_` int(11) DEFAULT '1',
                                   `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `START_TIME_` datetime(3) NOT NULL,
                                   `END_TIME_` datetime(3) DEFAULT NULL,
                                   `DURATION_` bigint(20) DEFAULT NULL,
                                   `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                   `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
                                   KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
                                   KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_PROCINST
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_TASKINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_TASKINST`;
CREATE TABLE `ACT_HI_TASKINST` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `REV_` int(11) DEFAULT '1',
                                   `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `START_TIME_` datetime(3) NOT NULL,
                                   `CLAIM_TIME_` datetime(3) DEFAULT NULL,
                                   `END_TIME_` datetime(3) DEFAULT NULL,
                                   `DURATION_` bigint(20) DEFAULT NULL,
                                   `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `PRIORITY_` int(11) DEFAULT NULL,
                                   `DUE_DATE_` datetime(3) DEFAULT NULL,
                                   `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                   `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                                   KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                                   KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
                                   KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_TASKINST
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_TSK_LOG
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_TSK_LOG`;
CREATE TABLE `ACT_HI_TSK_LOG` (
                                  `ID_` bigint(20) NOT NULL AUTO_INCREMENT,
                                  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `TASK_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
                                  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `DATA_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_TSK_LOG
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_HI_VARINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_HI_VARINST`;
CREATE TABLE `ACT_HI_VARINST` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `REV_` int(11) DEFAULT '1',
                                  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
                                  `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `DOUBLE_` double DEFAULT NULL,
                                  `LONG_` bigint(20) DEFAULT NULL,
                                  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `CREATE_TIME_` datetime(3) DEFAULT NULL,
                                  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
                                  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                                  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                                  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
                                  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
                                  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_HI_VARINST
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_PROCDEF_INFO
-- ----------------------------
DROP TABLE IF EXISTS `ACT_PROCDEF_INFO`;
CREATE TABLE `ACT_PROCDEF_INFO` (
                                    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                    `REV_` int(11) DEFAULT NULL,
                                    `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    PRIMARY KEY (`ID_`),
                                    UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
                                    KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
                                    KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
                                    CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                    CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_PROCDEF_INFO
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RE_DEPLOYMENT
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_DEPLOYMENT`;
CREATE TABLE `ACT_RE_DEPLOYMENT` (
                                     `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                     `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
                                     `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RE_DEPLOYMENT
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RE_MODEL
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_MODEL`;
CREATE TABLE `ACT_RE_MODEL` (
                                `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                `REV_` int(11) DEFAULT NULL,
                                `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
                                `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
                                `VERSION_` int(11) DEFAULT NULL,
                                `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                PRIMARY KEY (`ID_`),
                                KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
                                KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
                                KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
                                CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `ACT_RE_DEPLOYMENT` (`ID_`),
                                CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RE_MODEL
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RE_PROCDEF
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RE_PROCDEF`;
CREATE TABLE `ACT_RE_PROCDEF` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `REV_` int(11) DEFAULT NULL,
                                  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `VERSION_` int(11) NOT NULL,
                                  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
                                  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
                                  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
                                  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `DERIVED_FROM_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `DERIVED_VERSION_` int(11) NOT NULL DEFAULT '0',
                                  PRIMARY KEY (`ID_`),
                                  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RE_PROCDEF
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_ACTINST
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_ACTINST`;
CREATE TABLE `ACT_RU_ACTINST` (
                                  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `REV_` int(11) DEFAULT '1',
                                  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                  `START_TIME_` datetime(3) NOT NULL,
                                  `END_TIME_` datetime(3) DEFAULT NULL,
                                  `DURATION_` bigint(20) DEFAULT NULL,
                                  `TRANSACTION_ORDER_` int(11) DEFAULT NULL,
                                  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                  PRIMARY KEY (`ID_`),
                                  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
                                  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
                                  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
                                  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
                                  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
                                  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_ACTINST
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_DEADLETTER_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_DEADLETTER_JOB`;
CREATE TABLE `ACT_RU_DEADLETTER_JOB` (
                                         `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                         `REV_` int(11) DEFAULT NULL,
                                         `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                         `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
                                         `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                         `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
                                         `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                         `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                         `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                         `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
                                         `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                         PRIMARY KEY (`ID_`),
                                         KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
                                         KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
                                         KEY `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
                                         KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                                         KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                                         KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
                                         KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
                                         KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
                                         KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
                                         CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                         CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                         CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                         CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                         CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_DEADLETTER_JOB
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_ENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_ENTITYLINK`;
CREATE TABLE `ACT_RU_ENTITYLINK` (
                                     `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `REV_` int(11) DEFAULT NULL,
                                     `CREATE_TIME_` datetime(3) DEFAULT NULL,
                                     `LINK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `REF_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `HIERARCHY_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     PRIMARY KEY (`ID_`),
                                     KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
                                     KEY `ACT_IDX_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
                                     KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_ENTITYLINK
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_EVENT_SUBSCR
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EVENT_SUBSCR`;
CREATE TABLE `ACT_RU_EVENT_SUBSCR` (
                                       `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `REV_` int(11) DEFAULT NULL,
                                       `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                       `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
                                       `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                       PRIMARY KEY (`ID_`),
                                       KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
                                       KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
                                       CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_EVENT_SUBSCR
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_EXECUTION
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EXECUTION`;
CREATE TABLE `ACT_RU_EXECUTION` (
                                    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                    `REV_` int(11) DEFAULT NULL,
                                    `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
                                    `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
                                    `IS_SCOPE_` tinyint(4) DEFAULT NULL,
                                    `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
                                    `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
                                    `SUSPENSION_STATE_` int(11) DEFAULT NULL,
                                    `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
                                    `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                    `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `START_TIME_` datetime(3) DEFAULT NULL,
                                    `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
                                    `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
                                    `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
                                    `TASK_COUNT_` int(11) DEFAULT NULL,
                                    `JOB_COUNT_` int(11) DEFAULT NULL,
                                    `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
                                    `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
                                    `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
                                    `EXTERNAL_WORKER_JOB_COUNT_` int(11) DEFAULT NULL,
                                    `VAR_COUNT_` int(11) DEFAULT NULL,
                                    `ID_LINK_COUNT_` int(11) DEFAULT NULL,
                                    `CALLBACK_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `CALLBACK_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `REFERENCE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `REFERENCE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    PRIMARY KEY (`ID_`),
                                    KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
                                    KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
                                    KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
                                    KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
                                    KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
                                    KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
                                    CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE,
                                    CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
                                    CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
                                    CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_EXECUTION
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_EXTERNAL_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_EXTERNAL_JOB`;
CREATE TABLE `ACT_RU_EXTERNAL_JOB` (
                                       `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `REV_` int(11) DEFAULT NULL,
                                       `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                       `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
                                       `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
                                       `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `RETRIES_` int(11) DEFAULT NULL,
                                       `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                       `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
                                       `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                       `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
                                       `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                       PRIMARY KEY (`ID_`),
                                       KEY `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
                                       KEY `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
                                       KEY `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
                                       KEY `ACT_IDX_EJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                                       KEY `ACT_IDX_EJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                                       KEY `ACT_IDX_EJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
                                       CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                       CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_EXTERNAL_JOB
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_HISTORY_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_HISTORY_JOB`;
CREATE TABLE `ACT_RU_HISTORY_JOB` (
                                      `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                      `REV_` int(11) DEFAULT NULL,
                                      `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
                                      `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                      `RETRIES_` int(11) DEFAULT NULL,
                                      `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                      `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                      `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                      `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                      `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                      `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                      `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
                                      `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                      `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                      PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_HISTORY_JOB
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_IDENTITYLINK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_IDENTITYLINK`;
CREATE TABLE `ACT_RU_IDENTITYLINK` (
                                       `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                       `REV_` int(11) DEFAULT NULL,
                                       `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                       PRIMARY KEY (`ID_`),
                                       KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
                                       KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
                                       KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                                       KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                                       KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
                                       KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
                                       KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
                                       KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
                                       CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
                                       CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                       CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `ACT_RU_TASK` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_IDENTITYLINK
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_JOB`;
CREATE TABLE `ACT_RU_JOB` (
                              `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                              `REV_` int(11) DEFAULT NULL,
                              `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                              `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
                              `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
                              `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `RETRIES_` int(11) DEFAULT NULL,
                              `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                              `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
                              `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                              `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                              `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                              `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
                              `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                              PRIMARY KEY (`ID_`),
                              KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
                              KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
                              KEY `ACT_IDX_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
                              KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                              KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                              KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
                              KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
                              KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
                              KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
                              CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                              CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                              CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                              CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                              CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_JOB
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_SUSPENDED_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_SUSPENDED_JOB`;
CREATE TABLE `ACT_RU_SUSPENDED_JOB` (
                                        `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                        `REV_` int(11) DEFAULT NULL,
                                        `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                        `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
                                        `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                        `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                        `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                        `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `RETRIES_` int(11) DEFAULT NULL,
                                        `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                        `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                        `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
                                        `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                        `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                        `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                        `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
                                        `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                        PRIMARY KEY (`ID_`),
                                        KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
                                        KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
                                        KEY `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
                                        KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                                        KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                                        KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
                                        KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
                                        KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
                                        KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
                                        CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                        CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                        CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                        CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                        CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_SUSPENDED_JOB
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_TASK
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_TASK`;
CREATE TABLE `ACT_RU_TASK` (
                               `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                               `REV_` int(11) DEFAULT NULL,
                               `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `TASK_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                               `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                               `PRIORITY_` int(11) DEFAULT NULL,
                               `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
                               `DUE_DATE_` datetime(3) DEFAULT NULL,
                               `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `SUSPENSION_STATE_` int(11) DEFAULT NULL,
                               `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                               `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                               `CLAIM_TIME_` datetime(3) DEFAULT NULL,
                               `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
                               `VAR_COUNT_` int(11) DEFAULT NULL,
                               `ID_LINK_COUNT_` int(11) DEFAULT NULL,
                               `SUB_TASK_COUNT_` int(11) DEFAULT NULL,
                               PRIMARY KEY (`ID_`),
                               KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
                               KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                               KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                               KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
                               KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
                               KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
                               KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
                               CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                               CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`),
                               CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_TASK
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_TIMER_JOB
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_TIMER_JOB`;
CREATE TABLE `ACT_RU_TIMER_JOB` (
                                    `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                    `REV_` int(11) DEFAULT NULL,
                                    `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                    `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
                                    `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
                                    `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `ELEMENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `ELEMENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `CORRELATION_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `RETRIES_` int(11) DEFAULT NULL,
                                    `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                    `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
                                    `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                    `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                    `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                    `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
                                    `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                    PRIMARY KEY (`ID_`),
                                    KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
                                    KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
                                    KEY `ACT_IDX_TIMER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
                                    KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                                    KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                                    KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
                                    KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
                                    KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
                                    KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
                                    CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                    CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                    CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                    CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                    CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `ACT_RE_PROCDEF` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_TIMER_JOB
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for ACT_RU_VARIABLE
-- ----------------------------
DROP TABLE IF EXISTS `ACT_RU_VARIABLE`;
CREATE TABLE `ACT_RU_VARIABLE` (
                                   `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                   `REV_` int(11) DEFAULT NULL,
                                   `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
                                   `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
                                   `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `SUB_SCOPE_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `SCOPE_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                   `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                   `DOUBLE_` double DEFAULT NULL,
                                   `LONG_` bigint(20) DEFAULT NULL,
                                   `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
                                   PRIMARY KEY (`ID_`),
                                   KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
                                   KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
                                   KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
                                   KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
                                   KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
                                   KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
                                   CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `ACT_GE_BYTEARRAY` (`ID_`),
                                   CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`),
                                   CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `ACT_RU_EXECUTION` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of ACT_RU_VARIABLE
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for blade_wf_button
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_button`;
CREATE TABLE `blade_wf_button` (
                                   `id` bigint(64) NOT NULL,
                                   `button_key` varchar(255) DEFAULT NULL COMMENT '按钮key',
                                   `name` varchar(255) DEFAULT NULL COMMENT '名称',
                                   `display` tinyint(1) DEFAULT NULL COMMENT '默认是否显示',
                                   `sort` int(11) DEFAULT NULL COMMENT '排序',
                                   `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
                                   `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
                                   `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                   `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
                                   `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                   `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
                                   `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
                                   `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程按钮';

-- ----------------------------
-- Records of blade_wf_button
-- ----------------------------
BEGIN;
INSERT INTO `blade_wf_button` VALUES (1394176899911041025, 'wf_pass', '通过', 1, 1, 1123598821738675201, 1123598813738675201, '2021-05-16 14:24:10', 1123598821738675201, '2021-05-16 14:24:10', '1', 0, '000000');
INSERT INTO `blade_wf_button` VALUES (1394177198465794050, 'wf_reject', '驳回', 1, 2, 1123598821738675201, 1123598813738675201, '2021-05-16 14:25:21', 1123598821738675201, '2021-05-16 14:25:21', '1', 0, '000000');
INSERT INTO `blade_wf_button` VALUES (1394179125421326337, 'wf_print', '打印', 1, 3, 1123598821738675201, 1123598813738675201, '2021-05-16 14:33:01', 1123598821738675201, '2021-05-16 14:33:01', '1', 0, '000000');
INSERT INTO `blade_wf_button` VALUES (1394609969089761281, 'wf_transfer', '转办', 1, 4, 1123598821738675201, 1123598813738675201, '2021-05-16 19:05:02', 1123598821738675201, '2021-05-16 19:05:02', '1', 0, '000000');
INSERT INTO `blade_wf_button` VALUES (1394610036672581634, 'wf_delegate', '委托', 1, 5, 1123598821738675201, 1123598813738675201, '2021-05-16 19:05:18', 1123598821738675201, '2021-05-16 19:05:18', '1', 0, '000000');
INSERT INTO `blade_wf_button` VALUES (1395271519601426433, 'wf_terminate', '终止', 1, 6, 1123598821738675201, 1123598813738675201, '2021-05-20 14:53:48', 1123598821738675201, '2021-05-20 14:53:48', '1', 0, '000000');
INSERT INTO `blade_wf_button` VALUES (1395274709692579841, 'wf_add_instance', '加签', 1, 7, 1123598821738675201, 1123598813738675201, '2021-05-20 15:06:28', 1123598821738675201, '2021-05-20 15:06:28', '1', 0, '000000');
INSERT INTO `blade_wf_button` VALUES (1395274774674931713, 'wf_del_instance', '减签', 1, 8, 1123598821738675201, 1123598813738675201, '2021-05-20 15:06:44', 1123598821738675201, '2021-05-20 15:06:44', '1', 0, '000000');
INSERT INTO `blade_wf_button` VALUES (1395274955986305025, 'wf_rollback', '指定回退', 1, 9, 1123598821738675201, 1123598813738675201, '2021-05-20 15:07:27', 1123598821738675201, '2021-05-20 15:07:27', '1', 0, '000000');
COMMIT;

-- ----------------------------
-- Table structure for blade_wf_category
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_category`;
CREATE TABLE `blade_wf_category` (
                                     `id` bigint(64) NOT NULL,
                                     `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
                                     `pid` bigint(64) DEFAULT '0' COMMENT '上级id',
                                     `sort` int(11) DEFAULT NULL COMMENT '排序',
                                     `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
                                     `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
                                     `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                     `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
                                     `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                     `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
                                     `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
                                     `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程分类';

-- ----------------------------
-- Records of blade_wf_category
-- ----------------------------
BEGIN;
INSERT INTO `blade_wf_category` VALUES (1394133715940073474, '请假流程', 0, 1, 1123598821738675201, 1123598813738675201, '2021-05-16 11:32:34', 1123598821738675201, '2021-06-25 20:37:49', '1', 0, '000000');
INSERT INTO `blade_wf_category` VALUES (1394158934813609986, '财务流程', 0, 2, 1123598821738675201, 1123598813738675201, '2021-05-16 13:12:47', 1123598821738675201, '2021-05-16 13:13:07', '1', 0, '000000');
INSERT INTO `blade_wf_category` VALUES (1394159147934584833, '报销流程', 1394158934813609986, 1, 1123598821738675201, 1123598813738675201, '2021-05-16 13:13:38', 1123598821738675201, '2021-05-16 13:13:38', '1', 0, '000000');
COMMIT;

-- ----------------------------
-- Table structure for blade_wf_condition
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_condition`;
CREATE TABLE `blade_wf_condition` (
                                      `id` bigint(64) NOT NULL,
                                      `name` varchar(255) DEFAULT NULL COMMENT '名称',
                                      `expression` varchar(255) DEFAULT NULL COMMENT '表达式',
                                      `type` varchar(255) DEFAULT NULL COMMENT '类型',
                                      `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
                                      `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
                                      `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                      `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
                                      `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                      `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
                                      `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
                                      `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
                                      PRIMARY KEY (`id`),
                                      UNIQUE KEY `WF_IDX_EXPRESSION` (`expression`,`type`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程表达式';

-- ----------------------------
-- Records of blade_wf_condition
-- ----------------------------
BEGIN;
INSERT INTO `blade_wf_condition` VALUES (1408267023015739393, '流程发起人', 'applyUser', 'user', 1123598821738675201, 1123598813738675201, '2021-06-25 11:33:17', 1123598821738675201, '2021-06-25 11:33:17', '1', 0, '000000');
INSERT INTO `blade_wf_condition` VALUES (1408267100878798850, '当前操作人', 'currentUser', 'user', 1123598821738675201, 1123598813738675201, '2021-06-25 11:33:36', 1123598821738675201, '2021-06-25 11:33:36', '1', 0, '000000');
INSERT INTO `blade_wf_condition` VALUES (1408305933398896641, '上级部门领导', 'leader', 'user', 1123598821738675201, 1123598813738675201, '2021-06-25 14:07:54', 1123598821738675201, '2021-06-25 14:07:54', '1', 0, '000000');
COMMIT;

-- ----------------------------
-- Table structure for blade_wf_copy
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_copy`;
CREATE TABLE `blade_wf_copy` (
                                 `id` bigint(64) NOT NULL,
                                 `user_id` bigint(64) DEFAULT NULL COMMENT '用户id',
                                 `title` varchar(255) DEFAULT NULL COMMENT '标题',
                                 `initiator` varchar(255) DEFAULT NULL COMMENT '发起者',
                                 `task_id` varchar(255) DEFAULT NULL COMMENT '任务id',
                                 `process_id` varchar(255) DEFAULT NULL COMMENT '流程实例id',
                                 `form_key` varchar(255) DEFAULT NULL COMMENT '外置表单key',
                                 `form_url` varchar(255) DEFAULT NULL COMMENT '外置表单url',
                                 `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
                                 `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
                                 `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                 `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
                                 `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程抄送';

-- ----------------------------
-- Records of blade_wf_copy
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for blade_wf_deployment_form
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_deployment_form`;
CREATE TABLE `blade_wf_deployment_form` (
                                            `id` bigint(64) NOT NULL,
                                            `deployment_id` varchar(255) DEFAULT NULL COMMENT '流程部署id',
                                            `form_key` varchar(255) DEFAULT NULL COMMENT '表单key',
                                            `content` longtext COMMENT '表单内容',
                                            `app_content` longtext COMMENT 'app表单内容',
                                            `task_key` varchar(255) DEFAULT NULL COMMENT '节点key',
                                            `task_name` varchar(255) DEFAULT NULL COMMENT '节点名称',
                                            `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
                                            `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
                                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                            `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
                                            `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                            `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '状态',
                                            `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程部署 - 表单';

-- ----------------------------
-- Records of blade_wf_deployment_form
-- ----------------------------
BEGIN;
COMMIT;

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

-- ----------------------------
-- Records of blade_wf_draft
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for blade_wf_form
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_form`;
CREATE TABLE `blade_wf_form` (
                                 `id` bigint(64) NOT NULL,
                                 `form_key` varchar(255) DEFAULT NULL COMMENT '表单key',
                                 `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表单名称',
                                 `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '表单内容',
                                 `app_content` longtext COMMENT 'app表单内容',
                                 `version` int(11) DEFAULT NULL COMMENT '版本',
                                 `category_id` bigint(64) DEFAULT NULL COMMENT '分类id',
                                 `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                                 `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
                                 `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
                                 `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                 `status` int(11) DEFAULT NULL COMMENT '状态',
                                 `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
                                 `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
                                 PRIMARY KEY (`id`),
                                 UNIQUE KEY `WF_IDX_FORM_KEY` (`form_key`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程表单';

-- ----------------------------
-- Records of blade_wf_form
-- ----------------------------
BEGIN;
INSERT INTO `blade_wf_form` VALUES (1399359377009377281, 'default-value', '测试默认值', '{column:[{type:\'input\',label:\'人事姓名\',span:24,display:true,prop:\'1622472547203_21841\',value:\'${this.$store.getters.userInfo.nick_name}\'},{type:\'input\',label:\'人事职位\',span:24,display:true,prop:\'1622553629767_65211\',value:\'${this.$store.getters.userInfo.post_name}\'},{type:\'input\',label:\'人事部门\',span:24,display:true,prop:\'1622472547375_86557\',value:\'${this.$store.getters.userInfo.dept_name}\'},{type:\'input\',label:\'当前日期\',span:24,display:true,prop:\'1622553629949_3168\',value:\'${this.dateFormat(new Date(),\\\"yyyy-MM-dd\\\")}\'},{type:\'input\',label:\'当前时间\',span:24,display:true,prop:\'1622553631752_15562\',value:\'${this.dateFormat(new Date(),\\\"hh:mm:ss\\\")}\'},{type:\'input\',label:\'人事姓名和日期\',span:24,display:true,prop:\'1622553691156_69886\',value:\'${this.$store.getters.userInfo.nick_name} - ${this.dateFormat(new Date(),\\\"yyyy-MM-dd\\\")}\'},{type:\'input\',label:\'经理姓名\',span:24,display:true,prop:\'1622472547780_5707\',value:\'${this.$store.getters.userInfo.nick_name}\'},{type:\'input\',label:\'经理部门\',span:24,display:true,prop:\'1622472547975_90560\',value:\'${this.$store.getters.userInfo.dept_name}\'},{type:\'input\',label:\'老板姓名\',span:24,display:true,prop:\'1622472548372_60141\',value:\'${this.$store.getters.userInfo.nick_name}\'},{type:\'input\',label:\'老板部门\',span:24,display:true,prop:\'1622472548560_32474\',value:\'${this.$store.getters.userInfo.dept_name}\'}],labelPosition:\'left\',labelSuffix:\'：\',labelWidth:140,gutter:0,menuBtn:true,submitBtn:true,submitText:\'提交\',emptyBtn:true,emptyText:\'清空\',menuPosition:\'center\'}', '{\"column\":[{\"type\":\"input\",\"label\":\"人事姓名\",\"span\":24,\"display\":true,\"prop\":\"1622472547203_21841\",\"value\":\"${this.$store.getters.userInfo.nick_name}\"},{\"type\":\"input\",\"label\":\"人事职位\",\"span\":24,\"display\":true,\"prop\":\"1622553629767_65211\",\"value\":\"${this.$store.getters.userInfo.post_name}\"},{\"type\":\"input\",\"label\":\"人事部门\",\"span\":24,\"display\":true,\"prop\":\"1622472547375_86557\",\"value\":\"${this.$store.getters.userInfo.dept_name}\"},{\"type\":\"input\",\"label\":\"当前日期\",\"span\":24,\"display\":true,\"prop\":\"1622553629949_3168\",\"value\":\"${this.dateFormat(new Date(),\\\"yyyy-MM-dd\\\")}\"},{\"type\":\"input\",\"label\":\"当前时间\",\"span\":24,\"display\":true,\"prop\":\"1622553631752_15562\",\"value\":\"${this.dateFormat(new Date(),\\\"hh:mm:ss\\\")}\"},{\"type\":\"input\",\"label\":\"人事姓名和日期\",\"span\":24,\"display\":true,\"prop\":\"1622553691156_69886\",\"value\":\"${this.$store.getters.userInfo.nick_name} - ${this.dateFormat(new Date(),\\\"yyyy-MM-dd\\\")}\"},{\"type\":\"input\",\"label\":\"经理姓名\",\"span\":24,\"display\":true,\"prop\":\"1622472547780_5707\",\"value\":\"${this.$store.getters.userInfo.nick_name}\"},{\"type\":\"input\",\"label\":\"经理部门\",\"span\":24,\"display\":true,\"prop\":\"1622472547975_90560\",\"value\":\"${this.$store.getters.userInfo.dept_name}\"},{\"type\":\"input\",\"label\":\"老板姓名\",\"span\":24,\"display\":true,\"prop\":\"1622472548372_60141\",\"value\":\"${this.$store.getters.userInfo.nick_name}\"},{\"type\":\"input\",\"label\":\"老板部门\",\"span\":24,\"display\":true,\"prop\":\"1622472548560_32474\",\"value\":\"${this.$store.getters.userInfo.dept_name}\"}],\"labelPosition\":\"left\",\"labelSuffix\":\"：\",\"labelWidth\":140,\"gutter\":0,\"menuBtn\":true,\"submitBtn\":true,\"submitText\":\"提交\",\"emptyBtn\":true,\"emptyText\":\"清空\",\"menuPosition\":\"center\"}', 1, -1, '', 1123598821738675201, 1123598813738675201, '2021-05-31 21:37:29', 1123598821738675201, '2021-11-01 09:08:05', 1, 0, '000000');
INSERT INTO `blade_wf_form` VALUES (1399729025840140290, 'leave', '请假流程表单', '{column:[{type:\'datetimerange\',label:\'请假时间\',span:12,display:true,format:\'yyyy-MM-dd HH:mm:ss\',valueFormat:\'yyyy-MM-dd HH:mm:ss\',prop:\'datetime\',required:true,rules:[{required:true,message:\'开始时间必须填写\'}],change:({value}) => {\r\n  if (!value || value.length == 0) {\r\n    this.$set(this.form, \'days\', undefined)\r\n  } else {\r\n    const d1 = Date.parse(value[0])\r\n    const d2 = Date.parse(value[1])\r\n    const day = (d2-d1)/(1*24*60*60*1000)\r\n    this.$set(this.form, \'days\', Number(day.toFixed(2)))\r\n  }\r\n}},{type:\'number\',label:\'请假天数\',span:12,display:true,prop:\'days\',required:true,rules:[{required:true,message:\'请假天数必须填写\'}],controls:true,controlsPosition:\'right\',change:({value}) => {\nthis.$set(this.form, \'reason\',\'请假\' + value + \'天\' )\n}},{type:\'textarea\',label:\'请假理由\',span:24,display:true,prop:\'reason\',required:true,rules:[{required:true,message:\'请假理由必须填写\'}]}],labelPosition:\'left\',labelSuffix:\'：\',labelWidth:120,gutter:0,menuBtn:true,submitBtn:true,submitText:\'提交\',emptyBtn:true,emptyText:\'清空\',menuPosition:\'center\'}', '{\"column\":[{\"type\":\"datetimerange\",\"label\":\"请假时间\",\"span\":12,\"display\":true,\"format\":\"yyyy-MM-dd HH:mm:ss\",\"valueFormat\":\"yyyy-MM-dd HH:mm:ss\",\"prop\":\"datetime\",\"required\":true,\"rules\":[{\"required\":true,\"message\":\"开始时间必须填写\"}],\"change\":\"({value}) => {\\r\\n  if (!value || value.length == 0) {\\r\\n    this.$set(this.form, \'days\', undefined)\\r\\n  } else {\\r\\n    const d1 = Date.parse(value[0])\\r\\n    const d2 = Date.parse(value[1])\\r\\n    const day = (d2-d1)/(1*24*60*60*1000)\\r\\n    this.$set(this.form, \'days\', Number(day.toFixed(2)))\\r\\n  }\\r\\n}\"},{\"type\":\"number\",\"label\":\"请假天数\",\"span\":12,\"display\":true,\"prop\":\"days\",\"required\":true,\"rules\":[{\"required\":true,\"message\":\"请假天数必须填写\"}],\"controls\":true,\"controlsPosition\":\"right\",\"change\":\"({value}) => {\\nthis.$set(this.form, \'reason\',\'请假\' + value + \'天\' )\\n}\"},{\"type\":\"textarea\",\"label\":\"请假理由\",\"span\":24,\"display\":true,\"prop\":\"reason\",\"required\":true,\"rules\":[{\"required\":true,\"message\":\"请假理由必须填写\"}]}],\"labelPosition\":\"left\",\"labelSuffix\":\"：\",\"labelWidth\":120,\"gutter\":0,\"menuBtn\":true,\"submitBtn\":true,\"submitText\":\"提交\",\"emptyBtn\":true,\"emptyText\":\"清空\",\"menuPosition\":\"center\"}', 1, -1, '', 1123598821738675201, 1123598813738675201, '2021-06-01 22:06:20', 1123598821738675201, '2021-11-01 09:08:07', 1, 0, '000000');
INSERT INTO `blade_wf_form` VALUES (1408402768310304770, 'demo-test', '测试简单表单', '{column:[{type:\'input\',label:\'单行文本\',span:24,display:true,prop:\'1624624365132_23209\'}],labelPosition:\'left\',labelSuffix:\'：\',labelWidth:120,gutter:0,menuBtn:true,submitBtn:true,submitText:\'提交\',emptyBtn:true,emptyText:\'清空\',menuPosition:\'center\'}', '{\"column\":[{\"type\":\"input\",\"label\":\"单行文本\",\"span\":24,\"display\":true,\"prop\":\"1624624365132_23209\"}],\"labelPosition\":\"left\",\"labelSuffix\":\"：\",\"labelWidth\":120,\"gutter\":0,\"menuBtn\":true,\"submitBtn\":true,\"submitText\":\"提交\",\"emptyBtn\":true,\"emptyText\":\"清空\",\"menuPosition\":\"center\"}', 1, -1, '', 1123598821738675201, 1123598813738675201, '2021-06-25 20:32:41', 1123598821738675201, '2021-11-01 09:08:09', 1, 0, '000000');
INSERT INTO `blade_wf_form` VALUES (1429672727182159874, 'field-linkage', '字段联动', '{column:[{type:\'switch\',label:\'控制显隐\',span:24,display:true,value:\'0\',dicData:[{label:\'\',value:\'0\'},{label:\'\',value:\'1\'}],prop:\'1629695558953_19833\',change:({value}) => {\r\n    const input = this.findObject(this.option.column, \'input\')\r\n    if(value == 0) {\r\n        input.display = false\r\n    } else {\r\n        input.display = true\r\n    }\r\n}},{type:\'input\',label:\'单行文本\',span:24,display:true,prop:\'input\',change:({value}) => {\r\n\r\n}},{type:\'select\',label:\'值改变\',dicData:[{label:\'一天\',value:\'1\'},{label:\'两天\',value:\'2\'},{label:\'三天\',value:\'3\'}],cascaderItem:[],span:24,display:true,props:{label:\'label\',value:\'value\'},prop:\'1629695859796_23456\',change:({value}) => {\r\n    let text = value\r\n    if(value) {\r\n        text = \'请假 \' + value + \' 天\'\r\n    }\r\n    this.$set(this.form, \'input2\', text)\r\n}},{type:\'input\',label:\'单行文本\',span:24,display:true,prop:\'input2\',change:({value}) => {\r\n\r\n}}],labelPosition:\'left\',labelSuffix:\'：\',labelWidth:120,gutter:0,menuBtn:true,submitBtn:true,submitText:\'提交\',emptyBtn:true,emptyText:\'清空\',menuPosition:\'center\'}', '{\"column\":[{\"type\":\"switch\",\"label\":\"控制显隐\",\"span\":24,\"display\":true,\"value\":\"0\",\"dicData\":[{\"label\":\"\",\"value\":\"0\"},{\"label\":\"\",\"value\":\"1\"}],\"prop\":\"1629695558953_19833\",\"change\":\"({value}) => {\\r\\n    const input = this.findObject(this.option.column, \'input\')\\r\\n    if(value == 0) {\\r\\n        input.display = false\\r\\n    } else {\\r\\n        input.display = true\\r\\n    }\\r\\n}\"},{\"type\":\"input\",\"label\":\"单行文本\",\"span\":24,\"display\":true,\"prop\":\"input\",\"change\":\"({value}) => {\\r\\n\\r\\n}\"},{\"type\":\"select\",\"label\":\"值改变\",\"dicData\":[{\"label\":\"一天\",\"value\":\"1\"},{\"label\":\"两天\",\"value\":\"2\"},{\"label\":\"三天\",\"value\":\"3\"}],\"cascaderItem\":[],\"span\":24,\"display\":true,\"props\":{\"label\":\"label\",\"value\":\"value\"},\"prop\":\"1629695859796_23456\",\"change\":\"({value}) => {\\r\\n    let text = value\\r\\n    if(value) {\\r\\n        text = \'请假 \' + value + \' 天\'\\r\\n    }\\r\\n    this.$set(this.form, \'input2\', text)\\r\\n}\"},{\"type\":\"input\",\"label\":\"单行文本\",\"span\":24,\"display\":true,\"prop\":\"input2\",\"change\":\"({value}) => {\\r\\n\\r\\n}\"}],\"labelPosition\":\"left\",\"labelSuffix\":\"：\",\"labelWidth\":120,\"gutter\":0,\"menuBtn\":true,\"submitBtn\":true,\"submitText\":\"提交\",\"emptyBtn\":true,\"emptyText\":\"清空\",\"menuPosition\":\"center\"}', 1, -1, '字段联动示例', 1123598821738675201, 1123598813738675201, '2021-08-23 13:11:54', 1123598821738675201, '2021-11-01 09:08:10', 1, 0, '000000');
COMMIT;

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
                                                `tenant_id` varchar(12) DEFAULT '000000' COMMENT '租户ID',
                                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程表单字段默认值';

-- ----------------------------
-- Records of blade_wf_form_default_values
-- ----------------------------
BEGIN;
INSERT INTO `blade_wf_form_default_values` VALUES (1399346112331087873, '当前操作人姓名', '${this.$store.getters.userInfo.nick_name}', 'input', 1123598821738675201, 1123598813738675201, '2021-05-31 20:44:46', 1123598821738675201, '2021-05-31 20:56:32', '1', 0, '000000');
INSERT INTO `blade_wf_form_default_values` VALUES (1399347906465595393, '当前操作人部门', '${this.$store.getters.userInfo.dept_name}', 'input', 1123598821738675201, 1123598813738675201, '2021-05-31 20:51:54', 1123598821738675201, '2021-05-31 20:56:41', '1', 0, '000000');
INSERT INTO `blade_wf_form_default_values` VALUES (1399717069960855553, '当前日期', '${this.dateFormat(new Date(),\"yyyy-MM-dd\")}', 'input', 1123598821738675201, 1123598813738675201, '2021-06-01 21:18:50', 1123598821738675201, '2021-06-01 21:34:25', '1', 0, '000000');
INSERT INTO `blade_wf_form_default_values` VALUES (1399717187904684034, '当前操作人职位', '${this.$store.getters.userInfo.post_name}', 'input', 1123598821738675201, 1123598813738675201, '2021-06-01 21:19:18', 1123598821738675201, '2021-06-01 21:19:18', '1', 0, '000000');
INSERT INTO `blade_wf_form_default_values` VALUES (1399717285564858369, '当前时间', '${this.dateFormat(new Date(),\"hh:mm:ss\")}', 'input', 1123598821738675201, 1123598813738675201, '2021-06-01 21:19:41', 1123598821738675201, '2021-06-01 21:34:34', '1', 0, '000000');
INSERT INTO `blade_wf_form_default_values` VALUES (1399718803940655106, '当前操作人姓名和日期', '${this.$store.getters.userInfo.nick_name} - ${this.dateFormat(new Date(),\"yyyy-MM-dd\")}', 'input', 1123598821738675201, 1123598813738675201, '2021-06-01 21:25:43', 1123598821738675201, '2021-06-01 21:34:40', '1', 0, '000000');
INSERT INTO `blade_wf_form_default_values` VALUES (1408401952027443201, '当前操作人姓名', '${this.$store.getters.userInfo.nick_name}', 'input', 1123598821738675201, 1123598813738675201, '2021-06-25 20:29:27', 1123598821738675201, '2021-06-25 20:29:32', '1', 1, '000000');
COMMIT;

-- ----------------------------
-- Table structure for blade_wf_form_history
-- ----------------------------
DROP TABLE IF EXISTS `blade_wf_form_history`;
CREATE TABLE `blade_wf_form_history` (
                                         `id` bigint(64) NOT NULL,
                                         `form_id` bigint(64) DEFAULT NULL COMMENT '表单id',
                                         `form_key` varchar(255) DEFAULT NULL COMMENT '表单key',
                                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表单名称',
                                         `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '表单内容',
                                         `app_content` longtext COMMENT 'app表单内容',
                                         `version` int(11) DEFAULT NULL COMMENT '版本',
                                         `category_id` bigint(64) DEFAULT NULL COMMENT '分类id',
                                         `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                                         `create_user` bigint(64) DEFAULT NULL COMMENT '创建人',
                                         `create_dept` bigint(64) DEFAULT NULL COMMENT '创建部门',
                                         `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                         `update_user` bigint(64) DEFAULT NULL COMMENT '修改人',
                                         `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                         `status` int(11) DEFAULT NULL COMMENT '状态',
                                         `is_deleted` int(2) DEFAULT '0' COMMENT '是否已删除',
                                         PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流程表单';

-- ----------------------------
-- Records of blade_wf_form_history
-- ----------------------------
BEGIN;
COMMIT;

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
INSERT INTO `blade_wf_model_scope` VALUES (1429675430591442946, '89d9c299dfed64a7834fdb7caccc913f', 'field-linkage', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO `blade_wf_model_scope` VALUES (1447556025547763714, 'd71049b6ba4eda39cacf9baf984274ac', 'indep-form', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
COMMIT;

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
                                   `current_sequence` int(11) DEFAULT NULL COMMENT '当前序列',
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

-- ----------------------------
-- Records of blade_wf_serial
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for FLW_RU_BATCH
-- ----------------------------
DROP TABLE IF EXISTS `FLW_RU_BATCH`;
CREATE TABLE `FLW_RU_BATCH` (
                                `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                `REV_` int(11) DEFAULT NULL,
                                `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
                                `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `CREATE_TIME_` datetime(3) NOT NULL,
                                `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
                                `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                `BATCH_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of FLW_RU_BATCH
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for FLW_RU_BATCH_PART
-- ----------------------------
DROP TABLE IF EXISTS `FLW_RU_BATCH_PART`;
CREATE TABLE `FLW_RU_BATCH_PART` (
                                     `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `REV_` int(11) DEFAULT NULL,
                                     `BATCH_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `TYPE_` varchar(64) COLLATE utf8_bin NOT NULL,
                                     `SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `SUB_SCOPE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `SCOPE_TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `SEARCH_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `SEARCH_KEY2_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `CREATE_TIME_` datetime(3) NOT NULL,
                                     `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
                                     `STATUS_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
                                     `RESULT_DOC_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
                                     `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
                                     PRIMARY KEY (`ID_`),
                                     KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
                                     CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `FLW_RU_BATCH` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of FLW_RU_BATCH_PART
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
