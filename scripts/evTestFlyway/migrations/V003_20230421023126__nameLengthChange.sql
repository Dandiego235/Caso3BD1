-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/20/2023
-- Descripcion: En este script se modifica el tamaño de los nombres y las traducciones para que puedan caber nombres más grandes
-----------------------------------------------------------

ALTER TABLE nombres
ALTER COLUMN nombreBase nchar(50) NULL
GO

ALTER TABLE traduccionesPorIdioma
ALTER COLUMN traduccion nchar(50) NOT NULL
GO

