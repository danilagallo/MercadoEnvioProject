
USE [GD1C2016]

IF NOT EXISTS (
	SELECT  schema_name
	FROM    information_schema.SCHEMATA
	WHERE   schema_name = 'LPB' )
BEGIN
	EXEC sp_executesql N'CREATE SCHEMA LPB '
END
GO

/*---------------Limpieza de Tablas-------------*/
/*---------Si la tabla ya existe la borro-------------*/

BEGIN TRANSACTION
IF OBJECT_ID('LPB.FuncionalidadesPorRol') IS NOT NULL
BEGIN
        DROP TABLE LPB.FuncionalidadesPorRol ;
END;
IF OBJECT_ID('LPB.RolesPorUsuario') IS NOT NULL
BEGIN
        DROP TABLE LPB.RolesPorUsuario ;
END;
IF OBJECT_ID('LPB.Empresas') IS NOT NULL
BEGIN
        DROP TABLE LPB.Empresas ;
END;
IF OBJECT_ID('LPB.RubrosEmpresa') IS NOT NULL
BEGIN
        DROP TABLE LPB.RubrosEmpresa ;
END;
IF OBJECT_ID('LPB.Compras') IS NOT NULL
BEGIN
		DROP TABLE LPB.Compras;
END;
IF OBJECT_ID('LPB.Items') IS NOT NULL
BEGIN
        DROP TABLE LPB.Items ;
END;
IF OBJECT_ID('LPB.Facturas') IS NOT NULL
BEGIN
        DROP TABLE LPB.Facturas ;
END;
IF OBJECT_ID('LPB.Ofertas') IS NOT NULL
BEGIN
		DROP TABLE LPB.Ofertas;
END;
IF OBJECT_ID('LPB.FormasDePago') IS NOT NULL
BEGIN
        DROP TABLE LPB.FormasDePago ;
END;
IF OBJECT_ID('LPB.PublicacionesPorRubro') IS NOT NULL
BEGIN
        DROP TABLE LPB.PublicacionesPorRubro;
END;
IF OBJECT_ID('LPB.Publicaciones') IS NOT NULL
BEGIN
		DROP TABLE LPB.Publicaciones;
END;
IF OBJECT_ID('LPB.Rubros') IS NOT NULL
BEGIN
		DROP TABLE LPB.Rubros;
END;
IF OBJECT_ID('LPB.EstadosDePublicacion') IS NOT NULL
BEGIN
		DROP TABLE LPB.EstadosDePublicacion;
END;
IF OBJECT_ID('LPB.TiposDePublicacion') IS NOT NULL
BEGIN
		DROP TABLE LPB.TiposDePublicacion;
END;
IF OBJECT_ID('LPB.Clientes') IS NOT NULL
BEGIN
	DROP TABLE LPB.Clientes;
END;
IF OBJECT_ID('LPB.Usuarios') IS NOT NULL
BEGIN
        DROP TABLE LPB.Usuarios ;
END;
IF OBJECT_ID('LPB.Roles') IS NOT NULL
BEGIN
        DROP TABLE LPB.Roles ;
END;
IF OBJECT_ID('LPB.Funcionalidades') IS NOT NULL
BEGIN
        DROP TABLE LPB.Funcionalidades ;
END;
IF OBJECT_ID('LPB.Calificaciones') IS NOT NULL
BEGIN
        DROP TABLE LPB.Calificaciones ;
END;
IF OBJECT_ID('LPB.Visibilidades') IS NOT NULL
BEGIN
        DROP TABLE LPB.Visibilidades ;
END;
COMMIT;
IF OBJECT_ID('LPB.Localidades') IS NOT NULL
BEGIN
        DROP TABLE LPB.Localidades ;
END;


/*---------Definiciones de Tabla-------------*/

CREATE TABLE [LPB].Usuarios(
id INT NOT NULL IDENTITY(1,1),
TipoUsuario VARCHAR(25) NOT NULL,
username VARCHAR(45) NOT NULL,
pass VARCHAR(100) NOT NULL,
habilitado BIT DEFAULT 1,
cantIntentosFallidos INT DEFAULT 0,
nuevo BIT DEFAULT 1,
fechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
PRIMARY KEY(id));
GO

CREATE TABLE [LPB].RolesPorUsuario(
Rol_id INT NOT NULL,
Usuario_id INT NOT NULL,
PRIMARY KEY(Rol_id, Usuario_id));
GO

CREATE TABLE [LPB].Roles(
id INT NOT NULL IDENTITY(1,1),
nombre VARCHAR(45) NOT NULL,
habilitado BIT DEFAULT 1,
PRIMARY KEY(id));
GO

CREATE TABLE [LPB].Funcionalidades(
id INT NOT NULL IDENTITY(1,1),
descripcion varchar(45) NOT NULL,
PRIMARY KEY(id));
GO

CREATE TABLE [LPB].FuncionalidadesPorRol(
Funcionalidad_id INT NOT NULL,
Rol_id INT NOT NULL,
PRIMARY KEY(Funcionalidad_id, Rol_id));
GO

CREATE TABLE [LPB].FormasDePago(
id INT NOT NULL IDENTITY(1,1),
descripcion nvarchar(255) NOT NULL,
PRIMARY KEY(id));
GO

CREATE TABLE [LPB].Facturas(
numero numeric(18,0) UNIQUE NOT NULL,
fecha DATETIME NOT NULL,
total numeric(18,2) NOT NULL,
FormaDePago_id INT NOT NULL,
Usuario_id INT NOT NULL,
PRIMARY KEY(numero));
GO

CREATE TABLE [LPB].Items(
id INT NOT NULL IDENTITY(1,1),
monto numeric(18,2) NOT NULL,
cantidad numeric(18,0) NOT NULL,
Factura_nro	numeric(18,0) NOT NULL,
Publicacion_cod numeric(18,0) NOT NULL,
PRIMARY KEY(id));
GO

CREATE TABLE [LPB].Empresas(
id INT NOT NULL IDENTITY(1,1),
razonSocial nvarchar(255) NOT NULL,
cuit nvarchar(50) NOT NULL,
mail nvarchar(50) NOT NULL,
telefono NUMERIC(12,0),
domicilioCalle nvarchar(100) NOT NULL,
nroCalle numeric(18,0) NOT NULL,
piso numeric(18,0),
dpto nvarchar(50),
codPostal nvarchar(50) NOT NULL,
Rubro_id int NULL,
nombreContacto nvarchar(100),
Localidad_id INT NULL,
Usuario_id INT NOT NULL,
PRIMARY KEY(id));
GO

CREATE TABLE [LPB].Clientes(
id INT NOT NULL IDENTITY(1,1),
documento_tipo VARCHAR(10) NOT NULL,
documento_numero NUMERIC(18,0) NOT NULL,
apellido NVARCHAR(255) NOT NULL,
nombre NVARCHAR(255) NOT NULL,
fechaNacimiento DATETIME NOT NULL,
mail NVARCHAR(255) NOT NULL,
telefono NUMERIC(12,0),
domicilioCalle nvarchar(255) NOT NULL,
nroCalle NUMERIC(18,0) NOT NULL,
piso NUMERIC(18,0) NOT NULL,
dpto NVARCHAR(50),
codPostal NVARCHAR(50) NOT NULL,
Localidad_id INT, 
Usuario_id INT NOT NULL,
PRIMARY KEY(ID));
GO

CREATE TABLE [LPB].Localidades(
id INT NOT NULL IDENTITY(1,1),
descripcion varchar(45) NOT NULL,
PRIMARY KEY(id)
)
GO

CREATE TABLE [LPB].Publicaciones(
codigo NUMERIC (18,0) NOT NULL,
Usuario_id INT,
EstadoDePublicacion_id INT,
TipoDePublicacion_id INT,
descripcion NVARCHAR(255),
stock NUMERIC(18,0) NOT NULL,
fechaCreacion DATETIME NOT NULL,
fechaVencimiento DATETIME NOT NULL,
precio NUMERIC(18,2) NOT NULL,
aceptaEnvio BIT,
Visibilidad_codigo NUMERIC(18,0),
PRIMARY KEY(codigo)
)
GO

CREATE TABLE [LPB].PublicacionesPorRubro(
Publicacion_id NUMERIC (18,0) NOT NULL,
Rubro_id INT NOT NULL,
PRIMARY KEY(Publicacion_id, Rubro_id));
GO

CREATE TABLE [LPB].Rubros(
id INT NOT NULL IDENTITY(1,1),
descripcion NVARCHAR(255),
PRIMARY KEY(id)
)
GO

CREATE TABLE [LPB].EstadosDePublicacion(
id INT NOT NULL IDENTITY(1,1),
descripcion NVARCHAR(255),
PRIMARY KEY(id)
)
GO

CREATE TABLE [LPB].TiposDePublicacion(
id INT NOT NULL IDENTITY(1,1),
descripcion NVARCHAR(255),
PRIMARY KEY(id)
)
GO

CREATE TABLE [LPB].Calificaciones(
codigo NUMERIC (18,0) NOT NULL,
descripcion nvarchar(255) NOT NULL,
cantEstrellas NUMERIC (18,0) NOT NULL,
PRIMARY KEY(codigo)
)
GO

CREATE TABLE [LPB].Visibilidades(
codigo NUMERIC (18,0) NOT NULL ,
descripcion nvarchar(255) NOT NULL,
precio NUMERIC(18,2) NOT NULL,
porcentaje NUMERIC(18,2) NOT NULL,
comisionPorEnvio NUMERIC(18,2),
PRIMARY KEY(codigo)
)
GO

CREATE TABLE [LPB].Compras(
id INT NOT NULL IDENTITY(1,1),
fecha DATETIME NOT NULL default getdate(),
cantidad NUMERIC(18,0) NOT NULL,
Cliente_id INT NOT NULL,
Publicacion_cod NUMERIC(18,0) NOT NULL,
Calificacion_cod NUMERIC(18,0),
envio BIT NOT NULL,
primary key (id))
GO

CREATE TABLE [LPB].Ofertas(
id INT NOT NULL IDENTITY(1,1),
fecha DATETIME NOT NULL default getdate(),
monto NUMERIC(18,2) NOT NULL,
Cliente_id INT NOT NULL,
Publicacion_cod NUMERIC(18,0) NOT NULL,
Calificacion_cod NUMERIC(18,0), 
ganadora BIT NOT NULL,
envio BIT NOT NULL,
primary key (id))
GO

create table [LPB].RubrosEmpresa(
ID INT NOT NULL IDENTITY(1,1),
descripcion VARCHAR(45) NOT NULL,
primary key(ID))
GO

/*---------Definiciones de FK-------*/

ALTER TABLE LPB.Publicaciones ADD
            FOREIGN KEY (Usuario_id) references LPB.Usuarios,
            FOREIGN KEY (EstadoDePublicacion_id) references LPB.EstadosDePublicacion,
			FOREIGN KEY (TipoDePublicacion_id) references LPB.TiposDePublicacion,
			FOREIGN KEY (Visibilidad_codigo) references LPB.Visibilidades;			
GO

ALTER TABLE LPB.RolesPorUsuario ADD
            FOREIGN KEY (Rol_id) references LPB.Roles,
            FOREIGN KEY (Usuario_id) references LPB.Usuarios;
GO

ALTER TABLE LPB.PublicacionesPorRubro ADD
            FOREIGN KEY (Rubro_id) references LPB.Rubros,
            FOREIGN KEY (Publicacion_id) references LPB.Publicaciones;
GO
                                                            
ALTER TABLE LPB.FuncionalidadesPorRol ADD
            FOREIGN KEY (Funcionalidad_id) references LPB.Funcionalidades,
            FOREIGN KEY (Rol_id) references LPB.roles;
GO   
                                                         
ALTER TABLE LPB.Facturas ADD
            FOREIGN KEY (FormaDePago_id) references LPB.FormasDePago,
            FOREIGN KEY (Usuario_id) references LPB.Usuarios;
            
GO

ALTER TABLE LPB.Items ADD
            FOREIGN KEY (Factura_nro) references LPB.Facturas,
			FOREIGN KEY (Publicacion_cod) references LPB.Publicaciones;
GO

ALTER TABLE LPB.Empresas ADD
FOREIGN KEY (Rubro_id) references LPB.RubrosEmpresa,
            FOREIGN KEY (Usuario_id) references LPB.Usuarios,
			FOREIGN KEY (Localidad_ID) references LPB.Localidades;
GO

ALTER TABLE LPB.Clientes add
	    FOREIGN KEY (Usuario_id) references LPB.Usuarios,
	    FOREIGN KEY (Localidad_id) references LPB.Localidades;
GO


ALTER TABLE LPB.Compras ADD
		FOREIGN KEY (Cliente_id) references LPB.Clientes,
		FOREIGN KEY (Publicacion_cod) references LPB.Publicaciones,
		FOREIGN KEY (Calificacion_cod) references LPB.Calificaciones;
GO

ALTER TABLE LPB.Ofertas ADD
		FOREIGN KEY (Cliente_id) references LPB.Clientes,
		FOREIGN KEY (Publicacion_cod) references LPB.Publicaciones,
		FOREIGN KEY (Calificacion_cod) references LPB.Calificaciones;
GO

/*---------- Limpieza de Procedures ------------*/

IF OBJECT_ID('LPB.SP_Baja_Rol') IS NOT NULL
BEGIN
    DROP PROCEDURE LPB.SP_Baja_Rol
END;
GO

IF OBJECT_ID('LPB.SP_Alta_Usuario') IS NOT NULL
BEGIN
	DROP PROCEDURE LPB.SP_Alta_Usuario
END;
GO

IF OBJECT_ID('LPB.SP_Alta_Cliente') IS NOT NULL
BEGIN
	DROP PROCEDURE LPB.SP_Alta_Cliente
END;
GO

IF OBJECT_ID('LPB.SP_Alta_Visibilidad') IS NOT NULL
BEGIN
	DROP PROCEDURE LPB.SP_Alta_Visibilidad
END;
GO

IF OBJECT_ID('LPB.SP_Modificacion_Visibilidad') IS NOT NULL
BEGIN
	DROP PROCEDURE LPB.SP_Modificacion_Visibilidad
END;
GO

IF OBJECT_ID('LPB.SP_Baja_Visibilidad') IS NOT NULL
BEGIN
	DROP PROCEDURE LPB.SP_Baja_Visibilidad
END;
GO

/*-------------- Definiciones de Stored Procedures ----------------*/

CREATE PROCEDURE lpb.SP_Baja_Rol (@rol varchar(45), @id INT)
AS BEGIN
UPDATE lpb.roles SET habilitado = 0 WHERE nombre = @rol
DELETE lpb.funcionalidadesPorRol WHERE Rol_id = @id
DELETE lpb.RolesPorUsuario WHERE Rol_id = @id
END
GO

CREATE PROCEDURE lpb.SP_Alta_Usuario (@tipo varchar(25),@username varchar(45),@pass varchar(100))
AS BEGIN
INSERT INTO lpb.Usuarios
(TipoUsuario,username,pass,habilitado,cantIntentosFallidos,nuevo)
values
(@tipo,@username,@pass,1,0,1)
END
GO

/*CREATE PROCEDURE lpb.SP_Alta_Cliente (@numeroDoc numeric(18,0),@apellido nvarchar(255),@nombre nvarchar(255),@fechaNac datetime,
@mail nvarchar(255),@telefono numeric(12,0), @calle nvarchar(255),@nroCalle numeric(18,0),@piso numeric(18,0),@dpto nvarchar(50),
@codPostal nvarchar(50),@descrpLocalidad varchar(45), @user varchar(45))
AS BEGIN
INSERT INTO lpb.Clientes 
(dni,apellido,nombre,fechaNacimiento,mail,telefono,domicilioCalle,nroCalle,piso,dpto,codPostal,Localidad_id,Usuario_id)
select @numeroDoc,@apellido,@nombre,@fechaNac,@mail,@telefono,@calle,@nroCalle,@piso,@dpto,@codPostal,
(select id from lpb.Localidades where descripcion=@descrpLocalidad),
(select id from lpb.Usuarios where username=@user)
END
GO*/

CREATE PROCEDURE LPB.SP_Alta_Visibilidad (@descripcion nvarchar(255), @precio numeric(18,2),@porcentaje numeric(18,2), @comision bit)
AS BEGIN
DECLARE @precioComision numeric(18,2)
DECLARE @codigo numeric(18,0)
IF(@comision = 1)
BEGIN
SET @precioComision = 98.0
END 
ELSE
BEGIN
SET @precioComision = 0
END

SET @codigo = (select MAX(codigo) from LPB.Visibilidades where codigo IS NOT NULL) + 1;

INSERT INTO lpb.Visibilidades 
(codigo,descripcion,precio,porcentaje,comisionPorEnvio)
VALUES (@codigo, @descripcion, @precio, @porcentaje, @precioComision)
END
GO

CREATE PROCEDURE LPB.SP_Modificacion_Visibilidad (@codigo decimal, @descripcion nvarchar(255), @precio numeric(18,2),@porcentaje numeric(18,2), @comision bit)
AS BEGIN
DECLARE @precioComision numeric(18,2)
IF(@comision = 1)
BEGIN
SET @precioComision = 98.0
END 
ELSE
BEGIN
SET @precioComision = 0
END

UPDATE lpb.Visibilidades 
SET descripcion = @descripcion,
	precio = @precio, 
	porcentaje = @porcentaje,
	comisionPorEnvio = @precioComision
WHERE codigo = @codigo
END
GO

CREATE PROCEDURE LPB.SP_Baja_Visibilidad (@codigo decimal)
AS BEGIN
DELETE FROM LPB.Visibilidades
WHERE codigo = @codigo
END
GO


/* Declaración de variables */

DECLARE @DocumentoCodigo_Dni VARCHAR(10) = 'DNI'
DECLARE @DocumentoCodigo_Cuil VARCHAR(10) = 'CUIL'
DECLARE @DocumentoCodigo_Cuit VARCHAR(10) = 'CUIT'

DECLARE @TipoDeUsuario_Cliente VARCHAR(15) = 'Cliente'
DECLARE @TipoDeUsuario_Empresa VARCHAR(15) = 'Empresa'
DECLARE @TipoDeUsuario_Administrador VARCHAR(15) = 'Administrador'

DECLARE @RolId_Administrador INT = 1
DECLARE @RolId_Cliente INT = 2
DECLARE @RolId_Empresa INT = 3

/*---------Carga de datos / migracion--------------------*/


/*Roles*/
BEGIN TRANSACTION
INSERT INTO LPB.Roles (nombre) VALUES ('Administrador');
INSERT INTO LPB.Roles (nombre) VALUES('Cliente');
INSERT INTO LPB.Roles (nombre) VALUES('Empresa');
COMMIT;


/*Funcionalidades*/
BEGIN TRANSACTION
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('abmRol');
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('abmUsuario');
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('abmRubro');
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('abmVisibilidad');
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('generarPublicacion');
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('comprar/ofertar');
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('historialCliente');
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('calificarVendedor');
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('consultaFacturas');
INSERT INTO LPB.Funcionalidades (descripcion) VALUES ('listadoEstadistico');
COMMIT;


/*Funcionalidad por rol*/
DECLARE @ID INTEGER;
SET @ID = (SELECT id FROM [LPB].Roles WHERE nombre='Administrador');

BEGIN TRANSACTION
INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (1, @ID);
INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (2, @ID);
INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (3, @ID);
INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (4, @ID);
INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (10, @ID);

SET @ID = (SELECT id FROM [LPB].Roles WHERE nombre='Cliente');

INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (5, @ID);
INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (6, @ID);
INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (7, @ID);
INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (8, @ID);

SET @ID = (SELECT id FROM [LPB].Roles WHERE nombre='Empresa');

INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (5, @ID);
INSERT INTO LPB.FuncionalidadesPorRol (Funcionalidad_id, Rol_id) VALUES (9, @ID);

COMMIT;

BEGIN TRANSACTION

INSERT INTO LPB.FormasDePago(descripcion) 
SELECT DISTINCT Forma_Pago_Desc
FROM [gd_esquema].[Maestra]
WHERE Forma_Pago_Desc IS NOT NULL;

COMMIT;


/*creacion Usuarios -HASH del password w23e: 'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0dc9be7'*/
BEGIN TRANSACTION
INSERT INTO LPB.Usuarios (TipoUsuario, username, pass, nuevo) VALUES('Administrador','admin','e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7',0);
COMMIT;

/* Migracion Usuarios */
BEGIN TRANSACTION
INSERT INTO LPB.Usuarios (username, pass,TipoUsuario, nuevo)	
SELECT DISTINCT @DocumentoCodigo_Cuit + REPLACE([Publ_Empresa_Cuit],'-','')
	            ,'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'
              	,@TipoDeUsuario_Empresa
	            ,0	
FROM [gd_esquema].[Maestra]
WHERE [Publ_Empresa_Cuit] IS NOT NULL

UNION ALL

SELECT DISTINCT @DocumentoCodigo_Dni + CAST([Cli_Dni] AS VARCHAR(20))
	            ,'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'	
	            ,@TipoDeUsuario_Cliente
	            ,0
FROM [gd_esquema].[Maestra]
WHERE [Cli_Dni] IS NOT NULL

UNION

SELECT DISTINCT @DocumentoCodigo_Dni + CAST([Publ_Cli_Dni] AS VARCHAR(20))
	            ,'e6b87050bfcb8143fcb8db0170a4dc9ed00d904ddd3e2a4ad1b1e8dc0fdc9be7'	
	            ,@TipoDeUsuario_Cliente
	            ,0
FROM [gd_esquema].[Maestra]
WHERE [Publ_Cli_Dni] IS NOT NULL
COMMIT;

/* Creación/Migración a la par de Empresas */
BEGIN TRANSACTION
INSERT INTO LPB.Empresas (razonSocial, cuit, mail, domicilioCalle, nroCalle, dpto, piso, codPostal, Usuario_id)	
SELECT DISTINCT [Publ_Empresa_Razon_Social],
	            [Publ_Empresa_Cuit],
				[Publ_Empresa_Mail],
	            [Publ_Empresa_Dom_Calle],
			    [Publ_Empresa_Nro_Calle],
			    [Publ_Empresa_Depto],
				[Publ_Empresa_Piso],
			    [Publ_Empresa_Cod_Postal],				
				--Usuarios.id
				(select id from LPB.Usuarios where username=@DocumentoCodigo_Cuit + REPLACE([Publ_Empresa_Cuit],'-',''))
FROM [gd_esquema].[Maestra]
--INNER JOIN LPB.Usuarios ON username = @DocumentoCodigo_Cuit + REPLACE([Publ_Empresa_Cuit],'-','') 
/* ralentiza muchisimo la ejecucion */
WHERE [Publ_Empresa_Cuit] IS NOT NULL
COMMIT;

/* Migracion de RolesxUsuario de los usuarios migrados en el paso anterior */
BEGIN TRANSACTION
INSERT INTO LPB.RolesPorUsuario (Usuario_id, Rol_id)
SELECT Id, CASE [TipoUsuario]
		        WHEN @TipoDeUsuario_Administrador THEN @RolId_Administrador
		        WHEN @TipoDeUsuario_Empresa THEN @RolId_Empresa
		        WHEN @TipoDeUsuario_Cliente THEN @RolId_Cliente
	       END
FROM LPB.Usuarios
COMMIT;

/*Migracion de Clientes*/
BEGIN TRANSACTION
INSERT INTO LPB.Clientes (documento_tipo,documento_numero,apellido,nombre,fechaNacimiento,mail,domicilioCalle,nroCalle,piso,dpto,codPostal,Localidad_id,Usuario_id)
select distinct 'DNI',
				[Publ_Cli_Dni],
				[Publ_Cli_Apeliido],
				[Publ_Cli_Nombre],
				[Publ_Cli_Fecha_Nac],
				[Publ_Cli_Mail],
				[Publ_Cli_Dom_Calle],
				[Publ_Cli_Nro_Calle],
				[Publ_Cli_Piso],
				[Publ_Cli_Depto],
				[Publ_Cli_Cod_Postal],
				NULL,
				(select id from LPB.Usuarios where username=@DocumentoCodigo_Dni+CAST([Publ_Cli_Dni] AS varchar(20)))
FROM [gd_esquema].Maestra
where [Publ_Cli_Dni] IS NOT NULL
UNION
Select DISTINCT 'DNI',
                [Cli_Dni],
				[Cli_Apeliido],
				[Cli_Nombre],
				[Cli_Fecha_Nac],
				[Cli_Mail],
				[Cli_Dom_Calle],
				[Cli_Nro_Calle],
				[Cli_Piso],
				[Cli_Depto],
				[Cli_Cod_Postal],
				NULL,
				(select id from LPB.Usuarios where username=@DocumentoCodigo_Dni+CAST([Cli_Dni] AS VARCHAR(20)))
FROM [gd_esquema].Maestra
where Cli_Dni is not null
COMMIT;

/*Migracion Factura*/

BEGIN TRANSACTION
INSERT INTO LPB.Facturas (numero, fecha, total, FormaDePago_id,Usuario_id)	
SELECT DISTINCT [Factura_Nro],
	            [Factura_Fecha],
				[Factura_Total],
				(SELECT id FROM [LPB].FormasDePago WHERE descripcion=[Forma_Pago_Desc]),
				(select id from LPB.Usuarios where username=@DocumentoCodigo_Cuit + REPLACE([Publ_Empresa_Cuit],'-',''))
FROM [gd_esquema].[Maestra]
WHERE [Factura_Nro] IS NOT NULL and [Publ_Empresa_Cuit] IS NOT NULL
UNION ALL
SELECT DISTINCT [Factura_Nro],
	            [Factura_Fecha],
				[Factura_Total],
				(SELECT id FROM [LPB].FormasDePago WHERE descripcion=[Forma_Pago_Desc]),
				(select id from LPB.Usuarios where username=@DocumentoCodigo_Dni+CAST([Cli_Dni] AS varchar(20)))				
FROM [gd_esquema].[Maestra]
WHERE [Factura_Nro] IS NOT NULL and [Cli_Dni] IS NOT NULL
UNION
SELECT DISTINCT [Factura_Nro],
	            [Factura_Fecha],
				[Factura_Total],
				(SELECT id FROM [LPB].FormasDePago WHERE descripcion=[Forma_Pago_Desc]),
				(select id from LPB.Usuarios where username=@DocumentoCodigo_Dni+CAST([Publ_Cli_Dni] AS varchar(20)))				
FROM [gd_esquema].[Maestra]
WHERE [Factura_Nro] IS NOT NULL and [Publ_Cli_Dni] IS NOT NULL
COMMIT;

/* Migracion calificaciones */

BEGIN TRANSACTION

INSERT INTO LPB.Calificaciones(codigo,descripcion, cantEstrellas)	
SELECT DISTINCT [Calificacion_Codigo],
	            [Calificacion_Descripcion],
				(CASE WHEN  [Calificacion_Cant_Estrellas] >5 THEN [Calificacion_Cant_Estrellas] - 5 ELSE [Calificacion_Cant_Estrellas] END )
FROM [gd_esquema].[Maestra]
WHERE [Calificacion_Codigo] IS NOT NULL

COMMIT;

/*TiposDePublicacion*/
BEGIN TRANSACTION
INSERT INTO LPB.tiposDePublicacion (descripcion) VALUES ('Compra Inmediata');
INSERT INTO LPB.tiposDePublicacion (descripcion) VALUES ('Subasta');
COMMIT;

/*EstadosDePublcacion*/
BEGIN TRANSACTION
INSERT INTO LPB.EstadosDePublicacion (descripcion) VALUES ('Finalizada');
INSERT INTO LPB.EstadosDePublicacion (descripcion) VALUES ('Activa');
INSERT INTO LPB.EstadosDePublicacion (descripcion) VALUES ('Publicada');
INSERT INTO LPB.EstadosDePublicacion (descripcion) VALUES ('Pausada');
INSERT INTO LPB.EstadosDePublicacion (descripcion) VALUES ('Borrador');
COMMIT;

/*Rubros*/
BEGIN TRANSACTION
INSERT INTO LPB.Rubros (descripcion)	
SELECT DISTINCT [Publicacion_Rubro_Descripcion]	            
FROM [gd_esquema].[Maestra]
COMMIT;


/*Migracion Visibilidades*/

BEGIN TRANSACTION

INSERT INTO LPB.Visibilidades(codigo,descripcion, precio, porcentaje,comisionPorEnvio)	
SELECT DISTINCT [Publicacion_Visibilidad_Cod],
	            [Publicacion_Visibilidad_Desc],
				[Publicacion_Visibilidad_Precio],
				[Publicacion_Visibilidad_Porcentaje],
				98
FROM [gd_esquema].[Maestra]
WHERE [Publicacion_Visibilidad_Cod] IS NOT NULL

COMMIT;

/*Migracion Publicaciones*/

BEGIN TRANSACTION

INSERT INTO [LPB].[Publicaciones] (
	[codigo]
	,[Usuario_Id]
	,[EstadoDePublicacion_Id]
	,[TipoDePublicacion_Id]	
	,[Descripcion]
	,[Stock]
	,[fechaCreacion]
	,[fechaVencimiento]	
	,[precio]
	,[Visibilidad_codigo]		
	)
SELECT DISTINCT [Publicacion_Cod]
	,[Empresas].[Usuario_Id]
	,1
	,[Tipos].[Id]
	,[Publicacion_Descripcion]	
	,[Publicacion_Stock]
	,[Publicacion_Fecha]
	,[Publicacion_Fecha_Venc]	
	,[Publicacion_Precio]
	,[Publicacion_Visibilidad_Cod]		
FROM [gd_esquema].[Maestra] AS Maestra
INNER JOIN [LPB].[TiposDePublicacion] AS Tipos ON Maestra.Publicacion_Tipo = Tipos.Descripcion
INNER JOIN [LPB].[Empresas] AS Empresas ON Maestra.Publ_Empresa_Cuit = Empresas.Cuit
INNER JOIN [LPB].[Rubros] AS Rubros ON Maestra.Publicacion_Rubro_Descripcion = Rubros.descripcion
WHERE [Publicacion_Cod] IS NOT NULL
	AND [Publ_Empresa_Cuit] IS NOT NULL

UNION ALL

SELECT DISTINCT [Publicacion_Cod]
	,[Clientes].[Usuario_Id]
	,1
	,[Tipos].[Id]
	,[Publicacion_Descripcion]	
	,[Publicacion_Stock]
	,[Publicacion_Fecha]
	,[Publicacion_Fecha_Venc]	
	,[Publicacion_Precio]
	,[Publicacion_Visibilidad_Cod]		
FROM [gd_esquema].[Maestra] AS Maestra
INNER JOIN [LPB].[TiposDePublicacion] AS Tipos ON Maestra.Publicacion_Tipo = Tipos.Descripcion
INNER JOIN [LPB].[Clientes] AS Clientes ON Maestra.Publ_Cli_Dni = Clientes.documento_numero
INNER JOIN [LPB].[Rubros] AS Rubros ON Maestra.Publicacion_Rubro_Descripcion = Rubros.descripcion
WHERE [Publicacion_Cod] IS NOT NULL
	AND [Publ_Cli_Dni] IS NOT NULL
COMMIT;

/* Migracion PublicacionesPorRubro */
INSERT INTO [lpb].[PublicacionesPorRubro] ([Rubro_id],[Publicacion_Id])
SELECT DISTINCT [Rubros].[id],[Publicacion_Cod]
FROM [gd_esquema].[Maestra] AS Maestra
INNER JOIN [lpb].[Rubros] AS Rubros ON Maestra.[Publicacion_Rubro_Descripcion] = Rubros.Descripcion
WHERE [Publicacion_Cod] IS NOT NULL
	AND ( [Publ_Cli_Dni] IS NOT NULL OR [Publ_Empresa_Cuit] IS NOT NULL)

/*Migracion Compras*/

BEGIN TRANSACTION

INSERT INTO LPB.Compras (fecha,cantidad,Cliente_id,Publicacion_cod,Calificacion_cod,envio)
select distinct [Compra_Fecha],
				[Compra_Cantidad],
				(select id from LPB.Clientes where documento_numero=Cli_Dni),
				Publicacion_Cod,
				Calificacion_codigo,
				0 -- Todas sin envio
from gd_esquema.Maestra
where Compra_Fecha IS NOT NULL
and calificacion_codigo is not null
and Publicacion_Tipo='Compra Inmediata'
COMMIT;

/*Migracion Items*/

BEGIN TRANSACTION
INSERT INTO LPB.Items(Publicacion_cod,Factura_nro,monto,cantidad)
	select Publicacion_cod, Factura_Nro, Item_Factura_Monto, Item_Factura_Cantidad 
	from gd_esquema.Maestra 
	where Publicacion_Cod IS NOT NULL and Factura_Nro IS NOT NULL
	ORDER BY PUBLICACION_COD 
COMMIT;

/*Migracion Ofertas*/

BEGIN TRANSACTION
INSERT INTO LPB.Ofertas(fecha,monto,Cliente_id,Publicacion_cod,Calificacion_cod,ganadora,envio)
select distinct M1.Oferta_Fecha,
					M1.Oferta_Monto,
					(select id from LPB.Clientes where documento_numero=M1.Cli_Dni),
					M1.Publicacion_Cod,
					(CASE 
						when exists(select * from gd_esquema.Maestra M2 
							where M1.Publicacion_Cod=M2.Publicacion_Cod and M2.Compra_Fecha is not null
							and M2.Cli_Dni=M1.Cli_Dni
							and M1.Oferta_Monto=(select max(oferta_monto) from gd_esquema.Maestra M3 where M1.Publicacion_Cod=M3.Publicacion_Cod))
							then (select M4.calificacion_codigo from gd_esquema.Maestra M4 where M4.Publicacion_Cod=M1.Publicacion_Cod and M4.Calificacion_Codigo is not null)
							else NULL
					END),
					(CASE 
						when exists(select * from gd_esquema.Maestra M2 
							where M1.Publicacion_Cod=M2.Publicacion_Cod and M2.Compra_Fecha is not null
							and M2.Cli_Dni=M1.Cli_Dni
							and M1.Oferta_Monto=(select max(oferta_monto) from gd_esquema.Maestra M3 where M1.Publicacion_Cod=M3.Publicacion_Cod))
							then 1
							else 0 
					END),
					0 -- Todas sin envio
	from gd_esquema.Maestra M1
	where M1.Oferta_Fecha is not null
	and M1.Compra_Fecha is null
COMMIT;


/*Agrego localidades*/
BEGIN TRANSACTION
Insert into LPB.Localidades(descripcion) values('25 de Mayo');
Insert into LPB.Localidades(descripcion) values('9 de Julio');
Insert into LPB.Localidades(descripcion) values('Adolfo Alsina');
Insert into LPB.Localidades(descripcion) values('Adolfo Gonzales Chaves');
Insert into LPB.Localidades(descripcion) values('Alberti');
Insert into LPB.Localidades(descripcion) values('Almirante Brown');
Insert into LPB.Localidades(descripcion) values('Arrecifes');
Insert into LPB.Localidades(descripcion) values('Avellaneda');
Insert into LPB.Localidades(descripcion) values('Ayacucho');
Insert into LPB.Localidades(descripcion) values('Azul');
Insert into LPB.Localidades(descripcion) values('Bahía Blanca');
Insert into LPB.Localidades(descripcion) values('Balcarce');
Insert into LPB.Localidades(descripcion) values('Baradero');
Insert into LPB.Localidades(descripcion) values('Benito Juárez');
Insert into LPB.Localidades(descripcion) values('Berazategui');
Insert into LPB.Localidades(descripcion) values('Berisso');
Insert into LPB.Localidades(descripcion) values('Bolívar');
Insert into LPB.Localidades(descripcion) values('Bragado');
Insert into LPB.Localidades(descripcion) values('Brandsen');
Insert into LPB.Localidades(descripcion) values('CABA (Ciudad Autónoma de Buenos Aires)');
Insert into LPB.Localidades(descripcion) values('Cañuelas');
Insert into LPB.Localidades(descripcion) values('Campana');
Insert into LPB.Localidades(descripcion) values('Capitán Sarmiento');
Insert into LPB.Localidades(descripcion) values('Carlos Casares');
Insert into LPB.Localidades(descripcion) values('Carlos Tejedor');
Insert into LPB.Localidades(descripcion) values('Carmen de Areco');
Insert into LPB.Localidades(descripcion) values('Castelli');
Insert into LPB.Localidades(descripcion) values('Chacabuco');
Insert into LPB.Localidades(descripcion) values('Chascomús');
Insert into LPB.Localidades(descripcion) values('Chivilcoy');
Insert into LPB.Localidades(descripcion) values('Colón');
Insert into LPB.Localidades(descripcion) values('Coronel de Marina L. Rosales');
Insert into LPB.Localidades(descripcion) values('Coronel Dorrego');
Insert into LPB.Localidades(descripcion) values('Coronel Pringles');
Insert into LPB.Localidades(descripcion) values('Coronel Suárez');
Insert into LPB.Localidades(descripcion) values('Daireaux');
Insert into LPB.Localidades(descripcion) values('Dolores');
Insert into LPB.Localidades(descripcion) values('Ensenada');
Insert into LPB.Localidades(descripcion) values('Escobar');
Insert into LPB.Localidades(descripcion) values('Esteban Echeverría');
Insert into LPB.Localidades(descripcion) values('Exaltación de la Cruz');
Insert into LPB.Localidades(descripcion) values('Ezeiza');
Insert into LPB.Localidades(descripcion) values('Florencio Varela');
Insert into LPB.Localidades(descripcion) values('Florentino Ameghino');
Insert into LPB.Localidades(descripcion) values('General Alvarado');
Insert into LPB.Localidades(descripcion) values('General Alvear');
Insert into LPB.Localidades(descripcion) values('General Arenales');
Insert into LPB.Localidades(descripcion) values('General Belgrano');
Insert into LPB.Localidades(descripcion) values('General Guido');
Insert into LPB.Localidades(descripcion) values('General Juan Madariaga');
Insert into LPB.Localidades(descripcion) values('General La Madrid');
Insert into LPB.Localidades(descripcion) values('General Las Heras');
Insert into LPB.Localidades(descripcion) values('General Lavalle');
Insert into LPB.Localidades(descripcion) values('General Paz');
Insert into LPB.Localidades(descripcion) values('General Pinto');
Insert into LPB.Localidades(descripcion) values('General Pueyrredón');
Insert into LPB.Localidades(descripcion) values('General Rodríguez');
Insert into LPB.Localidades(descripcion) values('General San Martín');
Insert into LPB.Localidades(descripcion) values('General Viamonte');
Insert into LPB.Localidades(descripcion) values('General Villegas');
Insert into LPB.Localidades(descripcion) values('Guaminí');
Insert into LPB.Localidades(descripcion) values('Hipólito Yrigoyen');
Insert into LPB.Localidades(descripcion) values('Hurlingham');
Insert into LPB.Localidades(descripcion) values('Ituzaingó');
Insert into LPB.Localidades(descripcion) values('José C. Paz');
Insert into LPB.Localidades(descripcion) values('Junín');
Insert into LPB.Localidades(descripcion) values('La Costa');
Insert into LPB.Localidades(descripcion) values('La Matanza');
Insert into LPB.Localidades(descripcion) values('La Plata');
Insert into LPB.Localidades(descripcion) values('Lanús');
Insert into LPB.Localidades(descripcion) values('Laprida');
Insert into LPB.Localidades(descripcion) values('Las Flores');
Insert into LPB.Localidades(descripcion) values('Leandro N. Alem');
Insert into LPB.Localidades(descripcion) values('Lincoln');
Insert into LPB.Localidades(descripcion) values('Lobería');
Insert into LPB.Localidades(descripcion) values('Lobos');
Insert into LPB.Localidades(descripcion) values('Lomas de Zamora');
Insert into LPB.Localidades(descripcion) values('Luján');
Insert into LPB.Localidades(descripcion) values('Magdalena');
Insert into LPB.Localidades(descripcion) values('Maipú');
Insert into LPB.Localidades(descripcion) values('Malvinas Argentinas');
Insert into LPB.Localidades(descripcion) values('Mar Chiquita');
Insert into LPB.Localidades(descripcion) values('Marcos Paz');
Insert into LPB.Localidades(descripcion) values('Mercedes');
Insert into LPB.Localidades(descripcion) values('Merlo');
Insert into LPB.Localidades(descripcion) values('Monte');
Insert into LPB.Localidades(descripcion) values('Monte Hermoso');
Insert into LPB.Localidades(descripcion) values('Morón');
Insert into LPB.Localidades(descripcion) values('Moreno');
Insert into LPB.Localidades(descripcion) values('Navarro');
Insert into LPB.Localidades(descripcion) values('Necochea');
Insert into LPB.Localidades(descripcion) values('Olavarría');
Insert into LPB.Localidades(descripcion) values('Patagones');
Insert into LPB.Localidades(descripcion) values('Pehuajó');
Insert into LPB.Localidades(descripcion) values('Pellegrini');
Insert into LPB.Localidades(descripcion) values('Pergamino');
Insert into LPB.Localidades(descripcion) values('Pila');
Insert into LPB.Localidades(descripcion) values('Pilar');
Insert into LPB.Localidades(descripcion) values('Pinamar');
Insert into LPB.Localidades(descripcion) values('Presidente Perón');
Insert into LPB.Localidades(descripcion) values('Puán');
Insert into LPB.Localidades(descripcion) values('Punta Indio');
Insert into LPB.Localidades(descripcion) values('Quilmes');
Insert into LPB.Localidades(descripcion) values('Ramallo');
Insert into LPB.Localidades(descripcion) values('Rauch');
Insert into LPB.Localidades(descripcion) values('Rivadavia');
Insert into LPB.Localidades(descripcion) values('Rojas');
Insert into LPB.Localidades(descripcion) values('Roque Pérez');
Insert into LPB.Localidades(descripcion) values('Saavedra');
Insert into LPB.Localidades(descripcion) values('Saladillo');
Insert into LPB.Localidades(descripcion) values('Salliqueló');
Insert into LPB.Localidades(descripcion) values('Salto');
Insert into LPB.Localidades(descripcion) values('San Andrés de Giles');
Insert into LPB.Localidades(descripcion) values('San Antonio de Areco');
Insert into LPB.Localidades(descripcion) values('San Cayetano');
Insert into LPB.Localidades(descripcion) values('San Fernando');
Insert into LPB.Localidades(descripcion) values('San Isidro');
Insert into LPB.Localidades(descripcion) values('San Miguel');
Insert into LPB.Localidades(descripcion) values('San Nicolás');
Insert into LPB.Localidades(descripcion) values('San Pedro');
Insert into LPB.Localidades(descripcion) values('San Vicente');
Insert into LPB.Localidades(descripcion) values('Suipacha');
Insert into LPB.Localidades(descripcion) values('Tandil');
Insert into LPB.Localidades(descripcion) values('Tapalqué');
Insert into LPB.Localidades(descripcion) values('Tigre');
Insert into LPB.Localidades(descripcion) values('Tordillo');
Insert into LPB.Localidades(descripcion) values('Tornquist');
Insert into LPB.Localidades(descripcion) values('Trenque Lauquen');
Insert into LPB.Localidades(descripcion) values('Tres Arroyos');
Insert into LPB.Localidades(descripcion) values('Tres de Febrero');
Insert into LPB.Localidades(descripcion) values('Tres Lomas');
Insert into LPB.Localidades(descripcion) values('Vicente López');
Insert into LPB.Localidades(descripcion) values('Villa Gesell');
Insert into LPB.Localidades(descripcion) values('Villarino');
Insert into LPB.Localidades(descripcion) values('Zárate');
Insert into LPB.Localidades(descripcion) values('Otra');
COMMIT;

/*Agrego Rubros de empresa*/
BEGIN TRANSACTION
Insert into LPB.RubrosEmpresa(descripcion) values('Aerolíneas');
Insert into LPB.RubrosEmpresa(descripcion) values('Agencias de Viajes y Turismo');
Insert into LPB.RubrosEmpresa(descripcion) values('Agencias de Publicidad');
Insert into LPB.RubrosEmpresa(descripcion) values('Alquiler de vehículos');
Insert into LPB.RubrosEmpresa(descripcion) values('Arte');
Insert into LPB.RubrosEmpresa(descripcion) values('Barracas y Aserraderos');
Insert into LPB.RubrosEmpresa(descripcion) values('Construcción');
Insert into LPB.RubrosEmpresa(descripcion) values('Cuero/Curtiembres');
Insert into LPB.RubrosEmpresa(descripcion) values('Diarios y periódicos');
Insert into LPB.RubrosEmpresa(descripcion) values('Diseño gráfico');
Insert into LPB.RubrosEmpresa(descripcion) values('Diseño de interiores');
Insert into LPB.RubrosEmpresa(descripcion) values('Eventos');
Insert into LPB.RubrosEmpresa(descripcion) values('Educación a distancia');
Insert into LPB.RubrosEmpresa(descripcion) values('Electricidad');
Insert into LPB.RubrosEmpresa(descripcion) values('Equipo e instrumental médico/hospitalario');
Insert into LPB.RubrosEmpresa(descripcion) values('Florerías');
Insert into LPB.RubrosEmpresa(descripcion) values('Fundiciones');
Insert into LPB.RubrosEmpresa(descripcion) values('Funerarias');
Insert into LPB.RubrosEmpresa(descripcion) values('Gigantografías');
Insert into LPB.RubrosEmpresa(descripcion) values('Gimnasios');
Insert into LPB.RubrosEmpresa(descripcion) values('Gastronomía');
Insert into LPB.RubrosEmpresa(descripcion) values('Hoteles');
Insert into LPB.RubrosEmpresa(descripcion) values('Heladerías');
Insert into LPB.RubrosEmpresa(descripcion) values('Imprentas');
Insert into LPB.RubrosEmpresa(descripcion) values('Industrias textiles');
Insert into LPB.RubrosEmpresa(descripcion) values('Industrias químicas');
Insert into LPB.RubrosEmpresa(descripcion) values('Importaciones');
Insert into LPB.RubrosEmpresa(descripcion) values('Juguetes');
Insert into LPB.RubrosEmpresa(descripcion) values('Joyerías');
Insert into LPB.RubrosEmpresa(descripcion) values('Jabones');
Insert into LPB.RubrosEmpresa(descripcion) values('Laboratorios farmaceúticos');
Insert into LPB.RubrosEmpresa(descripcion) values('Librerías y papelerías');
Insert into LPB.RubrosEmpresa(descripcion) values('Marketing');
Insert into LPB.RubrosEmpresa(descripcion) values('Mueblerias');
Insert into LPB.RubrosEmpresa(descripcion) values('Operadores logísticos');
Insert into LPB.RubrosEmpresa(descripcion) values('Ópticas');
Insert into LPB.RubrosEmpresa(descripcion) values('Organizaciones internacionales');
Insert into LPB.RubrosEmpresa(descripcion) values('Organismos no gubernamentales');
Insert into LPB.RubrosEmpresa(descripcion) values('Peluquerías');
Insert into LPB.RubrosEmpresa(descripcion) values('Plásticos');
Insert into LPB.RubrosEmpresa(descripcion) values('Petroleras');
Insert into LPB.RubrosEmpresa(descripcion) values('Serigrafía');
Insert into LPB.RubrosEmpresa(descripcion) values('Saunas');
Insert into LPB.RubrosEmpresa(descripcion) values('SPA');
Insert into LPB.RubrosEmpresa(descripcion) values('Seguridad física');
Insert into LPB.RubrosEmpresa(descripcion) values('Transporte');
Insert into LPB.RubrosEmpresa(descripcion) values('Turismo');
Insert into LPB.RubrosEmpresa(descripcion) values('Universidades');
Insert into LPB.RubrosEmpresa(descripcion) values('Vidrio');
Insert into LPB.RubrosEmpresa(descripcion) values('Veterinarias');
Insert into LPB.RubrosEmpresa(descripcion) values('Vinos');
Insert into LPB.RubrosEmpresa(descripcion) values('Web y multimedia');
Insert into LPB.RubrosEmpresa(descripcion) values('Zapaterías');
Insert into LPB.RubrosEmpresa(descripcion) values('Otro');
COMMIT;
