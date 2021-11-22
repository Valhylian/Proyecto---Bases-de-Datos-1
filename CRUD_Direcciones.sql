---CRUD DIRECCIONES
USE Supermercado
GO

--INSERTAR PAIS---------------------
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

--INSERTAR PROVINCIA---------------------------
CREATE PROCEDURE insertarProvincia
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[provincia] where Nombre = @nombre) = 0 --no se repite la provincia
			INSERT INTO [dbo].[provincia] (Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR PROVINCIA---------------------------
CREATE PROCEDURE insertarCanton
@nombre VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @nombre IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[canton] where Nombre = @nombre) = 0 --no se repite el canton
			INSERT INTO [dbo].[canton] (Nombre)
				   VALUES (@nombre)
		else
			set @error = 1

	if @nombre is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR DIRECCION
CREATE PROCEDURE insertarDireccion
@provincia INT,
@pais INT,
@canton INT,
@direccionExacta VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@provincia IS NOT NULL AND @pais IS NOT NULL AND @canton IS NOT NULL AND @direccionExacta IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[pais] where Id = @pais AND Estado = 1) > 0  AND	  --existe el pais 
		   (SELECT COUNT(*) FROM [dbo].[provincia] where Id = @provincia AND Estado = 1) > 0  AND	 --existe la provincia 
		   (SELECT COUNT(*) FROM [dbo].[canton] where Id = @canton AND Estado = 1) > 0		 --existe el canton

			INSERT INTO [dbo].[direccion] (Id_pais, Id_provincia, Id_canton, DireccionExacta)
				   VALUES (@pais, @provincia,@canton, @direccionExacta)
		else
			set @error = 3 --falta llave foranea
	else
		set @error = 1 --valor repetido


	if (@pais is null OR @provincia IS NULL OR @canton IS NULL or @direccionExacta is null)
		set @error = 2
print @error;
RETURN @error
END
GO

--INSERTAR DIRECCION COMPLETA
CREATE PROCEDURE insertarDireccionCompleta
@provincia VARCHAR(50),
@pais VARCHAR(50),
@canton VARCHAR(50),
@direccionExacta VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@id_pais INT,
	@id_provincia INT,
	@id_canton INT

	SET @error = 2
	if (@provincia IS NULL OR @pais IS NULL OR @canton IS NULL OR @direccionExacta IS NULL) --valores nulos
		RETURN @error

	--obtener id_pais
	EXEC insertarPais @nombre = @pais
	SELECT @id_pais = [Id] FROM [dbo].[pais]
						WHERE [Nombre] = @pais AND Estado = 1

	--obtener id_provincia
	EXEC insertarProvincia @nombre = @provincia
	SELECT @id_provincia = [Id] FROM [dbo].[provincia]
							WHERE [Nombre] = @provincia AND Estado = 1
	--obtener id_canton
	EXEC insertarCanton @nombre = @canton
	SELECT @id_canton = [Id] FROM [dbo].[canton]
							WHERE [Nombre] = @canton AND Estado = 1

	INSERT INTO [dbo].[direccion] (Id_pais, Id_provincia, Id_canton, DireccionExacta)
						   VALUES (@id_pais, @id_provincia, @id_canton, @direccionExacta)

SET @error = 0
print @error;
RETURN @error
END
GO


--ACTUALIZAR DIRECCIONCOMPLETA
CREATE PROCEDURE actualizarDireccionCompleta
@id INT,
@provincia VARCHAR(50),
@pais VARCHAR(50),
@canton VARCHAR(50),
@direccionExacta VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT,
	@id_pais INT,
	@id_provincia INT,
	@id_canton INT

	SET @error = 2
	if (@provincia IS NULL OR @pais IS NULL OR @canton IS NULL OR @direccionExacta IS NULL) --valores nulos
		RETURN @error

	SET @error = 3
	if (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @id AND Estado = 1) = 0 --no existe esa direccion
		RETURN @error

	--obtener id_pais
	EXEC insertarPais @nombre = @pais
	SELECT @id_pais = [Id] FROM [dbo].[pais]
						WHERE [Nombre] = @pais AND Estado = 1

	--obtener id_provincia
	EXEC insertarProvincia @nombre = @provincia
	SELECT @id_provincia = [Id] FROM [dbo].[provincia]
							WHERE [Nombre] = @provincia AND Estado = 1
	--obtener id_canton
	EXEC insertarCanton @nombre = @canton
	SELECT @id_canton = [Id] FROM [dbo].[canton]
							WHERE [Nombre] = @canton AND Estado = 1

	UPDATE [dbo].[direccion] SET Id_pais = @id_pais,
								Id_provincia = @id_provincia, 
								Id_canton = @id_canton,
								DireccionExacta= @direccionExacta
								WHERE [Id] = @id AND Estado = 1
SET @error = 0
print @error;
RETURN @error
END
GO

--ACTUALIZAR DIRECCION
CREATE PROCEDURE actualizarDireccion
@id INT,
@provincia INT,
@pais INT,
@canton INT,
@direccionExacta VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if (@id is not null and @provincia IS NOT NULL AND @pais IS NOT NULL AND @canton IS NOT NULL AND @direccionExacta IS NOT NULL) --valores no nulos
		if (SELECT COUNT(*) FROM [dbo].[pais] where Id = @pais AND Estado = 1) > 0  AND	  --existe el pais 
		   (SELECT COUNT(*) FROM [dbo].[provincia] where Id = @provincia AND Estado = 1) > 0  AND	 --existe la provincia 
		   (SELECT COUNT(*) FROM [dbo].[canton] where Id = @canton AND Estado = 1) > 0	AND        --existe el canton
		   (SELECT COUNT(*) FROM [dbo].[direccion] where Id = @id AND Estado = 1) > 0	        --existe la direccion

				UPDATE [dbo].[direccion] SET Id_pais = @pais,
											Id_provincia = @provincia, 
											Id_canton = @canton,
											DireccionExacta= @direccionExacta
											WHERE [Id] = @id AND Estado = 1
		else
			set @error = 3 --falta llave foranea
	else
		set @error = 1 --valor repetido


	if (@pais is null OR @provincia IS NULL OR @canton IS NULL or @direccionExacta is null)
		set @error = 2
print @error;
RETURN @error
END
GO

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

--ACTUALIZAR Provincia
CREATE PROCEDURE actualizarProvincia
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
		if  (SELECT COUNT(*) FROM [dbo].[provincia] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[provincia] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO

--ACTUALIZAR Provincia
CREATE PROCEDURE actualizarCanton
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
		if  (SELECT COUNT(*) FROM [dbo].[canton] where Id = @id AND Estado = 1) > 0
			UPDATE [dbo].[canton] SET [Nombre] = @nombre WHERE [Id] = @id AND Estado = 1
		else
			SET @error = 1
	else 
		SET @error = 2

print @error;
RETURN @error
END
GO


--ELIMINAR PROVINCIA---------------------------
CREATE PROCEDURE eliminarProvincia
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[direccion] where [Id_provincia] = @id) = 0 --no esta en niguna direccion
			UPDATE [dbo].[provincia] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO


--ELIMINAR PAIS---------------------------
CREATE PROCEDURE eliminarPais
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[direccion] where [Id_pais] = @id) = 0 --no esta en niguna direccion
			UPDATE [dbo].[pais] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO


--ELIMINAR Canton---------------------------
CREATE PROCEDURE eliminarCanton
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		if (SELECT COUNT(*) FROM [dbo].[direccion] where [Id_canton]  = @id) = 0 --no esta en niguna direccion
			UPDATE [dbo].[canton] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO

--ELIMINAR DIRECCION---------------------------
CREATE PROCEDURE eliminarDireccion
@id INT
AS
BEGIN
	SET NOCOUNT ON; 
DECLARE	
	@error INT
	SET @error = 0

	if @id IS NOT NULL
		--no esta en nigun registro
		if (SELECT COUNT(*) FROM [dbo].[cliente] where [Direccion] = @id) = 0 AND
			(SELECT COUNT(*) FROM [dbo].[empleado] where [Direccion] = @id) = 0 AND
			(SELECT COUNT(*) FROM [dbo].[sucursal] where [Direccion] = @id) = 0 
			UPDATE [dbo].[direccion] SET Estado = 0 WHERE Id = @id
		else
			set @error = 5 --no se puede eliminar

	if @id is null 
		set @error = 2
print @error;
RETURN @error
END
GO


EXEC eliminarProvincia @id = 1