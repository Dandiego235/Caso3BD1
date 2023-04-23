-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/22/2023
-- Descripcion: En este script se alteran columnas de not null a null en tabla de contratosProduccion y
-- se agrega fechaFiniquitacion en contratosRecoleccion
-- se altera viajesRecoleccion para arreglar el primary key
-----------------------------------------------------------

ALTER TABLE contratosProduccion
ALTER COLUMN fechaFiniquitacion datetime NULL

ALTER TABLE contratosRecoleccion
ADD fechaFiniquitacion datetime NULL

ALTER TABLE contratosProduccion
ADD contEstadoId tinyint NULL

ALTER TABLE contratosProduccion
ADD CONSTRAINT FK_contratosProduccion_estadosContratos FOREIGN KEY (contEstadoId)
REFERENCES estadosContratos (contEstadoId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

GO