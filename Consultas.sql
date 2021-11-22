--CONSULTAS
USE Supermercado
GO


--CONSULTA DE PRODUCTOS EXPIRAN
CREATE PROCEDURE consultaProductosExpiran 
AS
BEGIN
	SET NOCOUNT ON; 

	UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 3
							FROM [dbo].[producto]
							INNER JOIN [dbo].[lote] ON producto.Id_Lote = lote.Id
							WHERE DATEDIFF (DAY, GETDATE () , lote.FechaExpiracion  )  <= 8
							

	SELECT producto.Id,producto.[Nombre], proveedor.Nombre as Proveedor, sucursal.Nombre as Sucursal, 
			lote.FechaExpiracion,lote.FechaProduccion, lote.FechaProduccion,
			[dbo].[estadoProducto].Descripccion as Estado, [dbo].[categoriaProducto].Nombre as categoria
			FROM [dbo].[producto]
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = lote.Id
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[proveedor] ON [dbo].[inventarioProducto].[Id_Proveedor] = [dbo].[proveedor].Id
			INNER JOIN [dbo].[sucursal] ON [dbo].[inventarioProducto].[Id_Sucursal] = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoProducto] ON [dbo].[producto].Id_EstadoProducto = [dbo].[estadoProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON [dbo].[inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			WHERE DATEDIFF (DAY, GETDATE () , lote.FechaExpiracion  )  <= 8
END
GO
--APLICAR DESCUENTO A PRODUCTOS VENCIDOS
CREATE PROCEDURE aplicarDescuento 
@descuento INT
AS
BEGIN
	SET NOCOUNT ON; 

	UPDATE [dbo].[producto] SET [Descuento] = @descuento, [PrecioVenta] = [PrecioVenta] - (PrecioVenta+0.0)*((@descuento+0.0)/100)
							FROM [dbo].[producto]
							INNER JOIN [dbo].[lote] ON producto.Id_Lote = lote.Id
							WHERE Id_EstadoProducto = 3
							
END
GO

--REALIZAR PEDIDO DE LOS PRODUCTOS QUE HAN LLEGADO AL LIMITE
CREATE PROCEDURE realizarPedidos
AS
DECLARE 
	@idProductoInventario INT,
	@precio_compra INT,
	@proveedor_var INT,
	@cantMax INT,
	@cantidadActual INT,
	@porcentaje INT
DECLARE productos2 CURSOR FOR
	SELECT Id, PrecioCompra, Id_Proveedor, CantMaxima, Cantidad, Porcentaje
	FROM [dbo].[inventarioProducto]
	WHERE [inventarioProducto].[Cantidad] <= [inventarioProducto].[CantMinima]

	--obtener proveedor
	OPEN productos2 --abre el cursor
	FETCH productos2 into @idProductoInventario, @precio_compra, @proveedor_var, @cantMax, @cantidadActual, @porcentaje
	WHILE @@FETCH_STATUS = 0 --mientras tenga datos el cursor va a agarrar uno por uno
	
	BEGIN 
			INSERT INTO [dbo].[pedidoProveedor] (Precio, Cant, Porcentaje, Id_Proveedor, CodigoInventario)
						VALUES (@precio_compra,@cantMax - @cantidadActual, @porcentaje, @proveedor_var, @idProductoInventario)
			FETCH productos2 INTO @idProductoInventario, @precio_compra, @proveedor_var, @cantMax, @cantidadActual, @porcentaje --trae el siguiente dato
	END

	CLOSE productos2 --cerramos cursos
	DEALLOCATE productos2 --limpiamos memoria
GO

EXEC realizarPedidos
GO

--CONSULTAS DE PRODUCTOS Y PRECIO X PROVEEDOR
CREATE PROCEDURE consultaProductosxProveedor 
@proveedorID INT 
AS
BEGIN
	SET NOCOUNT ON; 
							
	SELECT Proveedor.Nombre as Proveedor, sucursal.Nombre as Sucursal, 
			[dbo].[inventarioProducto].Nombre,[Cantidad],[CantMaxima], [CantMinima],
			[dbo].[inventarioProducto].[PrecioCompra],
			[dbo].[inventarioProducto].[PrecioCompra] + ([dbo].[inventarioProducto].[PrecioCompra]*[dbo].[inventarioProducto].[Porcentaje]) as PrecioVenta,
			[dbo].[categoriaProducto].Nombre as categoria FROM [dbo].[inventarioProducto]
			INNER JOIN [dbo].[proveedor] ON [dbo].[inventarioProducto].Id_Proveedor = [dbo].[proveedor].Id
			INNER JOIN [dbo].[sucursal] ON [dbo].[inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[categoriaProducto] ON [dbo].[inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			WHERE [inventarioProducto].[Id_Proveedor] = @proveedorID
END
GO


--PAGOS DE BONOS
CREATE PROCEDURE consultarBonosPendientes
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, 
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal, [dbo].[estadoBono].[Descripcion] as EstadoBono
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = empleado.Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			WHERE Bono.Condicion = 1
							
END
GO

--BONOS PAGADOS
CREATE PROCEDURE consultarBonosPagados
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, 
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal, [dbo].[estadoBono].[Descripcion] as EstadoBono
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = empleado.Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			WHERE Bono.Condicion = 2
							
END
GO

--PAGAR BONOS
CREATE PROCEDURE pagarBonosPendientes
AS
BEGIN
	SET NOCOUNT ON; 

	UPDATE [dbo].[Bono] SET Condicion = 2
			WHERE Condicion = 1
END
GO

--CONSULTAR EMPLEADOS CON BONO PENDIENTE
CREATE PROCEDURE consultarEmpleadosXbono
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT empleado.Id, sum(Bono.Monto) as total, MAX(empleado.Nombre) as Nombre, MAX(empleado.Apellido) as Apellido,
			MAX ( empleado.Doc_Identificacion) as Identificacion, MAX (puesto.Nombre) as Puesto,
			MAX(sucursal.Nombre) as Sucursal, MAX(empleado.SalarioBase) as SalarioBase,
			SUM(Bono.Monto) as SumaEnBonos, (MAX(empleado.SalarioBase) + SUM(Bono.Monto)) as SalarioTotal
	FROM [dbo].[empleado]
	INNER JOIN [dbo].[Bono] ON Bono.Id_Empleado = empleado.Id
	INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
	INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
	WHERE ((SELECT COUNT(*) FROM [dbo].[Bono] where Bono.Id_Empleado = empleado.Id AND Bono.Condicion = 1) > 0)
	GROUP BY empleado.Id
							
END
GO


--CONSULTAR BONOS X EMPLEADO (ID)
CREATE PROCEDURE consultarBonosxEmpleado
@idEmpleado INT
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, [dbo].[estadoBono].[Descripcion] as EstadoBono
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			WHERE Bono.Id_Empleado = @idEmpleado			
END
GO

--CONSULTAR BONOS X FECHA
CREATE PROCEDURE consultarBonosxFecha
@in_fecha DATE
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, [dbo].[estadoBono].[Descripcion] as EstadoBono,
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE Bono.Fecha = @in_fecha			
END
GO

--CONSULTAR BONOS X SUCURSAL
CREATE PROCEDURE consultarBonosxSucursal
@in_sucursal INT
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, [dbo].[estadoBono].[Descripcion] as EstadoBono,
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE empleado.Id_Sucursal = @in_sucursal		
END
GO

--CONSULTAR BONOS X PAIS
CREATE PROCEDURE consultarBonosxPais
@in_pais INT
AS
BEGIN
	SET NOCOUNT ON; 
	SELECT Bono.[Id] as IdBono, Bono.Monto, Bono.Fecha, Bono.Condicion, [dbo].[estadoBono].[Descripcion] as EstadoBono,
			Empleado.Id as IdEmpleado, empleado.Nombre as empleado, Apellido, Doc_Identificacion, SalarioBase, 
			puesto.Nombre as puesto, sucursal.Nombre as sucursal, pais.Nombre as Pais
			FROM [dbo].[Bono]
			INNER JOIN [dbo].[estadoBono] ON Bono.Condicion = [dbo].[estadoBono].Id
			INNER JOIN [dbo].[empleado] ON Bono.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[direccion] ON empleado.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON direccion.Id_pais = [dbo].[pais].Id
			WHERE direccion.Id_pais = @in_pais	
END
GO

--CONSULTAR PRODUCTOS X SUCURSAL
CREATE PROCEDURE consultarProductosxSucursal
@in_sucursal INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, lote.FechaProduccion
			FROM [dbo].[producto]
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			WHERE [inventarioProducto].Id_Sucursal = @in_sucursal		
END
GO

--CONSULTAR INVENTARIO X SUCURSAL
CREATE PROCEDURE consultarInventarioxSucursal
@in_sucursal INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  [inventarioProducto].Id, [inventarioProducto].[Nombre], [inventarioProducto].Cantidad, [inventarioProducto].CantMaxima,
			[inventarioProducto].CantMinima, [categoriaProducto].Nombre as Categoria
			FROM [inventarioProducto] 
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			WHERE [inventarioProducto].Id_Sucursal = @in_sucursal		
END
GO

--CONSULTAR PRODUCTOS X INVENTARIO
CREATE PROCEDURE consultarProductosxInventario
@in_inv INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, lote.FechaProduccion,
			[dbo].[estadoProducto].Descripccion as estado
			FROM [dbo].[producto]
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoProducto] ON  producto.Id_EstadoProducto = [dbo].[estadoProducto].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			WHERE producto.Id_Inventario = @in_inv		
END
GO


--CONSULTAR PRODUCTOS X INVENTARIO
CREATE PROCEDURE consultarProductosxCategoria
@in_categoria INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, lote.FechaProduccion,
			[dbo].[estadoProducto].Descripccion as estado
			FROM [dbo].[producto]
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoProducto] ON  producto.Id_EstadoProducto = [dbo].[estadoProducto].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			WHERE [dbo].[inventarioProducto].Id_Categoria = @in_categoria		
END
GO

--INVENTARIO X CATEGORIA
CREATE PROCEDURE consultarInventarioxCategoria
@in_categoria INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  [inventarioProducto].Id, [inventarioProducto].[Nombre], [inventarioProducto].Cantidad, [inventarioProducto].CantMaxima,
			[inventarioProducto].CantMinima, [categoriaProducto].Nombre as Categoria
			FROM [inventarioProducto] 
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			WHERE [inventarioProducto].Id_Categoria = @in_categoria		
END
GO

--FACTURACION (PAGAR COMPRA)
--Actualiza el estado de la compra y de los productos vendidos
CREATE PROCEDURE facturacion
@idCompra INT
AS
BEGIN
	SET NOCOUNT ON; 

	UPDATE [dbo].[compra] SET [Id_estadoCompra] = 2
							WHERE [Id] = @idCompra
							

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			WHERE compra.Id = @idCompra
		

	--poner los productos vendidos
	EXEC venderProductos @id_compra = @idCompra
END
GO


--VENDER PRODUCTOS (ACTUALIZA EL ESTADO A VENDIDOS)
CREATE PROCEDURE venderProductos
@id_compra INT
AS
DECLARE 
	@idCompraxProducto INT,
	@idProducto INT,
	@inventario INT
DECLARE ventas CURSOR FOR
	SELECT [dbo].[compraxProducto].Id, [dbo].[compraxProducto].Id_Producto
	FROM [dbo].[compraxProducto]
	WHERE [dbo].[compraxProducto].Id_compra = @id_compra

	OPEN ventas --abre el cursor
	FETCH ventas into @idCompraxProducto, @idProducto
	WHILE @@FETCH_STATUS = 0 --mientras tenga datos el cursor va a agarrar uno por uno
	
	BEGIN 
			SELECT @inventario = [Id_Inventario] FROM [dbo].[producto]
									WHERE [dbo].[producto].Id = @idProducto
			UPDATE [dbo].[producto] SET [Id_EstadoProducto] = 2
								      WHERE [Id] = @idProducto 
			UPDATE [dbo].[inventarioProducto] SET Cantidad = Cantidad-1
									WHERE [dbo].[inventarioProducto].Id = @inventario

			FETCH ventas INTO @idCompraxProducto, @idProducto  --trae el siguiente dato
	END

	CLOSE ventas --cerramos cursos
	DEALLOCATE ventas --limpiamos memoria
GO


--PRODUCTOS X COMPRA
CREATE PROCEDURE productosXcompra
@id_compra INT
AS
		SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, lote.FechaProduccion,
			[dbo].[estadoProducto].Descripccion as estado
			FROM [dbo].[producto]
			INNER JOIN [dbo].[compra] ON [dbo].[compra].[Id] = @id_compra
			INNER JOIN [dbo].[compraxProducto] ON [dbo].[compraxProducto].Id_compra = @id_compra
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[estadoProducto] ON  producto.Id_EstadoProducto = [dbo].[estadoProducto].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			WHERE [dbo].[compraxProducto].Id_compra = @id_compra AND [dbo].[compraxProducto].Id_Producto = producto.Id

GO


--DETALLES DE COMPRA 
CREATE PROCEDURE detallesCompra
@idCompra INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado, [dbo].[envio].Precio AS PrecioEnvio,
			([dbo].[compra].Monto + [dbo].[envio].Precio) AS Total
			FROM [dbo].[envio]
			INNER JOIN [dbo].[compra] ON compra.Id = [dbo].[envio].Id_Compra
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			WHERE compra.Id = @idCompra
		
END
GO


--DETALLES DE COMPRA SIN ENVIO
CREATE PROCEDURE detallesCompraSinENvio
@idCompra INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			WHERE compra.Id = @idCompra
		
END
GO

--COMPRA X FECHA
CREATE PROCEDURE compraXFecha
@fecha DATE 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			WHERE compra.Fecha = @fecha
		
END
GO

--COMPRA X SUCURSAL
CREATE PROCEDURE compraXSucursal
@sucursal INt 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado, [dbo].[sucursal].Nombre AS Sucursal
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE empleado.Id_Sucursal = @sucursal
		
END
GO

--COMPRA X PAIS
CREATE PROCEDURE compraXPais
@pais INt 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[compra].Id, [dbo].[compra].Fecha, [dbo].[cliente].Id as IdCliente, [dbo].[cliente].Nombre AS nombreCliente, 
			[dbo].[metodoPago].Nombre AS MetodoPago, [dbo].[empleado].Id AS IdEmpleado, [dbo].[empleado].Nombre AS nombreEmpleado,
			[dbo].[compra].Monto, [dbo].[estadoCompra].Descripcion AS Estado, [dbo].[sucursal].Nombre AS Sucursal, 
			[dbo].[pais].Nombre AS Pais
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[direccion] ON empleado.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			WHERE [dbo].[direccion].Id_pais = @pais
		
END
GO

--GANCIAS X FECHA
CREATE PROCEDURE gananciasXFecha
@fecha DATE 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT SUM([dbo].[compra].Monto) AS SUMA, (COUNT(*)) AS comprasCompletadas
			FROM [dbo].[compra]
			WHERE compra.Fecha = @fecha AND compra.[Id_estadoCompra] = 2
		
END
GO

--GANCIAS X PAIS
CREATE PROCEDURE gananciasXPais
@pais INt 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT SUM([dbo].[compra].Monto) AS SUMA, (COUNT(*)) AS comprasCompletadas
			FROM [dbo].[compra]
			INNER JOIN [dbo].[cliente] ON compra.Id_Cliente = [dbo].[cliente].Id
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[metodoPago] ON compra.Id_metodoPago = [dbo].[metodoPago].Id
			INNER JOIN [dbo].[estadoCompra] ON compra.Id_estadoCompra = [dbo].[estadoCompra].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[direccion] ON empleado.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			WHERE [dbo].[direccion].Id_pais = @pais AND compra.[Id_estadoCompra] = 2
		
END
GO

--GANANCIA X SUCURSAL
CREATE PROCEDURE gananciasXSucursal
@sucursal INt 
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT SUM([dbo].[compra].Monto) AS SUMA, (COUNT(*)) AS comprasCompletadas
			FROM [dbo].[compra]
			INNER JOIN [dbo].[empleado] ON compra.Id_Empleado = [dbo].[empleado].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE empleado.Id_Sucursal = @sucursal AND compra.[Id_estadoCompra] = 2
		
END
GO

--REALIZAR PEDIDOS
EXEC realizarPedidos
GO

--BONOS PENDIENTES
EXEC consultarBonosPendientes
GO 

--BONOS PAGADOS
EXEC consultarBonosPagados
GO

--PAGAR BONOS
EXEC pagarBonosPendientes
GO

--LISTA EMPLEADOS PARA PAGAR BONOS
EXEC consultarEmpleadosXbono
GO

--PRODUCTOS QUE EXPIRAN
EXEC consultaProductosExpiran
GO

--CONSULTA PRODUCTOSXPROVEEDOR
EXEC consultaProductosxProveedor @proveedorID = 1
GO

--BONOS x EMPLEADO (ID)
EXEC consultarBonosxEmpleado @idEmpleado = 2
GO

--BONOS x SUCURSAL (ID)
EXEC consultarBonosxSucursal @in_sucursal = 1
GO

--BONOS X FECHA
DECLARE @fechita DATE= getDate()
EXEC consultarBonosxFecha @in_fecha = @fechita
GO

--BONOS X PAIS
EXEC consultarBonosxPais @in_pais = 1
GO

--PRODUCTOS X SUCURSAL
EXEC consultarProductosxSucursal @in_sucursal = 1
GO

--INVENTARIO X SUCURSAL
EXEC consultarInventarioxSucursal @in_sucursal = 1
GO

--PRODUCTO X INVENTARIO
EXEC consultarProductosxInventario @in_inv = 1
GO

--PRODUCTO X CATEGORIA
EXEC consultarProductosxCategoria @in_categoria = 1
GO

--INVENTARIO X CATEGORIA
EXEC consultarInventarioxCategoria @in_categoria = 1
GO

--FACTURACION
EXEC facturacion @idCompra = 8
GO

--DETALLES COMPRA CON ENVIO
EXEC detallesCompra @idCompra = 8
GO

--DETALLES COMPRA SIN ENVIO
EXEC detallesCompraSinENvio @idCompra = 8
GO

--PRODUCTOS POR COMPRA
EXEC productosXcompra @id_compra = 8
GO

--COMPRAS X FECHA
DECLARE @fechita DATE = getDate()
EXEC compraXFecha @fecha = @fechita
GO

--COMPRAS X SUCURSAL
EXEC compraXSucursal @sucursal = 2
GO

--COMPRAS X PAIS
EXEC compraXPais @pais = 2
GO

--GANACIAS POR FECHA
DECLARE @fechita DATE = getDate()
EXEC gananciasXFecha @fecha = @fechita
GO

--GANACIAS POR PAIS
EXEC gananciasXPais @pais = 1
GO

--GANANCIAS X SUCURSAL
EXEC gananciasXSucursal @sucursal = 2
GO

--APLICAR DESCUENTO
EXEC aplicarDescuento @descuento = 10
GO