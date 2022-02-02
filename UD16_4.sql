/* 4.1. Mostrar el nombre de todas las películas.*/
SELECT nombre FROM actividades.peliculas;
/* 4.2. Mostrar las distintas calificaciones de edad que existen. */
SELECT nombre,CALIFICACIONEDAD FROM actividades.peliculas where CALIFICACIONEDAD is not null;
/* 4.3. Mostrar todas las películas que no han sido calificadas.*/
SELECT nombre FROM actividades.peliculas where CALIFICACIONEDAD is null;
/* 4.4. Mostrar todas las salas que no proyectan ninguna película.*/
SELECT * FROM actividades.salas where PELICULA is null;
/* 4.5. Mostrar la información de todas las salas y, si se proyecta alguna película en la sala, mostrar también la información de la película*/
Select * From actividades.salas as s left join actividades.peliculas as p on salas.pelicula = peliculas.codigo;
/* 4.6. Mostrar la información de todas las películas y, si se proyecta en alguna sala, mostrar también la información de la sala.*/
SELECT * FROM actividades.salas as s RIGHT JOIN actividades.peliculas as p ON a.Pelicula = p.Codigo;
/* 4.7. Mostrar los nombres de las películas que no se proyectan en ninguna sala.*/
SELECT Nombre FROM actividades.peliculas as p WHERE p.CODIGO NOT IN(SELECT Pelicula FROM actividades.salas as s WHERE s.PELICULA IS NOT NULL);
/* 4.8. Añadir una nueva película 'Uno, Dos, Tres', para mayores de 7 años.*/
INSERT INTO `actividades`.`peliculas` (`NOMBRE`, `CALIFICACIONEDAD`) VALUES ('Uno', 'PG-7');
INSERT INTO `actividades`.`peliculas` (`NOMBRE`, `CALIFICACIONEDAD`) VALUES ('Dos', 'PG-7');
INSERT INTO `actividades`.`peliculas` (`NOMBRE`, `CALIFICACIONEDAD`) VALUES ('Tres', 'PG-7');
/* 4.9. Hacer constar que todas las películas no calificadas han sido calificadas 'no reco- mendables para menores de 13 años'.*/
UPDATE actividades.peliculas SET CalificacionEdad=13 WHERE CalificacionEdad IS NULL;
/* 4.10. Eliminar todas las salas que proyectan películas recomendadas para todos los públicos.*/
DELETE FROM actividades.salas as s WHERE Pelicula IN(SELECT p.codigo FROM actividades.peliculas as p WHERE p.CALIFICACIONEDAD = "G");