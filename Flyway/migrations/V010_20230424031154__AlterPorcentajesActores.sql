-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/23/2023
-- Descripcion: Se elimina la columna de prodContratoId y su FK constraint de porcentajes actores.
-----------------------------------------------------------

ALTER TABLE porcentajesActores
DROP COLUMN prodContratoId

ALTER TABLE porcentajesActores
DROP CONSTRAINT FK_porcentajesActores_contratosProduccion
GO