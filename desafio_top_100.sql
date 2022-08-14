<<<<<<< HEAD
/*paso 1*/
CREATE DATABASE top_100;

/*paso 2*/
CREATE TABLE IF NOT EXISTS public.peliculas
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    movie character varying COLLATE pg_catalog."default" NOT NULL,
    year integer NOT NULL,
    director character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT peliculas_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.reparto
(
    id bigint NOT NULL,
    actor name COLLATE pg_catalog."C" NOT NULL,
    CONSTRAINT id_reparto FOREIGN KEY (id)
        REFERENCES public.peliculas (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

/*paso 3 consulta id Titanic*/
SELECT id
	FROM public.peliculas
    where movie = 'Titanic';

/*paso 4 consulta id de los actores de titanic*/
SELECT id, actor
	FROM public.reparto
    where id = 2;

/*paso 5 consulta top 100 de harrison ford*/
SELECT actor
	FROM public.reparto
    where actor = 'Harrison Ford';

/*paso 6 peliculas estrenadas entre 1990 y 1999 por título y ascendente*/
SELECT movie
	FROM public.peliculas
    where year between 1990 and 1999
    order by movie asc;

/*paso 7 consulta sql de los titulos y su longitud*/
select char_length(movie) as longitud_titulo, name(movie)
from public.peliculas;

/*paso 8 consultar el titulo con mayor longitud*/
select max(length(movie))
from public.peliculas;

=======
-- paso 1 
CREATE DATABASE peliculas;
-- paso 2
CREATE TABLE pelicula (id BIGINT, pelicula TEXT, año_estreno TEXT, director NAME, PRIMARY KEY (id))
-- paso 3
CREATE TABLE reparto (id INTEGER, nombre NAME, FOREIGN KEY )
>>>>>>> 669d6b059b327e86bf52be80ee7059e4f7ea93da
























