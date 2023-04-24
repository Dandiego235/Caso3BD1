-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/24/2023
-- Descripcion: Se agrega una columna de fecha en facturas.
-----------------------------------------------------------

ALTER TABLE facturas
ADD fecha DATETIME NOT NULL

ALTER TABLE facturas
ADD fechaMax DATETIME NULL
GO