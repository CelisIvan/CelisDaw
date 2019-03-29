IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'AlumnosLab')
DROP TABLE AlumnosLab
/*
:)
*/CREATE TABLE AlumnosLab
( 
  id_alumno int not null IDENTITY PRIMARY KEY,
  nombre varchar (100) not null,
  apellido_paterno varchar (100) not null,
  apellido_materno varchar (100) not null,
  Sexo bit  not null,
  comentarios varchar (1000),
  peso int  not null
  ) 


