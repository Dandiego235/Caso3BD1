ALTER TABLE nombres
ALTER COLUMN nombreBase nchar(50) NULL
GO

ALTER TABLE traduccionesPorIdioma
ALTER COLUMN traduccion nchar(50) NOT NULL
GO

