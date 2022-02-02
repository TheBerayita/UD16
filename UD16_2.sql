use actividades;

/* 2.1. Obtener los apellidos de los empleados.*/
SELECT Apellidos FROM EMPLEADOS;

/* 2.2. Obtener los apellidos de los empleados sin repeticiones.*/
SELECT DISTINCT Apellidos FROM EMPLEADOS;

/* 2.3. Obtener todos los datos de los empleados que se apellidan 'Lopez'.*/
SELECT * FROM EMPLEADOS WHERE Apellidos = 'Lopez';

/* 2.4. Obtener todos los datos de los empleados que se apellidan 'Lopez' y los que se
apellidan 'Perez'.*/
SELECT * FROM EMPLEADOS
WHERE Apellidos = 'Lopez' OR Apellidos = 'Perez';

/* 2.5. Obtener todos los datos de los empleados que trabajan para el departamento 14.*/
SELECT * FROM EMPLEADOS WHERE Departamento = 14;

/* 2.6. Obtener todos los datos de los empleados que trabajan para el departamento 37 y
para el departamento 77.*/
SELECT * FROM EMPLEADOS
WHERE Departamento = 37 OR Departamento = 77;

/* 2.7. Obtener todos los datos de los empleados cuyo apellido comience por 'P'.*/
SELECT * FROM EMPLEADOS
WHERE Apellidos LIKE 'P%';

/* 2.8. Obtener el presupuesto total de todos los departamentos.*/
SELECT SUM(Presupuesto) FROM DEPARTAMENTOS;

/* 2.9. Obtener el numero de empleados en cada departamento.*/
SELECT Departamento, COUNT(*)
FROM EMPLEADOS
GROUP BY Departamento;

/* 2.10. Obtener un listado completo de empleados, incluyendo por cada empleado los datos
del empleado y de su departamento.*/
SELECT *
FROM EMPLEADOS INNER JOIN DEPARTAMENTOS
ON EMPLEADOS.Departamento = DEPARTAMENTOS.Codigo;

/* 2.11. Obtener un listado completo de empleados, incluyendo el nombre y apellidos del
empleado junto al nombre y presupuesto de su departamento.*/
SELECT E.Nombre, Apellidos, D.Nombre, Presupuesto
FROM EMPLEADOS E INNER JOIN DEPARTAMENTOS D
ON E.Departamento = D.Codigo;

/* 2.12. Obtener los nombres y apellidos de los empleados que trabajen en departamentos
cuyo presupuesto sea mayor de 60.000 .*/
SELECT Nombre, Apellidos FROM EMPLEADOS
WHERE Departamento IN
(SELECT Codigo FROM DEPARTAMENTOS WHERE Presupuesto > 60000);
/* 2.13. Obtener los datos de los departamentos cuyo presupuesto es superior al presupues-
to medio de todos los departamentos.*/
SELECT * FROM DEPARTAMENTOS
WHERE Presupuesto >(SELECT AVG(Presupuesto)FROM DEPARTAMENTOS);
/*2.14. Obtener los nombres ( ́unicamente los nombres) de los departamentos que tienen
mas de dos empleados.*/
SELECT Nombre FROM DEPARTAMENTOS WHERE Codigo IN (SELECT Departamento FROM EMPLEADOS GROUP BY Departamento HAVING COUNT(*) > 2);

/* 2.15. Anadir un nuevo departamento: ‘Calidad', con presupuesto de 40.000 ¤ y codigo 
11. Anadir un empleado vinculado al departamento reci ́en creado: Esther V ́azquez, DNI: 89267109*/
INSERT INTO DEPARTAMENTOS VALUES ( 11 , 'Calidad' , 40000);
INSERT INTO EMPLEADOS VALUES ( '89267109' , 'Esther','Vazquez' , 11);
/* 2.16. Aplicar un recorte presupuestario del 10 % a todos los departamentos.*/
UPDATE DEPARTAMENTOS SET Presupuesto = Presupuesto * 0.9;

/* 2.17. Reasignar a los empleados del departamento de investigaci ́on (codigo 77) al departamento de inform ́atica (codigo 14).*/
UPDATE EMPLEADOS SET Departamento = 14 WHERE Departamento = 77;

/* 2.18. Despedir a todos los empleados que trabajan para el departamento de inform ́atica(codigo 14).*/
DELETE FROM EMPLEADOS WHERE Departamento = 14;

/* 2.19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto
sea superior a los 60.000.*/
DELETE FROM EMPLEADOS WHERE Departamento IN(SELECT Codigo FROM DEPARTAMENTOS WHERE Presupuesto >= 60000);
/* 2.20. Despedir a todos los empleados.*/
DELETE FROM EMPLEADOS;