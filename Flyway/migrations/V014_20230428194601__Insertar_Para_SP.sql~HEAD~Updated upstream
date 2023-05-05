-----------------------------------------------------------
-- Autor: Diego Granados Granados
-- Fecha: 04/28/2023
-- Descripcion: Inserta cosas que hacen falta para que el Stored procedure funcione
-----------------------------------------------------------

INSERT INTO [dbo].[elementosPorRegion]
([regionId], [paisId], [estadoId], [ciudadId], [direccionId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES
(1, 1, NULL, NULL, NULL, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
(1, 2, NULL, NULL, NULL, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
(1, 3, NULL, NULL, NULL, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
(1, NULL, 7, NULL, NULL, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);

INSERT INTO [dbo].[elementosPorRegion]
([regionId], [paisId], [estadoId], [ciudadId], [direccionId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES
(2, 4, NULL, NULL, NULL, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
(2, 5, NULL, NULL, NULL, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
(2, 6, NULL, NULL, NULL, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);
INSERT INTO [dbo].[elementosPorRegion]
([regionId], [paisId], [estadoId], [ciudadId], [direccionId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES
(2, NULL, NULL, 13, NULL, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);

INSERT INTO [dbo].[saldosDistribucion]
(localId, montoSaldo, monedaId, [enabled], [createdAt], [computer], [username], [checksum])
VALUES
(1, 10000.0000, 1, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);
INSERT INTO [dbo].[saldosDistribucion]
(localId, montoSaldo, monedaId, [enabled], [createdAt], [computer], [username], [checksum])
VALUES
(2, 100.0000, 1, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);

INSERT INTO [dbo].[costosPasoRecoleccion] ([recPasoId], [costoRec], [recolectorId], [comisionEV], [costoTrato], [areaEfectoId], [objectTypeId], [monedaId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (6, 1000.5, 2, 250, 1100.5, 3, 4, 1, 1, GETDATE(), NULL, 'computer01', 'user01', 0x0);


INSERT INTO [dbo].[costosPasoRecoleccion] ([recPasoId], [costoRec], [recolectorId], [comisionEV], [costoTrato], [areaEfectoId], [objectTypeId], [monedaId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (617, 1000.5, 2, 250, 1100.5, 2, 5, 1, 1, GETDATE(), NULL, 'computer01', 'user01', 0x0);

INSERT INTO [dbo].[desechosPorPaso] (
	[recPasoId],
	[maxEsperado],
	[recoger],
	[minEsperado],
	[costoTratoId],
	[desechoId],
	[enabled],
	[createdAt],
	[updatedAt],
	[computer],
	[username],
	[checksum]
)
VALUES (617,100000,1,70000,54,5,1,GETDATE(),NULL,'ExampleComputer','ExampleUser',0x0000000000000000000000000000000000000000000000000000000000000000),
(6,30000,1,20000,35,5,1,GETDATE(),NULL,'ExampleComputer','ExampleUser',0x0000000000000000000000000000000000000000000000000000000000000000);