CREATE TABLE Clientes_Banca 
( 
  NoCuenta varchar (5) not null, 
  Nombre varchar(30) not null, 
  Saldo numeric (10,2) not null 
) 

CREATE TABLE Tipos_Movimientos
(
	ClaveM varchar (2) not null,
	Descripcion varchar (30) not null 
)

CREATE TABLE Movimientos
(
	NoCuenta varchar (5) not null,
	ClaveM varchar (2) not null,
	Fecha datetime not null,
	Monto numeric (10,2) not null
)

ALTER TABLE Clientes_Banca add constraint llaveCliente PRIMARY KEY (NoCuenta)
ALTER TABLE Tipos_Movimientos add constraint llaveMovimiento PRIMARY KEY (ClaveM)
ALTER TABLE Movimientos add constraint llavemovimientos PRIMARY KEY CLUSTERED (NoCuenta, ClaveM, Fecha)

ALTER TABLE Movimientos add constraint cfMovimientosc 
  foreign key (NoCuenta) references Clientes_Banca(NoCuenta);
  
  ALTER TABLE Movimientos add constraint cfMovimientosm
  foreign key (ClaveM) references Tipos_Movimientos(ClaveM);
  
  sp_helpconstraint Movimientos

  --Transaccion de prueba
  BEGIN TRANSACTION PRUEBA1 
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000); 
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000); 
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000); 
COMMIT TRANSACTION PRUEBA1 

--verificar cambios
SELECT * FROM CLIENTES_BANCA 

BEGIN TRANSACTION PRUEBA2 
INSERT INTO CLIENTES_BANCA VALUES('004','Ricardo Rios Maldonado',19000); 
INSERT INTO CLIENTES_BANCA VALUES('005','Pablo Ortiz Arana',15000); 
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Manuel Alvarado',18000);

BEGIN TRANSACTION PRUEBA3 
INSERT INTO TIPOS_MOVIMIENTOS VALUES('A','Retiro Cajero Automatico'); 
INSERT INTO Tipos_Movimientos VALUES('B','Deposito Ventanilla'); 
COMMIT TRANSACTION PRUEBA3 
 
 BEGIN TRANSACTION PRUEBA4 
INSERT INTO MOVIMIENTOS VALUES('001','A',GETDATE(),500); 
UPDATE CLIENTES_BANCA SET SALDO = SALDO -500 
WHERE NoCuenta='001' 
COMMIT TRANSACTION PRUEBA4 


SELECT * From Clientes_Banca

Select * from Tipos_Movimientos

DELETE FROM Clientes_Banca where NoCuenta='005' OR NoCuenta='006' OR  NoCuenta='007'

BEGIN TRANSACTION PRUEBA5 
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000); 
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000); 
INSERT INTO CLIENTES_BANCA VALUES('007','Oscar Perez Alvarado',8000);

IF @@ERROR = 0 
COMMIT TRANSACTION PRUEBA5 
ELSE 
BEGIN 
PRINT 'A transaction needs to be rolled back' 
ROLLBACK TRANSACTION PRUEBA5 
END  

-- transaccion para hacer retiro
IF EXISTS (SELECT name FROM sysobjects
                                       WHERE name = 'transaccion' AND type = 'P')
                                DROP PROCEDURE transaccion
							Go
CREATE PROCEDURE transaccion
	@noCuen varchar(5),
	@monto numeric(10,2)
	AS
		 BEGIN TRANSACTION trans 
		INSERT INTO MOVIMIENTOS VALUES(@noCuen,'B',GETDATE(),@monto); 
		UPDATE CLIENTES_BANCA SET SALDO = SALDO -@monto 
		WHERE NoCuenta=@noCuen 
		COMMIT TRANSACTION trans 
GO
 

--transaccion para hacer depósito
IF EXISTS (SELECT name FROM sysobjects
                                       WHERE name = 'dep_ventanilla' AND type = 'P')
                                DROP PROCEDURE dep_ventanilla
								GO
CREATE PROCEDURE dep_ventanilla
	@noCuen varchar(5),
	@monto numeric(10,2)
	AS
		 BEGIN TRANSACTION deposito
		INSERT INTO MOVIMIENTOS VALUES(@noCuen,'B',GETDATE(),@monto); 
		UPDATE CLIENTES_BANCA SET SALDO = SALDO + @monto 
		WHERE NoCuenta=@noCuen 
		COMMIT TRANSACTION deposito 
GO
