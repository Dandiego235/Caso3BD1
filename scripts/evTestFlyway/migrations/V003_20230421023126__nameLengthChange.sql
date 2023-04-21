-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/20/2023
-- Descripcion: En este script se modifica el tama�o de los nombres y las traducciones para que puedan caber nombres m�s grandes
-----------------------------------------------------------

ALTER TABLE nombres
ALTER COLUMN nombreBase nchar(50) NULL
GO

ALTER TABLE traduccionesPorIdioma
ALTER COLUMN traduccion nchar(50) NOT NULL
GO

