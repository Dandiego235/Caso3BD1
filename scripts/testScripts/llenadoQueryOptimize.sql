-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/23/2023
-- Descripcion: En este script se genera un llenado aleatorio para la base de datos para el query que se va a optimizar
-----------------------------------------------------------

IF OBJECT_ID(N'tempdb..#objectTypeQuantities') IS NOT NULL
BEGIN
DROP TABLE #objectTypeQuantities
END
GO

CREATE TABLE #objectTypeQuantities (
	objectTypeId TINYINT IDENTITY(1,1) NOT NULL,
	cantidad INT NULL
);

INSERT INTO #objectTypeQuantities (cantidad) VALUES
((SELECT COUNT(direccionId) FROM direcciones)),
((SELECT COUNT(ciudadId) FROM ciudades)),
((SELECT COUNT(estadoId) FROM estados)),
((SELECT COUNT(paisId) FROM paises)),
((SELECT COUNT(regionId) FROM regiones)),
((SELECT COUNT(localId) FROM locales)),
((SELECT COUNT(productorId) FROM productores)),
((SELECT COUNT(recolectorId) FROM recolectores)),
((SELECT COUNT(participanteId) FROM participantes)),
((SELECT COUNT(recipienteId) FROM recipientes)),
((SELECT COUNT(productoId) FROM productos)),
((SELECT COUNT(loteId) FROM lotesProduccionLogs))

DECLARE @computer VARCHAR(20), @username VARCHAR(20), @checksum VARBINARY(150);

DECLARE @contador int;

SET @computer = 'computer1'
SET @username = 'user1'
SET @checksum = 1234

SET @contador = 0

DECLARE @max INT, @objectTypeId TINYINT, @geographicObjects TINYINT, @minObjects TINYINT, @maxObjects TINYINT;

SET @contador = 1
SET @max = 10000
SET @geographicObjects = 5
SET @minObjects = 7
SET @maxObjects = 10

-- llenar actoresContratoProd
WHILE @contador <= @max
BEGIN
SET @objectTypeId = FLOOR(@minObjects + RAND()*(@maxObjects - @minObjects))
INSERT INTO [dbo].[actoresContratoProd]
           ([prodContratoId]
           ,[objectTypeId]
           ,[genericId]
           ,[enabled]
           ,[createdAt]
           ,[computer]
		   ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 prodContratoId FROM contratosProduccion ORDER BY NEWID())
           ,@objectTypeId
           ,FLOOR(1 + RAND() * (SELECT cantidad FROM #objectTypeQuantities WHERE objectTypeId = @objectTypeId))
           ,1
           ,GETDATE()
           ,@computer
           ,@username
           ,@checksum)

INSERT INTO [dbo].[porcentajesActores]
           ([actorId]
           ,[porcentaje]
           ,[productoId]
           ,[monedaId]
           ,[fechaInicio]
           ,[fechaFin]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           (@contador
           ,100*RAND()
           ,(SELECT TOP 1 productoId from productos ORDER BY NEWID())
           ,(SELECT TOP 1 monedaId from monedas ORDER BY NEWID())
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,1
           ,GETDATE()
           ,@computer
           ,@username
           ,@checksum)
SET @contador = @contador + 1
END

-- SELECT * FROM actoresContratoProd ORDER BY actorId
-- SELECT * FROM porcentajesActores
-- SELECT * FROM actoresContratoProd ORDER BY actorId


SET @contador = 1
SET @max = 20000
WHILE @contador <= @max
BEGIN

INSERT INTO [dbo].[lotesProduccionLogs]
           ([productoId]
           ,[plantaId]
           ,[cantidad]
           ,[prodContratoId]
           ,[costoProduccion]
           ,[monedaId]
           ,[fecha]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 productoId FROM productos ORDER BY NEWID())
           ,(SELECT TOP 1 plantaId FROM plantas ORDER BY NEWID())
           ,FLOOR(1 + RAND() * 10000)
           ,(SELECT TOP 1 prodContratoId FROM contratosProduccion ORDER BY NEWID())
           ,FLOOR(1 + RAND() * 10000)
           ,(SELECT TOP 1 monedaId FROM monedas ORDER BY NEWID())
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,1
           ,GETDATE()
		   ,@computer
		   ,@username
		   ,@checksum)
SET @contador = @contador + 1

END

SET @contador = 1
SET @max = 500
WHILE @contador <= @max
BEGIN

SET @objectTypeId = FLOOR(1 + RAND()*@geographicObjects)

INSERT INTO [dbo].[preciosProductosContrato]
           ([prodContratoId]
           ,[productoId]
           ,[precio]
           ,[areaEfectoId]
           ,[objectTypeId]
           ,[fechaInicio]
           ,[fechaFin]
           ,[monedaId]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 prodContratoId from contratosProduccion ORDER BY NEWID())
           ,(SELECT TOP 1 productoId from productos ORDER BY NEWID())
           ,FLOOR(1 + RAND() * 150)
           ,FLOOR(1 + RAND() * (SELECT cantidad FROM #objectTypeQuantities WHERE objectTypeId = @objectTypeId))
           ,@objectTypeId
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,(SELECT TOP 1 monedaId FROM monedas ORDER BY NEWID())
           ,1
           ,GETDATE()
		   ,@computer
		   ,@username
		   ,@checksum)

SET @contador = @contador + 1

END


SET @contador = 1
SET @max = 200000
WHILE @contador <= @max
BEGIN

INSERT INTO [dbo].[itemsProductos]
           ([canalId]
           ,[loteId]
           ,[cantidadProductos]
           ,[montoTotal]
           ,[monedaId]
           ,[fecha]
           ,[precioProductoId]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 canalId FROM canales ORDER BY NEWID())
           ,(SELECT TOP 1 loteId FROM lotesProduccionLogs ORDER BY NEWID())
           ,FLOOR(1 + rand()*10000)
           ,FLOOR(1 + rand()*1000)
           ,(SELECT TOP 1 monedaId FROM monedas ORDER BY NEWID())
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,(SELECT TOP 1 precioProductoId FROM preciosProductosContrato ORDER BY NEWID())
           ,1
           ,GETDATE()
		   ,@computer
		   ,@username
		   ,@checksum)

SET @contador = @contador + 1

END
GO

DECLARE @computer VARCHAR(20), @username VARCHAR(20), @checksum VARBINARY(150);
DECLARE @max INT
DECLARE @contador int;

SET @computer = 'computer1'
SET @username = 'user1'
SET @checksum = 1234

DECLARE @itemsFactura int, @contItems int, @maxItems int;
SET @contador = 1
SET @max = 10000
SET @maxItems = (SELECT COUNT(itemProdId) FROM itemsProductos)

SET @itemsFactura = FLOOR(@maxItems/@max)

WHILE @contador <= @max
BEGIN
SET @contItems = 1

INSERT INTO [dbo].[facturas]
           ([enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum]
           ,[facturaStatusId]
           ,[descripcion]
		   ,[fecha])
     VALUES
           (1
           ,GETDATE()
		   ,@computer
		   ,@username
		   ,@checksum
           ,(SELECT TOP 1 facturaStatusId FROM facturaStatuses ORDER BY NEWID())
           ,'Venta de productos'
		   ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00'))

WHILE @contItems <= @itemsFactura AND (@contador - 1) * @itemsFactura + @contItems <= @maxItems
BEGIN

INSERT INTO [dbo].[itemsFactura]
           ([facturaId]
           ,[itemId]
           ,[tipoItemId]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           (@contador
           ,(@contador - 1) * @itemsFactura + @contItems
           ,3
           ,1
           ,GETDATE()
		   ,@computer
		   ,@username
		   ,@checksum)
	SET @contItems = @contItems + 1
END
SET @contador = @contador + 1
END


GO

-- SELECT * FROM lotesProduccionLogs
-- SELECT * FROM facturas

-- SELECT * FROM itemsFactura
