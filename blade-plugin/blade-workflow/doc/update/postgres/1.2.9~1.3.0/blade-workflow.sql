ALTER TABLE "blade_wf_deployment_form"
    ADD COLUMN "app_content" text;

COMMENT ON COLUMN "blade_wf_deployment_form"."app_content" IS 'app表单内容';

ALTER TABLE "blade_wf_form"
    ADD COLUMN "app_content" text;

COMMENT ON COLUMN "blade_wf_form"."app_content" IS 'app表单内容';

ALTER TABLE "blade_wf_form_history"
    ADD COLUMN "app_content" text;

COMMENT ON COLUMN "blade_wf_form_history"."app_content" IS 'app表单内容';
