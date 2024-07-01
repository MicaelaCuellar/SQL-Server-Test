--Procedimientos:

--Agregar Nuevo libro

CREATE PROCEDURE AgregarLibro 
	@Titulo NVARCHAR (100),
	@Autor NVARCHAR (100),
	@Editorial NVARCHAR (100),
	@Genero NVARCHAR (50)
AS
BEGIN
--Declarar variables locales para almacenar IDs
	DECLARE @AutorID INT, @EditorialID INT, @GeneroID INT;

--Buscar el ID del autor de la tabla Autores 
	SELECT @AutorID = AutorID
	FROM Autores
	WHERE Nombre = @Autor;

--Si el autor no existe, insertarlo en la tabla Autores y obtener su nuevo ID
IF @AutorID IS NULL
BEGIN 
	INSERT INTO Autores (Nombre)
	VALUES (@Autor);
	SET @AutorID = SCOPE_IDENTITY(); --Obtener el último ID insertado
END;

--Buscar el ID de la editorial en la tabla Editorial
	SELECT @EditorialID = EditorialID
	FROM Editorial
	WHERE Nombre = @Editorial;

END 