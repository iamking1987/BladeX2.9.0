ALTER TABLE "blade_wf_button" ADD COLUMN "display" int4;

COMMENT ON COLUMN "blade_wf_button"."display" IS '默认是否显示';

UPDATE blade_wf_button SET display = 1;
