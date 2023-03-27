﻿CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;

CREATE TABLE "Movies" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "Title" text NULL,
    "ReleaseDate" timestamp with time zone NOT NULL,
    "Genre" text NULL,
    "Price" numeric NOT NULL,
    CONSTRAINT "PK_Movies" PRIMARY KEY ("Id")
);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20230324132245_InitialCreate', '7.0.4');

COMMIT;

START TRANSACTION;

UPDATE "Movies" SET "Title" = '' WHERE "Title" IS NULL;
ALTER TABLE "Movies" ALTER COLUMN "Title" SET NOT NULL;
ALTER TABLE "Movies" ALTER COLUMN "Title" SET DEFAULT '';

ALTER TABLE "Movies" ALTER COLUMN "Price" TYPE numeric(18,2);

UPDATE "Movies" SET "Genre" = '' WHERE "Genre" IS NULL;
ALTER TABLE "Movies" ALTER COLUMN "Genre" SET NOT NULL;
ALTER TABLE "Movies" ALTER COLUMN "Genre" SET DEFAULT '';

ALTER TABLE "Movies" ADD "Rating" text NOT NULL DEFAULT '';

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20230324232403_Rating', '7.0.4');

COMMIT;

START TRANSACTION;

ALTER TABLE "Movies" ALTER COLUMN "Title" TYPE character varying(60);

ALTER TABLE "Movies" ALTER COLUMN "Rating" TYPE character varying(5);

ALTER TABLE "Movies" ALTER COLUMN "Genre" TYPE character varying(30);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20230324234706_NewDataAnnotations', '7.0.4');

COMMIT;
