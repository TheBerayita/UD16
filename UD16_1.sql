use actividades;
/* 1.1. Obtener los nombres de los productos de la tienda.*/
SELECT Nombre FROM ARTICULOS;
/* 1.2. Obtener los nombres y los precios de los productos de la tienda.*/
SELECT Nombre, Precio FROM ARTICULOS;
/* 1.3. Obtener el nombre de los productos cuyo precio sea menor o igual a 200.*/
SELECT Nombre FROM ARTICULOS WHERE Precio > 200;

/* 1.4. Obtener todos los datos de los art ́ıculos cuyo precio est ́e entre los 60 y los 120(ambas cantidades incluidas).*/
SELECT * FROM ARTICULOS WHERE Precio >= 60 AND Precio <= 120;

/* 1.5. Obtener el nombre y el precio en pesetas (es decir, el precio en euros multiplicado por 166’386)*/
SELECT Nombre, Precio * 166.386 AS PrecioPtas FROM ARTICULOS;

/* 1.6. Seleccionar el precio medio de todos los productos.*/
SELECT AVG(Precio) FROM ARTICULOS;

/* 1.7. Obtener el precio medio de los art ́ıculos cuyo c ́odigo de fabricante sea 2.*/
SELECT AVG(Precio) FROM ARTICULOS WHERE Fabricante=2;

/* 1.8. Obtener el numero de art ́ıculos cuyo precio sea mayor o igual a 180.*/
SELECT COUNT(*) FROM ARTICULOS WHERE Precio >= 180;

/* 1.9. Obtener el nombre y precio de los art ́ıculos cuyo precio sea mayor o igual a 180 y ordenarlos descendentemente por precio, y luego ascendentemente por nombre.*/
SELECT Nombre, Precio FROM ARTICULOS WHERE Precio >= 180 ORDER BY Precio DESC, Nombre;

/* 1.10. Obtener un listado completo de art ́ıculos, incluyendo por cada articulo los datos del articulo y de su fabricante.*/
SELECT * FROM ARTICULOS INNER JOIN FABRICANTES ON ARTICULOS.Fabricante = FABRICANTES.Codigo;

/* 1.11. Obtener un listado de art ́ıculos, incluyendo el nombre del art ́ıculo, su precio, y el nombre de su fabricante*/
SELECT ARTICULOS.Nombre, Precio, FABRICANTES.Nombre FROM ARTICULOS, FABRICANTES WHERE ARTICULOS.Fabricante = FABRICANTES.Codigo;

/* 1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los codigos de fabricante.*/
SELECT AVG(Precio), Fabricante FROM ARTICULOS GROUP BY Fabricante;

/* 1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.*/
SELECT AVG(Precio), FABRICANTES.Nombre
FROM ARTICULOS INNER JOIN FABRICANTES
ON ARTICULOS.Fabricante = FABRICANTES.Codigo
GROUP BY FABRICANTES.Nombre;

/* 1.14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150 .*/
SELECT AVG(Precio), FABRICANTES.Nombre FROM ARTICULOS INNER JOIN FABRICANTES ON ARTICULOS.Fabricante = FABRICANTES.Codigo GROUP BY FABRICANTES.Nombre HAVING AVG(Precio) >= 150;

/* 1.15. Obtener el nombre y precio del art ́ıculo m ́as barato.*/
SELECT Nombre, Precio FROM ARTICULOS WHERE Precio = (SELECT MIN(Precio) FROM ARTICULOS);

/* 1.16. Obtener una lista con el nombre y precio de los art ́ıculos m ́as caros de cada proveedor (incluyendo el nombre del proveedor).*/
SELECT A.Nombre, A.Precio, F.Nombre FROM ARTICULOS A, FABRICANTES F WHERE A.Fabricante = F.Codigo AND A.Precio =(SELECT MAX(A.Precio)FROM ARTICULOS A WHERE A.Fabricante = F.Codigo);

/* 1.17. A ̃nadir un nuevo producto: Altavoces de 70 ¤ (del fabricante 2)*/
INSERT INTO ARTICULOS(Codigo, Nombre , Precio , Fabricante)
VALUES ( 11,'Altavoces' , 70 , 2 );

/* 1.18. Cambiar el nombre del producto 8 a ’Impresora Laser’ */
UPDATE ARTICULOS SET Nombre = "Impresora Laser" WHERE Codigo = 8;

/* 1.19. Aplicar un descuento del 10 % (multiplicar el precio por 0’9) a todos los productos.*/
UPDATE ARTICULOS SET Precio = Precio * 0.9 ;

/* 1.20. Aplicar un descuento de 10  a todos los productos cuyo precio sea mayor o igual a 120*/
UPDATE ARTICULOS SET Precio = Precio - 10 WHERE Precio >=120;