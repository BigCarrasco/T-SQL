USE MASTER
GO

CREATE DATABASE BD_PEDIDO
GO

USE BD_PEDIDO
GO

/*Eliminar Relaciones existentes */
/*Nota: solo en caso que se quiera volver a ejecutar, se tiene que descomentar el codigo siguiente. 
Además de comentar las lineas CREATE DATABASE BD_PEDIDO GO */

--ALTER TABLE [tb_detalle_pedido]
--DROP CONSTRAINT IF EXISTS [fk_IdPedido]
--GO
--ALTER TABLE [tb_detalle_pedido]
--DROP CONSTRAINT IF EXISTS [fk_idproducto]
--GO
--ALTER TABLE [tb_Pedido]
--DROP CONSTRAINT IF EXISTS [fk_idEmpresaEnvio]
--GO
--ALTER TABLE [tb_Pedido]
--DROP CONSTRAINT IF EXISTS [fk_idCliente]
--GO
--ALTER TABLE [tb_Pedido]
--DROP CONSTRAINT IF EXISTS [fk_idEmpleado]
--GO
--ALTER TABLE [tb_producto]
--DROP CONSTRAINT IF EXISTS [fk_idproducto]
--GO
--ALTER TABLE [tb_producto]
--DROP CONSTRAINT IF EXISTS [fk_idCategoria]
--GO
------------------------------------------------------------------------


DROP TABLE IF EXISTS [tb_categoria];

CREATE TABLE [tb_categoria](
	[idcategoria] int NOT NULL , -- 
	[nombrecategoria] Varchar(100) NOT NULL,
	[descripcion] text NULL );

DROP TABLE IF EXISTS [tb_cliente];
CREATE TABLE [tb_cliente](
	[IdCliente] int NOT NULL ,
	[Nombre_empresa] Varchar(100) NOT NULL,
	[NombreContacto] Varchar(100) NULL,
	[CargoContacto] Varchar(100) NULL,
	[Direccion] Varchar(100) NULL,
	[Ciudad] Varchar(100) NULL,
	[Region] Varchar(100) NULL,
	[CodPostal] Varchar(100) NULL,
	[Pais] Varchar(100) NULL,
	[Telefono] Varchar(30) NULL,
	[Fax] Varchar(30) NULL);

DROP TABLE IF EXISTS [tb_empresa_envio];
CREATE TABLE [tb_empresa_envio](
	[idEmpresaEnvio] int  NOT NULL,
	[nombre_empresa] Varchar(40) NOT NULL,
	[telefono] Varchar(24) NULL); 

DROP TABLE IF EXISTS [tb_detalle_pedido];
CREATE TABLE [tb_detalle_pedido](
	[idpedido] int NULL ,
	[idproducto] int NULL,
	[preciounidad] decimal(18, 2) NOT NULL,
	[cantidad] int NOT NULL,
	[descuento] decimal(18, 2) NOT NULL ); 

DROP TABLE IF EXISTS [tb_empleado];
CREATE TABLE [tb_empleado](
	[IdEmpleado] int NOT NULL,
	[Apellidos] Varchar(20) NULL,
	[Nombre] Varchar(20) NULL,
	[cargo] Varchar(40) NULL,
	[Tratamiento] Varchar(40) NULL,
	[FechaNacimiento] date NULL,
	[FechaContratacion] date NULL,
	[direccion] Varchar(60) NULL,
	[ciudad] Varchar(15) NULL,
	[region] Varchar(15) NULL,
	[codPostal] Varchar(10) NULL,
	[pais] Varchar(15) NULL,
	[TelDomicilio] Varchar(24) NULL,
	[Extension] Varchar(4) NULL,
	[notas] text NULL,
	[Jefe] int NULL,
	[sueldoBasico] decimal(18,2) NULL);

DROP TABLE IF EXISTS [tb_pedido];
CREATE TABLE [tb_pedido](
	[IdPedido] int NOT NULL,
	[IdCliente] int NOT NULL,
	[IdEmpleado] int NOT NULL,
	[FechaPedido] date NULL,
	[FechaEntrega] date NULL,
	[FechaEnvio] date NULL,
	[idEmpresaEnvio] int NULL,
	[Cargo] decimal(18, 2) NULL,
	[Destinatario] Varchar(60) NULL,
	[DireccionDestinatario] Varchar(60) NULL,
	[CiudadDestinatario] Varchar(60) NULL,
	[RegionDestinatario] Varchar(60) NULL,
	[CodPostalDestinatario] Varchar(60) NULL,
	[PaisDestinatario] Varchar(60) NULL);

DROP TABLE IF EXISTS [tb_producto];
CREATE TABLE [tb_producto](
	[idproducto] int NOT NULL,
	[nombreProducto] Varchar(40) NULL,
	[idProveedor] int NULL,
	[idCategoria] int NULL,
	[cantidadPorUnidad] Varchar(20) NULL,
	[precioUnidad] decimal(18,2) NULL,
	[unidadesEnExistencia] smallint NULL,
	[unidadesEnPedido] smallint NULL,
	[nivelNuevoPedido] smallint NULL,
	[suspendido] bit NULL,
	[categoriaProducto] Varchar(20) NULL);

DROP TABLE IF EXISTS [tb_proveedor];
CREATE TABLE [tb_proveedor](
	[idProveedor] int NOT NULL,
	[nombre_empresa] Varchar(40) NOT NULL,
	[nombrecontacto] Varchar(30) NULL,
	[cargocontacto] Varchar(30) NULL,
	[direccion] Varchar(60) NULL,
	[ciudad] Varchar(15) NULL,
	[region] Varchar(15) NULL,
	[codPostal] Varchar(10) NULL,
	[pais] Varchar(15) NULL,
	[telefono] Varchar(24) NULL,
	[fax] Varchar(24) NULL,
	[paginaprincipal] text NULL);

/*Asignar Primary Key*/
ALTER TABLE tb_cliente 
ADD CONSTRAINT [pk_idcliente] primary key(idcliente)

ALTER TABLE tb_categoria 
ADD CONSTRAINT [pk_idcategoria] primary key(idcategoria)

ALTER TABLE tb_empleado
ADD CONSTRAINT [pk_idempleado] primary key(idempleado)

ALTER TABLE tb_empresa_envio
ADD CONSTRAINT [pk_idEmpresaEnvio] primary key(idEmpresaEnvio)

ALTER TABLE tb_pedido
ADD CONSTRAINT [pk_idpedido] primary key(idpedido)

ALTER TABLE tb_producto
ADD CONSTRAINT [pk_idproducto] primary key(idproducto)

ALTER TABLE tb_proveedor
ADD CONSTRAINT [pk_idproveedor] primary key(idproveedor)


/*Asignar Foreign Key*/
ALTER TABLE [tb_detalle_pedido]  
ADD CONSTRAINT [fk_IdPedido] FOREIGN KEY([idpedido])
REFERENCES [tb_Pedido] ([IdPedido])
GO
ALTER TABLE [tb_detalle_pedido]  
WITH CHECK ADD  CONSTRAINT [fk_idproducto] FOREIGN KEY([idproducto])
REFERENCES [tb_producto] ([idproducto])
GO
ALTER TABLE [tb_Pedido] 
ADD CONSTRAINT [fk_idEmpresaEnvio] FOREIGN KEY([idEmpresaEnvio])
REFERENCES [tb_empresa_envio] ([idEmpresaEnvio])
GO
ALTER TABLE [tb_Pedido]  
WITH CHECK ADD  CONSTRAINT [fk_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [tb_cliente] ([idCliente])
GO
ALTER TABLE [tb_Pedido]  
ADD  CONSTRAINT [fk_IdEmpleado] FOREIGN KEY([IdEmpleado])
REFERENCES [tb_Empleado] ([IdEmpleado])
GO
ALTER TABLE [tb_producto]  
ADD  CONSTRAINT [fk_idProveedor] FOREIGN KEY([idProveedor])
REFERENCES [tb_proveedor] ([idProveedor])
GO
ALTER TABLE [tb_producto]  
ADD  CONSTRAINT [fk_idCategoria] FOREIGN KEY([idCategoria])
REFERENCES [tb_categoria] ([idcategoria])
GO
