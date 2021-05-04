CREATE TABLE IF NOT EXISTS "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE IF NOT EXISTS "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "categories" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE IF NOT EXISTS "subcategories" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "category_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_3937626525"
FOREIGN KEY ("category_id")
  REFERENCES "categories" ("id")
);
CREATE INDEX "index_subcategories_on_category_id" ON "subcategories" ("category_id");
CREATE TABLE IF NOT EXISTS "measure_units" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "characteristics" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "measure_unit_id" integer, "subcategory_id" integer, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_4cf7b3f51e"
FOREIGN KEY ("measure_unit_id")
  REFERENCES "measure_units" ("id")
, CONSTRAINT "fk_rails_ead16bd1d4"
FOREIGN KEY ("subcategory_id")
  REFERENCES "subcategories" ("id")
);
CREATE INDEX "index_characteristics_on_measure_unit_id" ON "characteristics" ("measure_unit_id");
CREATE INDEX "index_characteristics_on_subcategory_id" ON "characteristics" ("subcategory_id");
CREATE TABLE IF NOT EXISTS "products" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "price" decimal(8,2), "subcategory_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, "picture_url" varchar, CONSTRAINT "fk_rails_150008c07d"
FOREIGN KEY ("subcategory_id")
  REFERENCES "subcategories" ("id")
);
CREATE INDEX "index_products_on_subcategory_id" ON "products" ("subcategory_id");
CREATE TABLE IF NOT EXISTS "characteristics_products" ("characteristic_id" integer NOT NULL, "product_id" integer NOT NULL, "value" varchar);
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "login" varchar, "password" varchar, "email" varchar, "address" varchar, "zipcode" integer, "phone" bigint, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
CREATE TABLE IF NOT EXISTS "orders" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL, CONSTRAINT "fk_rails_f868b47f6a"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_orders_on_user_id" ON "orders" ("user_id");
CREATE TABLE IF NOT EXISTS "orders_products" ("order_id" integer NOT NULL, "product_id" integer NOT NULL);
CREATE TABLE IF NOT EXISTS "parsing_jobs" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "status" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
INSERT INTO "schema_migrations" (version) VALUES
('20210425071557'),
('20210425071617'),
('20210425071709'),
('20210425071818'),
('20210425072335'),
('20210425082129'),
('20210425165749'),
('20210426061814'),
('20210426062130'),
('20210426062257'),
('20210504084538');


