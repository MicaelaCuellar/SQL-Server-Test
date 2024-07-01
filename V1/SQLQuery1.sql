--Elimar una Base de Datos
IF DB_ID(N'Biblioteca') IS NOT NULL
	DROP DATABASE Biblioteca;
GO

--Creamos la Base de Datos Biblioteca
--Previamente creamos las carpetas:
-- C:\ProyectoBiblioteca\V1\Data
-- C:\ProyectoBiblioteca\V1\Log

USE MASTER;
GO

--Monitorear el crecimiento real de la bdd con el tiempo y ajustarlo segun sea necesario
CREATE DATABASE Biblioteca
ON PRIMARY
(
	NAME = N'V1_Data',
	FILENAME = N'C:\ProyectoBiblioteca\V1\Biblioteca.mdf',
	SIZE = 20 MB, --tener en cuenta una estimación del tamaño que necesitara nuestra base d datos y proyectar como crecera
	FILEGROWTH = 10 MB
)
LOG ON --podemos hacer copias de seguridad ya que el crecimiento del espacio podria ser menor
(
	NAME = N'V1_Log',
	FILENAME = N'C:\ProyectoBiblioteca\V1\Biblioteca.ldf',
	SIZE = 10 MB,
	FILEGROWTH = 5 MB
);
GO

