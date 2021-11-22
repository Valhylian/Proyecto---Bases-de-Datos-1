--CRUD ELIMINAR
--El borrado es logico (Atributo Estado)

--ELIMINAR SUCURSAL---------------------------
CREATE PROCEDURE eliminarSucursal
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where [Id_Sucursal] = @id) = 0  AND --no esta en niguna direccion
			(SELECT COUNT(*) FROM [dbo].[empleado] where [Id_Sucursal]  = @id) = 0  AND 
			(SELECT COUNT(*) FROM [dbo].[sucursalxProveedor] where [Id_Sucursal]  = @id) = 0   
			UPDATE [dbo].[sucursal] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--ELIMINAR EMPLEADO---------------------------
CREATE PROCEDURE eliminarEmpleado
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
	
			UPDATE [dbo].[empleado] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--ELIMINAR PUESTO---------------------------
CREATE PROCEDURE eliminarPuesto
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[empleado] where [Id_Puesto] = @id) = 0  
			UPDATE [dbo].[puesto] SET Estado = 0 WHERE Id = @id
		else
			set @error = 6 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--ELIMINAR PROVEEDOR---------------------------
CREATE PROCEDURE eliminarProveedor
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL 
		if (SELECT COUNT(*) FROM [dbo].[sucursalxProveedor] where [Id_Proveedor] = @id) = 0  AND
			(SELECT COUNT(*) FROM [dbo].[pedidoProveedor] where [Id_Proveedor] = @id) = 0
			UPDATE [dbo].[proveedor] SET Estado = 0 WHERE Id = @id
		else
			set @error = 6 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--ELIMINAR PRODUCTO---------------------------
CREATE PROCEDURE eliminarProducto
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL 
		if (SELECT COUNT(*) FROM [dbo].[compraxProducto] where Id_Producto = @id) = 0  
			UPDATE [dbo].[producto] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--ELIMINAR CATEGORIAPRODUCTO---------------------------
CREATE PROCEDURE eliminarCategoriaProducto
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL 
		if (SELECT COUNT(*) FROM [dbo].[inventarioProducto] where Id_Categoria = @id) = 0  
			UPDATE [dbo].[categoriaProducto] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--ELIMINAR METODO PAGO---------------------------
CREATE PROCEDURE eliminarMetodoPago
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[compra] where [Id_metodoPago] = @id) = 0 --no esta en niguna direccion
			UPDATE [dbo].[metodoPago] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO


--ELIMINAR CLIENTE---------------------------
CREATE PROCEDURE eliminarCliente
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[compra] where [Id_Cliente] = @id) = 0  
			UPDATE [dbo].[cliente] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO