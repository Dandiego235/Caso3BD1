-----------------------------------------------------------
-- Autor: Diego Granados
-- Fecha: 05/04/2023
-- Descripcion: En este script se ejecuta el stored procedure SP_registrarFacturaRecoleccion
-----------------------------------------------------------

DECLARE @viajes AS viajesTabla;

INSERT INTO @viajes VALUES (1), (2);
-- SET STATISTICS TIME ON;
EXEC SP_registrarFacturaRecoleccion @viajes;
-- SET STATISTICS TIME OFF;

select * from facturas;
select * from itemsFactura;
select * from itemsRecoleccion;
select * from saldosDistribucion;

INSERT INTO [dbo].[itemsRecoleccion] ([productorId], [montoTotal], [recolectorId], [montoRec], [montoTrato], 
		[montoComisionEV],[viajeId],[fechaFactura], [descuentoSaldo], [montoAPagar], [enabled], [createdAt], [computer],[username],[checksum])
		VALUES (1,100.0,1, 10.0,10.0, 10.0, NULL, '2023-04-24 00:00:00', 10, 90, 1, '2023-04-24 10:00:00', 'ComputerName', 'Username', 0x0123456789ABCDEF)
