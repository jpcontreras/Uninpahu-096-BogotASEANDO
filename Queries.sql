
#Create BD bogotaseando
CREATE DATABASE bogotaseando
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;

#Create scrap_types table

CREATE TABLE public.scrap_types
(
  id bigint NOT NULL DEFAULT nextval('scrap_types_id_seq'::regclass),
  name character varying,
  created_at timestamp without time zone NOT NULL,
  updated_at timestamp without time zone NOT NULL,
  CONSTRAINT scrap_types_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.scrap_types
  OWNER TO postgres;

#insert data into scrap_types table

INSERT INTO "scrap_types" ("name", "created_at", "updated_at") VALUES ('De todo tipo', '2018-06-19 01:53:45.944685', '2018-06-19 01:53:45.944685') 

INSERT INTO "scrap_types" ("name", "created_at", "updated_at") VALUES ('Para carros', '2018-06-19 01:57:15.701426', '2018-06-19 01:57:15.701426') 

INSERT INTO "scrap_types" ("name", "created_at", "updated_at") VALUES ('Uso doméstico', '2018-06-19 01:57:28.308906', '2018-06-19 01:57:28.308906')



#insert data into scraps table

INSERT INTO "scraps" ("name", "scrap_type_id", "created_at", "updated_at") VALUES ('Pilas', 1, '2018-06-19 01:59:58.507850', '2018-06-19 01:59:58.507850') 

INSERT INTO "scraps" ("name", "scrap_type_id", "created_at", "updated_at") VALUES ('Llantas', 2, '2018-06-19 02:01:34.619277', '2018-06-19 02:01:34.619277')


#Update data into scrap_types table of id 2
UPDATE "scrap_types" SET "name" = 'Para Carros', "updated_at" = '2018-06-19 02:19:19.271359'
WHERE "scrap_types"."id" = 2 

#select with Join with two tables (scraps and scrap_types)

SELECT "scraps"."id", "scraps"."name", "scrap_types"."name"
FROM "scraps"
INNER JOIN "scrap_types" ON "scrap_types"."id" = "scraps"."scrap_type_id"
WHERE "scraps"."id" = 1
