-- Database: blazor

-- Table: public."tblRecipe"

-- DROP TABLE public."tblRecipe";

CREATE TABLE public."tblRecipe"
(
    "RecipeId" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 999999999 CACHE 1 ),
    "Name" character varying COLLATE pg_catalog."default",
    "Ingredients" character varying COLLATE pg_catalog."default",
    "Description" character varying COLLATE pg_catalog."default",
    "Notes" character varying COLLATE pg_catalog."default",
    CONSTRAINT "tblRecipe_pkey" PRIMARY KEY ("RecipeId")
)

TABLESPACE pg_default;

ALTER TABLE public."tblRecipe"
    OWNER to postgres;



INSERT INTO public."tblRecipe"(
	"Name", "Ingredients", "Description", "Notes")
	VALUES ('Name1', 'Ingredients1', 'Description1', 'Notes');
