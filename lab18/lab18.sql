-- La suma de las cantidades e importe total de todas las entregas realizadas durante el 97. 
SELECT e.Clave,m.Descripcion, SUM(e.Cantidad) as 'Cantidad Total', SUM(m.Costo*e.Cantidad) as 'Importe Total'
FROM Entregan e, Materiales m
Where e.Clave=m.Clave AND Fecha BETWEEN '1997/01/01' and '1997/12/31' 
GROUP BY e.Clave, m.Descripcion

/*
1 tupla
1270 Tezontle 546 43680
*/

-- Para cada proveedor, obtener la razón social del proveedor, número de entregas e 
--importe total de las entregas realizadas.
SELECT pr.RazonSocial, COUNT (E.RFC) as 'Total de Entregas', SUM(M.Costo*E.Cantidad) AS 'Importe de todas las ventas'
FROM Proveedores pr, Entregan E, Materiales M
WHERE pr.RFC= E.RFC and e.Clave=m.Clave
GROUP BY pr.RazonSocial
/*
8tuplas
RSocial  Tot entregas     Importe de todas las ventas
Alvin        15           776214
*/
-- Por cada material obtener la clave y descripción del material, la cantidad total entregada, 
--la mínima cantidad entregada, la máxima cantidad entregada, el importe total de las entregas de aquellos
-- materiales en los que la cantidad promedio entregada sea mayor a 400. 
SELECT e.Clave, m.Descripcion,SUM (e.Cantidad) as 'Cantidad Total Entregada', MIN (Cantidad) as 'Cantidad Minima', 
MAX(Cantidad) as 'Cantidad Maxima', SUM(m.Costo*e.Cantidad) as 'Importe Total'
FROM Materiales m, Entregan e
WHERE m.Clave=e.Clave
GROUP By e.Clave, m.Descripcion
Having SUM (e.Cantidad) > 400.00
/*
Tuplas 44
Clave     Descripcion      Canti. Tot Entre   Cantidad Min    Cant Max    Imp Tota
1000      Varilla  3/16      426                   7			254	       42600
*/


-- Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de 
-- cada material entregado, detallando la clave y descripción del material, excluyendo aquellos
-- proveedores para los que la cantidad promedio sea menor a 500. 
SELECT pr.RazonSocial, m.Clave,m.Descripcion, AVG(Cantidad) AS 'Promedio de Material'
FROM Proveedores pr, Entregan e, Materiales m
WHERE pr.RFC=e.RFC and m.Clave=e.Clave 
GROUP BY pr.RazonSocial,m.Clave,m.Descripcion
HAVING AVG(Cantidad)>=500
/*
tuplas 3
RazonS  Clave    Descripcion    Prom de Mat
Oviedo	1010	Varilla 4/32	572.666666
*/

-- Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos
-- grupos de proveedores: aquellos para los que la cantidad promedio entregada es menor a 370 y 
--aquellos para los que la cantidad promedio entregada sea mayor a 450.
SELECT pr.RazonSocial, m.Clave,m.Descripcion, AVG(Cantidad) AS 'Promedio de Material'
FROM Proveedores pr, Entregan e, Materiales m
WHERE pr.RFC=e.RFC and m.Clave=e.Clave 
GROUP BY pr.RazonSocial,m.Clave,m.Descripcion
HAVING AVG(Cantidad)<370 or AVG(Cantidad)>450
/*
tuplas 34
La fragua	1000	Varilla 3/16	142.000000
Oviedo	   1010	    Varilla 4/32	572.666666
*/
select*
from Materiales

--clave descripcion costo porcentaje impuesto

--INSERTA 5 NUEVOS MATERIALES
Delete from Materiales
Where Clave=2016
INSERT INTO Materiales VALUES (2016,'Tuerca 3/9', 6, (2*6)/100)
INSERT INTO Materiales VALUES (2017,'Broca 3/4', 22, (2*22)/100)
INSERT INTO Materiales VALUES (2018,'Estopa Blanca',8,(2*8)/100)
INSERT INTO Materiales VALUES (2019, 'Loseta 32', 67,(2*67)/100)
INSERT INTO Materiales VALUES (2020,'Rondana 5/7', 4,(2*4)/100)


--CLAVE Y DESCRIPCION DE LOS MATERIALES QUE NUNCA HAN SIDO ENTREGADOS
Select ma.Clave,ma.Descripcion
FROM  Materiales ma
WHERE ma.Clave NOT IN(
SELECT e.Clave
FROM Entregan e, Materiales m
Where e.Clave=m.Clave
)
/*
tuplas 6
2016	Tuerca 3/9
2017	Broca 3/4
*/

--Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México' 
--como al proyecto 'Querétaro Limpio'. 
SELECT DISTINCT pro.RazonSocial
FROM Proveedores pro, Entregan e, Proyectos p
Where pro.RFC=e.RFC and p.Numero=e.Numero and p.Denominacion='Vamos Mexico'
INTERSECT 
SELECT DISTINCT pro.RazonSocial
FROM Proveedores pro, Entregan e, Proyectos p
Where pro.RFC=e.RFC and p.Numero=e.Numero and p.Denominacion='Queretaro limpio'
-- tuplas 1
-- La fragua

-- Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'. 

SELECT  m.Descripcion
FROM Materiales m
Where m.Descripcion not in
(SELECT DISTINCT m.Descripcion
FROM Materiales m, Entregan e, Proyectos p
Where m.Clave=e.Clave and p.Numero=e.Numero and p.Denominacion='CIT Yucatan')
/*
Tuplas 46
Varillas 3/16
*/

SELECT*
FROM Materiales

-- Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad 
--entregada es mayor al promedio de la cantidad entregada por el proveedor con el RFC 'VAGO780901'. 
SELECT pro.RazonSocial, AVG(E.Cantidad) AS 'Promedio de cantidad entregada'
FROM Entregan e, Proyectos p,Proveedores pro
WHERE p.Numero=e.Numero AND pro.RFC=e.RFC
GROUP BY pro.RazonSocial
HAVING AVG(e.Cantidad)> (SELECT AVG(e.Cantidad)
  FROM Entregan e
  WHERE E.RFC='VAGO780901'
)
/*
tuplas 0
*/
-- RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango' y cuyas 
--cantidades totales entregadas en el 2000 fueron mayores a las cantidades totales entregadas en el 2001.
SELECT pro.RFC, pro.RazonSocial
FROM Entregan e, Proyectos p,Proveedores pro
WHERE p.Numero=e.Numero AND pro.RFC=e.RFC and pro.RazonSocial='Infonavit Durango'
GROUP BY pro.RFC, pro.RazonSocial
  HAVING 
  (SELECT SUM(E.Cantidad)
  FROM Entregan e, Proyectos p,Proveedores pro
  WHERE p.Numero=e.Numero AND pro.RFC=e.RFC AND (e.Fecha BETWEEN '2000/01/01' AND '2000/12/31')
)> 
(SELECT SUM(E.Cantidad)
  FROM Entregan e, Proyectos p,Proveedores pro
  WHERE p.Numero=e.Numero AND pro.RFC=e.RFC AND (e.Fecha BETWEEN '2001/01/01' AND '2001/12/31')
)
/*
tuplas 0
*/