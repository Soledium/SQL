
/*REQUERIMIENTOS*/
/* Requerimiento 1 */
psql.exe -U postgres -d unidad_2 -f C:\Users\nesco\Downloads\unidad2.sql

/* Requerimiento 2 */
BEGIN TRANSACTION;
INSERT INTO public.compra(
    cliente_id, fecha)
    VALUES (1, now());
INSERT INTO public.detalle_compra(
    producto_id,compra_id, cantidad)
    VALUES (9, (SELECT MAX(id)FROM compra), 5);
UPDATE public.producto SET stock = stock - 5 WHERE id = 9;
COMMIT;
SELECT * FROM producto;

/*Requerimiento 3 */
BEGIN TRANSACTION;
INSERT INTO public.compra(
    cliente_id, fecha)
    VALUES (2, now());
SAVEPOINT checkpoint;
INSERT INTO public.detalle_compra(
    producto_id, compra_id, cantidad)
    VALUES (1, (SELECT MAX(id) FROM compra), 3); 
UPDATE public.producto SET stock=stock-3 WHERE id=1;
SAVEPOINT checkpoint;
INSERT INTO public.detalle_compra(
    producto_id, compra_id, cantidad)
    VALUES (2, (SELECT MAX(id) FROM compra), 3); 
UPDATE public.producto SET stock=stock-3 WHERE id=2;
SAVEPOINT checkpoint;
INSERT INTO public.detalle_compra(
    producto_id, compra_id, cantidad)
    VALUES (8, (SELECT MAX(id) FROM compra), 3); 
UPDATE public.producto SET stock=stock-3 WHERE id=8;
ROLLBACK TO checkpoint;
COMMIT;

/* Requerimiento 4 desglose */
/* a. Deshabilitar el AUTOCOMMIT .*/
\set AUTOCOMMIT off

/* b. Insertar un nuevo cliente.*/
INSERT INTO cliente(nombre, email) VALUES ('nuevousuario', 'nuevousuario@gmail.com');

/* c. Confirmar que fue agregado en la tabla cliente.*/
SELECT * FROM cliente;

/* d. Realizar un ROLLBACK.*/
ROLLBACK;

/* e. Confirmar que se restauró la información, sin considerar la inserción del punto b.*/
SELECT * FROM cliente;

/* f. Habilitar de nuevo el AUTOCOMMIT.*/
\set AUTOCOMMIT on;
