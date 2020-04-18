-- Database: blazor

-- Table: public."cidades"

DROP TABLE public."cidades";

CREATE TABLE public."cidades"
(
    "id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 999999999 CACHE 1 ),
    "nome" character varying COLLATE pg_catalog."default",
    CONSTRAINT "cidades_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."cidades"
    OWNER to postgres;



INSERT INTO public."cidades"( "nome") VALUES ('Name1');
INSERT INTO public."cidades"( "nome") VALUES ('Name2');
INSERT INTO public."cidades"( "nome") VALUES ('Name3');
