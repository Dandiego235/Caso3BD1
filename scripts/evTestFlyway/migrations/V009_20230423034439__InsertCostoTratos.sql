-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/22/2023
-- Descripcion: En este script se insertan los costos por trato
-----------------------------------------------------------


USE [evtest]
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

DECLARE @contador INT, @max INT, @objectTypeId TINYINT, @geographicObjects TINYINT;

SET @contador = 0
SET @max = 100
SET @geographicObjects = 5


WHILE @contador < @max
BEGIN
	SET @objectTypeId = FLOOR(1 + RAND()*@geographicObjects)

INSERT INTO [dbo].[costosTratamiento]
           ([precioKg]
           ,[areaEfectoId]
           ,[objectTypeId]
           ,[fechaInicio]
           ,[fechaFin]
           ,[monedaId]
           ,[productorId]
           ,[tratoId]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           (FLOOR(1 + rand()*1000)
           ,FLOOR(1 + RAND() * (SELECT cantidad FROM #objectTypeQuantities WHERE objectTypeId = @objectTypeId))
           ,@objectTypeId
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,(SELECT TOP 1 monedaId FROM monedas ORDER BY NEWID())
           ,(SELECT TOP 1 productorId FROM productores ORDER BY NEWID())
           ,(SELECT TOP 1 tratoId FROM tratamientos ORDER BY NEWID())
           ,1
           ,GETDATE()
           ,'computer1'
           ,'user1'
           ,1234)
	SET @contador = @contador + 1
END
