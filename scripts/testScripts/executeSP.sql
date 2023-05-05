-----------------------------------------------------------
-- Autor: Diego Granados
-- Fecha: 05/04/2023
-- Descripcion: En este script se ejecuta el stored procedure SP_registrarFacturaRecoleccion
-----------------------------------------------------------

DECLARE @viajes AS viajesTabla;

INSERT INTO @viajes VALUES (1), (24);

EXEC SP_registrarFacturaRecoleccion @viajes;

select * from facturas;
select * from itemsFactura where facturaId =1002;
select * from itemsRecoleccion;
select * from saldosDistribucion;
