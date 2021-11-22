--CREACION DE TABLAS 

USE Supermercado
GO
--TABLA DE ERRORES (CREAR)
--TABLA CATALOGO DE PAISES
CREATE TABLE pais (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL
);


--TABLA ESTADO BONOS
CREATE TABLE estadoBono (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Descripcion VARCHAR(50) NOT NULL,
);

--TABLA SUCURSAL
CREATE TABLE sucursal (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL,
	Pais INT NOT NULL,
	Direccion VARCHAR (50) NOT NULL,
	FOREIGN KEY (Pais) REFERENCES pais (Id)
);

--TABLA CLIENTE
CREATE TABLE cliente (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Doc_Identificacion INT NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Pais INT NOT NULL,
	Direccion VARCHAR (50) NOT NULL,
	FOREIGN KEY (Pais) REFERENCES pais (Id)
);

--TABLA CATALOGO DE PUESTOS
CREATE TABLE puesto (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL
);

--TABLA EMPLEADOS
CREATE TABLE empleado (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Doc_Identificacion INT NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Direccion VARCHAR(50) NOT NULL,
	SalarioBase MONEY NOT NULL,
	Id_Puesto INT NOT NULL,
	Id_Sucursal INT NOT NULL,
	FOREIGN KEY (Id_Puesto) REFERENCES puesto (Id),
	FOREIGN KEY (Id_Sucursal) REFERENCES sucursal (Id)
);

--TABLA BONO
CREATE TABLE Bono (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Monto MONEY NOT NULL,
	Fecha DATE NOT NULL,
	Id_Empleado INT NOT NULL,
	FOREIGN KEY (Id_Empleado) REFERENCES empleado (Id)
);

ALTER TABLE Bono
ADD Condicion INT NOT NULL Default 1,
FOREIGN KEY (Condicion) REFERENCES estadoBono (Id)

--TABLA (ES COMO CATALOGO) PROVEEDOR
CREATE TABLE proveedor (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL,
	Telefono INT NOT NULL,
);

--TABLA RED DE PROVEEDORES DE SUCURSAL
CREATE TABLE sucursalxProveedor (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Id_Sucursal INT NOT NULL,
	Id_Proveedor INT NOT NULL,
	FOREIGN KEY (Id_Sucursal) REFERENCES sucursal (Id),
	FOREIGN KEY (Id_Proveedor) REFERENCES proveedor (Id)
);

--TABLA CATALOGO CATEGORIA PRODUCTO
CREATE TABLE categoriaProducto (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL,
	Impuesto INT NOT NULL
);

--TABLA LOTE
CREATE TABLE lote (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Descripccion VARCHAR(50) NOT NULL,
	FechaExpiracion DATE NOT NULL,
	FechaProduccion DATE NOT NULL,
	Id_categoria INT NOT NULL,
	FOREIGN KEY (Id_Categoria) REFERENCES categoriaProducto (Id)
);

--TABLA INENTARIO
CREATE TABLE inventarioProducto (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL,
	Cantidad INT NOT NULL,
	CantMaxima INT NOT NULL,
	CantMinima INT NOT NULL,
	Id_Sucursal INT NOT NULL,
	Id_Categoria INT NOT NULL,
	FOREIGN KEY (Id_Sucursal) REFERENCES sucursal (Id),
	FOREIGN KEY (Id_Categoria) REFERENCES categoriaProducto (Id)
);
ALTER TABLE inventarioProducto
ADD Codigo INT NOT NULL

ALTER TABLE inventarioProducto
DROP COLUMN Codigo
--TABLA PRODUCTO
CREATE TABLE producto (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(50) NOT NULL,
	PrecioVenta MONEY NOT NULL,
	Descuento INT NOT NULL,
	Estado VARCHAR(50) NOT NULL,
	Id_Inventario INT NOT NULL,
	Id_Lote INT NOT NULL,
	FOREIGN KEY (Id_Inventario) REFERENCES inventarioProducto (Id),
	FOREIGN KEY (Id_Lote) REFERENCES lote (Id)
);
ALTER TABLE producto

ADD  FOREIGN KEY (Proveedor) REFERENCES Proveedor (Id),
	FOREIGN KEY (Id_Lote) REFERENCES lote (Id)

ALTER TABLE producto
ADD Id_EstadoProducto INT NOT NULL DEFAULT 1,
FOREIGN KEY (Id_EstadoProducto) REFERENCES estadoProducto (Id)

ADD Id_Proveedor INT NOT NULL,
FOREIGN KEY (Id_Proveedor) REFERENCES proveedor (Id)

--TABLA PEDIDO PROVEEDOR (ProductoXProveedor)
CREATE TABLE pedidoProveedor (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Precio MONEY NOT NULL,
	Cant INT NOT NULL,
	Porcentaje INT NOT NULL,
	Id_Proveedor INT NOT NULL,
	Id_Producto INT NOT NULL,
	FOREIGN KEY (Id_Proveedor) REFERENCES proveedor (Id),
	FOREIGN KEY (Id_Producto) REFERENCES producto (Id)
);

ALTER TABLE pedidoProveedor
ADD CodigoInventario INT NOT NULL,
FOREIGN KEY (CodigoInventario) REFERENCES inventarioProducto (Id)
DROP COLUMN Id_Producto
DROP CONSTRAINT FK__pedidoPro__Id_Pr__4D94879B

--TABLA METODO PAGO
CREATE TABLE metodoPago (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL
);

--TABLA COMPRA
CREATE TABLE compra (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Fecha DATE NOT NULL,
	Monto MONEY NOT NULL,
	Id_metodoPago INT NOT NULL,
	Id_Cliente INT NOT NULL,
	ADD Id_Empleado INT NOT NULL,
	FOREIGN KEY (Id_metodoPago) REFERENCES metodoPago (Id),
	FOREIGN KEY (Id_Cliente) REFERENCES cliente (Id),
	FOREIGN KEY (Id_Empleado) REFERENCES empleado (Id)
);


--TABLA COMPRA X PRODUCTO
CREATE TABLE compraxProducto (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Cantidad INT NOT NULL,
	Subtotal MONEY NOT NULL,
	Id_compra INT NOT NULL,
	Id_Producto INT NOT NULL,
	FOREIGN KEY (Id_compra) REFERENCES compra (Id),
	FOREIGN KEY (Id_Producto) REFERENCES producto (Id)
);

--TABLA INENTARIO
CREATE TABLE envio (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Direccion VARCHAR(50) NOT NULL,
	Precio MONEY NOT NULL,
	Id_Compra INT NOT NULL,
	FOREIGN KEY (Id_Compra) REFERENCES compra (Id)

);

--TABLA ESTADO PRODUCTO
CREATE TABLE estadoProducto (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Descripccion VARCHAR(50) NOT NULL
);

-----------------------------------------------------------
--MANEJO DE DIRECCIONES

--TABLA CATALOGO DE PROVINCIA
CREATE TABLE provincia (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL
);

--TABLA CATALOGO DE CANTON
CREATE TABLE canton (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50) NOT NULL
);

--TABLA ESTADO DE COMPRA 
CREATE TABLE estadoCompra (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Descripcion VARCHAR(50) NOT NULL
);
------------------------------------------------
--AGREGAR ESTADO A TABLA COMPRA
ALTER TABLE compra
ADD Id_estadoCompra INT NOT NULL DEFAULT 1,
FOREIGN KEY (Id_estadoCompra) REFERENCES estadoCompra (Id)
------------------------------------------------

--TABLA DIRECCION
CREATE TABLE direccion (
	Id INT PRIMARY KEY IDENTITY (1,1),
	Id_pais INT NOT NULL,
	Id_provincia INT NOT NULL,
	Id_canton INT NOT NULL,
	DireccionExacta VARCHAR(50) NOT NULL,
	Estado BIT NOT NULL DEFAULT 1,
	FOREIGN KEY (Id_provincia) REFERENCES provincia (Id),
	FOREIGN KEY (Id_canton) REFERENCES canton (Id),
	FOREIGN KEY (Id_pais) REFERENCES pais (Id)
);

-----------------------------------------------------------
--AGREGAR DIRECCION
ALTER TABLE Sucursal
	ADD FOREIGN KEY (Direccion) REFERENCES direccion (Id)

ALTER TABLE Empleado
	ADD Direccion INT NOT NULL DEFAULT 1;
----------------------------------------------------------------

--TABLA ERRORES
CREATE TABLE error (
	Id INT PRIMARY KEY IDENTITY (1,1),
	descripcion VARCHAR(20) not null
);

--AGREGAR ESTADO--------------------------------------------------
ALTER TABLE pais
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE sucursal
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE cliente
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE puesto
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE empleado
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE bono
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE proveedor
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE sucursalxProveedor
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE categoriaproducto
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE lote
	ADD Estado INT NOT NULL DEFAULT 1;

ALTER TABLE inventarioProducto
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE producto
	ADD EstadoInventario VARCHAR(50) NOT NULL;

ALTER TABLE pedidoProveedor
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE metodoPago
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE compra
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE compraxProducto
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE envio
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE provincia
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE canton
	ADD Estado BIT NOT NULL DEFAULT 1;

ALTER TABLE direccion
	ADD Estado BIT NOT NULL DEFAULT 1;

