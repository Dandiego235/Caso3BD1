-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/22/2023
-- Descripcion: En este script se insertan camiones
-----------------------------------------------------------

USE [evtest]
GO

DECLARE @contador INT;

SET @contador = 0

WHILE @contador < 200
BEGIN
INSERT INTO [dbo].[camiones]
           ([recolectorId]
           ,[enabled]
           ,[capacidadMaxima]
           ,[createdAt]
           ,[computer]
           ,[username]
           ,[checksum])
     VALUES
           ((SELECT TOP 1 recolectorId FROM recolectores WHERE recolectorId != 6 ORDER BY NEWID())
           ,1
           ,FLOOR(1 + RAND() * 50)
           ,getDATE()
           ,'computer1'
           ,'user1'
           ,1234);
SET @contador = @contador + 1
END
