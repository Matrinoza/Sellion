

CREATE DATABASE DBSSITEMA_VENTA

GO

Use DBSSITEMA_VENTA

go

create table ROL(
IdRol int primary key identity,
Descripcion varchar (50),
FechaCreacion datetime default getdate()
)

go

create table PERMISO (
IdPermiso int primary key identity,
IdRol int references ROL(IdRol),
NombreMenu varchar (100),
FechaCreacion datetime default getdate()
)

go

create table PROVEEDOR (
IdProveedor int primary key identity,
Documento varchar (50),
Correo varchar (50),
Telefono varchar (50),
RazonSocial varchar (50),
Estado bit,
FechaCreacion datetime default getdate()
)

go

create table CLIENTE (
IdCliente int primary key identity,
Documento varchar (50),
NombreCompleto varchar (50),
Correo varchar (50),
Telefono varchar (50),
Estado bit,
FechaCreacion datetime default getdate()
)

go

create table USUARIO (
IdUsuario int primary key identity,
IdRol int references ROL(IdRol),
Documento varchar (50),
NombreCompleto varchar (50),
Usuario varchar (50),
Clave varchar (50),
Correo varchar (50),
Estado bit,
FechaCreacion datetime default getdate()
)

go

create table CATEGORIA (
IdCategoria int primary key identity,
Descripcion varchar (50),
Estado bit,
FechaCreacion datetime default getdate()
)

go

create table PRODUCTO (
IdProducto int primary key identity,
Descripcion varchar (50),
Codigo varchar (50),
Nombre varchar (50),
IdCategoria int references CATEGORIA(IdCategoria),
Stock int not null default 0,
PrecioCompra decimal(10,2) default 0,
PrecioVenta decimal(10,2) default 0,
Estado bit,
FechaCreacion datetime default getdate()
)

go


create table COMPRA (
IdCompra int primary key identity,
IdRol int references ROL(IdRol),
IdUsuario int references USUARIO(IdUsuario),
IdProveedor int references PROVEEDOR(IdProveedor),
TipoDocumento varchar(50),
NumeroDocumento varchar(50),
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)

go

create table DETALLE_COMPRA (
IdDetalleCompra int primary key identity,
IdCompra int references COMPRA(IdCompra),
IdProducto int references PRODUCTO(IdProducto),
PrecioCompra decimal(10,2) default 0,
PrecioVenta decimal(10,2) default 0,
Cantidad int,
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)

go

create table VENTA (
IdVenta int primary key identity,
IdRol int references ROL(IdRol),
IdUsuario int references USUARIO(IdUsuario),
TipoDocumento varchar(50),
NumeroDocumento varchar(50),
DocumentoCliente varchar(100),
NombreCliente varchar(100),
MontoPago decimal(10,2),
MontoCambio decimal(10,2),
MontoTotal decimal(10,2),
FechaRegistro datetime default getdate()
)

go

create table DETALLE_VENTA (
IdDetalleVenta int primary key identity,
IdVenta int references Venta(IdVenta),
IdProducto int references PRODUCTO(IdProducto),
PrecioVenta decimal(10,2) default 0,
Cantidad int,
SubtTotal decimal(10,2),
FechaRegistro datetime default getdate()
)

go