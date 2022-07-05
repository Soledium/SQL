CREATE DATABASE vehiculos;

CREATE TABLE public.autos
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 ),
    marca text NOT NULL,
    modelo text NOT NULL,
    year integer NOT NULL,
    color character varying NOT NULL,
    PRIMARY KEY (id)

CREATE TABLE IF NOT EXISTS public.ventas
(
    id bigint NOT NULL,
    fecha date NOT NULL,
    cliente text COLLATE pg_catalog."default" NOT NULL,
    referencia text COLLATE pg_catalog."default",
    cantidad integer NOT NULL,
    id_autos bigint NOT NULL,
    CONSTRAINT ventas_pkey PRIMARY KEY (id_autos),
    CONSTRAINT autos FOREIGN KEY (id_autos)
        REFERENCES public.autos (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
/*punto 5*/
\copy autos FROM 'D:\OneDrive\Escritorio\Bootcamp\Módulo 7 ROBERTO\1-BASES DE DATOS RELACIONALES\DÍA 2\Apoyo Lectura - Base de datos relacionales/autos.csv' csv header;

/* punto 6: realizar consulta con un alias*/
SELECT marca, modelo as tipo, year as "año", color
	FROM public.autos;

/*punto 7 consulta de datos*/
INSERT INTO public.ventas(
	id, fecha, cliente, referencia, cantidad, id_autos)
	VALUES (1, '2022-01-25', 'César Osses', 'compañero de trabajo', 2, 1);
INSERT INTO public.ventas(
	id, fecha, cliente, referencia, cantidad, id_autos)
	VALUES (2, '2022-02-28', 'Miguel Ángel', 'compañero de clases', 1, 3);

/*punto 8, realizar una suma */
SELECT sum(cantidad)as "autos vendidos" FROM ventas

/*punto 9 agregando una tabla nueva*/
ALTER TABLE autos
ADD estado text;

/*punto 10 agregando un nuevo dato*/
INSERT INTO public.autos(marca, modelo, year, color, estado)
	VALUES ('chevrolet', 'spark',2020,'vino','nuevo');

/*punto 11*/
UPDATE public.autos
	SET marca='chevrolet', modelo='2022'
	WHERE id=2;

/*punto 12*/
SELECT count(marca)
	FROM public.autos 
    group by marca;


