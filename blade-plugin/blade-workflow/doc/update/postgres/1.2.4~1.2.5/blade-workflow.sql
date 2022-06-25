INSERT INTO "act_de_model" ("id", "name", "model_key", "form_key", "description", "model_comment", "created", "created_by", "last_updated", "last_updated_by", "version", "xml", "model_editor_json", "thumbnail", "model_type", "tenant_id") VALUES ('89d9c299dfed64a7834fdb7caccc913f', '字段联动', 'field-linkage', 'field-linkage', '表单字段联动示例', NULL, '2021-08-23 13:22:16.481', '1123598821738675201', '2021-08-23 13:25:32.18', '1123598821738675201', 1, '<?xml version="1.0" encoding="UTF-8"?>
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
', '{"bounds":{"lowerRight":{"x":1485.0,"y":700.0},"upperLeft":{"x":0.0,"y":0.0}},"resourceId":"canvas","stencil":{"id":"BPMNDiagram"},"stencilset":{"namespace":"http://b3mn.org/stencilset/bpmn2.0#","url":"../editor/stencilsets/bpmn2.0/bpmn2.0.json"},"properties":{"process_id":"field-linkage","name":"字段联动","documentation":"表单字段联动示例","process_namespace":"http://bpmn.io/schema/bpmn","iseagerexecutionfetch":false,"messages":[],"executionlisteners":{"executionListeners":[]},"eventlisteners":{"eventListeners":[]},"signaldefinitions":[],"messagedefinitions":[],"escalationdefinitions":[]},"childShapes":[{"bounds":{"lowerRight":{"x":276.0,"y":236.0},"upperLeft":{"x":240.0,"y":200.0}},"resourceId":"startEvent_1","childShapes":[],"stencil":{"id":"StartNoneEvent"},"properties":{"overrideid":"startEvent_1","name":"开始","interrupting":true,"formproperties":{"formProperties":[{"id":"1629695558953_19833","name":"控制显隐","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"input","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1629695859796_23456","name":"值改变","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"input2","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0ij25wf"}]},{"bounds":{"lowerRight":{"x":430.0,"y":258.0},"upperLeft":{"x":330.0,"y":178.0}},"resourceId":"Activity_1tlsc5z","childShapes":[],"stencil":{"id":"UserTask"},"properties":{"overrideid":"Activity_1tlsc5z","name":"1","formproperties":{"formProperties":[{"id":"1629695558953_19833","name":"控制显隐","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"input","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"1629695859796_23456","name":"值改变","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true},{"id":"input2","name":"单行文本","type":null,"expression":null,"variable":null,"default":null,"required":false,"readable":true,"writable":true}]},"asynchronousdefinition":false,"exclusivedefinition":true,"isforcompensation":false,"tasklisteners":{"taskListeners":[]},"executionlisteners":{"executionListeners":[]}},"outgoing":[{"resourceId":"Flow_0vq4xed"}]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0ij25wf","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":18.0,"y":18.0},{"x":50.0,"y":40.0}],"outgoing":[{"resourceId":"Activity_1tlsc5z"}],"target":{"resourceId":"Activity_1tlsc5z"},"properties":{"overrideid":"Flow_0ij25wf"}},{"bounds":{"lowerRight":{"x":528.0,"y":236.0},"upperLeft":{"x":492.0,"y":200.0}},"resourceId":"Event_1ettf2b","childShapes":[],"stencil":{"id":"EndNoneEvent"},"properties":{"overrideid":"Event_1ettf2b","executionlisteners":{"executionListeners":[]}},"outgoing":[]},{"bounds":{"lowerRight":{"x":172.0,"y":212.0},"upperLeft":{"x":128.0,"y":212.0}},"resourceId":"Flow_0vq4xed","childShapes":[],"stencil":{"id":"SequenceFlow"},"dockers":[{"x":50.0,"y":40.0},{"x":18.0,"y":18.0}],"outgoing":[{"resourceId":"Event_1ettf2b"}],"target":{"resourceId":"Event_1ettf2b"},"properties":{"overrideid":"Flow_0vq4xed"}}]}', NULL, 0, '000000');

INSERT INTO "blade_wf_form" ("id", "form_key", "name", "content", "version", "remark", "create_user", "create_dept", "create_time", "update_user", "update_time", "status", "is_deleted", "tenant_id") VALUES (1429672727182159874, 'field-linkage', '字段联动', '{column:[{type:''switch'',label:''控制显隐'',span:24,display:true,value:''0'',dicData:[{label:'''',value:''0''},{label:'''',value:''1''}],prop:''1629695558953_19833'',change:({value}) => {
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

}}],labelPosition:''left'',labelSuffix:''：'',labelWidth:120,gutter:0,menuBtn:true,submitBtn:true,submitText:''提交'',emptyBtn:true,emptyText:''清空'',menuPosition:''center''}', 1, '字段联动示例', 1123598821738675201, 1123598813738675201, '2021-08-23 13:11:54', 1123598821738675201, '2021-08-23 13:25:17.205', '1', 0, '000000');

INSERT INTO "blade_wf_model_scope" ("id", "model_id", "model_key", "type", "val", "text") VALUES (1429675430591442946, '89d9c299dfed64a7834fdb7caccc913f', 'field-linkage', 'role', '1123598816738675201,1123598816738675202,1123598816738675203,1123598816738675204,1123598816738675205', '超级管理员,用户,人事,经理,老板');
