use actividades;
/* 3.1. Obtener todos los almacenes*/
SELECT * FROM ALMACENES;

/* 3.2. Obtener todas las cajas cuyo contenido tenga un valor superior a 150 ¤.*/
SELECT * FROM CAJAS WHERE Valor > 150;

/* 3.3. Obtener los tipos de contenidos de las cajas.*/
SELECT DISTINCT Contenido FROM CAJAS;

/* 3.4. Obtener el valor medio de todas las cajas.*/
SELECT AVG(Valor) FROM CAJAS;

/* 3.5. Obtener el valor medio de las cajas de cada almacen.*/
SELECT Almacen, AVG(Valor) FROM CAJAS GROUP BY Almacen;

/* 3.6. Obtener los c ́odigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150.*/
SELECT Almacen, AVG(Valor)
FROM CAJAS
GROUP BY Almacen
HAVING AVG(Valor) > 150;

/* 3.7. Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra.*/
SELECT NumReferencia, Lugar FROM ALMACENES INNER JOIN CAJAS ON ALMACENES.Codigo = CAJAS.Almacen;

/* 3.8. Obtener el numero de cajas que hay en cada almacen. */
SELECT Codigo, COUNT(NumReferencia)
FROM ALMACENES LEFT JOIN CAJAS
ON ALMACENES.Codigo = CAJAS.Almacen
GROUP BY Codigo;

/* 3.9. Obtener los c ́odigos de los almacenes que est ́an saturados (los almacenes donde el numero de cajas es superior a la capacidad).*/
SELECT Codigo FROM ALMACENES WHERE Capacidad < ( SELECT COUNT(*) FROM CAJAS WHERE Almacen = Codigo);

/* 3.10. Obtener los numeros de referencia de las cajas que est ́an en Bilbao. */
SELECT NumReferencia FROM CAJAS WHERE Almacen IN(SELECT Codigo FROM ALMACENES WHERE Lugar = 'Bilbao');

/* 3.11. Insertar un nuevo almac ́en en Barcelona con capacidad para 3 cajas.*/
INSERT INTO ALMACENES(Codigo,Lugar,Capacidad) VALUES(6,'Barcelona',3);

/* 3.12. Insertar una nueva caja, con n ́umero de referencia ‘H5RT', con contenido ‘Papel',valor 200, y situada en el almac ́en 2.*/
INSERT INTO CAJAS VALUES('H5RT','Papel',200,2);

/* 3.13. Rebajar el valor de todas las cajas un 15 */
UPDATE CAJAS SET Valor = Valor * 0.85;

/* 3.14. Rebajar un 20 % el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas.*/
UPDATE CAJAS SET Valor = Valor * 0.80
WHERE Valor > (SELECT AVG(Valor) FROM cajas);

/* 3.15. Eliminar todas las cajas cuyo valor sea inferior a 100 ¤.*/
DELETE FROM CAJAS WHERE Valor < 100;

/* 3.16. Vaciar el contenido de los almacenes que est ́an saturados.*/
DELETE FROM CAJAS WHERE Almacen IN(SELECT Codigo FROM ALMACENES WHERE Capacidad <(SELECT COUNT(*)FROM CAJAS WHERE Almacen = Codigo));