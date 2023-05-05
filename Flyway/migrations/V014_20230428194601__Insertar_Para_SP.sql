-----------------------------------------------------------
-- Autor: Diego Granados Granados
-- Fecha: 04/28/2023
-- Descripcion: Inserta cosas que hacen falta para que el Stored procedure funcione
-----------------------------------------------------------

-- 11
INSERT INTO [dbo].[contratosRecoleccion] ([productorId], [enabled], [recStartDate], [recEndDate], [contEstadoId], [areaEfectoId], [objectTypeId], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (1, 1, '2023-05-01', '2023-05-31', 1, 1,4, '2023-05-01', NULL, 'ComputerName', 'Username', 0x0123456789ABCDEF);

-- 1001
INSERT INTO [dbo].[horariosRecoleccion] ([recContratoId], [recPeriodicidad], [recStartDate], [recEndDate], [contEstadoId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (1, 7, NULL, NULL, 1, 1, '2023-05-04 09:00:00', NULL, 'ComputerName', 'Username', 0x0123456789ABCDEF);

-- 1001
INSERT INTO [dbo].[pasosRecoleccion] ([plantaIdOrigen], [dia], [horaRecogerEV], [horaEntregarEV], [recHorarioId], [hora], [plantaIdDestino], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (NULL, 1, '08:00:00', '12:00:00', 1, '10:00:00', NULL, 1, '2023-05-04 09:00:00', NULL, 'ComputerName', 'Username', 0x0123456789ABCDEF);

-- 1001
INSERT INTO [dbo].[viajesRecoleccion] ([recPasoId], [localId], [camionId], [plantaOrigenId], [plantaDestinoId], [fechaInicio], [choferId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (1, 1, 1, 1, 2, '2023-05-04 09:00:00', NULL, 1, '2023-05-04 09:00:00', NULL, 'ComputerName', 'Username', 0x0123456789ABCDEF);

INSERT INTO [dbo].[costosPasoRecoleccion] ([recPasoId], [costoRec], [recolectorId], [comisionEV], [costoTrato], [areaEfectoId], [objectTypeId], [monedaId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (1, 1000.5, 2, 250, 1100.5, 3, 4, 1, 1, GETDATE(), NULL, 'computer01', 'user01', 0x0);

INSERT INTO [dbo].[desechosPorPaso] ([recPasoId],[maxEsperado],[recoger],[minEsperado],[costoTratoId],[desechoId],[enabled],[createdAt],[updatedAt],[computer],[username],[checksum])
VALUES (1,20,1,10,54,2,1,GETDATE(),NULL,'ExampleComputer','ExampleUser',0x0000000000000000000000000000000000000000000000000000000000000000)
INSERT INTO [dbo].[desechosPorPaso] ([recPasoId],[maxEsperado],[recoger],[minEsperado],[costoTratoId],[desechoId],[enabled],[createdAt],[updatedAt],[computer],[username],[checksum])
VALUES (1,25,1,12,54,1,1,GETDATE(),NULL,'ExampleComputer','ExampleUser',0x0000000000000000000000000000000000000000000000000000000000000000)

INSERT INTO [dbo].[desechosPlantasLogs] ([plantaId], [desechoId], [cantidad], [fecha], [viajeId], [costoTrato], [enabled], [costoTratoId], [createdAt], [computer], [username], [checksum])
VALUES (1, 2, 10.5, '2023-05-04 10:00:00', 1, 50.00, 1, 1, '2023-05-04 10:00:00', 'PC123', 'JohnDoe', 0x12AB34CD5678EF90123456AB789CDEF012345678);

INSERT INTO [dbo].[desechosPlantasLogs] ([plantaId], [desechoId], [cantidad], [fecha], [viajeId], [costoTrato], [enabled], [costoTratoId], [createdAt], [computer], [username], [checksum])
VALUES (1, 1, 15.5, '2023-05-04 10:00:00', 1, 100.00, 1, 1, '2023-05-04 10:00:00', 'PC123', 'JohnDoe', 0x12AB34CD5678EF90123456AB789CDEF012345678);

---------------
-- 12
INSERT INTO [dbo].[contratosRecoleccion] ([productorId], [enabled], [recStartDate], [recEndDate], [contEstadoId], [areaEfectoId], [objectTypeId], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (2, 1, '2023-05-01', '2023-05-31', 1, 1,4, '2023-05-01', NULL, 'ComputerName', 'Username', 0x0123456789ABCDEF);

-- 1002
INSERT INTO [dbo].[horariosRecoleccion] ([recContratoId], [recPeriodicidad], [recStartDate], [recEndDate], [contEstadoId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (2, 7, NULL, NULL, 1, 1, '2023-05-04 09:00:00', NULL, 'ComputerName', 'Username', 0x0123456789ABCDEF);

-- 1002
INSERT INTO [dbo].[pasosRecoleccion] ([plantaIdOrigen], [dia], [horaRecogerEV], [horaEntregarEV], [recHorarioId], [hora], [plantaIdDestino], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (NULL, 1, '08:00:00', '12:00:00', 2, '10:00:00', NULL, 1, '2023-05-04 09:00:00', NULL, 'ComputerName', 'Username', 0x0123456789ABCDEF);

-- 1002
INSERT INTO [dbo].[viajesRecoleccion] ([recPasoId], [localId], [camionId], [plantaOrigenId], [plantaDestinoId], [fechaInicio], [choferId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (2, 2, 1, 1, 2, '2023-05-04 09:00:00', NULL, 1, '2023-05-04 09:00:00', NULL, 'ComputerName', 'Username', 0x0123456789ABCDEF);

INSERT INTO [dbo].[costosPasoRecoleccion] ([recPasoId], [costoRec], [recolectorId], [comisionEV], [costoTrato], [areaEfectoId], [objectTypeId], [monedaId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (2, 1000.5, 2, 250, 1100.5, 7, 4, 1, 1, GETDATE(), NULL, 'computer01', 'user01', 0x0);

INSERT INTO [dbo].[desechosPorPaso] ([recPasoId],[maxEsperado],[recoger],[minEsperado],[costoTratoId],[desechoId],[enabled],[createdAt],[updatedAt],[computer],[username],[checksum])
VALUES (2,30,1,20,54,3,1,GETDATE(),NULL,'ExampleComputer','ExampleUser',0x0000000000000000000000000000000000000000000000000000000000000000)
INSERT INTO [dbo].[desechosPorPaso] ([recPasoId],[maxEsperado],[recoger],[minEsperado],[costoTratoId],[desechoId],[enabled],[createdAt],[updatedAt],[computer],[username],[checksum])
VALUES (2,50,1,30,54,4,1,GETDATE(),NULL,'ExampleComputer','ExampleUser',0x0000000000000000000000000000000000000000000000000000000000000000)

INSERT INTO [dbo].[desechosPlantasLogs] ([plantaId], [desechoId], [cantidad], [fecha], [viajeId], [costoTrato], [enabled], [costoTratoId], [createdAt], [computer], [username], [checksum])
VALUES (1, 3, 25.5, '2023-05-04 10:00:00', 2, 50.00, 1, 1, '2023-05-04 10:00:00', 'PC123', 'JohnDoe', 0x12AB34CD5678EF90123456AB789CDEF012345678);

INSERT INTO [dbo].[desechosPlantasLogs] ([plantaId], [desechoId], [cantidad], [fecha], [viajeId], [costoTrato], [enabled], [costoTratoId], [createdAt], [computer], [username], [checksum])
VALUES (1, 4, 40.5, '2023-05-04 10:00:00', 2, 100.00, 1, 1, '2023-05-04 10:00:00', 'PC123', 'JohnDoe', 0x12AB34CD5678EF90123456AB789CDEF012345678);


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
(2, 1000.0000, 1, 1, '2023-04-24 12:00:00', 'my_computer', 'my_username', 0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);