
/*CREA MATERIAL*/
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaMaterial' AND type = 'P')
                DROP PROCEDURE creaMaterial
GO

CREATE PROCEDURE creaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
AS
	INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
GO

EXECUTE creaMaterial 5000,'Martillos Acme',250,15 

/*modificaMaterial que permite modificar un material que reciba como parámetros las columnas de la tabla 
materiales y actualice las columnas correspondientes con los valores recibidos, para el registro cuya llave 
sea la clave que se recibe como parámetro.*/ 

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaMaterial' AND type = 'P')
                DROP PROCEDURE modificaMaterial
GO

CREATE PROCEDURE modificaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
AS
	UPDATE Materiales
	SET Descripcion=@udescripcion , Costo=@ucosto, PorcentajeImpuesto=@uimpuesto
	WHERE Clave=@uclave
GO


/*eliminaMaterial que elimina el registro de la tabla materiales cuya llave sea la clave
 que se recibe como parámetro. */

 IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaMaterial' AND type = 'P')
                DROP PROCEDURE eliminaMaterial
GO

CREATE PROCEDURE eliminaMaterial
                @uclave NUMERIC(5,0)
AS
	DELETE FROM Materiales
	WHERE Clave=@uclave
GO




--CREA PROYECTO
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProyecto' AND type = 'P')
                DROP PROCEDURE creaProyecto
GO

CREATE PROCEDURE creaProyecto
                @unumero NUMERIC(5),
				@udenominacion varchar(50)
AS
	INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
GO

SELECT *
FROM Proyectos

--MODIFICA PROYECTO
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProyecto' AND type = 'P')
                DROP PROCEDURE modificaProyecto
GO

CREATE PROCEDURE modificaProyecto
                 @unumero NUMERIC(5),
				 @udenominacion varchar(50)
AS
	UPDATE Proyectos
	SET Denominacion=@udenominacion
	WHERE Numero=@unumero
GO

--ELIMINA PROYECTO
 IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProyecto' AND type = 'P')
                DROP PROCEDURE eliminaProyecto
GO

CREATE PROCEDURE eliminaProyecto
                @unumero NUMERIC(5)
AS
	DELETE FROM Proyectos
	WHERE Numero=@unumero
GO


--CREA PROVEEDOR
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProveedor' AND type = 'P')
                DROP PROCEDURE creaProveedor
GO

CREATE PROCEDURE creaProveedor
                @urfc char(13),
				@urazonsocial varchar(50)
AS
	INSERT INTO Proveedores VALUES(@urfc, @urazonsocial)
GO

SELECT *
FROM Proveedores


-- MODIFICA PROVEEDORES
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProveedores' AND type = 'P')
                DROP PROCEDURE modificaProveedores
GO

CREATE PROCEDURE modificaProveedores
                 @urfc char(13),
				@urazonsocial varchar(50)
AS
	UPDATE Proveedores
	SET RazonSocial=@urazonsocial
	WHERE RFC=@urfc
GO

--ELIMINA PROVEEDOR
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProveedor' AND type = 'P')
                DROP PROCEDURE eliminaProveedor
GO

CREATE PROCEDURE eliminaProveedor
                @urfc char(13)
AS
	DELETE FROM Proveedores
	WHERE RFC=@urfc
GO

--CREAR ENTREGA
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaEntrega' AND type = 'P')
                DROP PROCEDURE creaEntrega
GO

CREATE PROCEDURE creaEntrega
                @uclave numeric(5), 
				@urfc char(13) , 
				@unumero numeric(5) , 
				@ufecha datetime , 
				@ucantidad numeric (8,2) 
AS
	INSERT INTO Entregan VALUES(@uclave, @urfc,@unumero,@ufecha,@ucantidad)
GO

--MODIFICA ENTREGA
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaEntrega' AND type = 'P')
                DROP PROCEDURE modificaEntrega
GO

CREATE PROCEDURE modificaEntrega
                 @uclave numeric(5),
				@ufecha datetime , 
				@ucantidad numeric (8,2) 
AS
	UPDATE Entregan
	SET Fecha=@ufecha, Cantidad=@ucantidad
	WHERE Clave=@uclave
GO

--ELIMINA ENTREGA
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaEntrega' AND type = 'P')
                DROP PROCEDURE eliminaEntrega
GO

CREATE PROCEDURE eliminaEntrega
                @ufecha datetime 
AS
	DELETE FROM Entregan
	WHERE Fecha=@ufecha
GO


SELECT *
FROM Entregan



--CREAR CONSULTAS CON PARÁMETROS
IF EXISTS (SELECT name FROM sysobjects
	WHERE name = 'queryMaterial' AND type = 'P')
	DROP PROCEDURE queryMaterial
GO

CREATE PROCEDURE queryMaterial
	@udescripcion VARCHAR(50),
	@ucosto NUMERIC(8,2)

AS
	SELECT * FROM Materiales WHERE descripcion
	LIKE '%'+@udescripcion+'%' AND costo > @ucosto
GO

EXECUTE queryMaterial 'Lad',20 