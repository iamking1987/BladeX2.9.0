ALTER TABLE "blade_wf_form" ADD COLUMN "category_id" int8;
ALTER TABLE "blade_wf_form_history" ADD COLUMN "category_id" int8;
ALTER TABLE "act_de_model" ADD COLUMN "category_id" int8;
ALTER TABLE "act_de_model_history" ADD COLUMN "category_id" int8;

COMMENT ON COLUMN "blade_wf_form"."category_id" IS '分类id';
COMMENT ON COLUMN "blade_wf_form_history"."category_id" IS '分类id';
COMMENT ON COLUMN "act_de_model"."category_id" IS '分类id';
COMMENT ON COLUMN "act_de_model_history"."category_id" IS '分类id';
