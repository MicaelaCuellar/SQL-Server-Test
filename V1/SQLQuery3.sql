--Vamos a hacer una consulta uniendo dos tablas, primero agarrar una tabla que me muestre por cada ID de Libro prestado cuantas veces se presto
use Biblioteca
go

SELECT * 
FROM Libros;

SELECT LibroID 
FROM Prestamos

-- uno los libros con los prestamos
SELECT Libros.LibroID, Titulo FROM Libros
JOIN Prestamos ON Libros.LibroID = Prestamos.PrestamoID


-- Cuento cuantas veces se repite cada ID de libro
SELECT LibroID, COUNT(LibroID) AS veces_pedido FROM Prestamos
GROUP BY LibroID

--Obtener libro
SELECT LibroID, Titulo
FROM Libros


