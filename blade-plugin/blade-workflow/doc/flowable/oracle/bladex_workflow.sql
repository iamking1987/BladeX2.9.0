-- ----------------------------
-- Table structure for ACT_DE_MODEL
-- ----------------------------
DROP TABLE "ACT_DE_MODEL";
CREATE TABLE "ACT_DE_MODEL" (
                                              "ID" NVARCHAR2(255) NOT NULL,
                                              "NAME" NVARCHAR2(400) NOT NULL,
                                              "MODEL_KEY" NVARCHAR2(400) NOT NULL,
                                              "FORM_KEY" NVARCHAR2(255),
                                              "CATEGORY_ID" NUMBER(20,0),
                                              "DESCRIPTION" NCLOB,
                                              "MODEL_COMMENT" NCLOB,
                                              "CREATED" DATE,
                                              "CREATED_BY" NVARCHAR2(255),
                                              "LAST_UPDATED" DATE,
                                              "LAST_UPDATED_BY" NVARCHAR2(255),
                                              "VERSION" NUMBER(11,0),
                                              "XML" NCLOB,
                                              "MODEL_EDITOR_JSON" NCLOB,
                                              "THUMBNAIL" BLOB,
                                              "MODEL_TYPE" NUMBER(11,0),
                                              "TENANT_ID" NVARCHAR2(255)
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "ACT_DE_MODEL"."NAME" IS '名称';
COMMENT ON COLUMN "ACT_DE_MODEL"."MODEL_KEY" IS '模型标识';
COMMENT ON COLUMN "ACT_DE_MODEL"."FORM_KEY" IS '表单标识';
COMMENT ON COLUMN "ACT_DE_MODEL"."CATEGORY_ID" IS '分类id';
COMMENT ON COLUMN "ACT_DE_MODEL"."DESCRIPTION" IS '描述';
COMMENT ON COLUMN "ACT_DE_MODEL"."MODEL_COMMENT" IS '评论';
COMMENT ON COLUMN "ACT_DE_MODEL"."CREATED" IS '创建时间';
COMMENT ON COLUMN "ACT_DE_MODEL"."CREATED_BY" IS '创建人';
COMMENT ON COLUMN "ACT_DE_MODEL"."LAST_UPDATED" IS '最后更新时间';
COMMENT ON COLUMN "ACT_DE_MODEL"."LAST_UPDATED_BY" IS '最后更新人';
COMMENT ON COLUMN "ACT_DE_MODEL"."VERSION" IS '版本';
COMMENT ON COLUMN "ACT_DE_MODEL"."XML" IS 'xml';
COMMENT ON COLUMN "ACT_DE_MODEL"."MODEL_EDITOR_JSON" IS 'flowable-ui编辑器json';
COMMENT ON COLUMN "ACT_DE_MODEL"."THUMBNAIL" IS '缩略图';
COMMENT ON COLUMN "ACT_DE_MODEL"."MODEL_TYPE" IS '类型';
COMMENT ON COLUMN "ACT_DE_MODEL"."TENANT_ID" IS '租户id';
COMMENT ON TABLE "ACT_DE_MODEL" IS '流程 - 定义 - 模型';

-- ----------------------------
-- Records of ACT_DE_MODEL
-- ----------------------------
INSERT INTO "ACT_DE_MODEL" VALUES ('0676f2277420b7dc67f69dd3a0ec1164', '请假流程 - 外置表单', 'ex-leave', 'wf_ex_Leave', NULL, NULL, NULL, TO_DATE('2021-12-11 09:21:49', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-12-11 09:21:55', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', '1', '<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:flowable="http://flowable.org/bpmn" xmlns:activiti="http://activiti.org/bpmn" xmlns:camunda="http://camunda.org/schema/1.0/bpmn" targetNamespace="http://bpmn.io/schema/bpmn">
  <process id="ex-leave" name="请假流程 - 外置表单" isExecutable="true" flowable:skipFirstNode="true" flowable:rollbackNode="Activity_1bvvbi2">
    <extensionElements>
      <flowable:serial name="测试流水号" prefix="SQ" dateFormat="yyyyMMdd" suffixLength="5" startSequence="0" connector="" cycle="none" />
    </extensionElements>
    <startEvent id="startEvent_1" name="开始" flowable:exFormKey="Leave">
      <extensionElements>
        <flowable:exFormKey value="Leave" />
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="true" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="true" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="true" />
      </extensionElements>
      <outgoing>Flow_1itpbiu</outgoing>
    </startEvent>
    <userTask id="Activity_1bvvbi2" name="发起人" flowable:exFormKey="Leave" flowable:assignee="${applyUser}" flowable:hideCopy="true">
      <extensionElements>
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="true" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="true" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_1itpbiu</incoming>
      <outgoing>Flow_0eeuztq</outgoing>
    </userTask>
    <sequenceFlow id="Flow_1itpbiu" sourceRef="startEvent_1" targetRef="Activity_1bvvbi2" />
    <userTask id="Activity_0xqgcpk" name="人事" flowable:exFormKey="Leave" flowable:candidateUsers="1123598821738675202">
      <extensionElements>
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="false" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="false" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="false" />
      </extensionElements>
      <incoming>Flow_0eeuztq</incoming>
      <outgoing>Flow_1vu0qon</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0eeuztq" sourceRef="Activity_1bvvbi2" targetRef="Activity_0xqgcpk" />
    <userTask id="Activity_0k0fyan" name="经理" flowable:exFormKey="Leave" flowable:candidateUsers="1123598821738675203">
      <extensionElements>
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="false" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="false" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="false" />
      </extensionElements>
      <incoming>Flow_1vu0qon</incoming>
      <outgoing>Flow_1d63z9m</outgoing>
    </userTask>
    <sequenceFlow id="Flow_1vu0qon" sourceRef="Activity_0xqgcpk" targetRef="Activity_0k0fyan" />
    <endEvent id="Event_06z26fy">
      <incoming>Flow_1d63z9m</incoming>
    </endEvent>
    <sequenceFlow id="Flow_1d63z9m" sourceRef="Activity_0k0fyan" targetRef="Event_06z26fy" />
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_flow">
    <bpmndi:BPMNPlane id="BPMNPlane_flow" bpmnElement="ex-leave">
      <bpmndi:BPMNEdge id="Flow_1d63z9m_di" bpmnElement="Flow_1d63z9m">
        <di:waypoint x="720" y="215" />
        <di:waypoint x="772" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1vu0qon_di" bpmnElement="Flow_1vu0qon">
        <di:waypoint x="570" y="215" />
        <di:waypoint x="620" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0eeuztq_di" bpmnElement="Flow_0eeuztq">
        <di:waypoint x="420" y="215" />
        <di:waypoint x="470" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1itpbiu_di" bpmnElement="Flow_1itpbiu">
        <di:waypoint x="270" y="215" />
        <di:waypoint x="320" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="BPMNShape_startEvent_1" bpmnElement="startEvent_1">
        <dc:Bounds x="240" y="200" width="30" height="30" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="243" y="237" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1bvvbi2_di" bpmnElement="Activity_1bvvbi2">
        <dc:Bounds x="320" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0xqgcpk_di" bpmnElement="Activity_0xqgcpk">
        <dc:Bounds x="470" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0k0fyan_di" bpmnElement="Activity_0k0fyan">
        <dc:Bounds x="620" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_06z26fy_di" bpmnElement="Event_06z26fy">
        <dc:Bounds x="772" y="197" width="36" height="36" />
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>
', '{"bounds":{"lowerRight":{"x":1485.0,"y":700.0},"upperLeft":{"x":0.0,"y":0.0}},"resourceId":"canvas","stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"},"properties":{"process_id":"ex-leave","name":"请假流程 - 外置表单","process_namespace":"http://bpmn.io/schema/bpmn","iseagerexecutionfetch":false,"messages":[],"executionlisteners":{"executionListeners":[]},"eventlisteners":{"eventListeners":[]},"signaldefinitions":[],"messagedefinitions":[],"escalationdefinitions":[]},"childShapes":[{"bounds":{"lowerRight":{"x":270.0,"y":230.0},"upperLeft":{"x":240.0,"y":200.0}},"resourceId":"startEvent_1","childShapes":[],"stencil":{"id":"StartNoneEvent"},"properties":{"overrideid":"startEvent_1","name":"开始","interrupting":true,"formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1itpbiu"}]},{"bounds":{"lowerRight":{"x":420.0,"y":255.0},"upperLeft":{"x":320.0,"y":175.0}},"resourceId":"Activity_1bvvbi2","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1bvvbi2","name":"发起人","usertaskassignment":{"assignment":{"type":"static","assignee":"${applyUser}"}},"formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0eeuztq"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1itpbiu","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":15.0,"y":15.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1bvvbi2"}],"target":{"resourceId":"Activity_1bvvbi2"},"properties":{"overrideid":"Flow_1itpbiu"}},{"bounds":{"lowerRight":{"x":570.0,"y":255.0},"upperLeft":{"x":470.0,"y":175.0}},"resourceId":"Activity_0xqgcpk","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_0xqgcpk","name":"人事","usertaskassignment":{"assignment":{"type":"static","candidateUsers":[{"value":"1123598821738675202"}]}},"formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1vu0qon"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0eeuztq","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_0xqgcpk"}],"target":{"resourceId":"Activity_0xqgcpk"},"properties":{"overrideid":"Flow_0eeuztq"}},{"bounds":{"lowerRight":{"x":720.0,"y":255.0},"upperLeft":{"x":620.0,"y":175.0}},"resourceId":"Activity_0k0fyan","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_0k0fyan","name":"经理","usertaskassignment":{"assignment":{"type":"static","candidateUsers":[{"value":"1123598821738675203"}]}},"formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1d63z9m"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1vu0qon","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_0k0fyan"}],"target":{"resourceId":"Activity_0k0fyan"},"properties":{"overrideid":"Flow_1vu0qon"}},{"bounds":{"lowerRight":{"x":808.0,"y":233.0},"upperLeft":{"x":772.0,"y":197.0}},"resourceId":"Event_06z26fy","childShapes":[],"stencil":{"id":"EndNoneEvent"},"properties":{"overrideid":"Event_06z26fy","executionlisteners":{"executionListeners":[]}},"outgoing":[]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1d63z9m","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":18.0,"y":18.0}],"outgoing":[{"resourceId":"Event_06z26fy"}],"target":{"resourceId":"Event_06z26fy"},"properties":{"overrideid":"Flow_1d63z9m"}}]}', NULL, '0', '000000');
INSERT INTO "ACT_DE_MODEL" VALUES ('2f6b3b6de24354bb5df5aad3a87789af', '请假流程', 'leave', 'leave', NULL, NULL, NULL, TO_DATE('2021-12-11 09:21:57', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-12-11 09:21:59', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', '1', '<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:flowable="http://flowable.org/bpmn" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn" xmlns:camunda="http://camunda.org/schema/1.0/bpmn" targetNamespace="http://bpmn.io/schema/bpmn">
  <process id="leave" name="请假流程" isExecutable="true" flowable:skipFirstNode="true" flowable:rollbackNode="Activity_0u3ywm0">
    <extensionElements>
      <flowable:serial name="请假流水号" prefix="Leave" dateFormat="yyyyMMdd" suffixLength="5" startSequence="0" connector="" cycle="none" />
    </extensionElements>
    <startEvent id="startEvent_1" name="开始">
      <extensionElements>
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="true" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="true" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="true" />
      </extensionElements>
      <outgoing>Flow_0myeljb</outgoing>
    </startEvent>
    <userTask id="Activity_0u3ywm0" name="发起人">
      <extensionElements>
        <flowable:assignee type="custom" value="applyUser" text="流程发起人" />
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="true" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="true" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0myeljb</incoming>
      <outgoing>Flow_0bz2pj7</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0myeljb" sourceRef="startEvent_1" targetRef="Activity_0u3ywm0" />
    <userTask id="Activity_1hmjyx7" name="人事">
      <extensionElements>
        <flowable:assignee type="role" value="1123598816738675203" text="人事" />
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="false" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="false" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="false" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0bz2pj7</incoming>
      <outgoing>Flow_1pf3fia</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0bz2pj7" sourceRef="Activity_0u3ywm0" targetRef="Activity_1hmjyx7" />
    <exclusiveGateway id="Gateway_1qc70vy">
      <incoming>Flow_1pf3fia</incoming>
      <outgoing>Flow_0of3zct</outgoing>
      <outgoing>Flow_139q6po</outgoing>
    </exclusiveGateway>
    <sequenceFlow id="Flow_1pf3fia" sourceRef="Activity_1hmjyx7" targetRef="Gateway_1qc70vy" />
    <userTask id="Activity_1r4xgdo" name="经理">
      <extensionElements>
        <flowable:assignee type="role" value="1123598816738675204" text="经理" />
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="false" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="false" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="false" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0of3zct</incoming>
      <outgoing>Flow_1dmv86y</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0of3zct" name="小于5天" sourceRef="Gateway_1qc70vy" targetRef="Activity_1r4xgdo">
      <conditionExpression xsi:type="tFormalExpression">${days&lt;5}</conditionExpression>
    </sequenceFlow>
    <userTask id="Activity_1bt0gzy" name="老板">
      <extensionElements>
        <flowable:assignee type="role" value="1123598816738675205" text="老板" />
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="false" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="false" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="false" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_139q6po</incoming>
      <outgoing>Flow_1bugorc</outgoing>
    </userTask>
    <sequenceFlow id="Flow_139q6po" name="大于5天" sourceRef="Gateway_1qc70vy" targetRef="Activity_1bt0gzy">
      <conditionExpression xsi:type="tFormalExpression">${days&gt;=5}</conditionExpression>
    </sequenceFlow>
    <exclusiveGateway id="Gateway_0ciyfci">
      <incoming>Flow_1dmv86y</incoming>
      <incoming>Flow_1bugorc</incoming>
      <outgoing>Flow_0vtl8w4</outgoing>
    </exclusiveGateway>
    <sequenceFlow id="Flow_1dmv86y" sourceRef="Activity_1r4xgdo" targetRef="Gateway_0ciyfci" />
    <sequenceFlow id="Flow_1bugorc" sourceRef="Activity_1bt0gzy" targetRef="Gateway_0ciyfci" />
    <endEvent id="Event_1j9xjra" name="结束">
      <incoming>Flow_0vtl8w4</incoming>
    </endEvent>
    <sequenceFlow id="Flow_0vtl8w4" sourceRef="Gateway_0ciyfci" targetRef="Event_1j9xjra" />
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_flow">
    <bpmndi:BPMNPlane id="BPMNPlane_flow" bpmnElement="leave">
      <bpmndi:BPMNEdge id="Flow_0vtl8w4_di" bpmnElement="Flow_0vtl8w4">
        <di:waypoint x="925" y="215" />
        <di:waypoint x="992" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1bugorc_di" bpmnElement="Flow_1bugorc">
        <di:waypoint x="830" y="330" />
        <di:waypoint x="900" y="330" />
        <di:waypoint x="900" y="240" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1dmv86y_di" bpmnElement="Flow_1dmv86y">
        <di:waypoint x="830" y="110" />
        <di:waypoint x="900" y="110" />
        <di:waypoint x="900" y="190" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_139q6po_di" bpmnElement="Flow_139q6po">
        <di:waypoint x="650" y="240" />
        <di:waypoint x="650" y="330" />
        <di:waypoint x="730" y="330" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="600" y="282" width="40" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0of3zct_di" bpmnElement="Flow_0of3zct">
        <di:waypoint x="650" y="190" />
        <di:waypoint x="650" y="110" />
        <di:waypoint x="730" y="110" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="600" y="147" width="40" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1pf3fia_di" bpmnElement="Flow_1pf3fia">
        <di:waypoint x="570" y="215" />
        <di:waypoint x="625" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0bz2pj7_di" bpmnElement="Flow_0bz2pj7">
        <di:waypoint x="420" y="215" />
        <di:waypoint x="470" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0myeljb_di" bpmnElement="Flow_0myeljb">
        <di:waypoint x="270" y="215" />
        <di:waypoint x="320" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="BPMNShape_startEvent_1" bpmnElement="startEvent_1">
        <dc:Bounds x="240" y="200" width="30" height="30" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="243" y="237" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0u3ywm0_di" bpmnElement="Activity_0u3ywm0">
        <dc:Bounds x="320" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1hmjyx7_di" bpmnElement="Activity_1hmjyx7">
        <dc:Bounds x="470" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_1qc70vy_di" bpmnElement="Gateway_1qc70vy" isMarkerVisible="true">
        <dc:Bounds x="625" y="190" width="50" height="50" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1r4xgdo_di" bpmnElement="Activity_1r4xgdo">
        <dc:Bounds x="730" y="70" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1bt0gzy_di" bpmnElement="Activity_1bt0gzy">
        <dc:Bounds x="730" y="290" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_0ciyfci_di" bpmnElement="Gateway_0ciyfci" isMarkerVisible="true">
        <dc:Bounds x="875" y="190" width="50" height="50" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_1j9xjra_di" bpmnElement="Event_1j9xjra">
        <dc:Bounds x="992" y="197" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="999" y="240" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>
', '{"bounds":{"lowerRight":{"x":1485.0,"y":700.0},"upperLeft":{"x":0.0,"y":0.0}},"resourceId":"canvas","stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"},"properties":{"process_id":"leave","name":"请假流程","process_namespace":"http://bpmn.io/schema/bpmn","iseagerexecutionfetch":false,"messages":[],"executionlisteners":{"executionListeners":[]},"eventlisteners":{"eventListeners":[]},"signaldefinitions":[],"messagedefinitions":[],"escalationdefinitions":[]},"childShapes":[{"bounds":{"lowerRight":{"x":270.0,"y":230.0},"upperLeft":{"x":240.0,"y":200.0}},"resourceId":"startEvent_1","childShapes":[],"stencil":{"id":"StartNoneEvent"},"properties":{"overrideid":"startEvent_1","name":"开始","interrupting":true,"formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0myeljb"}]},{"bounds":{"lowerRight":{"x":420.0,"y":255.0},"upperLeft":{"x":320.0,"y":175.0}},"resourceId":"Activity_0u3ywm0","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_0u3ywm0","name":"发起人","formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0bz2pj7"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0myeljb","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":15.0,"y":15.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_0u3ywm0"}],"target":{"resourceId":"Activity_0u3ywm0"},"properties":{"overrideid":"Flow_0myeljb"}},{"bounds":{"lowerRight":{"x":570.0,"y":255.0},"upperLeft":{"x":470.0,"y":175.0}},"resourceId":"Activity_1hmjyx7","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1hmjyx7","name":"人事","formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1pf3fia"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0bz2pj7","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1hmjyx7"}],"target":{"resourceId":"Activity_1hmjyx7"},"properties":{"overrideid":"Flow_0bz2pj7"}},{"bounds":{"lowerRight":{"x":675.0,"y":240.0},"upperLeft":{"x":625.0,"y":190.0}},"resourceId":"Gateway_1qc70vy","childShapes":[],"stencil":{"id":"ExclusiveGateway"},"properties":{"overrideid":"Gateway_1qc70vy","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0of3zct"},{"resourceId":"Flow_139q6po"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1pf3fia","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":25.0,"y":25.0}],"outgoing":[{"resourceId":"Gateway_1qc70vy"}],"target":{"resourceId":"Gateway_1qc70vy"},"properties":{"overrideid":"Flow_1pf3fia"}},{"bounds":{"lowerRight":{"x":830.0,"y":150.0},"upperLeft":{"x":730.0,"y":70.0}},"resourceId":"Activity_1r4xgdo","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1r4xgdo","name":"经理","formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1dmv86y"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0of3zct","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":25.0,"y":25.0},{"x":650.0,"y":110.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1r4xgdo"}],"target":{"resourceId":"Activity_1r4xgdo"},"properties":{"overrideid":"Flow_0of3zct","name":"小于5天","conditionsequenceflow":"${days<5}"}},{"bounds":{"lowerRight":{"x":830.0,"y":370.0},"upperLeft":{"x":730.0,"y":290.0}},"resourceId":"Activity_1bt0gzy","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1bt0gzy","name":"老板","formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1bugorc"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_139q6po","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":25.0,"y":25.0},{"x":650.0,"y":330.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1bt0gzy"}],"target":{"resourceId":"Activity_1bt0gzy"},"properties":{"overrideid":"Flow_139q6po","name":"大于5天","conditionsequenceflow":"${days>=5}"}},{"bounds":{"lowerRight":{"x":925.0,"y":240.0},"upperLeft":{"x":875.0,"y":190.0}},"resourceId":"Gateway_0ciyfci","childShapes":[],"stencil":{"id":"ExclusiveGateway"},"properties":{"overrideid":"Gateway_0ciyfci","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0vtl8w4"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1dmv86y","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":900.0,"y":110.0},{"x":25.0,"y":25.0}],"outgoing":[{"resourceId":"Gateway_0ciyfci"}],"target":{"resourceId":"Gateway_0ciyfci"},"properties":{"overrideid":"Flow_1dmv86y"}},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1bugorc","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":900.0,"y":330.0},{"x":25.0,"y":25.0}],"outgoing":[{"resourceId":"Gateway_0ciyfci"}],"target":{"resourceId":"Gateway_0ciyfci"},"properties":{"overrideid":"Flow_1bugorc"}},{"bounds":{"lowerRight":{"x":1028.0,"y":233.0},"upperLeft":{"x":992.0,"y":197.0}},"resourceId":"Event_1j9xjra","childShapes":[],"stencil":{"id":"EndNoneEvent"},"properties":{"overrideid":"Event_1j9xjra","name":"结束","executionlisteners":{"executionListeners":[]}},"outgoing":[]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0vtl8w4","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":25.0,"y":25.0},{"x":18.0,"y":18.0}],"outgoing":[{"resourceId":"Event_1j9xjra"}],"target":{"resourceId":"Event_1j9xjra"},"properties":{"overrideid":"Flow_0vtl8w4"}}]}', NULL, '0', '000000');
INSERT INTO "ACT_DE_MODEL" VALUES ('5b7a367e1139f1ab5cb1e6210685fa91', '多实例示例', 'demo-multi-instance', 'demo-test', NULL, NULL, NULL, TO_DATE('2021-12-11 09:23:09', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-12-11 09:23:11', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', '1', '<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:flowable="http://flowable.org/bpmn" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn" xmlns:camunda="http://camunda.org/schema/1.0/bpmn" targetNamespace="http://bpmn.io/schema/bpmn">
  <process id="demo-multi-instance" name="多实例示例" isExecutable="true" flowable:skipFirstNode="true" flowable:rollbackNode="Activity_0srhxhz">
    <extensionElements>
      <flowable:serial name="多实例流水号" prefix="MT" dateFormat="yyyyMMdd" suffixLength="4" startSequence="0" connector="" cycle="none" />
    </extensionElements>
    <startEvent id="startEvent_1" name="开始">
      <extensionElements>
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
      </extensionElements>
      <outgoing>Flow_1i5g9nh</outgoing>
    </startEvent>
    <userTask id="Activity_0srhxhz" name="发起人">
      <extensionElements>
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
        <flowable:assignee type="custom" value="applyUser" text="流程发起人" />
      </extensionElements>
      <incoming>Flow_1i5g9nh</incoming>
      <outgoing>Flow_15l5hak</outgoing>
    </userTask>
    <sequenceFlow id="Flow_1i5g9nh" sourceRef="startEvent_1" targetRef="Activity_0srhxhz" />
    <userTask id="Activity_1qj1out" name="多实例（串行）" flowable:assignee="${assignee}">
      <extensionElements>
        <flowable:assignee type="custom" value="leader" text="上级部门领导" />
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_15l5hak</incoming>
      <outgoing>Flow_0afq5tt</outgoing>
      <multiInstanceLoopCharacteristics isSequential="true" flowable:collection="${wfMultiInstanceHandler.getList(execution)}" flowable:elementVariable="assignee">
        <completionCondition xsi:type="tFormalExpression">${nrOfCompletedInstances/nrOfInstances &gt;= 0.5}</completionCondition>
      </multiInstanceLoopCharacteristics>
    </userTask>
    <sequenceFlow id="Flow_15l5hak" sourceRef="Activity_0srhxhz" targetRef="Activity_1qj1out" />
    <userTask id="Activity_0oh31om" name="多实例（并行）" flowable:assignee="${assignee}">
      <extensionElements>
        <flowable:assignee type="dept" value="1123598813738675202" text="常州刀锋" />
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0afq5tt</incoming>
      <outgoing>Flow_0dera7k</outgoing>
      <multiInstanceLoopCharacteristics flowable:collection="${wfMultiInstanceHandler.getList(execution)}" flowable:elementVariable="assignee">
        <completionCondition xsi:type="tFormalExpression">${nrOfCompletedInstances/nrOfInstances &gt;= 1}</completionCondition>
      </multiInstanceLoopCharacteristics>
    </userTask>
    <sequenceFlow id="Flow_0afq5tt" sourceRef="Activity_1qj1out" targetRef="Activity_0oh31om" />
    <endEvent id="Event_02858i0" name="结束">
      <incoming>Flow_0dera7k</incoming>
    </endEvent>
    <sequenceFlow id="Flow_0dera7k" sourceRef="Activity_0oh31om" targetRef="Event_02858i0" />
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_flow">
    <bpmndi:BPMNPlane id="BPMNPlane_flow" bpmnElement="demo-multi-instance">
      <bpmndi:BPMNEdge id="Flow_0dera7k_di" bpmnElement="Flow_0dera7k">
        <di:waypoint x="720" y="215" />
        <di:waypoint x="772" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0afq5tt_di" bpmnElement="Flow_0afq5tt">
        <di:waypoint x="570" y="215" />
        <di:waypoint x="620" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_15l5hak_di" bpmnElement="Flow_15l5hak">
        <di:waypoint x="420" y="215" />
        <di:waypoint x="470" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1i5g9nh_di" bpmnElement="Flow_1i5g9nh">
        <di:waypoint x="270" y="215" />
        <di:waypoint x="320" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="BPMNShape_startEvent_1" bpmnElement="startEvent_1">
        <dc:Bounds x="240" y="200" width="30" height="30" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="243" y="237" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0srhxhz_di" bpmnElement="Activity_0srhxhz">
        <dc:Bounds x="320" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1qj1out_di" bpmnElement="Activity_1qj1out">
        <dc:Bounds x="470" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0oh31om_di" bpmnElement="Activity_0oh31om">
        <dc:Bounds x="620" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_02858i0_di" bpmnElement="Event_02858i0">
        <dc:Bounds x="772" y="197" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="779" y="240" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>
', '{"bounds":{"lowerRight":{"x":1485.0,"y":700.0},"upperLeft":{"x":0.0,"y":0.0}},"resourceId":"canvas","stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"},"properties":{"process_id":"demo-multi-instance","name":"多实例示例","process_namespace":"http://bpmn.io/schema/bpmn","iseagerexecutionfetch":false,"messages":[],"executionlisteners":{"executionListeners":[]},"eventlisteners":{"eventListeners":[]},"signaldefinitions":[],"messagedefinitions":[],"escalationdefinitions":[]},"childShapes":[{"bounds":{"lowerRight":{"x":270.0,"y":230.0},"upperLeft":{"x":240.0,"y":200.0}},"resourceId":"startEvent_1","childShapes":[],"stencil":{"id":"StartNoneEvent"},"properties":{"overrideid":"startEvent_1","name":"开始","interrupting":true,"formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1i5g9nh"}]},{"bounds":{"lowerRight":{"x":420.0,"y":255.0},"upperLeft":{"x":320.0,"y":175.0}},"resourceId":"Activity_0srhxhz","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_0srhxhz","name":"发起人","formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_15l5hak"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1i5g9nh","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":15.0,"y":15.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_0srhxhz"}],"target":{"resourceId":"Activity_0srhxhz"},"properties":{"overrideid":"Flow_1i5g9nh"}},{"bounds":{"lowerRight":{"x":570.0,"y":255.0},"upperLeft":{"x":470.0,"y":175.0}},"resourceId":"Activity_1qj1out","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1qj1out","name":"多实例（串行）","usertaskassignment":{"assignment":{"type":"static","assignee":"${assignee}"}},"formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"multiinstance_type":"Sequential","multiinstance_collection":"${wfMultiInstanceHandler.getList(execution)}","multiinstance_variable":"assignee","multiinstance_condition":"${nrOfCompletedInstances/nrOfInstances >= 0.5}","tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0afq5tt"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_15l5hak","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1qj1out"}],"target":{"resourceId":"Activity_1qj1out"},"properties":{"overrideid":"Flow_15l5hak"}},{"bounds":{"lowerRight":{"x":720.0,"y":255.0},"upperLeft":{"x":620.0,"y":175.0}},"resourceId":"Activity_0oh31om","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_0oh31om","name":"多实例（并行）","usertaskassignment":{"assignment":{"type":"static","assignee":"${assignee}"}},"formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"multiinstance_type":"Parallel","multiinstance_collection":"${wfMultiInstanceHandler.getList(execution)}","multiinstance_variable":"assignee","multiinstance_condition":"${nrOfCompletedInstances/nrOfInstances >= 1}","tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0dera7k"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0afq5tt","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_0oh31om"}],"target":{"resourceId":"Activity_0oh31om"},"properties":{"overrideid":"Flow_0afq5tt"}},{"bounds":{"lowerRight":{"x":808.0,"y":233.0},"upperLeft":{"x":772.0,"y":197.0}},"resourceId":"Event_02858i0","childShapes":[],"stencil":{"id":"EndNoneEvent"},"properties":{"overrideid":"Event_02858i0","name":"结束","executionlisteners":{"executionListeners":[]}},"outgoing":[]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0dera7k","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":18.0,"y":18.0}],"outgoing":[{"resourceId":"Event_02858i0"}],"target":{"resourceId":"Event_02858i0"},"properties":{"overrideid":"Flow_0dera7k"}}]}', NULL, '0', '000000');
INSERT INTO "ACT_DE_MODEL" VALUES ('617167d80b6051708484bbedfb72a137', '人员/流转调用自定义方法示例', 'demo-custom-method', 'demo-test', NULL, '人员/流转调用自定义方法示例', NULL, TO_DATE('2021-12-11 09:23:14', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-12-11 09:23:16', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', '1', '<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:flowable="http://flowable.org/bpmn" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:activiti="http://activiti.org/bpmn" xmlns:camunda="http://camunda.org/schema/1.0/bpmn" targetNamespace="http://bpmn.io/schema/bpmn">
  <process id="demo-custom-method" name="人员/流转调用自定义方法示例" isExecutable="true" flowable:skipFirstNode="true" flowable:rollbackNode="Activity_06t0e98">
    <documentation>人员/流转调用自定义方法示例</documentation>
    <startEvent id="startEvent_1" name="开始">
      <extensionElements>
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
      </extensionElements>
      <outgoing>Flow_0yhobgw</outgoing>
    </startEvent>
    <userTask id="Activity_06t0e98" name="发起人">
      <extensionElements>
        <flowable:assignee type="custom" value="applyUser" text="流程发起人" />
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0yhobgw</incoming>
      <outgoing>Flow_1t6zwdf</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0yhobgw" sourceRef="startEvent_1" targetRef="Activity_06t0e98" />
    <userTask id="Activity_07ghy8s" name="方式1">
      <extensionElements>
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
        <flowable:assignee type="custom" value="${wfCustomUserHandler.userList(execution, &#39;自定义参数&#39;)}" text="${wfCustomUserHandler.userList(execution, &#39;自定义参数&#39;)}" />
      </extensionElements>
      <incoming>Flow_1t6zwdf</incoming>
      <outgoing>Flow_0kxxs74</outgoing>
    </userTask>
    <sequenceFlow id="Flow_1t6zwdf" sourceRef="Activity_06t0e98" targetRef="Activity_07ghy8s" />
    <userTask id="Activity_10810pv" name="方式2">
      <extensionElements>
        <flowable:assignee type="custom" value="${wfCustomUserHandler.strList(execution, &#39;自定义参数&#39;)}" text="${wfCustomUserHandler.strList(execution, &#39;自定义参数&#39;)}" />
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0kxxs74</incoming>
      <outgoing>Flow_01h467o</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0kxxs74" sourceRef="Activity_07ghy8s" targetRef="Activity_10810pv" />
    <userTask id="Activity_1i46ta4" name="方式3">
      <extensionElements>
        <flowable:assignee type="custom" value="${wfCustomUserHandler.longList(execution, &#39;自定义参数&#39;)}" text="${wfCustomUserHandler.longList(execution, &#39;自定义参数&#39;)}" />
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0kdt4xu</incoming>
      <outgoing>Flow_1x5wxzy</outgoing>
    </userTask>
    <userTask id="Activity_03trwm6" name="方式4">
      <extensionElements>
        <flowable:assignee type="custom" value="${wfCustomUserHandler.str(execution, &#39;自定义参数&#39;)}" text="${wfCustomUserHandler.str(execution, &#39;自定义参数&#39;)}" />
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0jw1ae2</incoming>
      <outgoing>Flow_00r5t9o</outgoing>
    </userTask>
    <endEvent id="Event_0uefnoo">
      <incoming>Flow_1fun2ye</incoming>
    </endEvent>
    <exclusiveGateway id="Gateway_0mtj57e">
      <incoming>Flow_01h467o</incoming>
      <outgoing>Flow_0kdt4xu</outgoing>
      <outgoing>Flow_0jw1ae2</outgoing>
    </exclusiveGateway>
    <sequenceFlow id="Flow_01h467o" sourceRef="Activity_10810pv" targetRef="Gateway_0mtj57e" />
    <sequenceFlow id="Flow_0kdt4xu" sourceRef="Gateway_0mtj57e" targetRef="Activity_1i46ta4">
      <conditionExpression xsi:type="tFormalExpression">${wfCustomUserHandler.condition(execution, ''对'')}</conditionExpression>
    </sequenceFlow>
    <sequenceFlow id="Flow_0jw1ae2" sourceRef="Gateway_0mtj57e" targetRef="Activity_03trwm6">
      <conditionExpression xsi:type="tFormalExpression">${wfCustomUserHandler.condition(execution, ''错'')}</conditionExpression>
    </sequenceFlow>
    <exclusiveGateway id="Gateway_0ha0m7b">
      <incoming>Flow_1x5wxzy</incoming>
      <incoming>Flow_00r5t9o</incoming>
      <outgoing>Flow_1fun2ye</outgoing>
    </exclusiveGateway>
    <sequenceFlow id="Flow_1x5wxzy" sourceRef="Activity_1i46ta4" targetRef="Gateway_0ha0m7b" />
    <sequenceFlow id="Flow_1fun2ye" sourceRef="Gateway_0ha0m7b" targetRef="Event_0uefnoo" />
    <sequenceFlow id="Flow_00r5t9o" sourceRef="Activity_03trwm6" targetRef="Gateway_0ha0m7b" />
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_flow">
    <bpmndi:BPMNPlane id="BPMNPlane_flow" bpmnElement="demo-custom-method">
      <bpmndi:BPMNEdge id="Flow_0kxxs74_di" bpmnElement="Flow_0kxxs74">
        <di:waypoint x="590" y="218" />
        <di:waypoint x="650" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1t6zwdf_di" bpmnElement="Flow_1t6zwdf">
        <di:waypoint x="430" y="218" />
        <di:waypoint x="490" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0yhobgw_di" bpmnElement="Flow_0yhobgw">
        <di:waypoint x="276" y="218" />
        <di:waypoint x="330" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_01h467o_di" bpmnElement="Flow_01h467o">
        <di:waypoint x="750" y="218" />
        <di:waypoint x="815" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0kdt4xu_di" bpmnElement="Flow_0kdt4xu">
        <di:waypoint x="840" y="193" />
        <di:waypoint x="840" y="90" />
        <di:waypoint x="910" y="90" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0jw1ae2_di" bpmnElement="Flow_0jw1ae2">
        <di:waypoint x="840" y="243" />
        <di:waypoint x="840" y="360" />
        <di:waypoint x="910" y="360" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1x5wxzy_di" bpmnElement="Flow_1x5wxzy">
        <di:waypoint x="1010" y="90" />
        <di:waypoint x="1080" y="90" />
        <di:waypoint x="1080" y="193" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1fun2ye_di" bpmnElement="Flow_1fun2ye">
        <di:waypoint x="1105" y="218" />
        <di:waypoint x="1142" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_00r5t9o_di" bpmnElement="Flow_00r5t9o">
        <di:waypoint x="1010" y="360" />
        <di:waypoint x="1080" y="360" />
        <di:waypoint x="1080" y="243" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="BPMNShape_startEvent_1" bpmnElement="startEvent_1">
        <dc:Bounds x="240" y="200" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="248" y="243" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_06t0e98_di" bpmnElement="Activity_06t0e98">
        <dc:Bounds x="330" y="178" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_07ghy8s_di" bpmnElement="Activity_07ghy8s">
        <dc:Bounds x="490" y="178" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_10810pv_di" bpmnElement="Activity_10810pv">
        <dc:Bounds x="650" y="178" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_0mtj57e_di" bpmnElement="Gateway_0mtj57e" isMarkerVisible="true">
        <dc:Bounds x="815" y="193" width="50" height="50" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1i46ta4_di" bpmnElement="Activity_1i46ta4">
        <dc:Bounds x="910" y="50" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_03trwm6_di" bpmnElement="Activity_03trwm6">
        <dc:Bounds x="910" y="320" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Gateway_0ha0m7b_di" bpmnElement="Gateway_0ha0m7b" isMarkerVisible="true">
        <dc:Bounds x="1055" y="193" width="50" height="50" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_0uefnoo_di" bpmnElement="Event_0uefnoo">
        <dc:Bounds x="1142" y="200" width="36" height="36" />
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>
', '{"bounds":{"lowerRight":{"x":1485.0,"y":700.0},"upperLeft":{"x":0.0,"y":0.0}},"resourceId":"canvas","stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"},"properties":{"process_id":"demo-custom-method","name":"人员/流转调用自定义方法示例","documentation":"人员/流转调用自定义方法示例","process_namespace":"http://bpmn.io/schema/bpmn","iseagerexecutionfetch":false,"messages":[],"executionlisteners":{"executionListeners":[]},"eventlisteners":{"eventListeners":[]},"signaldefinitions":[],"messagedefinitions":[],"escalationdefinitions":[]},"childShapes":[{"bounds":{"lowerRight":{"x":276.0,"y":236.0},"upperLeft":{"x":240.0,"y":200.0}},"resourceId":"startEvent_1","childShapes":[],"stencil":{"id":"StartNoneEvent"},"properties":{"overrideid":"startEvent_1","name":"开始","interrupting":true,"formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0yhobgw"}]},{"bounds":{"lowerRight":{"x":430.0,"y":258.0},"upperLeft":{"x":330.0,"y":178.0}},"resourceId":"Activity_06t0e98","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_06t0e98","name":"发起人","formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1t6zwdf"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0yhobgw","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":18.0,"y":18.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_06t0e98"}],"target":{"resourceId":"Activity_06t0e98"},"properties":{"overrideid":"Flow_0yhobgw"}},{"bounds":{"lowerRight":{"x":590.0,"y":258.0},"upperLeft":{"x":490.0,"y":178.0}},"resourceId":"Activity_07ghy8s","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_07ghy8s","name":"方式1","formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0kxxs74"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1t6zwdf","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_07ghy8s"}],"target":{"resourceId":"Activity_07ghy8s"},"properties":{"overrideid":"Flow_1t6zwdf"}},{"bounds":{"lowerRight":{"x":750.0,"y":258.0},"upperLeft":{"x":650.0,"y":178.0}},"resourceId":"Activity_10810pv","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_10810pv","name":"方式2","formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_01h467o"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0kxxs74","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_10810pv"}],"target":{"resourceId":"Activity_10810pv"},"properties":{"overrideid":"Flow_0kxxs74"}},{"bounds":{"lowerRight":{"x":1010.0,"y":130.0},"upperLeft":{"x":910.0,"y":50.0}},"resourceId":"Activity_1i46ta4","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1i46ta4","name":"方式3","formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1x5wxzy"}]},{"bounds":{"lowerRight":{"x":1010.0,"y":400.0},"upperLeft":{"x":910.0,"y":320.0}},"resourceId":"Activity_03trwm6","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_03trwm6","name":"方式4","formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_00r5t9o"}]},{"bounds":{"lowerRight":{"x":1178.0,"y":236.0},"upperLeft":{"x":1142.0,"y":200.0}},"resourceId":"Event_0uefnoo","childShapes":[],"stencil":{"id":"EndNoneEvent"},"properties":{"overrideid":"Event_0uefnoo","executionlisteners":{"executionListeners":[]}},"outgoing":[]},{"bounds":{"lowerRight":{"x":865.0,"y":243.0},"upperLeft":{"x":815.0,"y":193.0}},"resourceId":"Gateway_0mtj57e","childShapes":[],"stencil":{"id":"ExclusiveGateway"},"properties":{"overrideid":"Gateway_0mtj57e","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0kdt4xu"},{"resourceId":"Flow_0jw1ae2"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_01h467o","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":25.0,"y":25.0}],"outgoing":[{"resourceId":"Gateway_0mtj57e"}],"target":{"resourceId":"Gateway_0mtj57e"},"properties":{"overrideid":"Flow_01h467o"}},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0kdt4xu","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":25.0,"y":25.0},{"x":840.0,"y":90.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1i46ta4"}],"target":{"resourceId":"Activity_1i46ta4"},"properties":{"overrideid":"Flow_0kdt4xu","conditionsequenceflow":"${wfCustomUserHandler.condition(execution, ''对'')}"}},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0jw1ae2","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":25.0,"y":25.0},{"x":840.0,"y":360.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_03trwm6"}],"target":{"resourceId":"Activity_03trwm6"},"properties":{"overrideid":"Flow_0jw1ae2","conditionsequenceflow":"${wfCustomUserHandler.condition(execution, ''错'')}"}},{"bounds":{"lowerRight":{"x":1105.0,"y":243.0},"upperLeft":{"x":1055.0,"y":193.0}},"resourceId":"Gateway_0ha0m7b","childShapes":[],"stencil":{"id":"ExclusiveGateway"},"properties":{"overrideid":"Gateway_0ha0m7b","asynchronousdefinition":false,"exclusivedefinition":true,"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1fun2ye"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1x5wxzy","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":1080.0,"y":90.0},{"x":25.0,"y":25.0}],"outgoing":[{"resourceId":"Gateway_0ha0m7b"}],"target":{"resourceId":"Gateway_0ha0m7b"},"properties":{"overrideid":"Flow_1x5wxzy"}},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1fun2ye","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":25.0,"y":25.0},{"x":18.0,"y":18.0}],"outgoing":[{"resourceId":"Event_0uefnoo"}],"target":{"resourceId":"Event_0uefnoo"},"properties":{"overrideid":"Flow_1fun2ye"}},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_00r5t9o","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":1080.0,"y":360.0},{"x":25.0,"y":25.0}],"outgoing":[{"resourceId":"Gateway_0ha0m7b"}],"target":{"resourceId":"Gateway_0ha0m7b"},"properties":{"overrideid":"Flow_00r5t9o"}}]}', NULL, '0', '000000');
INSERT INTO "ACT_DE_MODEL" VALUES ('89d9c299dfed64a7834fdb7caccc913f', '字段联动', 'field-linkage', 'field-linkage', NULL, '表单字段联动示例', NULL, TO_DATE('2021-12-11 09:23:18', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-12-11 09:23:20', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', '1', '<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:flowable="http://flowable.org/bpmn" xmlns:activiti="http://activiti.org/bpmn" xmlns:camunda="http://camunda.org/schema/1.0/bpmn" targetNamespace="http://bpmn.io/schema/bpmn">
  <process id="field-linkage" name="字段联动" isExecutable="true">
    <documentation>表单字段联动示例</documentation>
    <startEvent id="startEvent_1" name="开始">
      <extensionElements>
        <flowable:formProperty id="1629695558953_19833" name="控制显隐" readable="true" writable="true" />
        <flowable:formProperty id="input" name="单行文本" readable="true" writable="true" />
        <flowable:formProperty id="1629695859796_23456" name="值改变" readable="true" writable="true" />
        <flowable:formProperty id="input2" name="单行文本" readable="true" writable="true" />
      </extensionElements>
      <outgoing>Flow_0ij25wf</outgoing>
    </startEvent>
    <userTask id="Activity_1tlsc5z" name="1">
      <extensionElements>
        <flowable:assignee type="user" value="1123598821738675201" text="管理员" />
        <flowable:formProperty id="1629695558953_19833" name="控制显隐" readable="true" writable="true" />
        <flowable:formProperty id="input" name="单行文本" readable="true" writable="true" />
        <flowable:formProperty id="1629695859796_23456" name="值改变" readable="true" writable="true" />
        <flowable:formProperty id="input2" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0ij25wf</incoming>
      <outgoing>Flow_0vq4xed</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0ij25wf" sourceRef="startEvent_1" targetRef="Activity_1tlsc5z" />
    <endEvent id="Event_1ettf2b">
      <incoming>Flow_0vq4xed</incoming>
    </endEvent>
    <sequenceFlow id="Flow_0vq4xed" sourceRef="Activity_1tlsc5z" targetRef="Event_1ettf2b" />
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_flow">
    <bpmndi:BPMNPlane id="BPMNPlane_flow" bpmnElement="field-linkage">
      <bpmndi:BPMNEdge id="Flow_0vq4xed_di" bpmnElement="Flow_0vq4xed">
        <di:waypoint x="430" y="218" />
        <di:waypoint x="492" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0ij25wf_di" bpmnElement="Flow_0ij25wf">
        <di:waypoint x="276" y="218" />
        <di:waypoint x="330" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="BPMNShape_startEvent_1" bpmnElement="startEvent_1">
        <dc:Bounds x="240" y="200" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="247" y="243" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1tlsc5z_di" bpmnElement="Activity_1tlsc5z">
        <dc:Bounds x="330" y="178" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_1ettf2b_di" bpmnElement="Event_1ettf2b">
        <dc:Bounds x="492" y="200" width="36" height="36" />
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>
', '{"bounds":{"lowerRight":{"x":1485.0,"y":700.0},"upperLeft":{"x":0.0,"y":0.0}},"resourceId":"canvas","stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"},"properties":{"process_id":"field-linkage","name":"字段联动","documentation":"表单字段联动示例","process_namespace":"http://bpmn.io/schema/bpmn","iseagerexecutionfetch":false,"messages":[],"executionlisteners":{"executionListeners":[]},"eventlisteners":{"eventListeners":[]},"signaldefinitions":[],"messagedefinitions":[],"escalationdefinitions":[]},"childShapes":[{"bounds":{"lowerRight":{"x":276.0,"y":236.0},"upperLeft":{"x":240.0,"y":200.0}},"resourceId":"startEvent_1","childShapes":[],"stencil":{"id":"StartNoneEvent"},"properties":{"overrideid":"startEvent_1","name":"开始","interrupting":true,"formproperties":{"formProperties":[{"id":"1629695558953_19833","name":"控制显隐","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"input","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1629695859796_23456","name":"值改变","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"input2","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0ij25wf"}]},{"bounds":{"lowerRight":{"x":430.0,"y":258.0},"upperLeft":{"x":330.0,"y":178.0}},"resourceId":"Activity_1tlsc5z","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1tlsc5z","name":"1","formproperties":{"formProperties":[{"id":"1629695558953_19833","name":"控制显隐","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"input","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1629695859796_23456","name":"值改变","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"input2","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0vq4xed"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0ij25wf","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":18.0,"y":18.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1tlsc5z"}],"target":{"resourceId":"Activity_1tlsc5z"},"properties":{"overrideid":"Flow_0ij25wf"}},{"bounds":{"lowerRight":{"x":528.0,"y":236.0},"upperLeft":{"x":492.0,"y":200.0}},"resourceId":"Event_1ettf2b","childShapes":[],"stencil":{"id":"EndNoneEvent"},"properties":{"overrideid":"Event_1ettf2b","executionlisteners":{"executionListeners":[]}},"outgoing":[]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0vq4xed","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":18.0,"y":18.0}],"outgoing":[{"resourceId":"Event_1ettf2b"}],"target":{"resourceId":"Event_1ettf2b"},"properties":{"overrideid":"Flow_0vq4xed"}}]}', NULL, '0', '000000');
INSERT INTO "ACT_DE_MODEL" VALUES ('d71049b6ba4eda39cacf9baf984274ac', '节点独立表单示例', 'indep-form', 'wf_indep_default-value', NULL, NULL, NULL, TO_DATE('2021-12-11 09:23:22', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-12-11 09:23:23', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', '1', '<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:flowable="http://flowable.org/bpmn" xmlns:activiti="http://activiti.org/bpmn" xmlns:camunda="http://camunda.org/schema/1.0/bpmn" targetNamespace="http://bpmn.io/schema/bpmn">
  <process id="indep-form" name="节点独立表单示例" isExecutable="true">
    <startEvent id="startEvent_1" name="开始">
      <extensionElements>
        <flowable:indepFormKey value="default-value" />
        <flowable:formProperty id="1622472547203_21841" name="人事姓名" readable="true" writable="true" />
        <flowable:formProperty id="1622553629767_65211" name="人事职位" readable="true" writable="true" />
        <flowable:formProperty id="1622472547375_86557" name="人事部门" readable="true" writable="true" />
        <flowable:formProperty id="1622553629949_3168" name="当前日期" readable="true" writable="true" />
        <flowable:formProperty id="1622553631752_15562" name="当前时间" readable="true" writable="true" />
        <flowable:formProperty id="1622553691156_69886" name="人事姓名和日期" readable="true" writable="true" />
        <flowable:formProperty id="1622472547780_5707" name="经理姓名" readable="true" writable="true" />
        <flowable:formProperty id="1622472547975_90560" name="经理部门" readable="true" writable="true" />
        <flowable:formProperty id="1622472548372_60141" name="老板姓名" readable="true" writable="true" />
        <flowable:formProperty id="1622472548560_32474" name="老板部门" readable="true" writable="true" />
      </extensionElements>
      <outgoing>Flow_0u2w7hr</outgoing>
    </startEvent>
    <userTask id="Activity_0a06fpe" name="节点1" flowable:indepFormKey="leave" flowable:indepFormSummary="0">
      <extensionElements>
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
        <flowable:formProperty id="datetime" name="请假时间" readable="true" writable="true" />
        <flowable:formProperty id="days" name="请假天数" readable="true" writable="true" />
        <flowable:formProperty id="reason" name="请假理由" readable="true" writable="true" />
        <flowable:assignee type="user" value="1123598821738675201" text="管理员" />
      </extensionElements>
      <incoming>Flow_0u2w7hr</incoming>
      <outgoing>Flow_1gfy6oq</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0u2w7hr" sourceRef="startEvent_1" targetRef="Activity_0a06fpe" />
    <userTask id="Activity_0k3kp91" name="节点2" flowable:indepFormKey="demo-test" flowable:indepFormSummary="0">
      <extensionElements>
        <flowable:formProperty id="1624624365132_23209" name="单行文本" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
        <flowable:assignee type="user" value="1123598821738675201" text="管理员" />
      </extensionElements>
      <incoming>Flow_1gfy6oq</incoming>
      <outgoing>Flow_016wlba</outgoing>
    </userTask>
    <sequenceFlow id="Flow_1gfy6oq" sourceRef="Activity_0a06fpe" targetRef="Activity_0k3kp91" />
    <userTask id="Activity_1yv7km2" name="汇总" flowable:indepFormSummary="1">
      <extensionElements>
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
        <flowable:assignee type="user" value="1123598821738675201" text="管理员" />
      </extensionElements>
      <incoming>Flow_016wlba</incoming>
      <outgoing>Flow_1omx17n</outgoing>
    </userTask>
    <sequenceFlow id="Flow_016wlba" sourceRef="Activity_0k3kp91" targetRef="Activity_1yv7km2" />
    <endEvent id="Event_1vr1neq" name="结束">
      <incoming>Flow_1omx17n</incoming>
    </endEvent>
    <sequenceFlow id="Flow_1omx17n" sourceRef="Activity_1yv7km2" targetRef="Event_1vr1neq" />
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_flow">
    <bpmndi:BPMNPlane id="BPMNPlane_flow" bpmnElement="indep-form">
      <bpmndi:BPMNEdge id="Flow_0u2w7hr_di" bpmnElement="Flow_0u2w7hr">
        <di:waypoint x="276" y="218" />
        <di:waypoint x="330" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1gfy6oq_di" bpmnElement="Flow_1gfy6oq">
        <di:waypoint x="430" y="218" />
        <di:waypoint x="490" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_016wlba_di" bpmnElement="Flow_016wlba">
        <di:waypoint x="590" y="218" />
        <di:waypoint x="650" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_1omx17n_di" bpmnElement="Flow_1omx17n">
        <di:waypoint x="750" y="218" />
        <di:waypoint x="812" y="218" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="BPMNShape_startEvent_1" bpmnElement="startEvent_1">
        <dc:Bounds x="240" y="200" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="247" y="243" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0a06fpe_di" bpmnElement="Activity_0a06fpe">
        <dc:Bounds x="330" y="178" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0k3kp91_di" bpmnElement="Activity_0k3kp91">
        <dc:Bounds x="490" y="178" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1yv7km2_di" bpmnElement="Activity_1yv7km2">
        <dc:Bounds x="650" y="178" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_1vr1neq_di" bpmnElement="Event_1vr1neq">
        <dc:Bounds x="812" y="200" width="36" height="36" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="819" y="243" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>
', '{"bounds":{"lowerRight":{"x":1485.0,"y":700.0},"upperLeft":{"x":0.0,"y":0.0}},"resourceId":"canvas","stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"},"properties":{"process_id":"indep-form","name":"节点独立表单示例","process_namespace":"http://bpmn.io/schema/bpmn","iseagerexecutionfetch":false,"messages":[],"executionlisteners":{"executionListeners":[]},"eventlisteners":{"eventListeners":[]},"signaldefinitions":[],"messagedefinitions":[],"escalationdefinitions":[]},"childShapes":[{"bounds":{"lowerRight":{"x":276.0,"y":236.0},"upperLeft":{"x":240.0,"y":200.0}},"resourceId":"startEvent_1","childShapes":[],"stencil":{"id":"StartNoneEvent"},"properties":{"overrideid":"startEvent_1","name":"开始","interrupting":true,"formproperties":{"formProperties":[{"id":"1622472547203_21841","name":"人事姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622553629767_65211","name":"人事职位","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472547375_86557","name":"人事部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622553629949_3168","name":"当前日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622553631752_15562","name":"当前时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622553691156_69886","name":"人事姓名和日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472547780_5707","name":"经理姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472547975_90560","name":"经理部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472548372_60141","name":"老板姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472548560_32474","name":"老板部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0u2w7hr"}]},{"bounds":{"lowerRight":{"x":430.0,"y":258.0},"upperLeft":{"x":330.0,"y":178.0}},"resourceId":"Activity_0a06fpe","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_0a06fpe","name":"节点1","formproperties":{"formProperties":[{"id":"datetime","name":"请假时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"days","name":"请假天数","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"reason","name":"请假理由","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1gfy6oq"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0u2w7hr","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":18.0,"y":18.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_0a06fpe"}],"target":{"resourceId":"Activity_0a06fpe"},"properties":{"overrideid":"Flow_0u2w7hr"}},{"bounds":{"lowerRight":{"x":590.0,"y":258.0},"upperLeft":{"x":490.0,"y":178.0}},"resourceId":"Activity_0k3kp91","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_0k3kp91","name":"节点2","formproperties":{"formProperties":[{"id":"1624624365132_23209","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_016wlba"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1gfy6oq","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_0k3kp91"}],"target":{"resourceId":"Activity_0k3kp91"},"properties":{"overrideid":"Flow_1gfy6oq"}},{"bounds":{"lowerRight":{"x":750.0,"y":258.0},"upperLeft":{"x":650.0,"y":178.0}},"resourceId":"Activity_1yv7km2","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1yv7km2","name":"汇总","asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1omx17n"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_016wlba","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1yv7km2"}],"target":{"resourceId":"Activity_1yv7km2"},"properties":{"overrideid":"Flow_016wlba"}},{"bounds":{"lowerRight":{"x":848.0,"y":236.0},"upperLeft":{"x":812.0,"y":200.0}},"resourceId":"Event_1vr1neq","childShapes":[],"stencil":{"id":"EndNoneEvent"},"properties":{"overrideid":"Event_1vr1neq","name":"结束","executionlisteners":{"executionListeners":[]}},"outgoing":[]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1omx17n","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":18.0,"y":18.0}],"outgoing":[{"resourceId":"Event_1vr1neq"}],"target":{"resourceId":"Event_1vr1neq"},"properties":{"overrideid":"Flow_1omx17n"}}]}', NULL, '0', '000000');
INSERT INTO "ACT_DE_MODEL" VALUES ('fb4c1a6a8c4588779a2519a547966846', '测试默认值', 'test-default-values', 'default-value', NULL, NULL, NULL, TO_DATE('2021-12-11 09:23:24', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-12-11 09:23:25', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', '1', '<?xml version="1.0" encoding="UTF-8"?>
<definitions xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL" xmlns:bpmndi="http://www.omg.org/spec/BPMN/20100524/DI" xmlns:dc="http://www.omg.org/spec/DD/20100524/DC" xmlns:di="http://www.omg.org/spec/DD/20100524/DI" xmlns:flowable="http://flowable.org/bpmn" xmlns:activiti="http://activiti.org/bpmn" xmlns:camunda="http://camunda.org/schema/1.0/bpmn" targetNamespace="http://bpmn.io/schema/bpmn">
  <process id="test-default-values" name="测试默认值" isExecutable="true" flowable:rollbackNode="Activity_0p2hxfq">
    <startEvent id="startEvent_1" name="开始">
      <extensionElements>
        <flowable:formProperty id="1622472547203_21841" name="人事姓名" readable="true" writable="false" />
        <flowable:formProperty id="1622553629767_65211" name="人事职位" readable="true" writable="false" />
        <flowable:formProperty id="1622472547375_86557" name="人事部门" readable="true" writable="false" />
        <flowable:formProperty id="1622553629949_3168" name="当前日期" readable="true" writable="false" />
        <flowable:formProperty id="1622553631752_15562" name="当前时间" readable="true" writable="false" />
        <flowable:formProperty id="1622553691156_69886" name="人事姓名和日期" readable="true" writable="false" />
        <flowable:formProperty id="1622472547780_5707" name="经理姓名" readable="true" writable="false" />
        <flowable:formProperty id="1622472547975_90560" name="经理部门" readable="true" writable="false" />
        <flowable:formProperty id="1622472548372_60141" name="老板姓名" readable="true" writable="false" />
        <flowable:formProperty id="1622472548560_32474" name="老板部门" readable="true" writable="false" />
      </extensionElements>
      <outgoing>Flow_0c932wc</outgoing>
    </startEvent>
    <userTask id="Activity_0p2hxfq" name="人事" flowable:assignee="1123598821738675201">
      <extensionElements>
        <flowable:formProperty id="1622472547203_21841" name="人事姓名" readable="true" writable="true" />
        <flowable:formProperty id="1622553629767_65211" name="人事职位" readable="true" writable="true" />
        <flowable:formProperty id="1622472547375_86557" name="人事部门" readable="true" writable="true" />
        <flowable:formProperty id="1622553629949_3168" name="当前日期" readable="true" writable="true" />
        <flowable:formProperty id="1622553631752_15562" name="当前时间" readable="true" writable="true" />
        <flowable:formProperty id="1622553691156_69886" name="人事姓名和日期" readable="true" writable="true" />
        <flowable:formProperty id="1622472547780_5707" name="经理姓名" readable="true" writable="false" />
        <flowable:formProperty id="1622472547975_90560" name="经理部门" readable="true" writable="false" />
        <flowable:formProperty id="1622472548372_60141" name="老板姓名" readable="true" writable="false" />
        <flowable:formProperty id="1622472548560_32474" name="老板部门" readable="true" writable="false" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0c932wc</incoming>
      <outgoing>Flow_042y9oy</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0c932wc" sourceRef="startEvent_1" targetRef="Activity_0p2hxfq" />
    <userTask id="Activity_0p0q6jd" name="经理" flowable:assignee="1123598821738675203">
      <extensionElements>
        <flowable:formProperty id="1622472547203_21841" name="人事姓名" readable="true" writable="false" />
        <flowable:formProperty id="1622553629767_65211" name="人事职位" readable="true" writable="false" />
        <flowable:formProperty id="1622472547375_86557" name="人事部门" readable="true" writable="false" />
        <flowable:formProperty id="1622553629949_3168" name="当前日期" readable="true" writable="false" />
        <flowable:formProperty id="1622553631752_15562" name="当前时间" readable="true" writable="false" />
        <flowable:formProperty id="1622553691156_69886" name="人事姓名和日期" readable="true" writable="false" />
        <flowable:formProperty id="1622472547780_5707" name="经理姓名" readable="true" writable="true" />
        <flowable:formProperty id="1622472547975_90560" name="经理部门" readable="true" writable="true" />
        <flowable:formProperty id="1622472548372_60141" name="老板姓名" readable="true" writable="false" />
        <flowable:formProperty id="1622472548560_32474" name="老板部门" readable="true" writable="false" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_042y9oy</incoming>
      <outgoing>Flow_0c47aum</outgoing>
    </userTask>
    <sequenceFlow id="Flow_042y9oy" sourceRef="Activity_0p2hxfq" targetRef="Activity_0p0q6jd" />
    <userTask id="Activity_1dj1hpj" name="老板" flowable:assignee="1123598821738675204">
      <extensionElements>
        <flowable:formProperty id="1622472547203_21841" name="人事姓名" readable="true" writable="false" />
        <flowable:formProperty id="1622553629767_65211" name="人事职位" readable="true" writable="false" />
        <flowable:formProperty id="1622472547375_86557" name="人事部门" readable="true" writable="false" />
        <flowable:formProperty id="1622553629949_3168" name="当前日期" readable="true" writable="false" />
        <flowable:formProperty id="1622553631752_15562" name="当前时间" readable="true" writable="false" />
        <flowable:formProperty id="1622553691156_69886" name="人事姓名和日期" readable="true" writable="false" />
        <flowable:formProperty id="1622472547780_5707" name="经理姓名" readable="true" writable="false" />
        <flowable:formProperty id="1622472547975_90560" name="经理部门" readable="true" writable="false" />
        <flowable:formProperty id="1622472548372_60141" name="老板姓名" readable="true" writable="true" />
        <flowable:formProperty id="1622472548560_32474" name="老板部门" readable="true" writable="true" />
        <flowable:button label="通过" prop="wf_pass" display="true" />
        <flowable:button label="驳回" prop="wf_reject" display="true" />
        <flowable:button label="打印" prop="wf_print" display="true" />
        <flowable:button label="转办" prop="wf_transfer" display="true" />
        <flowable:button label="委托" prop="wf_delegate" display="true" />
        <flowable:button label="终止" prop="wf_terminate" display="true" />
        <flowable:button label="加签" prop="wf_add_instance" display="true" />
        <flowable:button label="减签" prop="wf_del_instance" display="true" />
        <flowable:button label="指定回退" prop="wf_rollback" display="true" />
      </extensionElements>
      <incoming>Flow_0c47aum</incoming>
      <outgoing>Flow_1ehhsly</outgoing>
    </userTask>
    <sequenceFlow id="Flow_0c47aum" sourceRef="Activity_0p0q6jd" targetRef="Activity_1dj1hpj" />
    <endEvent id="Event_03anpp1">
      <incoming>Flow_1ehhsly</incoming>
    </endEvent>
    <sequenceFlow id="Flow_1ehhsly" sourceRef="Activity_1dj1hpj" targetRef="Event_03anpp1" />
  </process>
  <bpmndi:BPMNDiagram id="BPMNDiagram_flow">
    <bpmndi:BPMNPlane id="BPMNPlane_flow" bpmnElement="test-default-values">
      <bpmndi:BPMNEdge id="Flow_1ehhsly_di" bpmnElement="Flow_1ehhsly">
        <di:waypoint x="720" y="215" />
        <di:waypoint x="772" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0c47aum_di" bpmnElement="Flow_0c47aum">
        <di:waypoint x="570" y="215" />
        <di:waypoint x="620" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_042y9oy_di" bpmnElement="Flow_042y9oy">
        <di:waypoint x="420" y="215" />
        <di:waypoint x="470" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNEdge id="Flow_0c932wc_di" bpmnElement="Flow_0c932wc">
        <di:waypoint x="270" y="215" />
        <di:waypoint x="320" y="215" />
      </bpmndi:BPMNEdge>
      <bpmndi:BPMNShape id="BPMNShape_startEvent_1" bpmnElement="startEvent_1">
        <dc:Bounds x="240" y="200" width="30" height="30" />
        <bpmndi:BPMNLabel>
          <dc:Bounds x="243" y="237" width="22" height="14" />
        </bpmndi:BPMNLabel>
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0p2hxfq_di" bpmnElement="Activity_0p2hxfq">
        <dc:Bounds x="320" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_0p0q6jd_di" bpmnElement="Activity_0p0q6jd">
        <dc:Bounds x="470" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Activity_1dj1hpj_di" bpmnElement="Activity_1dj1hpj">
        <dc:Bounds x="620" y="175" width="100" height="80" />
      </bpmndi:BPMNShape>
      <bpmndi:BPMNShape id="Event_03anpp1_di" bpmnElement="Event_03anpp1">
        <dc:Bounds x="772" y="197" width="36" height="36" />
      </bpmndi:BPMNShape>
    </bpmndi:BPMNPlane>
  </bpmndi:BPMNDiagram>
</definitions>
', '{"bounds":{"lowerRight":{"x":1485.0,"y":700.0},"upperLeft":{"x":0.0,"y":0.0}},"resourceId":"canvas","stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"},"properties":{"process_id":"test-default-values","name":"测试默认值","process_namespace":"http://bpmn.io/schema/bpmn","iseagerexecutionfetch":false,"messages":[],"executionlisteners":{"executionListeners":[]},"eventlisteners":{"eventListeners":[]},"signaldefinitions":[],"messagedefinitions":[],"escalationdefinitions":[]},"childShapes":[{"bounds":{"lowerRight":{"x":270.0,"y":230.0},"upperLeft":{"x":240.0,"y":200.0}},"resourceId":"startEvent_1","childShapes":[],"stencil":{"id":"StartNoneEvent"},"properties":{"overrideid":"startEvent_1","name":"开始","interrupting":true,"formproperties":{"formProperties":[{"id":"1622472547203_21841","name":"人事姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553629767_65211","name":"人事职位","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472547375_86557","name":"人事部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553629949_3168","name":"当前日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553631752_15562","name":"当前时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553691156_69886","name":"人事姓名和日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472547780_5707","name":"经理姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472547975_90560","name":"经理部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472548372_60141","name":"老板姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472548560_32474","name":"老板部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false}]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0c932wc"}]},{"bounds":{"lowerRight":{"x":420.0,"y":255.0},"upperLeft":{"x":320.0,"y":175.0}},"resourceId":"Activity_0p2hxfq","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_0p2hxfq","name":"人事","usertaskassignment":{"assignment":{"type":"static","assignee":"1123598821738675201"}},"formproperties":{"formProperties":[{"id":"1622472547203_21841","name":"人事姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622553629767_65211","name":"人事职位","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472547375_86557","name":"人事部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622553629949_3168","name":"当前日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622553631752_15562","name":"当前时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622553691156_69886","name":"人事姓名和日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472547780_5707","name":"经理姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472547975_90560","name":"经理部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472548372_60141","name":"老板姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472548560_32474","name":"老板部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_042y9oy"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0c932wc","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":15.0,"y":15.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_0p2hxfq"}],"target":{"resourceId":"Activity_0p2hxfq"},"properties":{"overrideid":"Flow_0c932wc"}},{"bounds":{"lowerRight":{"x":570.0,"y":255.0},"upperLeft":{"x":470.0,"y":175.0}},"resourceId":"Activity_0p0q6jd","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_0p0q6jd","name":"经理","usertaskassignment":{"assignment":{"type":"static","assignee":"1123598821738675203"}},"formproperties":{"formProperties":[{"id":"1622472547203_21841","name":"人事姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553629767_65211","name":"人事职位","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472547375_86557","name":"人事部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553629949_3168","name":"当前日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553631752_15562","name":"当前时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553691156_69886","name":"人事姓名和日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472547780_5707","name":"经理姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472547975_90560","name":"经理部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472548372_60141","name":"老板姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472548560_32474","name":"老板部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0c47aum"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_042y9oy","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_0p0q6jd"}],"target":{"resourceId":"Activity_0p0q6jd"},"properties":{"overrideid":"Flow_042y9oy"}},{"bounds":{"lowerRight":{"x":720.0,"y":255.0},"upperLeft":{"x":620.0,"y":175.0}},"resourceId":"Activity_1dj1hpj","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1dj1hpj","name":"老板","usertaskassignment":{"assignment":{"type":"static","assignee":"1123598821738675204"}},"formproperties":{"formProperties":[{"id":"1622472547203_21841","name":"人事姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553629767_65211","name":"人事职位","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472547375_86557","name":"人事部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553629949_3168","name":"当前日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553631752_15562","name":"当前时间","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622553691156_69886","name":"人事姓名和日期","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472547780_5707","name":"经理姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472547975_90560","name":"经理部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":false},{"id":"1622472548372_60141","name":"老板姓名","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1622472548560_32474","name":"老板部门","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_1ehhsly"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0c47aum","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1dj1hpj"}],"target":{"resourceId":"Activity_1dj1hpj"},"properties":{"overrideid":"Flow_0c47aum"}},{"bounds":{"lowerRight":{"x":808.0,"y":233.0},"upperLeft":{"x":772.0,"y":197.0}},"resourceId":"Event_03anpp1","childShapes":[],"stencil":{"id":"EndNoneEvent"},"properties":{"overrideid":"Event_03anpp1","executionlisteners":{"executionListeners":[]}},"outgoing":[]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_1ehhsly","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":18.0,"y":18.0}],"outgoing":[{"resourceId":"Event_03anpp1"}],"target":{"resourceId":"Event_03anpp1"},"properties":{"overrideid":"Flow_1ehhsly"}}]}', NULL, '0', '000000');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for ACT_DE_MODEL_HISTORY
-- ----------------------------
DROP TABLE "ACT_DE_MODEL_HISTORY";
CREATE TABLE "ACT_DE_MODEL_HISTORY" (
                                                      "ID" NVARCHAR2(255) NOT NULL,
                                                      "NAME" NVARCHAR2(400) NOT NULL,
                                                      "MODEL_KEY" NVARCHAR2(400) NOT NULL,
                                                      "FORM_KEY" NVARCHAR2(255),
                                                      "CATEGORY_ID" NUMBER(20,0),
                                                      "DESCRIPTION" NCLOB,
                                                      "MODEL_COMMENT" NCLOB,
                                                      "CREATED" DATE,
                                                      "CREATED_BY" NVARCHAR2(255),
                                                      "LAST_UPDATED" DATE,
                                                      "LAST_UPDATED_BY" NVARCHAR2(255),
                                                      "REMOVAL_DATE" DATE,
                                                      "VERSION" NUMBER(11,0),
                                                      "XML" NCLOB,
                                                      "MODEL_EDITOR_JSON" NCLOB,
                                                      "MODEL_ID" NVARCHAR2(255) NOT NULL,
                                                      "MODEL_TYPE" NUMBER(11,0),
                                                      "TENANT_ID" NVARCHAR2(255)
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."NAME" IS '名称';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."MODEL_KEY" IS '模型标识';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."FORM_KEY" IS '表单标识';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."CATEGORY_ID" IS '分类id';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."DESCRIPTION" IS '描述';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."MODEL_COMMENT" IS '注释';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."CREATED" IS '创建时间';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."CREATED_BY" IS '创建人';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."LAST_UPDATED" IS '最后更新时间';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."LAST_UPDATED_BY" IS '最后更新人';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."REMOVAL_DATE" IS '移除时间';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."VERSION" IS '版本';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."XML" IS 'xml';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."MODEL_EDITOR_JSON" IS 'flowable-ui编辑器json';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."MODEL_ID" IS 'modelId';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."MODEL_TYPE" IS '类型';
COMMENT ON COLUMN "ACT_DE_MODEL_HISTORY"."TENANT_ID" IS '租户id';
COMMENT ON TABLE "ACT_DE_MODEL_HISTORY" IS '流程 - 定义 - 模型历史';

-- ----------------------------
-- Records of ACT_DE_MODEL_HISTORY
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for ACT_DE_MODEL_RELATION
-- ----------------------------
DROP TABLE "ACT_DE_MODEL_RELATION";
CREATE TABLE "ACT_DE_MODEL_RELATION" (
                                                       "ID" NVARCHAR2(255) NOT NULL,
                                                       "PARENT_MODEL_ID" NVARCHAR2(255),
                                                       "MODEL_ID" NVARCHAR2(255),
                                                       "RELATION_TYPE" NVARCHAR2(255)
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;

-- ----------------------------
-- Records of ACT_DE_MODEL_RELATION
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_BUTTON
-- ----------------------------
DROP TABLE "BLADE_WF_BUTTON";
CREATE TABLE "BLADE_WF_BUTTON" (
                                                 "ID" NUMBER(20,0) NOT NULL,
                                                 "BUTTON_KEY" NVARCHAR2(255),
                                                 "NAME" NVARCHAR2(255),
                                                 "DISPLAY" NUMBER(4,0),
                                                 "SORT" NUMBER(11,0),
                                                 "CREATE_USER" NUMBER(20,0),
                                                 "CREATE_DEPT" NUMBER(20,0),
                                                 "CREATE_TIME" DATE,
                                                 "UPDATE_USER" NUMBER(20,0),
                                                 "UPDATE_TIME" DATE,
                                                 "STATUS" NVARCHAR2(255),
                                                 "IS_DELETED" NUMBER(11,0) DEFAULT 0,
                                                 "TENANT_ID" NVARCHAR2(12) DEFAULT '000000'
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_BUTTON"."BUTTON_KEY" IS '按钮key';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."NAME" IS '名称';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."DISPLAY" IS '默认是否显示';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."SORT" IS '排序';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."UPDATE_USER" IS '修改人';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."IS_DELETED" IS '是否已删除';
COMMENT ON COLUMN "BLADE_WF_BUTTON"."TENANT_ID" IS '租户ID';
COMMENT ON TABLE "BLADE_WF_BUTTON" IS '流程按钮';

-- ----------------------------
-- Records of BLADE_WF_BUTTON
-- ----------------------------
INSERT INTO "BLADE_WF_BUTTON" VALUES ('1394176899911041025', 'wf_pass', '通过', '1', '1', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-16 14:24:10', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-16 14:24:10', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_BUTTON" VALUES ('1394177198465794050', 'wf_reject', '驳回', '1', '2', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-16 14:25:21', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-16 14:25:21', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_BUTTON" VALUES ('1394179125421326337', 'wf_print', '打印', '1', '3', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-16 14:33:01', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-16 14:33:01', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_BUTTON" VALUES ('1394609969089761281', 'wf_transfer', '转办', '1', '4', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-16 19:05:02', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-16 19:05:02', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_BUTTON" VALUES ('1394610036672581634', 'wf_delegate', '委托', '1', '5', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-16 19:05:18', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-16 19:05:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_BUTTON" VALUES ('1395271519601426433', 'wf_terminate', '终止', '1', '6', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-20 14:53:48', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-20 14:53:48', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_BUTTON" VALUES ('1395274709692579841', 'wf_add_instance', '加签', '1', '7', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-20 15:06:28', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-20 15:06:28', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_BUTTON" VALUES ('1395274774674931713', 'wf_del_instance', '减签', '1', '8', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-20 15:06:44', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-20 15:06:44', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_BUTTON" VALUES ('1395274955986305025', 'wf_rollback', '指定回退', '1', '9', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-20 15:07:27', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-20 15:07:27', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_CATEGORY
-- ----------------------------
DROP TABLE "BLADE_WF_CATEGORY";
CREATE TABLE "BLADE_WF_CATEGORY" (
                                                   "ID" NUMBER(20,0) NOT NULL,
                                                   "NAME" NVARCHAR2(255),
                                                   "PID" NUMBER(20,0),
                                                   "SORT" NUMBER(11,0),
                                                   "CREATE_USER" NUMBER(20,0),
                                                   "CREATE_DEPT" NUMBER(20,0),
                                                   "CREATE_TIME" DATE,
                                                   "UPDATE_USER" NUMBER(20,0),
                                                   "UPDATE_TIME" DATE,
                                                   "STATUS" NVARCHAR2(255),
                                                   "IS_DELETED" NUMBER(11,0) DEFAULT 0,
                                                   "TENANT_ID" NVARCHAR2(12) DEFAULT '000000'
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."NAME" IS '分类名称';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."PID" IS '上级id';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."SORT" IS '排序';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."UPDATE_USER" IS '修改人';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."IS_DELETED" IS '是否已删除';
COMMENT ON COLUMN "BLADE_WF_CATEGORY"."TENANT_ID" IS '租户ID';
COMMENT ON TABLE "BLADE_WF_CATEGORY" IS '流程分类';

-- ----------------------------
-- Records of BLADE_WF_CATEGORY
-- ----------------------------
INSERT INTO "BLADE_WF_CATEGORY" VALUES ('1394133715940073474', '请假流程', '0', '1', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-16 11:32:34', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-06-25 20:37:49', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_CATEGORY" VALUES ('1394158934813609986', '财务流程', '0', '2', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-16 13:12:47', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-16 13:13:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_CATEGORY" VALUES ('1394159147934584833', '报销流程', '1394158934813609986', '1', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-16 13:13:38', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-16 13:13:38', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_CONDITION
-- ----------------------------
DROP TABLE "BLADE_WF_CONDITION";
CREATE TABLE "BLADE_WF_CONDITION" (
                                                    "ID" NUMBER(20,0) NOT NULL,
                                                    "NAME" NVARCHAR2(255),
                                                    "EXPRESSION" NVARCHAR2(255),
                                                    "TYPE" NVARCHAR2(255),
                                                    "CREATE_USER" NUMBER(20,0),
                                                    "CREATE_DEPT" NUMBER(20,0),
                                                    "CREATE_TIME" DATE,
                                                    "UPDATE_USER" NUMBER(20,0),
                                                    "UPDATE_TIME" DATE,
                                                    "STATUS" NVARCHAR2(255),
                                                    "IS_DELETED" NUMBER(11,0) DEFAULT 0,
                                                    "TENANT_ID" NVARCHAR2(12) DEFAULT '000000'
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_CONDITION"."NAME" IS '名称';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."EXPRESSION" IS '表达式';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."TYPE" IS '类型';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."UPDATE_USER" IS '修改人';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."IS_DELETED" IS '是否已删除';
COMMENT ON COLUMN "BLADE_WF_CONDITION"."TENANT_ID" IS '租户ID';
COMMENT ON TABLE "BLADE_WF_CONDITION" IS '流程表达式';

-- ----------------------------
-- Records of BLADE_WF_CONDITION
-- ----------------------------
INSERT INTO "BLADE_WF_CONDITION" VALUES ('1408267023015739393', '流程发起人', 'applyUser', 'user', '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-25 11:33:17', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-06-25 11:33:17', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_CONDITION" VALUES ('1408267100878798850', '当前操作人', 'currentUser', 'user', '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-25 11:33:36', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-06-25 11:33:36', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_CONDITION" VALUES ('1408305933398896641', '上级部门领导', 'leader', 'user', '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-25 14:07:54', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-06-25 14:07:54', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_COPY
-- ----------------------------
DROP TABLE "BLADE_WF_COPY";
CREATE TABLE "BLADE_WF_COPY" (
                                               "ID" NUMBER(20,0) NOT NULL,
                                               "USER_ID" NUMBER(20,0),
                                               "TITLE" NVARCHAR2(255),
                                               "INITIATOR" NVARCHAR2(255),
                                               "TASK_ID" NVARCHAR2(255),
                                               "PROCESS_ID" NVARCHAR2(255),
                                               "FORM_KEY" NVARCHAR2(255),
                                               "FORM_URL" NVARCHAR2(255),
                                               "CREATE_USER" NUMBER(20,0),
                                               "CREATE_DEPT" NUMBER(20,0),
                                               "CREATE_TIME" DATE,
                                               "UPDATE_USER" NUMBER(20,0),
                                               "UPDATE_TIME" DATE,
                                               "STATUS" NVARCHAR2(255),
                                               "IS_DELETED" NUMBER(11,0) DEFAULT 0
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_COPY"."USER_ID" IS '用户id';
COMMENT ON COLUMN "BLADE_WF_COPY"."TITLE" IS '标题';
COMMENT ON COLUMN "BLADE_WF_COPY"."INITIATOR" IS '发起者';
COMMENT ON COLUMN "BLADE_WF_COPY"."TASK_ID" IS '任务id';
COMMENT ON COLUMN "BLADE_WF_COPY"."PROCESS_ID" IS '流程实例id';
COMMENT ON COLUMN "BLADE_WF_COPY"."FORM_KEY" IS '外置表单key';
COMMENT ON COLUMN "BLADE_WF_COPY"."FORM_URL" IS '外置表单url';
COMMENT ON COLUMN "BLADE_WF_COPY"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADE_WF_COPY"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADE_WF_COPY"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADE_WF_COPY"."UPDATE_USER" IS '修改人';
COMMENT ON COLUMN "BLADE_WF_COPY"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADE_WF_COPY"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADE_WF_COPY"."IS_DELETED" IS '是否已删除';
COMMENT ON TABLE "BLADE_WF_COPY" IS '流程抄送';

-- ----------------------------
-- Records of BLADE_WF_COPY
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_DEPLOYMENT_FORM
-- ----------------------------
DROP TABLE "BLADE_WF_DEPLOYMENT_FORM";
CREATE TABLE "BLADE_WF_DEPLOYMENT_FORM" (
                                                          "ID" NUMBER(20,0) NOT NULL,
                                                          "DEPLOYMENT_ID" NVARCHAR2(255),
                                                          "FORM_KEY" NVARCHAR2(255),
                                                          "CONTENT" NCLOB,
                                                          "APP_CONTENT" NCLOB,
                                                          "TASK_KEY" NVARCHAR2(255),
                                                          "TASK_NAME" NVARCHAR2(255),
                                                          "CREATE_USER" NUMBER(20,0),
                                                          "CREATE_DEPT" NUMBER(20,0),
                                                          "CREATE_TIME" DATE,
                                                          "UPDATE_USER" NUMBER(20,0),
                                                          "UPDATE_TIME" DATE,
                                                          "STATUS" NVARCHAR2(255),
                                                          "IS_DELETED" NUMBER(11,0) DEFAULT 0
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."DEPLOYMENT_ID" IS '流程部署id';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."FORM_KEY" IS '表单key';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."CONTENT" IS '表单内容';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."APP_CONTENT" IS 'app表单内容';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."TASK_KEY" IS '节点key';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."TASK_NAME" IS '节点名称';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."UPDATE_USER" IS '修改人';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADE_WF_DEPLOYMENT_FORM"."IS_DELETED" IS '是否已删除';
COMMENT ON TABLE "BLADE_WF_DEPLOYMENT_FORM" IS '流程部署 - 表单';

-- ----------------------------
-- Records of BLADE_WF_DEPLOYMENT_FORM
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_DRAFT
-- ----------------------------
DROP TABLE "BLADE_WF_DRAFT";
CREATE TABLE "BLADE_WF_DRAFT" (
                                                "ID" NUMBER(20,0) NOT NULL,
                                                "USER_ID" NUMBER(20,0),
                                                "FORM_KEY" NVARCHAR2(255),
                                                "PROCESS_DEF_ID" NVARCHAR2(255),
                                                "VARIABLES" NCLOB,
                                                "PLATFORM" NVARCHAR2(255)
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_DRAFT"."USER_ID" IS '用户id';
COMMENT ON COLUMN "BLADE_WF_DRAFT"."FORM_KEY" IS '表单key';
COMMENT ON COLUMN "BLADE_WF_DRAFT"."PROCESS_DEF_ID" IS '流程定义id';
COMMENT ON COLUMN "BLADE_WF_DRAFT"."VARIABLES" IS '表单变量';
COMMENT ON COLUMN "BLADE_WF_DRAFT"."PLATFORM" IS '平台 pc/app';
COMMENT ON TABLE "BLADE_WF_DRAFT" IS '流程草稿箱';

-- ----------------------------
-- Records of BLADE_WF_DRAFT
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_FORM
-- ----------------------------
DROP TABLE "BLADE_WF_FORM";
CREATE TABLE "BLADE_WF_FORM" (
                                               "ID" NUMBER(20,0) NOT NULL,
                                               "FORM_KEY" NVARCHAR2(255),
                                               "NAME" NVARCHAR2(255),
                                               "CONTENT" NCLOB,
                                               "APP_CONTENT" NCLOB,
                                               "VERSION" NUMBER(11,0),
                                               "CATEGORY_ID" NUMBER(20,0),
                                               "REMARK" NVARCHAR2(255),
                                               "CREATE_USER" NUMBER(20,0),
                                               "CREATE_DEPT" NUMBER(20,0),
                                               "CREATE_TIME" DATE,
                                               "UPDATE_USER" NUMBER(20,0),
                                               "UPDATE_TIME" DATE,
                                               "STATUS" NUMBER(11,0),
                                               "IS_DELETED" NUMBER(11,0) DEFAULT 0,
                                               "TENANT_ID" NVARCHAR2(12) DEFAULT '000000'
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_FORM"."FORM_KEY" IS '表单key';
COMMENT ON COLUMN "BLADE_WF_FORM"."NAME" IS '表单名称';
COMMENT ON COLUMN "BLADE_WF_FORM"."CONTENT" IS '表单内容';
COMMENT ON COLUMN "BLADE_WF_FORM"."APP_CONTENT" IS 'app表单内容';
COMMENT ON COLUMN "BLADE_WF_FORM"."VERSION" IS '版本';
COMMENT ON COLUMN "BLADE_WF_FORM"."CATEGORY_ID" IS '分类id';
COMMENT ON COLUMN "BLADE_WF_FORM"."REMARK" IS '备注';
COMMENT ON COLUMN "BLADE_WF_FORM"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADE_WF_FORM"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADE_WF_FORM"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADE_WF_FORM"."UPDATE_USER" IS '修改人';
COMMENT ON COLUMN "BLADE_WF_FORM"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADE_WF_FORM"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADE_WF_FORM"."IS_DELETED" IS '是否已删除';
COMMENT ON COLUMN "BLADE_WF_FORM"."TENANT_ID" IS '租户ID';
COMMENT ON TABLE "BLADE_WF_FORM" IS '流程表单';

-- ----------------------------
-- Records of BLADE_WF_FORM
-- ----------------------------
INSERT INTO "BLADE_WF_FORM" VALUES ('1399729025840140290', 'leave', '请假流程表单', '{column:[{type:''datetimerange'',label:''请假时间'',span:12,display:true,format:''yyyy-MM-dd HH:mm:ss'',valueFormat:''yyyy-MM-dd HH:mm:ss'',prop:''datetime'',required:true,rules:[{required:true,message:''开始时间必须填写''}],change:({value}) => {
  if (!value || value.length == 0) {
    this.$set(this.form, ''days'', undefined)
  } else {
    const d1 = Date.parse(value[0])
    const d2 = Date.parse(value[1])
    const day = (d2-d1)/(1*24*60*60*1000)
    this.$set(this.form, ''days'', Number(day.toFixed(2)))
  }
}},{type:''number'',label:''请假天数'',span:12,display:true,prop:''days'',required:true,rules:[{required:true,message:''请假天数必须填写''}],controls:true,controlsPosition:''right'',change:({value}) => {
this.$set(this.form, ''reason'',''请假'' + value + ''天'' )
}},{type:''textarea'',label:''请假理由'',span:24,display:true,prop:''reason'',required:true,rules:[{required:true,message:''请假理由必须填写''}]}],labelPosition:''left'',labelSuffix:''：'',labelWidth:120,gutter:0,menuBtn:true,submitBtn:true,submitText:''提交'',emptyBtn:true,emptyText:''清空'',menuPosition:''center''}', '{"column":[{"type":"datetimerange","label":"请假时间","span":12,"display":true,"format":"yyyy-MM-dd HH:mm:ss","valueFormat":"yyyy-MM-dd HH:mm:ss","prop":"datetime","required":true,"rules":[{"required":true,"message":"开始时间必须填写"}],"change":"({value}) => {\r\n  if (!value || value.length == 0) {\r\n    this.$set(this.form, ''days'', undefined)\r\n  } else {\r\n    const d1 = Date.parse(value[0])\r\n    const d2 = Date.parse(value[1])\r\n    const day = (d2-d1)/(1*24*60*60*1000)\r\n    this.$set(this.form, ''days'', Number(day.toFixed(2)))\r\n  }\r\n}"},{"type":"number","label":"请假天数","span":12,"display":true,"prop":"days","required":true,"rules":[{"required":true,"message":"请假天数必须填写"}],"controls":true,"controlsPosition":"right","change":"({value}) => {\nthis.$set(this.form, ''reason'',''请假'' + value + ''天'' )\n}"},{"type":"textarea","label":"请假理由","span":24,"display":true,"prop":"reason","required":true,"rules":[{"required":true,"message":"请假理由必须填写"}]}],"labelPosition":"left","labelSuffix":"：","labelWidth":120,"gutter":0,"menuBtn":true,"submitBtn":true,"submitText":"提交","emptyBtn":true,"emptyText":"清空","menuPosition":"center"}', '1', '-1', NULL, '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-01 22:06:20', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-11-01 09:08:07', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_FORM" VALUES ('1408402768310304770', 'demo-test', '测试简单表单', '{column:[{type:''input'',label:''单行文本'',span:24,display:true,prop:''1624624365132_23209''}],labelPosition:''left'',labelSuffix:''：'',labelWidth:120,gutter:0,menuBtn:true,submitBtn:true,submitText:''提交'',emptyBtn:true,emptyText:''清空'',menuPosition:''center''}', '{"column":[{"type":"input","label":"单行文本","span":24,"display":true,"prop":"1624624365132_23209"}],"labelPosition":"left","labelSuffix":"：","labelWidth":120,"gutter":0,"menuBtn":true,"submitBtn":true,"submitText":"提交","emptyBtn":true,"emptyText":"清空","menuPosition":"center"}', '1', '-1', NULL, '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-25 20:32:41', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-11-01 09:08:09', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_FORM" VALUES ('1429672727182159874', 'field-linkage', '字段联动', '{column:[{type:''switch'',label:''控制显隐'',span:24,display:true,value:''0'',dicData:[{label:'''',value:''0''},{label:'''',value:''1''}],prop:''1629695558953_19833'',change:({value}) => {
    const input = this.findObject(this.option.column, ''input'')
    if(value == 0) {
        input.display = false
    } else {
        input.display = true
    }
}},{type:''input'',label:''单行文本'',span:24,display:true,prop:''input'',change:({value}) => {

}},{type:''select'',label:''值改变'',dicData:[{label:''一天'',value:''1''},{label:''两天'',value:''2''},{label:''三天'',value:''3''}],cascaderItem:[],span:24,display:true,props:{label:''label'',value:''value''},prop:''1629695859796_23456'',change:({value}) => {
    let text = value
    if(value) {
        text = ''请假 '' + value + '' 天''
    }
    this.$set(this.form, ''input2'', text)
}},{type:''input'',label:''单行文本'',span:24,display:true,prop:''input2'',change:({value}) => {

}}],labelPosition:''left'',labelSuffix:''：'',labelWidth:120,gutter:0,menuBtn:true,submitBtn:true,submitText:''提交'',emptyBtn:true,emptyText:''清空'',menuPosition:''center''}', '{"column":[{"type":"switch","label":"控制显隐","span":24,"display":true,"value":"0","dicData":[{"label":"","value":"0"},{"label":"","value":"1"}],"prop":"1629695558953_19833","change":"({value}) => {\r\n    const input = this.findObject(this.option.column, ''input'')\r\n    if(value == 0) {\r\n        input.display = false\r\n    } else {\r\n        input.display = true\r\n    }\r\n}"},{"type":"input","label":"单行文本","span":24,"display":true,"prop":"input","change":"({value}) => {\r\n\r\n}"},{"type":"select","label":"值改变","dicData":[{"label":"一天","value":"1"},{"label":"两天","value":"2"},{"label":"三天","value":"3"}],"cascaderItem":[],"span":24,"display":true,"props":{"label":"label","value":"value"},"prop":"1629695859796_23456","change":"({value}) => {\r\n    let text = value\r\n    if(value) {\r\n        text = ''请假 '' + value + '' 天''\r\n    }\r\n    this.$set(this.form, ''input2'', text)\r\n}"},{"type":"input","label":"单行文本","span":24,"display":true,"prop":"input2","change":"({value}) => {\r\n\r\n}"}],"labelPosition":"left","labelSuffix":"：","labelWidth":120,"gutter":0,"menuBtn":true,"submitBtn":true,"submitText":"提交","emptyBtn":true,"emptyText":"清空","menuPosition":"center"}', '1', '-1', '字段联动示例', '1123598821738675201', '1123598813738675201', TO_DATE('2021-08-23 13:11:54', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-11-01 09:08:10', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_FORM" VALUES ('1399359377009377281', 'default-value', '测试默认值', '{column:[{type:''input'',label:''人事姓名'',span:24,display:true,prop:''1622472547203_21841'',value:''${this.$store.getters.userInfo.nick_name}''},{type:''input'',label:''人事职位'',span:24,display:true,prop:''1622553629767_65211'',value:''${this.$store.getters.userInfo.post_name}''},{type:''input'',label:''人事部门'',span:24,display:true,prop:''1622472547375_86557'',value:''${this.$store.getters.userInfo.dept_name}''},{type:''input'',label:''当前日期'',span:24,display:true,prop:''1622553629949_3168'',value:''${this.dateFormat(new Date(),\"yyyy-MM-dd\")}''},{type:''input'',label:''当前时间'',span:24,display:true,prop:''1622553631752_15562'',value:''${this.dateFormat(new Date(),\"hh:mm:ss\")}''},{type:''input'',label:''人事姓名和日期'',span:24,display:true,prop:''1622553691156_69886'',value:''${this.$store.getters.userInfo.nick_name} - ${this.dateFormat(new Date(),\"yyyy-MM-dd\")}''},{type:''input'',label:''经理姓名'',span:24,display:true,prop:''1622472547780_5707'',value:''${this.$store.getters.userInfo.nick_name}''},{type:''input'',label:''经理部门'',span:24,display:true,prop:''1622472547975_90560'',value:''${this.$store.getters.userInfo.dept_name}''},{type:''input'',label:''老板姓名'',span:24,display:true,prop:''1622472548372_60141'',value:''${this.$store.getters.userInfo.nick_name}''},{type:''input'',label:''老板部门'',span:24,display:true,prop:''1622472548560_32474'',value:''${this.$store.getters.userInfo.dept_name}''}],labelPosition:''left'',labelSuffix:''：'',labelWidth:140,gutter:0,menuBtn:true,submitBtn:true,submitText:''提交'',emptyBtn:true,emptyText:''清空'',menuPosition:''center''}', '{"column":[{"type":"input","label":"人事姓名","span":24,"display":true,"prop":"1622472547203_21841","value":"${this.$store.getters.userInfo.nick_name}"},{"type":"input","label":"人事职位","span":24,"display":true,"prop":"1622553629767_65211","value":"${this.$store.getters.userInfo.post_name}"},{"type":"input","label":"人事部门","span":24,"display":true,"prop":"1622472547375_86557","value":"${this.$store.getters.userInfo.dept_name}"},{"type":"input","label":"当前日期","span":24,"display":true,"prop":"1622553629949_3168","value":"${this.dateFormat(new Date(),\"yyyy-MM-dd\")}"},{"type":"input","label":"当前时间","span":24,"display":true,"prop":"1622553631752_15562","value":"${this.dateFormat(new Date(),\"hh:mm:ss\")}"},{"type":"input","label":"人事姓名和日期","span":24,"display":true,"prop":"1622553691156_69886","value":"${this.$store.getters.userInfo.nick_name} - ${this.dateFormat(new Date(),\"yyyy-MM-dd\")}"},{"type":"input","label":"经理姓名","span":24,"display":true,"prop":"1622472547780_5707","value":"${this.$store.getters.userInfo.nick_name}"},{"type":"input","label":"经理部门","span":24,"display":true,"prop":"1622472547975_90560","value":"${this.$store.getters.userInfo.dept_name}"},{"type":"input","label":"老板姓名","span":24,"display":true,"prop":"1622472548372_60141","value":"${this.$store.getters.userInfo.nick_name}"},{"type":"input","label":"老板部门","span":24,"display":true,"prop":"1622472548560_32474","value":"${this.$store.getters.userInfo.dept_name}"}],"labelPosition":"left","labelSuffix":"：","labelWidth":140,"gutter":0,"menuBtn":true,"submitBtn":true,"submitText":"提交","emptyBtn":true,"emptyText":"清空","menuPosition":"center"}', '1', '-1', NULL, '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-31 21:37:29', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-11-01 09:08:05', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_FORM_DEFAULT_VALUES
-- ----------------------------
DROP TABLE "BLADE_WF_FORM_DEFAULT_VALUES";
CREATE TABLE "BLADE_WF_FORM_DEFAULT_VALUES" (
                                                              "ID" NUMBER(20,0) NOT NULL,
                                                              "NAME" NVARCHAR2(255),
                                                              "CONTENT" NVARCHAR2(255),
                                                              "FIELD_TYPE" NVARCHAR2(255),
                                                              "CREATE_USER" NUMBER(20,0),
                                                              "CREATE_DEPT" NUMBER(20,0),
                                                              "CREATE_TIME" DATE,
                                                              "UPDATE_USER" NUMBER(20,0),
                                                              "UPDATE_TIME" DATE,
                                                              "STATUS" NVARCHAR2(255),
                                                              "IS_DELETED" NUMBER(11,0) DEFAULT 0,
                                                              "TENANT_ID" NVARCHAR2(12) DEFAULT '000000'
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."NAME" IS '名称';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."CONTENT" IS '内容';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."FIELD_TYPE" IS '字段类型';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."UPDATE_USER" IS '修改人';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."IS_DELETED" IS '是否已删除';
COMMENT ON COLUMN "BLADE_WF_FORM_DEFAULT_VALUES"."TENANT_ID" IS '租户ID';
COMMENT ON TABLE "BLADE_WF_FORM_DEFAULT_VALUES" IS '流程表单字段默认值';

-- ----------------------------
-- Records of BLADE_WF_FORM_DEFAULT_VALUES
-- ----------------------------
INSERT INTO "BLADE_WF_FORM_DEFAULT_VALUES" VALUES ('1399346112331087873', '当前操作人姓名', '${this.$store.getters.userInfo.nick_name}', 'input', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-31 20:44:46', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-31 20:56:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_FORM_DEFAULT_VALUES" VALUES ('1399347906465595393', '当前操作人部门', '${this.$store.getters.userInfo.dept_name}', 'input', '1123598821738675201', '1123598813738675201', TO_DATE('2021-05-31 20:51:54', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-05-31 20:56:41', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_FORM_DEFAULT_VALUES" VALUES ('1399717069960855553', '当前日期', '${this.dateFormat(new Date(),"yyyy-MM-dd")}', 'input', '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-01 21:18:50', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-06-01 21:34:25', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_FORM_DEFAULT_VALUES" VALUES ('1399717187904684034', '当前操作人职位', '${this.$store.getters.userInfo.post_name}', 'input', '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-01 21:19:18', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-06-01 21:19:18', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_FORM_DEFAULT_VALUES" VALUES ('1399717285564858369', '当前时间', '${this.dateFormat(new Date(),"hh:mm:ss")}', 'input', '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-01 21:19:41', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-06-01 21:34:34', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_FORM_DEFAULT_VALUES" VALUES ('1399718803940655106', '当前操作人姓名和日期', '${this.$store.getters.userInfo.nick_name} - ${this.dateFormat(new Date(),"yyyy-MM-dd")}', 'input', '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-01 21:25:43', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-06-01 21:34:40', 'SYYYY-MM-DD HH24:MI:SS'), '1', '0', '000000');
INSERT INTO "BLADE_WF_FORM_DEFAULT_VALUES" VALUES ('1408401952027443201', '当前操作人姓名', '${this.$store.getters.userInfo.nick_name}', 'input', '1123598821738675201', '1123598813738675201', TO_DATE('2021-06-25 20:29:27', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-06-25 20:29:32', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1', '000000');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_FORM_HISTORY
-- ----------------------------
DROP TABLE "BLADE_WF_FORM_HISTORY";
CREATE TABLE "BLADE_WF_FORM_HISTORY" (
                                                       "ID" NUMBER(20,0) NOT NULL,
                                                       "FORM_ID" NUMBER(20,0),
                                                       "FORM_KEY" NVARCHAR2(255),
                                                       "NAME" NVARCHAR2(255),
                                                       "CONTENT" NCLOB,
                                                       "APP_CONTENT" NCLOB,
                                                       "VERSION" NUMBER(11,0),
                                                       "CATEGORY_ID" NUMBER(20,0),
                                                       "REMARK" NVARCHAR2(255),
                                                       "CREATE_USER" NUMBER(20,0),
                                                       "CREATE_DEPT" NUMBER(20,0),
                                                       "CREATE_TIME" DATE,
                                                       "UPDATE_USER" NUMBER(20,0),
                                                       "UPDATE_TIME" DATE,
                                                       "STATUS" NUMBER(11,0),
                                                       "IS_DELETED" NUMBER(11,0) DEFAULT 0
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."FORM_ID" IS '表单id';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."FORM_KEY" IS '表单key';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."NAME" IS '表单名称';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."CONTENT" IS '表单内容';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."APP_CONTENT" IS 'app表单内容';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."VERSION" IS '版本';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."CATEGORY_ID" IS '分类id';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."REMARK" IS '备注';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."UPDATE_USER" IS '修改人';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADE_WF_FORM_HISTORY"."IS_DELETED" IS '是否已删除';
COMMENT ON TABLE "BLADE_WF_FORM_HISTORY" IS '流程表单';

-- ----------------------------
-- Records of BLADE_WF_FORM_HISTORY
-- ----------------------------
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_MODEL_SCOPE
-- ----------------------------
DROP TABLE "BLADE_WF_MODEL_SCOPE";
CREATE TABLE "BLADE_WF_MODEL_SCOPE" (
                                                      "ID" NUMBER(20,0) NOT NULL,
                                                      "MODEL_ID" NVARCHAR2(255),
                                                      "MODEL_KEY" NVARCHAR2(255),
                                                      "TYPE" NVARCHAR2(255),
                                                      "VAL" NVARCHAR2(255),
                                                      "TEXT" NVARCHAR2(255)
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_MODEL_SCOPE"."MODEL_ID" IS '模型id';
COMMENT ON COLUMN "BLADE_WF_MODEL_SCOPE"."MODEL_KEY" IS '模型key';
COMMENT ON COLUMN "BLADE_WF_MODEL_SCOPE"."TYPE" IS '类型 user用户 role角色 dept部门 post职位';
COMMENT ON COLUMN "BLADE_WF_MODEL_SCOPE"."VAL" IS '用户/角色/部门/职位 id集合';
COMMENT ON COLUMN "BLADE_WF_MODEL_SCOPE"."TEXT" IS '用户/角色/部门/职位 name集合';
COMMENT ON TABLE "BLADE_WF_MODEL_SCOPE" IS '流程模型权限';

-- ----------------------------
-- Records of BLADE_WF_MODEL_SCOPE
-- ----------------------------
INSERT INTO "BLADE_WF_MODEL_SCOPE" VALUES ('1418457955400978434', '0676f2277420b7dc67f69dd3a0ec1164', 'ex-leave', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO "BLADE_WF_MODEL_SCOPE" VALUES ('1418457988913467393', '5b7a367e1139f1ab5cb1e6210685fa91', 'demo-multi-instance', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO "BLADE_WF_MODEL_SCOPE" VALUES ('1418458020752429058', 'fb4c1a6a8c4588779a2519a547966846', 'test-default-values', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO "BLADE_WF_MODEL_SCOPE" VALUES ('1429675430591442946', '89d9c299dfed64a7834fdb7caccc913f', 'field-linkage', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO "BLADE_WF_MODEL_SCOPE" VALUES ('1447556025547763714', 'd71049b6ba4eda39cacf9baf984274ac', 'indep-form', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO "BLADE_WF_MODEL_SCOPE" VALUES ('1469479081375543297', '2f6b3b6de24354bb5df5aad3a87789af', 'leave', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
INSERT INTO "BLADE_WF_MODEL_SCOPE" VALUES ('1469479081379737601', '2f6b3b6de24354bb5df5aad3a87789af', 'leave', 'platform', 'h5', '移动端H5');
COMMIT;
COMMIT;

-- ----------------------------
-- Table structure for BLADE_WF_SERIAL
-- ----------------------------
DROP TABLE "BLADE_WF_SERIAL";
CREATE TABLE "BLADE_WF_SERIAL" (
                                                 "ID" NUMBER(20,0) NOT NULL,
                                                 "DEPLOYMENT_ID" NVARCHAR2(255),
                                                 "NAME" NVARCHAR2(255),
                                                 "PREFIX" NVARCHAR2(255),
                                                 "DATE_FORMAT" NVARCHAR2(255),
                                                 "SUFFIX_LENGTH" NUMBER(11,0),
                                                 "START_SEQUENCE" NUMBER(11,0),
                                                 "CONNECTOR" NVARCHAR2(255),
                                                 "CURRENT_SEQUENCE" NUMBER(11,0),
                                                 "CYCLE" NVARCHAR2(255),
                                                 "CREATE_USER" NUMBER(20,0),
                                                 "CREATE_DEPT" NUMBER(20,0),
                                                 "CREATE_TIME" DATE,
                                                 "UPDATE_USER" NUMBER(20,0),
                                                 "UPDATE_TIME" DATE,
                                                 "STATUS" NVARCHAR2(255),
                                                 "IS_DELETED" NUMBER(11,0) DEFAULT 0
)
    LOGGING
NOCOMPRESS
PCTFREE 10
INITRANS 1
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
)
PARALLEL 1
NOCACHE
DISABLE ROW MOVEMENT
;
COMMENT ON COLUMN "BLADE_WF_SERIAL"."DEPLOYMENT_ID" IS '部署id';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."NAME" IS '名称';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."PREFIX" IS '前缀';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."DATE_FORMAT" IS '日期格式化';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."SUFFIX_LENGTH" IS '后缀位数';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."START_SEQUENCE" IS '初始数值';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."CONNECTOR" IS '连接符';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."CURRENT_SEQUENCE" IS '当前序列';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."CYCLE" IS '重置周期 none不重置 day天 week周 month月 year年';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."CREATE_USER" IS '创建人';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."CREATE_DEPT" IS '创建部门';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."CREATE_TIME" IS '创建时间';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."UPDATE_USER" IS '修改人';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."UPDATE_TIME" IS '修改时间';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."STATUS" IS '状态';
COMMENT ON COLUMN "BLADE_WF_SERIAL"."IS_DELETED" IS '是否已删除';
COMMENT ON TABLE "BLADE_WF_SERIAL" IS '流程流水号';

-- ----------------------------
-- Records of BLADE_WF_SERIAL
-- ----------------------------
INSERT INTO "BLADE_WF_SERIAL" VALUES ('1469478609411485698', '556a1a29-5a21-11ec-b023-7ab62621a7a3', '请假流水号', 'Leave', 'yyyyMMdd', '5', '0', NULL, '1', 'none', NULL, NULL, TO_DATE('2021-12-11 09:26:16', 'SYYYY-MM-DD HH24:MI:SS'), '1123598821738675201', TO_DATE('2021-12-11 09:28:22', 'SYYYY-MM-DD HH24:MI:SS'), '1', '1');
COMMIT;
COMMIT;

-- ----------------------------
-- Primary Key structure for table ACT_DE_MODEL
-- ----------------------------
ALTER TABLE "ACT_DE_MODEL" ADD CONSTRAINT "SYS_C0011413" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table ACT_DE_MODEL
-- ----------------------------
ALTER TABLE "ACT_DE_MODEL" ADD CONSTRAINT "SYS_C0011392" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "ACT_DE_MODEL" ADD CONSTRAINT "SYS_C0011393" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "ACT_DE_MODEL" ADD CONSTRAINT "SYS_C0011394" CHECK ("MODEL_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table ACT_DE_MODEL
-- ----------------------------
CREATE INDEX "IDX_PROC_MOD_CREATED"
    ON "ACT_DE_MODEL" ("CREATED_BY" ASC) LOCAL
  LOGGING
  ONLINE
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);
CREATE UNIQUE INDEX "WF_IDX_MODEL_KEY"
    ON "ACT_DE_MODEL" ("MODEL_KEY" ASC, "TENANT_ID" ASC)
    LOGGING
  ONLINE
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table ACT_DE_MODEL_HISTORY
-- ----------------------------
ALTER TABLE "ACT_DE_MODEL_HISTORY" ADD CONSTRAINT "SYS_C0011411" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table ACT_DE_MODEL_HISTORY
-- ----------------------------
ALTER TABLE "ACT_DE_MODEL_HISTORY" ADD CONSTRAINT "SYS_C0011396" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "ACT_DE_MODEL_HISTORY" ADD CONSTRAINT "SYS_C0011397" CHECK ("NAME" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "ACT_DE_MODEL_HISTORY" ADD CONSTRAINT "SYS_C0011398" CHECK ("MODEL_KEY" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;
ALTER TABLE "ACT_DE_MODEL_HISTORY" ADD CONSTRAINT "SYS_C0011399" CHECK ("MODEL_ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table ACT_DE_MODEL_HISTORY
-- ----------------------------
CREATE INDEX "IDX_PROC_MOD_HISTORY_PROC"
    ON "ACT_DE_MODEL_HISTORY" ("MODEL_ID" ASC) LOCAL
  LOGGING
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table ACT_DE_MODEL_RELATION
-- ----------------------------
ALTER TABLE "ACT_DE_MODEL_RELATION" ADD CONSTRAINT "SYS_C0011410" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table ACT_DE_MODEL_RELATION
-- ----------------------------
ALTER TABLE "ACT_DE_MODEL_RELATION" ADD CONSTRAINT "SYS_C0011391" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table ACT_DE_MODEL_RELATION
-- ----------------------------
CREATE INDEX "FK_RELATION_CHILD"
    ON "ACT_DE_MODEL_RELATION" ("MODEL_ID" ASC)
    LOGGING
  ONLINE
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  BUFFER_POOL DEFAULT
);
CREATE INDEX "FK_RELATION_PARENT"
    ON "ACT_DE_MODEL_RELATION" ("PARENT_MODEL_ID" ASC) LOCAL
  LOGGING
  ONLINE
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table BLADE_WF_BUTTON
-- ----------------------------
ALTER TABLE "BLADE_WF_BUTTON" ADD CONSTRAINT "SYS_C0011412" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_BUTTON
-- ----------------------------
ALTER TABLE "BLADE_WF_BUTTON" ADD CONSTRAINT "SYS_C0011395" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table BLADE_WF_CATEGORY
-- ----------------------------
ALTER TABLE "BLADE_WF_CATEGORY" ADD CONSTRAINT "SYS_C0011414" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_CATEGORY
-- ----------------------------
ALTER TABLE "BLADE_WF_CATEGORY" ADD CONSTRAINT "SYS_C0011400" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table BLADE_WF_CONDITION
-- ----------------------------
ALTER TABLE "BLADE_WF_CONDITION" ADD CONSTRAINT "SYS_C0011415" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_CONDITION
-- ----------------------------
ALTER TABLE "BLADE_WF_CONDITION" ADD CONSTRAINT "SYS_C0011401" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table BLADE_WF_CONDITION
-- ----------------------------
CREATE UNIQUE INDEX "WF_IDX_EXPRESSION"
    ON "BLADE_WF_CONDITION" ("EXPRESSION" ASC, "TYPE" ASC, "TENANT_ID" ASC) LOCAL
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table BLADE_WF_COPY
-- ----------------------------
ALTER TABLE "BLADE_WF_COPY" ADD CONSTRAINT "SYS_C0011416" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_COPY
-- ----------------------------
ALTER TABLE "BLADE_WF_COPY" ADD CONSTRAINT "SYS_C0011402" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table BLADE_WF_DEPLOYMENT_FORM
-- ----------------------------
ALTER TABLE "BLADE_WF_DEPLOYMENT_FORM" ADD CONSTRAINT "SYS_C0011418" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_DEPLOYMENT_FORM
-- ----------------------------
ALTER TABLE "BLADE_WF_DEPLOYMENT_FORM" ADD CONSTRAINT "SYS_C0011404" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table BLADE_WF_DRAFT
-- ----------------------------
ALTER TABLE "BLADE_WF_DRAFT" ADD CONSTRAINT "SYS_C0011417" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_DRAFT
-- ----------------------------
ALTER TABLE "BLADE_WF_DRAFT" ADD CONSTRAINT "SYS_C0011403" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table BLADE_WF_DRAFT
-- ----------------------------
CREATE UNIQUE INDEX "WF_IDX_DRAFT_UNI"
    ON "BLADE_WF_DRAFT" ("USER_ID" ASC, "PROCESS_DEF_ID" ASC, "PLATFORM" ASC) LOCAL
  LOGGING
  ONLINE
  NOSORT
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table BLADE_WF_FORM
-- ----------------------------
ALTER TABLE "BLADE_WF_FORM" ADD CONSTRAINT "SYS_C0011419" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_FORM
-- ----------------------------
ALTER TABLE "BLADE_WF_FORM" ADD CONSTRAINT "SYS_C0011405" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table BLADE_WF_FORM
-- ----------------------------
CREATE UNIQUE INDEX "WF_IDX_FORM_KEY"
    ON "BLADE_WF_FORM" ("FORM_KEY" ASC, "TENANT_ID" ASC)
    LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);

-- ----------------------------
-- Primary Key structure for table BLADE_WF_FORM_DEFAULT_VALUES
-- ----------------------------
ALTER TABLE "BLADE_WF_FORM_DEFAULT_VALUES" ADD CONSTRAINT "SYS_C0011420" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_FORM_DEFAULT_VALUES
-- ----------------------------
ALTER TABLE "BLADE_WF_FORM_DEFAULT_VALUES" ADD CONSTRAINT "SYS_C0011406" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table BLADE_WF_FORM_HISTORY
-- ----------------------------
ALTER TABLE "BLADE_WF_FORM_HISTORY" ADD CONSTRAINT "SYS_C0011421" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_FORM_HISTORY
-- ----------------------------
ALTER TABLE "BLADE_WF_FORM_HISTORY" ADD CONSTRAINT "SYS_C0011407" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table BLADE_WF_MODEL_SCOPE
-- ----------------------------
ALTER TABLE "BLADE_WF_MODEL_SCOPE" ADD CONSTRAINT "SYS_C0011422" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_MODEL_SCOPE
-- ----------------------------
ALTER TABLE "BLADE_WF_MODEL_SCOPE" ADD CONSTRAINT "SYS_C0011408" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Primary Key structure for table BLADE_WF_SERIAL
-- ----------------------------
ALTER TABLE "BLADE_WF_SERIAL" ADD CONSTRAINT "SYS_C0011423" PRIMARY KEY ("ID");

-- ----------------------------
-- Checks structure for table BLADE_WF_SERIAL
-- ----------------------------
ALTER TABLE "BLADE_WF_SERIAL" ADD CONSTRAINT "SYS_C0011409" CHECK ("ID" IS NOT NULL) NOT DEFERRABLE INITIALLY IMMEDIATE NORELY VALIDATE;

-- ----------------------------
-- Indexes structure for table BLADE_WF_SERIAL
-- ----------------------------
CREATE UNIQUE INDEX "UNI"
    ON "BLADE_WF_SERIAL" ("DEPLOYMENT_ID" ASC) LOCAL
  LOGGING
  VISIBLE
PCTFREE 10
INITRANS 2
STORAGE (
  INITIAL 65536
  NEXT 1048576
  MINEXTENTS 1
  MAXEXTENTS 2147483645
  BUFFER_POOL DEFAULT
);
