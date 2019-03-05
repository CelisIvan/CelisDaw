drop TABLE entregan
drop TABLE materiales 
drop TABLE proyectos 
drop TABLE Proveedores


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')



DROP TABLE Materiales 

CREATE TABLE Materiales 
( 
  Clave numeric(5) not null, 
  Descripcion varchar(50), 
  Costo numeric (8,2) 
) 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')
DROP TABLE Proveedores
CREATE TABLE Proveedores 
( 
  RFC char(13) not null, 
  RazonSocial varchar(50) 
) 
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')
DROP TABLE Proyectos
CREATE TABLE Proyectos 
( 
  Numero numeric(5) not null, 
  Denominacion varchar(50) 
) 
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')
DROP TABLE Entregan
CREATE TABLE Entregan 
( 
  Clave numeric(5) not null, 
  RFC char(13) not null, 
  Numero numeric(5) not null, 
  Fecha datetime not null, 
  Cantidad numeric (8,2) 
) 


-- CARGAR LAS TABLAS
BULK INSERT a1703860.a1703860.[Materiales]
   FROM 'e:\wwwroot\a1703860\materiales (1).csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
BULK INSERT a1703860.a1703860.[Proyectos]
   FROM 'e:\wwwroot\a1703860\proyectos (1).csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
BULK INSERT a1703860.a1703860.[Proveedores] 
  FROM 'e:\wwwroot\a1703860\proveedores (1).csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 


SET DATEFORMAT dmy -- especificar formato de la fecha 

BULK INSERT a1703860.a1703860.[Entregan] 
  FROM 'e:\wwwroot\a1703860\entregan (1).csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

 
   Delete from Materiales where Clave = 1000 and Costo = 1000 

  SELECT * 
  FROM Proveedores

   INSERT INTO Materiales values(1000, 'xxx', 1000) 
  

  --LLAVES
  ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)
   ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero) 
    ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)
ALTER TABLE Entregan add constraint llaveEntregan PRIMARY KEY CLUSTERED (Clave, RFC, Numero,Fecha)

     sp_helpconstraint Materiales;



	   INSERT INTO Entregan values (0, 'xxx', 0, '1-jan-02', 0) 
	    Delete from Entregan where Clave = 0 

		
  
  ALTER TABLE Entregan add constraint cfentreganclave 
  foreign key (Clave) references Materiales(Clave); 

  ALTER TABLE Entregan add constraint cfentreganRFC 
  foreign key (RFC) references Proveedores(RFC);


  ALTER TABLE Entregan add constraint cfentregannumero 
  foreign key (Numero) references Proyectos(Numero);

    INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0) ;

  SELECT *
  From Entregan

  sp_helpconstraint Entregan


    --INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0); 
	--Delete from Entregan where Cantidad = 0 


	ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ; 
