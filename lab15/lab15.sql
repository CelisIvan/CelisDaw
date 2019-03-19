--Consulta para obtener las descripciones de los materiales entregados en el 2000
SELECT Descripcion  
FROM Entregan e, Materiales m
WHERE Fecha >= '2000/01/01' AND Fecha <= '2000/12/31' and m.Clave=e.Clave

Select *
From Entregan

SELECT DISTINCT Descripcion  
FROM Entregan e, Materiales m
WHERE Fecha >= '2000/01/01' AND Fecha <= '2000/12/31' and m.Clave=e.Clave

--Obt�n los n�meros y denominaciones de los proyectos con las fechas y cantidades de sus entregas,
-- ordenadas por n�mero de proyecto, presentando las fechas de la m�s reciente a la m�s antigua. 

SELECT e.Numero, Denominacion, Fecha, Cantidad
From Proyectos p, Entregan e
where p.Numero=e.Numero
ORDER BY p.Numero DESC, e.Fecha DESC

SELECT *
FROM Entregan

--OPERADORES DE CADENA
SELECT * 
FROM Materiales 
where Descripcion LIKE 'Si%' 

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%'; 
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%'; 
SELECT Numero FROM Entregan WHERE Numero LIKE '___6'; 

SELECT  * FROM Proyectos 

SELECT TOP 2* FROM Proyectos p 

SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND 
Exists ( SELECT [RFC] 
FROM [Proveedores] 
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ) 

SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND RFC IN
 ( SELECT [RFC] 
FROM [Proveedores] 
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ) 


SELECT RFC,Cantidad, Fecha,Numero 
FROM [Entregan] 
WHERE [Numero] Between 5000 and 5010 AND RFC NOT IN
 ( SELECT [RFC] 
FROM [Proveedores] 
WHERE RazonSocial LIKE '[^La%]' and [Entregan].[RFC] = [Proveedores].[RFC] ) 

ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2); 
UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000; 

-- Create VIEW materiales2000  as 
-- SELECT Descripcion  
-- FROM Entregan e, Materiales m
-- WHERE Fecha >= '2000/01/01' AND Fecha <= '2000/12/31' and m.Clave=e.Clave


--Los materiales (clave y descripción) entregados al proyecto "México sin ti no estamos completos". 
Select m.Clave, m.Descripcion
FROM Materiales m, Entregan e, Proyectos p
WHERE m.clave=e.clave and  p.Numero=e.Numero and p.Denominacion='México sin ti no estamos completos'


--  Los materiales (clave y descripción) que han sido proporcionados por el proveedor "Acme tools". 
Select m.Clave, m.Descripcion
FROM Materiales m, Entregan e, Proveedores p
WHERE m.clave=e.clave and  p.Numero=e.Numero and p.Denominacion= "Acme tools"

--       El RFC de los proveedores que durante el 2000 entregaron en promedio cuando menos 300 materiales. 
SELECT DISTINCT RFC, PROM(Cantidad) as 'Prome'
FROM Entregan
WHERE Fecha Between '2000/01/01' AND  '2000/12/31' AND 'Prome'>= 2000;

-- 4 El Total entregado por cada material en el año

SELECT E.Clave, SUM(Cantidad) as 'Total'
FROM Entregan as E
WHERE (Fecha Between '01-JAN-2000' AND '31-DEC-2000')
GROUP BY E.Clave

-- Salida:
-- Clave  Total
-- 1000    7.00
-- Numero de tuplas:22

/*5 La Clave del material más vendido durante el 2001. (se recomienda usar una vista intermedia para su solución) */
CREATE VIEW elmasVendido2001(Clave,Cantidad) AS
SELECT TOP 1 e.Clave, SUM(Cantidad) as 'Total'
FROM Entregan e
WHERE (Fecha Between '01-JAN-2001' AND '31-DEC-2001')
GROUP BY e.Clave
ORDER BY 'Total' DESC
-- Salida:
-- Clave  Total
-- 1140   967.00
-- Numero de tuplas:1

/*6 Productos que contienen el patr�n 'ub' en su nombre. */
CREATE VIEW productoUB(descripcion) AS
SELECT descripcion
FROM Materiales AS M
WHERE descripcion LIKE '%ub%';

select * from productoUB

-- Clave  Nombre
-- 1180    Recubrimiento P1019
-- 1350    Tuberia 3.8
-- Numero de tuplas:12*/



/*7 Denominaci�n y suma del total a pagar para todos los proyectos. */
SELECT p.Denominacion, SUM(E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) as "Total"
FROM Entregan e, Proyectos p, Materiales m
WHERE p.Numero=e.Numero AND m.Clave=e.Clave
GROUP BY p.Denominacion
-- Denominacion                                Total
-- Ampliación de la carretera a la huasteca 742461.1940000000
-- Aztecon                                  150200.2190000000
-- Numero de tuplas:20


/*8 Denominaci�n, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa en acci�n que no se encuentran apoyando al proyecto Educando en Coahuila (Solo usando vistas). */
 CREATE VIEW tCoah1(denominacion , RFC, RazonSocial) AS
 SELECT DISTINCT p.Denominacion, pr.RFC, pr.RazonSocial
     FROM Entregan r, Proyectos  r, Proveedores  pr
     WHERE p.Numero=e.Numero AND pr.RFC=e.RFC AND p.Denominacion LIKE 'Tel%' AND pr.RFC NOT IN (
    SELECT pr.RFC FROM Entregan e, Proyectos p, Proveedores pr
     WHERE p.Numero=e.Numero AND pr.RFC=E.RFC AND p.Denominacion LIKE 'Edu%' )

-- Denominacion         RFC      RazonSocial
-- Televisa en acciÓn CCCC800101 La Ferre
-- Televisa en acción DDDD800101 Cecoferre
-- Numero de tuplas:2


/*9 Denominación, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa en acci�n que no se encuentran apoyando al proyecto Educando en Coahuila (Sin usar vistas, utiliza not in, in o exists).*/
 SELECT DISTINCT p.Denominacion, pr.RFC, pr.RazonSocial
     FROM Entregan r, Proyectos  r, Proveedores  pr
     WHERE p.Numero=e.Numero AND pr.RFC=e.RFC AND p.Denominacion LIKE 'Televisa%' AND pr.RFC NOT IN (
    SELECT pr.RFC FROM Entregan e, Proyectos p, Proveedores pr
     WHERE p.Numero=e.Numero AND pr.RFC=E.RFC AND p.Denominacion LIKE 'Educando' )

-- Denominacion         RFC      RazonSocial
-- Televisa en acción CCCC800101 La Ferre
-- Televisa en acción DDDD800101 Cecoferre
-- Numero de tuplas:2

/*10 Costo de los materiales y los Materiales que son entregados al proyecto Televisa en acci�n cuyos proveedores tambi�n suministran materiales al proyecto Educando en Coahuila.*/
     SELECT m.Costo, m.Descripcion
     FROM Entregan e, Proyectos p, Materiales m, Proveedores pr
     WHERE p.Numero=e.Numero AND pr.RFC=e.RFC AND m.Clave=e.Clave AND m.Clave=e.Clave
     AND p.Denominacion LIKE 'Televisa' AND pr.RFC IN(
     SELECT pr.RFC
     FROM Entregan e, Proyectos p, Proveedores pr
     WHERE p.Numero=e.Numero AND pr.RFC=e.RFC AND p.Denominacion LIKE 'Educando'
       )
