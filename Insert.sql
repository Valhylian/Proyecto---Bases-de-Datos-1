--CREACION DE INSERT
USE Supermercado
GO

--INSERTAR EN TABLAS CATALOGOS-------------------------------

--INSERTAR PAIS
CREATE PROCEDURE insertarPais
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[pais] where Nombre = @nombre) = 0
			INSERT INTO [dbo].[pais] (Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2
print @error;
RETURN @error
END
GO
 
--INSERTAR PUESTO
CREATE PROCEDURE insertarPuesto
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL
		if (SELECT COUNT(*) FROM puesto where Nombre = @nombre) = 0
			INSERT INTO puesto(Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR PROVEEDOR
CREATE PROCEDURE insertarProveedor
@nombre VARCHAR(50),
@telefono INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	
	if (@nombre IS NOT NULL AND @telefono IS NOT NULL) --datos no nulos
		if (SELECT COUNT(*) FROM proveedor where Nombre = @nombre) = 0 --datos no repetidos
			INSERT INTO proveedor(Nombre,Telefono)
				   VALUES (@nombre, @telefono)
		else
			set @error = 1

	if (@nombre is null OR @telefono IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO


--INSERTAR CATEGORIA PRODUCTO
CREATE PROCEDURE insertarCategoriaProducto
@nombre VARCHAR(50),
@impuesto INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	
	if (@nombre IS NOT NULL AND @impuesto IS NOT NULL) --datos no nulos
		if (SELECT COUNT(*) FROM categoriaProducto where Nombre = @nombre) = 0 --datos no repetidos
			INSERT INTO categoriaProducto(Nombre,Impuesto)
				   VALUES (@nombre, @impuesto)
		else
			set @error = 1

	if (@nombre is null OR @impuesto IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR METODO PAGO
CREATE PROCEDURE insertarMetodoPago
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[metodoPago] where Nombre = @nombre) = 0 --valores no repetidos
			INSERT INTO [dbo].[metodoPago] (Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2
print @error;
RETURN @error
END
GO



--INSERTAR EN TABLAS CON FOREIGN KEY-------------------------------

--INSERTAR SUCURSAL
CREATE PROCEDURE insertarSucursal
@nombre VARCHAR(50),
@direccion INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@nombre IS NOT NULL AND  @direccion IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[sucursal] where Nombre = @nombre) = 0 --valores no repetidos
			if (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1) > 0	 --existe la direccion
			INSERT INTO [dbo].[sucursal] (Nombre, Direccion)
				   VALUES (@nombre, @direccion)
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@nombre is null  OR @direccion IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO



--INSERTAR EMPLEADO
CREATE PROCEDURE insertarEmpleado
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@identificacion INT,
@direccion INT,
@salarioBase MONEY,
@puesto INT,
@sucursal INT


AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0 --no hay error

	if (@nombre IS NOT NULL AND @apellido IS NOT NULL AND 
		@direccion IS NOT NULL AND @salarioBase IS NOT NULL AND @puesto IS NOT NULL AND @sucursal IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[empleado] 
				where Nombre = @nombre AND Apellido = @apellido AND Doc_Identificacion = @identificacion AND Estado = 1) = 0 --valores no repetidos
			if (SELECT COUNT(*) FROM [dbo].[puesto] where Id = @puesto AND Estado = 1)>0 
				AND (SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0  --existe sucursal y puesto como registro
				AND (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1) > 0 --existe direccion
					INSERT INTO [dbo].[empleado] (Nombre, Apellido, Doc_Identificacion, Direccion, SalarioBase, Id_Puesto, Id_Sucursal)
						   VALUES (@nombre, @apellido, @identificacion, @direccion, @salarioBase, @puesto, @sucursal)
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@nombre is null OR @apellido IS NULL OR @identificacion IS NULL OR @direccion is null OR @salarioBase IS NULL OR @puesto IS NULL OR @sucursal IS NULL )
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR BONO
CREATE PROCEDURE insertarBono
@empleado iNT,
@fecha DATE,
@monto MONEY
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@empleado IS NOT NULL AND @fecha IS NOT NULL AND @monto IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[empleado] where Id = @empleado AND Estado = 1) > 0 --existe el empleado como registro
		INSERT INTO [dbo].[Bono] (Id_Empleado, Fecha, Monto)
			   VALUES (@empleado, @fecha, @monto)
		else
			set @error = 3 --falta llave foranea


	if (@empleado is null OR @fecha IS NULL OR @monto IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO


--Insertar Cliente
CREATE PROCEDURE insertarCliente
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@identificacion INT,
@direccion INT
AS

BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0 --no hay error

	if (@nombre IS NOT NULL AND @apellido IS NOT NULL AND 
		@direccion IS NOT NULL AND @identificacion IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[cliente] 
				where Doc_Identificacion = @identificacion AND Estado = 1) = 0 --valores no repetidos
			if (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1)>0   --existe direccion
					INSERT INTO [dbo].[cliente] (Nombre, Apellido, Doc_Identificacion, Direccion)
						   VALUES (@nombre, @apellido, @identificacion, @direccion)
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@nombre is null OR @apellido IS NULL OR @identificacion IS NULL OR @direccion is null)
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR sucursalxProveedor
CREATE PROCEDURE insertarSucursalxProveedor
@sucursal INT,
@proveedor INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@sucursal IS NOT NULL AND @proveedor IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[sucursalxProveedor] where Id_Sucursal = @sucursal AND Id_Proveedor = @proveedor AND Estado = 1) = 0 --valores no repetidos
			if ((SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0 --existe la sucursal como registro
				AND (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0) --existe el proveedor
				INSERT INTO [dbo].[sucursalxProveedor] (Id_Sucursal, Id_Proveedor)
					   VALUES (@sucursal, @proveedor)
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@sucursal is null OR @proveedor IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR INVENTARIO PRODUCTO
CREATE PROCEDURE insertarInventarioProducto
@nombre VARCHAR(50),
@cantidad INT,
@maximo INT,
@minimo INT,
@sucursal INT,
@categoria INT,
@proveedor INT,
@precioCompra INT,
@porcentaje INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0 --no hay error

	if (@nombre IS NOT NULL AND @proveedor IS NOT NULL AND @cantidad IS NOT NULL AND @precioCompra IS NOT NULL AND @porcentaje IS NOT NULL
		AND @maximo IS NOT NULL AND @minimo IS NOT NULL AND @sucursal IS NOT NULL AND @categoria IS NOT NULL) --valores no nulos
			if (SELECT COUNT(*) FROM [dbo].[categoriaProducto] where Id = @categoria AND Estado = 1)>0  --existe categoria
				AND (SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0  --existe sucursal
				AND (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0  --existe proveedor
			
					INSERT INTO [dbo].[inventarioProducto] (Nombre, Cantidad, CantMaxima, CantMinima, 
										Id_Categoria, Id_Sucursal, Id_Proveedor, PrecioCompra, Porcentaje)
						   VALUES (@nombre, @cantidad, @maximo, @minimo, @categoria, @sucursal, @proveedor, @precioCompra, @porcentaje)
			else
				set @error = 3 --falta llave foranea


	if (@nombre is null OR @proveedor IS NULL OR @cantidad IS NULL OR @maximo is null OR @minimo IS NULL OR 
		@sucursal IS NULL OR @categoria IS NULL OR @precioCompra IS NULL OR @porcentaje IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR LOTE
CREATE PROCEDURE insertarLote
@descripcion VARCHAR(50),
@expiracion DATE,
@produccion DATE
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@descripcion IS NOT NULL AND @expiracion IS NOT NULL AND @produccion IS NOT NULL) --valores no nulos

		INSERT INTO [dbo].[lote] (FechaExpiracion, FechaProduccion, Descripccion)
			   VALUES (@expiracion, @produccion, @descripcion)


	if (@descripcion is null OR @expiracion IS NULL OR @produccion IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
--INSERTAR PEDIDO
CREATE PROCEDURE insertarPedido
@precio MONEY,
@cantidad INT,
@porcentaje INT,
@proveedor INT,
@codigoProductoInventario INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@precio IS NOT NULL AND @cantidad IS NOT NULL AND @porcentaje IS NOT NULL AND 
		@proveedor IS NOT NULL AND @codigoProductoInventario IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0 --existe proveedor
			AND (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id = @codigoProductoInventario AND Estado = 1) > 0 --existe producto en inventario
			INSERT INTO [dbo].[pedidoProveedor] (Precio, Porcentaje, Cant, CodigoInventario, Id_Proveedor)
				   VALUES (@precio, @porcentaje, @cantidad, @codigoProductoInventario, @proveedor)
		else
			set @error = 3 --falta llave foranea


	if (@precio is null OR @cantidad IS NULL OR @porcentaje IS NULL OR @proveedor IS NULL OR @codigoProductoInventario IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR PRODUCTO
--Nota: para agregar un producto (de forma individual) debe existir el registro correspondienes
--en el inventario (codigo)
CREATE PROCEDURE insertarProducto
@Descuento INT,
@lote INT,
@pedido INT

AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@precioCompra MONEY,
	@porcentaje INT,
	@impuesto INT,
	@inventarioProduc INT,
	@categoria INT,
	@proveedor INT,
	@precioVenta MONEY,
	@nombre VARCHAR (20)
	

	set @error = 2 --nulos
	if ( @Descuento IS NULL OR 
		@lote IS NULL OR @pedido IS NULL) --valores nulos
		RETURN @error
		
	set @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[lote] where Id = @lote AND Estado = 1) = 0						
		OR (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @pedido AND Estado = 1) = 0	
		RETURN @error

	SET @error = 0 --no hay error
	--obtener proveedor
	SELECT @proveedor = [Id_Proveedor] FROM [dbo].[pedidoProveedor]
						WHERE Id = @pedido AND Estado = 1
	--obtener precio compra
	SELECT @precioCompra = Precio FROM [dbo].[pedidoProveedor] 
						WHERE Id = @pedido AND Estado = 1
	--obtener porcentaje
	SELECT @porcentaje = Porcentaje FROM [dbo].[pedidoProveedor]
						WHERE Id = @pedido AND Estado = 1
	--obtener Id Inventario
	SELECT @inventarioProduc = CodigoInventario FROM [dbo].[pedidoProveedor]
						WHERE Id = @pedido AND Estado = 1
	--obtener Categoria
	SELECT @categoria = [Id_Categoria] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1
	--obtener Impuesto
	SELECT @impuesto = [Impuesto] FROM [dbo].[categoriaProducto]
						WHERE Id = @categoria AND Estado = 1
	--obtener nombre
	SELECT @nombre = [Nombre] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1

	--actualizar inventario
	UPDATE [dbo].[inventarioProducto] SET [Cantidad] = [Cantidad]+1 WHERE [Id] = @inventarioProduc AND Estado = 1

	--calcular precio Venta
	SET @precioVenta = @precioCompra + (@precioCompra * ((@impuesto+0.0)/100.0))+(@precioCompra * ((@porcentaje+0.0)/100.0)) -(@precioCompra * ((@Descuento+0.0)/100.0)) 

	INSERT INTO [dbo].[producto] (Nombre, PrecioVenta, Descuento, Id_Inventario, Id_Lote, Id_Pedido, Id_EstadoProducto)
			   VALUES (@nombre, @precioVenta, @Descuento, @inventarioProduc, @lote, @pedido, 1)


print @error;
RETURN @error
END
GO

DROP PROCEDURE insertarProducto

--INSERTAR COMPRA
CREATE PROCEDURE insertarCompra
@fecha DATE,
@cliente INT,
@empleado INT,
@metodoPago INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@fecha IS NOT NULL AND @cliente IS NOT NULL AND @empleado IS NOT NULL AND @metodoPago IS NOT NULL)--valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[cliente] where Id = @cliente AND Estado = 1) > 0 --existe cliente
			AND (SELECT COUNT(*) FROM [dbo].[empleado] where Id = @empleado AND Estado = 1) > 0 --existe empleado
			AND (SELECT COUNT(*) FROM [dbo].[metodoPago] where Id = @metodoPago AND Estado = 1) > 0 --existe metodoPago

			INSERT INTO [dbo].[compra] (Fecha, Monto, Id_metodoPago, Id_Cliente, Id_Empleado)
				   VALUES (@fecha, 0, @metodoPago, @cliente, @empleado)
		else
			set @error = 3 --falta llave foranea


	if (@fecha is null OR @cliente IS NULL OR @empleado IS NULL OR @metodoPago IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR ENVIO
CREATE PROCEDURE insertarEnvio
@compra INT,
@direccion VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@precioCompra MONEY,
	@precioEnvio MONEY

	SET @error = 2 --valores nulos
	if (@compra IS NULL AND @direccion IS NULL)--valores no nulos
		RETURN @error

	SET @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[compra] where Id = @compra AND Estado = 1) = 0 --existe compra
		RETURN @error

	SET @error = 0 --todo bien

	--obtener precioCompra
	SELECT @precioCompra = [Monto] FROM [dbo].[compra]
						WHERE Id = @compra AND Estado = 1

	--set precio del envio
	SET @precioEnvio = (@precioCompra+0.0)*0.1

	INSERT INTO [dbo].[envio] (Direccion, Precio, Id_Compra)
		   VALUES (@direccion, @precioEnvio, @compra)

print @error;
RETURN @error
END
GO

--INSERtARcompraxProducto
CREATE PROCEDURE insertraCompraxProducto
@compra INT,
@producto INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@monto MONEY,
	@inventario INT

	SET @error = 2 --valores nulos
	if (@compra IS NULL AND @producto IS NULL)--valores no nulos
		RETURN @error

	SET @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[compra] where Id = @compra AND Estado = 1) = 0 OR --existe compra
		(SELECT COUNT(*) FROM [dbo].[producto] where Id = @producto AND Estado = 1 AND ([Id_EstadoProducto] = 1 or [Id_EstadoProducto] = 4)) = 0 --existe producto
		RETURN @error

	SET @error = 0 --todo bien

	--obtener precioCompra
	SELECT @monto = [PrecioVenta] FROM [dbo].[producto]
						WHERE Id = @producto AND Estado = 1
	--obtener inventario
	SELECT @inventario = [Id_Inventario] FROM [dbo].[producto]
						WHERE Id = @producto AND Estado = 1


	--actualizar montoCompra
	UPDATE [dbo].[compra] SET [Monto] = [Monto]+@monto WHERE [Id] = @compra AND Estado = 1

	--actualizar estadoProducto
	UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 5 WHERE [Id] = @producto AND Estado = 1

	INSERT INTO [dbo].[compraxProducto] (Subtotal, Id_Producto, Id_Compra)
		   VALUES (@monto, @producto, @compra)

print @error;
RETURN @error
END
GO

drop procedure insertraCompraxProducto

--prueba insertarPais
EXEC insertarPais @nombre = 'Salvador'
GO

--prueba insertarBono-----------------
DECLARE @curent_date date = getdate();
EXEC insertarBono @empleado = 2, @fecha =@curent_date, @monto = 20000

--prueba insertEmpleado--------------
EXEC insertarEmpleado @nombre='Marco', @apellido = 'Salazar', @identificacion=119190366, @direccion = 'Aserri, San Jose, Costa Rica', @salarioBase = 1000000, @puesto = 2, @sucursal = 1
GO

--prueba insertarCliente--------------
EXEC insertarCliente @nombre='Luis', @apellido = 'Prado', @identificacion=114970647, @direccion = 'Nicoya, Guanacaste, Costa Rica', @pais = 1
GO

--prueba inserar SucursalxProveedor
EXEC insertarSucursalxProveedor @sucursal = 1, @proveedor =2
GO

--prueba insertar InventarioProducto
EXEC insertarInventarioProducto @nombre = 'Arroz Tio Pelon', @codigo = 1, @cantidad = 0, @maximo = 100, @minimo = 20, @sucursal =1 , @categoria =3
GO

--prueba insertar lote
DECLARE @produc date = getDate();
DECLARE @vence date = getDate()+365;
EXEC insertarLote  @descripcion = 'Arroz',  @expiracion = @vence, @produccion = @produc, @categoria = 3

--prueba instertar pedido
EXEC insertarPedido @precio = 2000, @cantidad = 200, @porcentaje = 10, @proveedor =1, @codigoProductoInventario = 1

--prueba insertar producto
DECLARE @Contador INT
SET @Contador = 0

WHILE @Contador < 5
BEGIN
	EXEC insertarProducto @Descuento = 0, @lote = 11, @pedido = 35
	SET @Contador = @Contador +1
END


EXEC insertarProducto @Descuento = 10, @lote = 3, @pedido = 1
GO
EXEC insertarProducto @Descuento = 10, @lote = 3, @pedido = 1
GO

--prueba insertarCompra
DECLARE @fecha2 DATE = getdate();
EXEC insertarCompra   @fecha = @fecha2, @cliente = 4, @empleado = 6, @metodoPago = 3

--prueba insertarEnvio
EXEC insertarEnvio @compra = 1, @direccion = '100m sur del surper'

--prueba insertarCompraxProducto
EXEC insertraCompraxProducto @compra = 8, @producto = 66

