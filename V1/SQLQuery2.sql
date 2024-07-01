USE Biblioteca;
GO

CREATE TABLE Usuarios (
	UsuarioID INT PRIMARY KEY,
	Nombre VARCHAR (50),
	Apellido VARCHAR (50),
	Direccion VARCHAR (150),
	Telefono VARCHAR (15),
	Email VARCHAR (100)
 );
 GO

 CREATE TABLE Autores (
	AutorID INT PRIMARY KEY,
	Nombre VARCHAR (50),
	Apellido VARCHAR (50),
	Nacionalidad VARCHAR (50),
	Fallecimiento DATE
);
GO

CREATE TABLE Editorial (
	EditorialID INT PRIMARY KEY,
	Nombre VARCHAR (50),
	Pais VARCHAR (50)
);
GO

CREATE TABLE Genero (
	GeneroID INT PRIMARY KEY,
	TipoDeGenero VARCHAR (50)
);
GO

CREATE TABLE Ubicacion (
	UbicacionID INT PRIMARY KEY ,
	Seccion VARCHAR (50),
	Posicion INT,
	Estante INT
);
GO

CREATE TABLE Estado (
	EstadoID INT PRIMARY KEY,
	TipoDeEstado VARCHAR (20) not null --este campo no debe quedar sin dato
);
GO

CREATE TABLE Libros (
	LibroID INT PRIMARY KEY,
	Titulo NVARCHAR (50),
	EditorialID INT,
	GeneroID INT,
	UbicacionID INT,
	FOREIGN KEY (EditorialID) REFERENCES Editorial (EditorialID),
	FOREIGN KEY (GeneroID) REFERENCES Genero (GeneroID),
	FOREIGN KEY (UbicacionID) REFERENCES Ubicacion (UbicacionID)
);
GO

CREATE TABLE LibroAutor (
	LibroAutorID INT PRIMARY KEY,
	LibroID INT,
	AutorID INT,
	FOREIGN KEY (LibroID) REFERENCES Libros (LibroID),
	FOREIGN KEY (AutorID) REFERENCES Autores (AutorID)
);
GO

CREATE TABLE Copias (
	CopiaID INT PRIMARY KEY,
	LibroID INT,
	Disponibilidad BIT DEFAULT 1, --Se establece valor prederteminado 1 (si)
	FOREIGN KEY (LibroID) REFERENCES Libros (LibroID)
);

CREATE TABLE Prestamos (
	PrestamoID INT PRIMARY KEY,
	LibroID INT,
	EstadoID INT,
	UsuarioID INT,
	CopiaID INT,
	FechaPrestamo DATE,
	FechaDevolucion DATE,
	FOREIGN KEY (LibroID) REFERENCES Libros (LibroID),
	FOREIGN KEY (EstadoID) REFERENCES Estado (EstadoID),
	FOREIGN KEY (UsuarioID) REFERENCES Usuarios (UsuarioID),
	FOREIGN KEY (CopiaID) REFERENCES Copias (CopiaID)
);
GO

INSERT INTO Usuarios ( UsuarioID, Nombre, Apellido, Direccion, Telefono, Email )
VALUES 
(1, 'Juan', 'Perez', 'Calle 123', '555-1234', 'juan@example.com'),
(2, 'María', 'González', 'Avenida Principal 456', '555-5678', 'maria@example.com'),
(3, 'Carlos', 'Martínez', 'Calle 789', '555-91011', 'carlos@example.com');


INSERT INTO Autores (AutorID, Nombre, Apellido, Nacionalidad, Fallecimiento)
VALUES
(1, 'Gabriel', 'García Márquez', 'Colombiana', '1980-04-17'),
(2, 'Julio', 'Cortázar', 'Argentina', '1984-02-12'),
(3, 'Isabel', 'Allende', 'Chilena', NULL);


INSERT INTO Editorial (EditorialID, Nombre, Pais)
VALUES
(1, 'Editorial A', 'España'),
(2, 'Editorial B', 'Argentina'),
(3, 'Editorial C', 'Chile');


INSERT INTO Genero (GeneroID, TipoDeGenero)
VALUES 
(1, 'Drama'),
(2, 'Thriller');


INSERT INTO Ubicacion (UbicacionID, Seccion, Posicion, Estante)
VALUES
(1, 'Ficción', 1, 1),
(2, 'Novela', 2, 1);

INSERT INTO Estado (EstadoID, TipoDeEstado)
VALUES
(1, 'Disponible'),
(2, 'Prestado');

INSERT INTO Libros (LibroID, Titulo, EditorialID, GeneroID, UbicacionID)
VALUES
(1, 'Cien años de soledad', 1, 1, 1),
(2, 'Rayuela', 2, 2, 2),
(3, 'La casa de los espíritus', 3, 1, 2);


INSERT INTO LibroAutor (LibroAutorID, LibroID, AutorID)
VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

INSERT INTO Copias (CopiaID, LibroID, Disponibilidad)
VALUES
(1, 1, 1),
(2, 2, 1);


INSERT INTO Prestamos (PrestamoID, LibroID, EstadoID, UsuarioID, CopiaID, FechaPrestamo, FechaDevolucion)
VALUES
(1, 1, 1, 1, 1, '2023-01-01', '2023-01-15'),
(2, 2, 1, 2, 2, '2023-01-02', '2023-01-16');

--Tuve que borrar unos registors pero tambien lo dejo de ejemplo anotado 
/*DELETE FROM Usuarios
DELETE FROM Autores
DELETE FROM Editorial
DELETE FROM Genero
DELETE FROM Ubicacion
DELETE FROM Estado
DELETE FROM Libros*/

