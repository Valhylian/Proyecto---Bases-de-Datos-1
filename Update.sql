--UDPATES
USE Supermercado
GO

--TABLAS CATALOGO

--ACTUALIZAR PAIS
CREATE PROCEDURE actualizarPais 
@nombre VARCHAR(50),
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[pais] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[pais] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO

--ACTUALIZAR PUESTO
CREATE PROCEDURE actualizarPuesto
@nombre VARCHAR(50),
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[puesto] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[puesto] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
--ACTUALIZAR METODO PAGO
CREATE PROCEDURE actualizarMetodoPago
@nombre VARCHAR(50),
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[metodoPago] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[metodoPago] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO

--ACTUALIZAR PROVEEDOR
CREATE PROCEDURE actualizarProveedor
@nombre VARCHAR(50),
@id INT,
@telefono INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL AND @telefono IS NOT NULL)	
		--existe el pais
		if  (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[proveedor] SET [Nombre] = @nombre, [Telefono] = @telefono WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO

--ACTUALIZAR CATEGORIA
CREATE PROCEDURE actualizarCategoriaProducto
@nombre VARCHAR(50),
@impuesto INT,
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@nombre IS NOT NULL AND @id IS NOT NULL AND @impuesto IS NOT NULL)	
		--existe la categoria
		if  (SELECT COUNT(*) FROM [dbo].[categoriaProducto] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[categoriaProducto] SET [Nombre] = @nombre, [Impuesto] = @impuesto WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

EXEC actualizarPrecioProductos @in_categoria = @id
print @error;
RETURN @error
END
GO


-----------------------------------------------------------------------------------------------------
--REFRESCAR PRECIO DE PRODUCTOS POR CAMBIO EN CATEGORIA
CREATE PROCEDURE actualizarPrecioProductos
@in_categoria INT
AS
DECLARE 
	@productoCursor INT,
	@precioCompra MONEY,
	@porcentaje INT,
	@impuesto INT,
	@descuento INT,
	@precioNuevo MONEY
DECLARE productitos CURSOR FOR
	SELECT producto.Id, [inventarioProducto].PrecioCompra, 
			[inventarioProducto].Porcentaje, [categoriaProducto].Impuesto,
			producto.Descuento
	FROM [dbo].[producto]
	INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
	INNER JOIN [dbo].[categoriaProducto] ON [dbo].[inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
	WHERE [categoriaProducto].Id = [inventarioProducto].Id_Categoria AND (producto.Estado = 1 OR producto.Estado = 4)

	OPEN productitos --abre el cursor
	FETCH productitos into @productoCursor, @precioCompra, @porcentaje, @impuesto, @descuento
	WHILE @@FETCH_STATUS = 0 --mientras tenga datos el cursor va a agarrar uno por uno
	
	BEGIN 
			SET @precioNuevo = @precioCompra + (@precioCompra * ((@impuesto+0.0)/100.0))+(@precioCompra * ((@porcentaje+0.0)/100.0)) -(@precioCompra * ((@Descuento+0.0)/100.0)) 
			UPDATE [dbo].[producto] SET [PrecioVenta] = @precioNuevo

			FETCH productitos INTO @productoCursor, @precioCompra, @porcentaje, @impuesto, @descuento--trae el siguiente dato
	END

	CLOSE productitos --cerramos cursos
	DEALLOCATE productitos --limpiamos memoria
GO
-----------------------------------------------------------------------------------------------------
--ACTUALIZAR BONO
CREATE PROCEDURE actualizarBono
@id INT,
@Monto MONEY,
@id_empleado INT,
@Fecha DATE
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@id IS NOT NULL AND @Monto IS NOT NULL AND @id_empleado IS NOT NULL AND @Fecha IS NOT NULL)	
		--existe el bono
		if  (SELECT COUNT(*) FROM [dbo].[Bono] where Id = @id AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[empleado] where Id = @id_empleado AND Estado = 1) > 0
			UPDATE [dbo].[Bono] SET [Monto] = @Monto, [Fecha] = @Fecha, [Id_Empleado] = @id_empleado WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO


--ACTUALIZAR BONO
CREATE PROCEDURE actualizarCliente
@id INT,
@identificacion INT,
@nombre VARCHAR(50),
@apellido VARCHAR(50),
@Direccion INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@id IS NOT NULL AND @identificacion IS NOT NULL AND @nombre IS NOT NULL AND @apellido IS NOT NULL AND
		@Direccion IS NOT NULL)	
		--existen los registros implicados
		if  (SELECT COUNT(*) FROM [dbo].[cliente] where Id = @id AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[direccion] where Id = @Direccion AND Estado = 1) > 0
			UPDATE [dbo].[cliente] SET [Doc_Identificacion] = @identificacion, 
									   [Nombre] = @nombre, 
									   [Apellido] = @apellido,
									   [Direccion] = @Direccion
									   WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO

--ACTUALIZAR COMPRA
CREATE PROCEDURE actualizarCompra
@id INT,
@fecha DATE,
@id_metodoPago INT,
@id_cliente INT,
@id_empleado INT,
@id_estado INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0
	--valores no nulos
	if (@id IS NOT NULL AND @fecha IS NOT NULL AND @id_metodoPago IS NOT NULL AND
		@id_cliente IS NOT NULL AND @id_empleado IS NOT NULL AND @id_estado IS NOT NULL)	
		--existen los registros implicados
		if  (SELECT COUNT(*) FROM [dbo].[compra] where Id = @id AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[metodoPago] where Id = @id_metodoPago AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[cliente] where Id = @id_cliente AND Estado = 1) > 0 AND
			(SELECT COUNT(*) FROM [dbo].[empleado] where Id = @id_empleado AND Estado = 1) > 0 
			UPDATE [dbo].[compra] SET [Fecha]= @fecha, 
									  [Id_metodoPago] = @id_metodoPago,
									  [Id_Cliente] = @id_cliente,
								      [Id_Empleado] = @id_empleado,
									  [Id_estadoCompra] = @id_estado
								      WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO
--UPDATE compraxProducto
CREATE PROCEDURE actualizarCompraxProducto
@compra INT,
@producto INT,
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@monto MONEY,
	@inventario INT,
	@productoViejo INT,
	@precioViejo INT

	SET @error = 2 --valores nulos
	if (@compra IS NULL AND @producto IS NULL)--valores no nulos
		RETURN @error

	SET @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[compra] where Id = @compra AND Estado = 1) = 0 OR --existe compra
		(SELECT COUNT(*) FROM [dbo].[producto] where Id = @producto AND Estado = 1 AND ([Id_EstadoProducto] = 1 OR [Id_EstadoProducto] = 4)) = 0 OR --existe producto OR
		(SELECT COUNT(*) FROM [dbo].[compraxProducto] where Id = @id AND Estado = 1) = 0
		RETURN @error

	SET @error = 0 --todo bien

	--obtner productoViejo
	SELECT @productoViejo = [Id_Producto] FROM [dbo].[compraxProducto]
							WHERE Id = @id AND Estado = 1
	--actualizar estado del producto
	UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 1 WHERE [Id] = @productoViejo AND Estado = 1
	--obtener precio viejo
	SELECT @precioViejo = [PrecioVenta] FROM [dbo].[producto]
							WHERE Id = @productoViejo AND Estado = 1
	--obtener precioCompra
	SELECT @monto = [PrecioVenta] FROM [dbo].[producto]
						WHERE Id = @producto AND Estado = 1

	--actualizar montoCompra
	UPDATE [dbo].[compra] SET [Monto] = [Monto] - @precioViejo + @monto WHERE [Id] = @compra AND Estado = 1
	--actualizar estadoProducto
	UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 5 WHERE [Id] = @producto AND Estado = 1
	--UPDATE 
	UPDATE [dbo].[compraxProducto] SET [Subtotal] = @monto, 
									   [Id_compra] = @compra, 
									   [Id_Producto] = @producto
									   WHERE [Id] = @id AND Estado = 1

print @error;
RETURN @error
END
GO


--INSERTAR EMPLEADO
CREATE PROCEDURE actualizarEmpleado
@id INT,
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

	if (@nombre IS NOT NULL AND @apellido IS NOT NULL AND @id IS NOT NULL AND
		@direccion IS NOT NULL AND @salarioBase IS NOT NULL AND @puesto IS NOT NULL AND @sucursal IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[empleado] where Id = @id AND Estado = 1) > 0 --existe empleado
			if (SELECT COUNT(*) FROM [dbo].[puesto] where Id = @puesto AND Estado = 1)>0 
				AND (SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0  --existe sucursal y puesto como registro
				AND (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1) > 0 --existe direccion
					UPDATE [dbo].[empleado] SET [Doc_Identificacion] = @identificacion,
												[Nombre] = @nombre, 
												[Apellido] = @apellido,
												[Direccion] = @direccion,
												[SalarioBase] = @salarioBase,
												[Id_Puesto] = @puesto,
												[Id_Sucursal] = @sucursal
												WHERE [Id] = @id AND Estado = 1

			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@id is null or @nombre is null OR @apellido IS NULL OR @identificacion IS NULL OR @direccion is null OR @salarioBase IS NULL OR @puesto IS NULL OR @sucursal IS NULL )
		set @error = 2
print @error;
RETURN @error
END
GO

--UPDATE ENVIO
CREATE PROCEDURE actualizarEnvio
@id INT,
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
		AND (SELECT COUNT(*) FROM [dbo].[envio] where Id = @id AND Estado = 1) = 0
		RETURN @error

	SET @error = 0 --todo bien

	--obtener precioCompra
	SELECT @precioCompra = [Monto] FROM [dbo].[compra]
						WHERE Id = @compra AND Estado = 1

	--set precio del envio
	SET @precioEnvio = (@precioCompra+0.0)*0.1

	UPDATE [dbo].[envio] SET [Direccion] = @direccion,
							 [Id_Compra] = @compra, 
						     [Precio] = @precioEnvio
							WHERE [Id] = @id AND Estado = 1
print @error;
RETURN @error
END
GO

--actualizar INVENTARIO PRODUCTO
CREATE PROCEDURE actualizarInventarioProducto
@id INT,
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

	if (@id IS NOT NULL AND @nombre IS NOT NULL AND @proveedor IS NOT NULL AND @cantidad IS NOT NULL AND  @precioCompra IS NOT NULL
		AND @maximo IS NOT NULL AND @minimo IS NOT NULL AND @sucursal IS NOT NULL AND @categoria IS NOT NULL AND @porcentaje IS NULL ) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id = @id) > 0 --existe el inventario
			if (SELECT COUNT(*) FROM [dbo].[categoriaProducto] where Id = @categoria AND Estado = 1)>0  --existe categoria
				AND (SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0  --existe sucursal 
				
				UPDATE [dbo].[inventarioProducto] SET [Nombre] = @nombre,
												[Cantidad] = @cantidad, 
												[CantMaxima] = @maximo,
												[CantMinima] = @minimo,
												[Id_Sucursal] = @sucursal,
												[Id_Categoria] = @categoria,
												[Id_Proveedor] = @proveedor,
												[PrecioCompra] = @precioCompra,
												[Porcentaje] = @porcentaje
												WHERE [Id] = @id AND Estado = 1
					
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@id IS NULL OR @nombre is null OR @proveedor IS NULL OR @cantidad IS NULL OR @maximo is null OR 
		@minimo IS NULL OR @sucursal IS NULL OR @categoria IS NULL OR @porcentaje IS NULL OR @precioCompra IS NULL )
		set @error = 2
print @error;
RETURN @error
END
GO

--ACTUALIZAR LOTE
CREATE PROCEDURE actualizarLote
@id INT,
@descripcion VARCHAR(50),
@expiracion DATE,
@produccion DATE,
@categoria INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@id IS NOT NULL AND @descripcion IS NOT NULL AND @expiracion IS NOT NULL AND @produccion IS NOT NULL AND @categoria IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[categoriaProducto] where Id = @categoria AND Estado = 1) > 0 --existe categoria como registro
		UPDATE [dbo].[lote] SET   [FechaExpiracion] = @expiracion,
												[FechaProduccion] = @produccion, 
												[Id_categoria] = @categoria,
												[Descripccion]= @descripcion
												WHERE [Id] = @id AND Estado = 1
		else
			set @error = 3 --falta llave foranea


	if (@id IS NULL OR @descripcion is null OR @expiracion IS NULL OR @produccion IS NULL OR @categoria IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO

--ACTUALIZAR PEDIDO PROVEEDOR
CREATE PROCEDURE actualizarPedido
@idPedido INT,
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

	if (@idPedido IS NOT NULL AND @precio IS NOT NULL AND @cantidad IS NOT NULL AND @porcentaje IS NOT NULL AND 
		@proveedor IS NOT NULL AND @codigoProductoInventario IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0 --existe proveedor
			AND (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id = @codigoProductoInventario AND Estado = 1) > 0 --existe producto en inventario
			AND (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @idPedido AND Estado = 1) > 0 --existe pedido
			
			UPDATE [dbo].[pedidoProveedor] SET  Precio = @precio,
												Porcentaje = @porcentaje, 
												Cant = @cantidad,
												CodigoInventario= @codigoProductoInventario,
												Id_Proveedor = @proveedor
												WHERE [Id] = @idPedido AND Estado = 1

		if (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0 --existe proveedor
			AND (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id = @codigoProductoInventario AND Estado = 1) > 0 --existe producto en inventario
			AND (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @idPedido AND Estado = 1) > 0 --existe pedido

			EXEC actualizarProductosPedido @id = @idPedido

		else
			set @error = 3 --falta llave foranea

		
	if (@idPedido is null or @precio is null OR @cantidad IS NULL OR @porcentaje IS NULL OR @proveedor IS NULL OR @codigoProductoInventario IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO

--ACTUALIZAR TODOS LOS PRODUCTOS DE UN PEDIDO
CREATE PROCEDURE actualizarProductosPedido
@id INT

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
	if (@id IS NULL) --valores nulos
		RETURN @error
		
	set @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @id AND Estado = 1) = 0	
		RETURN @error

	SET @error = 0 --no hay error
	--obtener proveedor
	SELECT @proveedor = [Id_Proveedor] FROM [dbo].[pedidoProveedor]
						WHERE Id = @id AND Estado = 1
	--obtener precio compra
	SELECT @precioCompra = Precio FROM [dbo].[pedidoProveedor] 
						WHERE Id = @id AND Estado = 1
	--obtener porcentaje
	SELECT @porcentaje = Porcentaje FROM [dbo].[pedidoProveedor]
						WHERE Id = @id AND Estado = 1
	--obtener Id Inventario
	SELECT @inventarioProduc = CodigoInventario FROM [dbo].[pedidoProveedor]
						WHERE Id = @id AND Estado = 1
	--obtener Categoria
	SELECT @categoria = [Id_Categoria] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1
	--obtener Impuesto
	SELECT @impuesto = [Impuesto] FROM [dbo].[categoriaProducto]
						WHERE Id = @categoria AND Estado = 1
	--obtener nombre
	SELECT @nombre = [Nombre] FROM [dbo].[inventarioProducto]
						WHERE Id = @inventarioProduc AND Estado = 1

	--calcular precio Venta
	SET @precioVenta = @precioCompra + (@precioCompra * ((@impuesto+0.0)/100.0))+(@precioCompra * ((@porcentaje+0.0)/100.0)) 

	UPDATE [dbo].[producto] SET Nombre = @nombre,
								PrecioVenta = @precioVenta - (@precioCompra * (([Descuento]+0.0)/100.0))
								WHERE [Id_Pedido] = @id AND Estado = 1 AND [Id_EstadoProducto] != 5 AND [Id_EstadoProducto] !=2

print @error;
RETURN @error
END
GO

--ACTUALIZAR PRODUCTO
--no se actualizan ni los vendidos ni los que estan en espera (compra)s
CREATE PROCEDURE actualizarProducto
@Id INT,
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
	if ( @Descuento IS NULL OR @id IS NULL OR
		@lote IS NULL OR @pedido IS NULL) --valores nulos
		RETURN @error
		
	set @error = 3 --falta llave foranea
	if (SELECT COUNT(*) FROM [dbo].[lote] where Id = @lote AND Estado = 1) = 0						
		OR (SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where Id = @pedido AND Estado = 1) = 0	
		OR (SELECT COUNT(*) FROM [dbo].[producto] where Id = @pedido AND [Id_EstadoProducto] != 5  AND [Id_EstadoProducto] != 2  AND Estado = 1) = 0	
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

	--calcular precio Venta
	SET @precioVenta = @precioCompra + (@precioCompra * ((@impuesto+0.0)/100.0))+(@precioCompra * ((@porcentaje+0.0)/100.0)) -(@precioCompra * ((@Descuento+0.0)/100.0)) 

	UPDATE [dbo].[producto] SET Nombre = @nombre,
								PrecioVenta = @precioVenta, 
								Descuento = @Descuento,
								Id_Inventario= @inventarioProduc,
								Id_Lote = @lote,
								Id_Pedido = @pedido
								WHERE [Id] = @id AND Estado = 1

print @error;
RETURN @error
END
GO


--actualizarSucursal
CREATE PROCEDURE actualizarSucursal
@id INT,
@nombre VARCHAR(50),
@direccion INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@id IS NOT NULL AND @nombre IS NOT NULL AND @direccion IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[sucursal] where ID = @id) > 0 --existe sucursal
			if (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @direccion AND Estado = 1) > 0		  --existe el pais como registro
				UPDATE [dbo].[sucursal] SET Nombre = @nombre,
								Direccion = @direccion
								WHERE [Id] = @id AND Estado = 1
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@id is null or @nombre is null OR @direccion IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO

--ACTUALIZAR SUCURSALXPROVEEDOR
CREATE PROCEDURE actualizarSucursalxProveedor
@id INT,
@sucursal INT,
@proveedor INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@id is not null and @sucursal IS NOT NULL AND @proveedor IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[sucursalxProveedor] where Id = @id AND Estado = 1) > 0 --existe
			if ((SELECT COUNT(*) FROM [dbo].[sucursal] where Id = @sucursal AND Estado = 1) > 0 --existe la sucursal como registro
				AND (SELECT COUNT(*) FROM [dbo].[proveedor] where Id = @proveedor AND Estado = 1) > 0) --existe el proveedor
					UPDATE [dbo].[sucursalxProveedor] SET [Id_Sucursal] = @sucursal,
														[Id_Proveedor] = @proveedor
														WHERE [Id] = @id AND Estado = 1
			else
				set @error = 3 --falta llave foranea
		else
			set @error = 1 --valor repetido


	if (@id is null or @sucursal is null OR @proveedor IS NULL)
		set @error = 2
print @error;
RETURN @error
END
GO
--prueba actualizarPais
EXEC actualizarPais @nombre = Guatemala, @id = 1
GO

--prueba actualizarPuesto
EXEC actualizarPuesto @nombre = 'Facturador', @id = 2
GO

--prueba actualizarMetodoPago
EXEC actualizarMetodoPago @nombre = 'Efectivo', @id = 1
GO

--prueba actualizarProveedor
EXEC actualizarProveedor @nombre = 'Cruz',@id = 2,@telefono = 83698238
GO

--prueba actualizar CategoriaProducto
EXEC actualizarCategoriaProducto @nombre = 'ABARROTES', @impuesto =10, @id=3
GO

--prueba actualizarBono
DECLARE @fechita DATE = getDate()
EXEC actualizarBono  @id = 1, @Monto = 356000, @id_empleado = 2, @Fecha = @fechita
GO

--prueba actualizarCliente
EXEC actualizarCliente @id = 1, @identificacion = 123456789, @nombre = 'Shirley', @apellido = 'Prado',@pais = 1, @direccion = 'San Pablo'
GO

--prueba actualizarCompra
DECLARE @fechita DATE = getDate()
EXEC actualizarCompra  @id = 1, @fecha = @fechita, @id_metodoPago = 1, @id_cliente =1, @id_empleado = 2
GO

--prueba actualizarCompraXProducto
EXEC actualizarCompraxProducto @id = 1, @compra = 1, @producto = 7
GO

--prueba actualizarEmpleado
EXEC actualizarEmpleado  @id = 1, @nombre = 'Sofia', @apellido = 'Cordero', @identificacion = '178945623', @direccion = '100 mets del super', @salarioBase = 800000, @puesto = 5, @sucursal = 1
GO

--prueba actualizarInventarioProducto
EXEC actualizarInventarioProducto  @id = 1, @nombre = 'arrox', @codigo = 123456, @cantidad = 0, @maximo = 200, @minimo = 10, @sucursal =1, @categoria =1
GO

--prueba actualizarLote
DECLARE @fechita DATE = getDate()
DECLARE @fechita2 DATE = getDate()+365
EXEC actualizarLote   @id = 1, @descripcion = 'Arrocito', @expiracion = @fechita2, @produccion = @fechita, @categoria =1
GO

--prueba actualizarPedido
EXEC actualizarPedido @idPedido = 1, @precio = 1000, @cantidad = 20, @porcentaje = 20, @proveedor = 1, @codigoProductoInventario = 1
GO

--prueba actualizarCategoria
EXEC actualizarCategoriaProducto @nombre = prueba, @impuesto = 10, @id = 1
GO