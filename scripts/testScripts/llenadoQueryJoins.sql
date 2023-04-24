-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/22/2023
-- Descripcion: En este script se genera un llenado aleatorio para la base de datos para el query que usa al menos 4 joins
-----------------------------------------------------------

/*
DECLARE @computer VARCHAR(20), @username VARCHAR(20), @checksum VARBINARY(150);

SET @computer = 'computer1'
SET @username = 'user1'
SET @checksum = 1234

-- inventarioLocales
INSERT INTO inventarioLocales (localId, recipienteId, cantidad, enabled, createdAt, computer, username, checksum)
VALUES
((SELECT TOP 1 localId FROM locales ORDER BY NEWID()), (SELECT TOP 1 recipienteId FROM recipientes ORDER BY NEWID()), 
FLOOR(1 + rand()*32000), 1, GETDATE(), @computer, @username, @checksum)
GO 1000

-- DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')

SELECT * FROM inventarioLocales
*/

USE [evtest]
GO

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

WHILE @contador < 1000
BEGIN
INSERT INTO [dbo].[contratosProduccion]
           ([fechaInicio]
           ,[fechaFin]
           ,[enabled]
           ,[periodicidad]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum]
           ,[contEstadoId])
     VALUES
           (DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,1
           ,FLOOR(1 + RAND()*8) * 7
           ,GETDATE()
           ,@computer
           ,@username
           ,@checksum
           ,(SELECT TOP 1 contEstadoId FROM estadosContratos ORDER BY NEWID()))
SET @contador = @contador + 1
END

DECLARE @max INT, @objectTypeId TINYINT, @geographicObjects TINYINT;

SET @contador = 0
SET @max = 10
SET @geographicObjects = 5

WHILE @contador < @max
BEGIN
	SET @objectTypeId = FLOOR(1 + RAND()*@geographicObjects)

	INSERT INTO [dbo].[contratosRecoleccion]
			   ([productorId]
			   ,[enabled]
			   ,[recStartDate]
			   ,[recEndDate]
			   ,[contEstadoId]
			   ,[areaEfectoId]
			   ,[objectTypeId]
			   ,[createdAt]
			   ,[computer]
			   ,[username]
			   ,[checksum]
			   )
		 VALUES
			   ((SELECT TOP 1 productorId FROM productores ORDER BY NEWID())
			   ,1
			   ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
			   ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
			   ,(SELECT TOP 1 contEstadoId FROM estadosContratos ORDER BY NEWID())
			   ,FLOOR(1 + RAND() * (SELECT cantidad FROM #objectTypeQuantities WHERE objectTypeId = @objectTypeId))
			   ,@objectTypeId
			   ,getDate()
			   ,@computer
			   ,@username
			   ,@checksum
			   )
	SET @contador = @contador + 1
END


SET @contador = 0

WHILE @contador < 1000
BEGIN
INSERT INTO [dbo].[recoleccionesPorProduccion]
           ([prodContratoId]
           ,[recContratoId]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 prodContratoId from contratosProduccion ORDER BY NEWID())
           ,(SELECT TOP 1 recContratoId from contratosRecoleccion ORDER BY NEWID())
           ,1
           ,GETDATE()
		   ,@computer
		   ,@username
		   ,@checksum)
SET @contador = @contador + 1
END

SET @contador = 0

WHILE @contador < 1000
BEGIN
INSERT INTO [dbo].[horariosRecoleccion]
           ([recContratoId]
           ,[recPeriodicidad]
           ,[recStartDate]
           ,[recEndDate]
           ,[contEstadoId]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 recContratoId from contratosRecoleccion ORDER BY NEWID())
           ,FLOOR(1 + RAND()*8) * 7
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,(SELECT TOP 1 contEstadoId FROM estadosContratos ORDER BY NEWID())
           ,1
           ,GETDATE()
		   ,@computer
		   ,@username
		   ,@checksum)
SET @contador = @contador + 1
END

SET @contador = 0

WHILE @contador < 1000
BEGIN
INSERT INTO [dbo].[pasosRecoleccion]
           ([plantaIdOrigen]
           ,[dia]
           ,[horaRecogerEV]
           ,[horaEntregarEV]
           ,[recHorarioId]
           ,[hora]
           ,[plantaIdDestino]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 plantaId FROM plantas ORDER BY NEWID())
           ,FLOOR(1 + RAND() * 56)
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,(SELECT TOP 1 recHorarioId from horariosRecoleccion ORDER BY NEWID())
           ,DATEADD(second, FLOOR(1 + RAND()*86400), '00:00:00')
           ,(SELECT TOP 1 plantaId FROM plantas ORDER BY NEWID())
           ,1
           ,GETDATE()
		   ,@computer
		   ,@username
		   ,@checksum)
SET @contador = @contador + 1
END

SET @contador = 0

WHILE @contador < 1000
BEGIN
INSERT INTO [dbo].[viajesRecoleccion]
           ([recPasoId]
           ,[localId]
           ,[camionId]
           ,[plantaOrigenId]
           ,[plantaDestinoId]
           ,[fechaInicio]
           ,[choferId]
           ,[enabled]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 recPasoId FROM pasosRecoleccion ORDER BY NEWID())
           ,(SELECT TOP 1 localId FROM locales ORDER BY NEWID())
           ,(SELECT TOP 1 camionId FROM camiones ORDER BY NEWID())
           ,(SELECT TOP 1 plantaId FROM plantas ORDER BY NEWID())
           ,(SELECT TOP 1 plantaId FROM plantas ORDER BY NEWID())
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,(SELECT TOP 1 contactoId FROM contactos ORDER BY NEWID())
           ,1
           ,GETDATE()
		   ,@computer
		   ,@username
		   ,@checksum)
SET @contador = @contador + 1
END

SET @contador = 0

WHILE @contador < 1000
BEGIN
INSERT INTO [dbo].[desechosPlantasLogs]
           ([plantaId]
           ,[desechoId]
           ,[cantidad]
           ,[fecha]
           ,[viajeId]
           ,[costoTrato]
           ,[enabled]
           ,[costoTratoId]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 plantaId FROM plantas ORDER BY NEWID())
           ,(SELECT TOP 1 desechoId FROM desechos ORDER BY NEWID())
           ,FLOOR(1 + RAND()*100000)
           ,DATEADD(minute, FLOOR(1 + RAND()*518400), '2022-01-01 00:00:00')
           ,(SELECT TOP 1 viajeId from viajesRecoleccion ORDER BY NEWID())
           ,FLOOR(1 + RAND()*10000)
           ,1
           ,(SELECT TOP 1 costoTratoId FROM costosTratamiento ORDER BY NEWID())
           ,getDate()
		   ,@computer
		   ,@username
		   ,@checksum)
SET @contador = @contador + 1
END
