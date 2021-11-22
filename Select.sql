
USE Supermercado
GO 

--CONSULTAR CATEGORIA PRODUCTO
CREATE PROCEDURE selectCategoria
@categoria INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [dbo].[categoriaProducto].Id, [dbo].[categoriaProducto].Nombre, [dbo].[categoriaProducto].[Impuesto]
			FROM [dbo].[categoriaProducto]
			WHERE [dbo].[categoriaProducto].Id = @categoria
END
GO

--CONSULTAR PROVEEDOR
CREATE PROCEDURE selectProveedor
@proveedor INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT [Id],[Nombre],[Telefono]
			FROM [dbo].[proveedor]
			WHERE Id = @proveedor
END
GO

--CONSULTAR CLIENTE
CREATE PROCEDURE selectCliente
@cliente INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT cliente.[Id], [Doc_Identificacion], cliente.[Nombre], [Apellido], 
			[Direccion].DireccionExacta AS Direccion, [dbo].[pais].Nombre AS Pais, 
			[dbo].[provincia].Nombre AS Provincia, [dbo].[canton].Nombre AS Canton
			FROM [dbo].[cliente]
			INNER JOIN [dbo].[direccion] ON cliente.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			INNER JOIN [dbo].[provincia] ON [dbo].[direccion].Id_provincia = [dbo].[provincia].Id
			INNER JOIN [dbo].[canton] ON [dbo].[direccion].Id_canton = [dbo].[canton].Id
			WHERE Cliente.Id = @cliente
END
GO

--CONSULTAR EMPLEADO
CREATE PROCEDURE selectEmpleado
@empleado INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT empleado.[Id], [Doc_Identificacion], empleado.[Nombre], empleado.[Apellido], 
			[Direccion].DireccionExacta AS Direccion, [dbo].[pais].Nombre AS Pais, 
			[dbo].[provincia].Nombre AS Provincia, [dbo].[canton].Nombre AS Canton,
			[dbo].[puesto].Nombre as Puesto, empleado.SalarioBase, [dbo].[sucursal].Nombre AS Sucursal
			FROM empleado
			INNER JOIN [dbo].[direccion] ON empleado.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			INNER JOIN [dbo].[provincia] ON [dbo].[direccion].Id_provincia = [dbo].[provincia].Id
			INNER JOIN [dbo].[canton] ON [dbo].[direccion].Id_canton = [dbo].[canton].Id
			INNER JOIN [dbo].[puesto] ON empleado.Id_Puesto = [dbo].[puesto].Id
			INNER JOIN [dbo].[sucursal] ON empleado.Id_Sucursal = [dbo].[sucursal].Id
			WHERE empleado.Id = @empleado
END
GO

--CONSULTAR SUCURSAL
CREATE PROCEDURE selectSucursal
@sucursal INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT sucursal.[Id], sucursal.[Nombre], 
			[Direccion].DireccionExacta AS Direccion, [dbo].[pais].Nombre AS Pais, 
			[dbo].[provincia].Nombre AS Provincia, [dbo].[canton].Nombre AS Canton
			FROM sucursal
			INNER JOIN [dbo].[direccion] ON sucursal.Direccion = [dbo].[direccion].Id
			INNER JOIN [dbo].[pais] ON [dbo].[direccion].Id_pais = [dbo].[pais].Id
			INNER JOIN [dbo].[provincia] ON [dbo].[direccion].Id_provincia = [dbo].[provincia].Id
			INNER JOIN [dbo].[canton] ON [dbo].[direccion].Id_canton = [dbo].[canton].Id

			WHERE sucursal.Id = @sucursal
END
GO


--CONSULTAR PRODUCTO
CREATE PROCEDURE selectProducto
@producto INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  producto.Id, producto.[Nombre], producto.PrecioVenta, producto.Descuento,  
			[dbo].[categoriaProducto].Nombre as Categoria, [dbo].[sucursal].Nombre AS sucursal, lote.FechaExpiracion, 
			lote.FechaProduccion, [dbo].[estadoProducto].Descripccion As Estado
			FROM [dbo].[producto]
			INNER JOIN [dbo].[inventarioProducto] ON producto.Id_Inventario = [dbo].[inventarioProducto].Id
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			INNER JOIN [dbo].[lote] ON producto.Id_Lote = [dbo].[lote].Id
			INNER JOIN [dbo].[estadoProducto] ON producto.Id_EstadoProducto = [dbo].[estadoProducto].Id
			WHERE producto.Id = @producto
END
GO

--CONSULTAR INVENTARIO
CREATE PROCEDURE selectInventario
@inventario INT
AS
BEGIN
	SET NOCOUNT ON; 

	SELECT  [inventarioProducto].Id, [inventarioProducto].[Nombre], [inventarioProducto].Cantidad, [inventarioProducto].CantMaxima,
			[inventarioProducto].CantMinima, [categoriaProducto].Nombre as Categoria
			FROM [inventarioProducto] 
			INNER JOIN [dbo].[categoriaProducto] ON  [inventarioProducto].Id_Categoria = [dbo].[categoriaProducto].Id
			INNER JOIN [dbo].[sucursal] ON  [inventarioProducto].Id_Sucursal = [dbo].[sucursal].Id
			WHERE [inventarioProducto].Id = @inventario		
END
GO


--------------------------------------------
--PRUEBAS-----------------------------------

--CONSULTAR CATEGORIA PRODUCTO
EXEC selectCategoria @categoria = 2
GO

--CONSULTAR PROVEEDOR
EXEC selectProveedor @proveedor =1
GO

--CONSULTAR CLIENTE
EXEC selectCliente @cliente = 1
GO

--CONSULTAR EMPLEADO
EXEC selectEmpleado @empleado = 1
GO

--CONSULTAR SUCURSAL
EXEC selectSucursal @sucursal = 1
GO

--CONSULTAR COMPRA
--QUERY CONSULTAS--


--CONSULTAR PRODUCTO
EXEC selectProducto @producto = 7
GO

--CONSULTAR INVENTARIO
EXEC selectInventario @inventario = 1
GO