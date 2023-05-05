-----------------------------------------------------------
-- Autor: Diego Granados
-- Fecha: 05/04/2023
-- Descripcion: En este script se ejecuta el stored procedure SP_registrarFacturaRecoleccion
-----------------------------------------------------------

DECLARE @viajes AS viajesTabla;

INSERT INTO @viajes VALUES (1), (2);

EXEC SP_registrarFacturaRecoleccion @viajes;

select * from facturas;
select * from itemsFactura;
select * from itemsRecoleccion;
select * from saldosDistribucion;
select * from viajesRecoleccion
