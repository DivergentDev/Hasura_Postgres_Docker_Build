CREATE TABLE "public"."User" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "firstname" text NOT NULL, "lastname" text NOT NULL, "email" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "password" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"), UNIQUE ("email"));COMMENT ON TABLE "public"."User" IS E'A table to store all base user data within the database';
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_User_updated_at"
BEFORE UPDATE ON "public"."User"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_User_updated_at" ON "public"."User" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
