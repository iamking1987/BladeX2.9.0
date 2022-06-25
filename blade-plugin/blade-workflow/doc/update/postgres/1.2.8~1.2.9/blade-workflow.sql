ALTER TABLE "blade_wf_deployment_form"
    ADD COLUMN "task_key" varchar(255),
  ADD COLUMN "task_name" varchar(255);

COMMENT ON COLUMN "blade_wf_deployment_form"."task_key" IS '节点key';

COMMENT ON COLUMN "blade_wf_deployment_form"."task_name" IS '节点名称';
