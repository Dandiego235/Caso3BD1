-----------------------------------------------------------
-- Autor: Diego Granados
-- Fecha: 04/22/2023
-- Descripcion: En este script se insertan valores en muchas tablas
-----------------------------------------------------------


INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('North America', 1, 1)

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Western Europe', 1, 1)

INSERT INTO [dbo].[regiones] ([nombreId], [enabled])
VALUES (57, 1)

INSERT INTO [dbo].[regiones] ([nombreId], [enabled])
VALUES (58, 1)

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 1', 1, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 2', 2, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));


INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 3', 3, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 4', 4, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 5', 5, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 6', 6, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));


INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 7', 7, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 8', 8, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 9', 9, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 10', 10, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));


INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 11', 11, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 12', 12, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 13', 13, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 14', 14, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));


INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 15', 15, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 16', 16, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 17', 17, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 18', 18, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 19', 19, geography::Point(25.7617, -80.1918, 4326), 'Detail 1', 'Detail 2', '12345', 1, GETDATE(), NULL, 'Computer 1', 'User 1', CONVERT(varbinary(150), 'Address 1'));

INSERT INTO [dbo].[direcciones] ([nombre], [ciudadId], [geolocation], [detalle1], [detalle2], [zipcode], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES ('Address 20', 20, geography::Point(37.7749, -122.4194, 4326), 'Detail 1', 'Detail 2', '23456', 1, GETDATE(), NULL, 'Computer 2', 'User 2', CONVERT(varbinary(150), 'Address 2'));

INSERT INTO tiposEntidades (tipoNombre, enabled)
VALUES ('Recolector', 1);

INSERT INTO tiposEntidades (tipoNombre, enabled)
VALUES ('Restaurante', 1);

INSERT INTO tiposEntidades (tipoNombre, enabled)
VALUES ('Oficina', 1);

INSERT INTO tiposEntidades (tipoNombre, enabled)
VALUES ('Fábrica', 1);

INSERT INTO tiposEntidades (tipoNombre, enabled)
VALUES ('Municipalidad', 1);

INSERT INTO tiposEntidades (tipoNombre, enabled)
VALUES ('Gobierno', 1);

INSERT INTO tiposEntidades (tipoNombre, enabled)
VALUES ('Canal', 1);

INSERT INTO [dbo].[nombres] (nombreBase, idiomaId, enabled) VALUES ('Dollar', 1, 1);
INSERT INTO [dbo].[nombres] (nombreBase, idiomaId, enabled) VALUES ('Euro', 1, 1);
INSERT INTO [dbo].[nombres] (nombreBase, idiomaId, enabled) VALUES ('Pound', 1, 1);
INSERT INTO [dbo].[nombres] (nombreBase, idiomaId, enabled) VALUES ('Colon', 1, 1);

INSERT INTO [dbo].[monedas] ([nombreId], [simbolo], [acronimo], [defaultMoneda], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (59, '$', 'USD', 1, 1, GETDATE(), NULL, 'Computer1', 'User1', 0x00)

INSERT INTO [dbo].[monedas] ([nombreId], [simbolo], [acronimo], [defaultMoneda], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (60, '€', 'EUR', 0, 1, GETDATE(), NULL, 'Computer1', 'User1', 0x00)

INSERT INTO [dbo].[monedas] ([nombreId], [simbolo], [acronimo], [defaultMoneda], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (61, '£', 'GBP', 0, 1, GETDATE(), NULL, 'Computer1', 'User1', 0x00)

INSERT INTO [dbo].[monedas] ([nombreId], [simbolo], [acronimo], [defaultMoneda], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (62, '₡', 'CRC', 0, 1, GETDATE(), NULL, 'Computer1', 'User1', 0x00)

-- Restaurant
INSERT INTO [dbo].[productores] (nombre, tipoEntidadId, fechaRegistro, huellaCarbonoProd, huellaCarbonoReco, estadoContaminanteId, monedaId,enabled, createdAt, computer, username, checksum)
VALUES ('La Trattoria', 2, '2022-03-01', 20, 15, 2, 3,  1, '2023-04-22', 'COMPUTER01', 'user01', 0x00);

-- Office department
INSERT INTO [dbo].[productores] ([nombre], [tipoEntidadId], [fechaRegistro], [huellaCarbonoProd], [huellaCarbonoReco], [estadoContaminanteId], [monedaId],     [enabled], [createdAt], [computer], [username], [checksum])
VALUES ('Amazon', 3, '2021-07-15', 70, 70, 1, 2, 1, GETDATE(), 'COMPUTER02', 'user02', 0x00);

-- Factory
INSERT INTO [dbo].[productores] ([nombre], [tipoEntidadId], [fechaRegistro], [huellaCarbonoProd], [huellaCarbonoReco], [estadoContaminanteId], [monedaId],     [enabled], [createdAt], [computer], [username], [checksum])
VALUES ('Acer', 4, '2021-02-28', 50, 80, 2, 1,  1, GETDATE(), 'COMPUTER03', 'user03', 0x00);

-- Restaurant
INSERT INTO [dbo].[productores] ([nombre], [tipoEntidadId], [fechaRegistro], [huellaCarbonoProd], [huellaCarbonoReco], [estadoContaminanteId], [monedaId],     [enabled], [createdAt], [computer], [username], [checksum])
VALUES ('Burger King', 2, '2022-01-10', 65, 45, 2, 1,  1, GETDATE(), 'COMPUTER04', 'user04', 0x00);

-- Office department
INSERT INTO [dbo].[productores] ([nombre], [tipoEntidadId], [fechaRegistro], [huellaCarbonoProd], [huellaCarbonoReco], [estadoContaminanteId], [monedaId],     [enabled], [createdAt], [computer], [username], [checksum])
VALUES ('GG Games', 3, '2023-02-20', 15, 15, 1, 4,  1, GETDATE(), 'COMPUTER05', 'user05', 0x00);

-- Factory
INSERT INTO [dbo].[productores] ([nombre], [tipoEntidadId], [fechaRegistro], [huellaCarbonoProd], [huellaCarbonoReco], [estadoContaminanteId], [monedaId],    [enabled], [createdAt], [computer], [username], [checksum])
VALUES ('Rolls Royce', 3, '2023-01-27', 80, 80, 1, 3, 1, GETDATE(), 'COMPUTER05', 'user05', 0x00);

INSERT INTO recolectores (nombre, fechaRegistro, tipoEntidadId, enabled, createdAt, computer, username, checksum)
VALUES ('EcoRecycling', DATEADD(DAY, -10, GETDATE()), 1, 1, GETDATE(), 'computer16', 'user16', 0x112233);

INSERT INTO recolectores (nombre, fechaRegistro, tipoEntidadId, enabled, createdAt, computer, username, checksum)
VALUES ('Clean Earth', DATEADD(DAY, -15, GETDATE()), 1, 1, GETDATE(), 'computer17', 'user17', 0x445566);

INSERT INTO recolectores (nombre, fechaRegistro, tipoEntidadId, enabled, createdAt, computer, username, checksum)
VALUES ('Waste Management', DATEADD(DAY, -20, GETDATE()), 1, 1, GETDATE(), 'computer18', 'user18', 0x778899);

INSERT INTO recolectores (nombre, fechaRegistro, tipoEntidadId, enabled, createdAt, computer, username, checksum)
VALUES ('GreenStar', DATEADD(DAY, -25, GETDATE()), 1, 1, GETDATE(), 'computer19', 'user19', 0xAABBCC);

INSERT INTO recolectores (nombre, fechaRegistro, tipoEntidadId, enabled, createdAt, computer, username, checksum)
VALUES ('Clean Harbors', DATEADD(DAY, -30, GETDATE()), 1, 1, GETDATE(), 'computer20', 'user20', 0xDDEEFF);

INSERT INTO recolectores (nombre, fechaRegistro, tipoEntidadId, enabled, createdAt, computer, username, checksum)
VALUES ('Propio', DATEADD(DAY, -35, GETDATE()), 1, 1, GETDATE(), 'computer21', 'user21', 0x112233);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (1, 5, 'Local 1', 1, GETDATE(), 'computer1', 'user1', 0x556677);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (2, 13, 'Local 2', 1, GETDATE(), 'computer2', 'user2', 0x112233);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (3, 7, 'Local 3', 1, GETDATE(), 'computer3', 'user3', 0x445566);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (4, 16, 'Local 4', 1, GETDATE(), 'computer4', 'user4', 0x778899);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (5, 4, 'Local 5', 1, GETDATE(), 'computer5', 'user5', 0xAABBCC);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (6, 20, 'Local 6', 1, GETDATE(), 'computer6', 'user6', 0xDDAADD);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (1, 8, 'Local 7', 1, GETDATE(), 'computer7', 'user7', 0x1122FF);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (2, 11, 'Local 8', 1, GETDATE(), 'computer8', 'user8', 0x4455EE);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (3, 15, 'Local 9', 1, GETDATE(), 'computer9', 'user9', 0x8899DD);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (4, 1, 'Local 10', 1, GETDATE(), 'computer10', 'user10', 0xCCDDEE);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (5, 19, 'Local 11', 1, GETDATE(), 'computer11', 'user11', 0x111222);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (6, 6, 'Local 12', 1, GETDATE(), 'computer12', 'user12', 0x444555);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (1, 9, 'Local 13', 1, GETDATE(), 'computer12', 'user12', 0x444555);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (2, 10, 'Local 14', 1, GETDATE(), 'computer14', 'user14', 0x777888);

INSERT INTO locales (productorId, direccionId, nombre, enabled, createdAt, computer, username, checksum)
VALUES (3, 3, 'Local 15', 1, GETDATE(), 'computer15', 'user15', 0xAAAABB);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Juan', 'Pérez', 'González', 1, GETDATE(), 'computer1', 'user1', 0x123456);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('María', 'García', 'Hernández', 1, GETDATE(), 'computer2', 'user2', 0x789ABC);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Luis', 'Martínez', 'Rodríguez', 0, GETDATE(), 'computer3', 'user3', 0xDEF123);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Ana', 'Sánchez', NULL, 1, GETDATE(), 'computer4', 'user4', 0x456789);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Jorge', 'Fernández', 'López', 1, GETDATE(), 'computer5', 'user5', 0xABCDEF);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Laura', 'González', 'Pérez', 0, GETDATE(), 'computer6', 'user6', 0x234567);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Carlos', 'Hernández', 'García', 1, GETDATE(), 'computer7', 'user7', 0x89ABCD);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Sofía', 'Rodríguez', NULL, 1, GETDATE(), 'computer8', 'user8', 0xCDEF01);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Pedro', 'López', 'Fernández', 0, GETDATE(), 'computer9', 'user9', 0x345678);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Marta', 'Pérez', 'González', 1, GETDATE(), 'computer10', 'user10', 0x9ABCDEF);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Mario', 'García', 'Hernández', 0, GETDATE(), 'computer11', 'user11', 0x234567);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Natalia', 'Martínez', 'Rodríguez', 1, GETDATE(), 'computer12', 'user12', 0x890ABC);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('María', 'González', 'Hernández', 1, GETDATE(), 'computer13', 'user13', 0x112233);

INSERT INTO contactos (nombre, apellido1, enabled, createdAt, computer, username, checksum)
VALUES ('Sofía', 'Sánchez', 1, GETDATE(), 'computer14', 'user14', 0x445566);

INSERT INTO contactos (nombre, apellido1, apellido2, enabled, createdAt, computer, username, checksum)
VALUES ('Juan', 'Pérez', 'López', 0, GETDATE(), 'computer15', 'user15', 0x778899);

INSERT INTO [dbo].[participantes] ([nombre], [tipoEntidadId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES ('Municipalidad SJ', 5, 1, GETDATE(), 'Computer1', 'User1', 0x)

INSERT INTO [dbo].[participantes] ([nombre], [tipoEntidadId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES ('Gobierno CR', 6, 1, GETDATE(), 'Computer1', 'User1', 0x)

INSERT INTO [dbo].[participantes] ([nombre], [tipoEntidadId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES ('Government US', 6, 1, GETDATE(), 'Computer1', 'User1', 0x)

INSERT INTO [dbo].[canales] ([nombre], [tipoEntidadId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES 
('Ecommerce', 7, 1, GETDATE(), 'ComputerName', 'UserName', 0x0),
('Walmart', 7, 1, GETDATE(), 'ComputerName', 'UserName', 0x0),
('Target', 7, 1, GETDATE(), 'ComputerName', 'UserName', 0x0),
('Automercado', 7, 1, GETDATE(), 'ComputerName', 'UserName', 0x0),
('Max X Menos', 7, 1, GETDATE(), 'ComputerName', 'UserName', 0x0),
('Vindi', 7, 1, GETDATE(), 'ComputerName', 'UserName', 0x0);

INSERT INTO [dbo].[marcasRecipiente] ([nombre], [enabled])
VALUES ('Rubbermaid', 1);

INSERT INTO [dbo].[modelosRecipientes] ([marcaId], [nombre], [enabled])
VALUES (1, 'Roughneck', 1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Quimico', 2, 1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Biologico', 2, 1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Aguas', 2, 1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Radioactivo', 2, 1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Aceites', 2, 1);

INSERT INTO [dbo].[tiposDesechos] ([nombreId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES
(63, 1, GETDATE(), 'server1', 'admin', CAST(0x0000 AS VARBINARY(150))),
(64, 1, GETDATE(), 'server1', 'admin', CAST(0x0000 AS VARBINARY(150))),
(65, 1, GETDATE(), 'server1', 'admin', CAST(0x0000 AS VARBINARY(150))),
(66, 1, GETDATE(), 'server1', 'admin', CAST(0x0000 AS VARBINARY(150))),
(67, 1, GETDATE(), 'server1', 'admin', CAST(0x0000 AS VARBINARY(150)));

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Azufre', 2, 1),
       ('Heces', 2, 1),
       ('Aguas grises', 2, 1),
       ('Uranium', 1, 1),
       ('Diesel', 1, 1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Recicable', 2, 1),
       ('Procesable', 2, 1),
       ('Intratable', 2, 1);

INSERT INTO [dbo].[clasificacionesDesechos] ([nombreId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (73, 1, GETDATE(), NULL, 'ComputerName', 'Username', 0x123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);
INSERT INTO [dbo].[clasificacionesDesechos] ([nombreId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (74, 1, GETDATE(), NULL, 'ComputerName', 'Username', 0x123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);
INSERT INTO [dbo].[clasificacionesDesechos] ([nombreId], [enabled], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES (75, 1, GETDATE(), NULL, 'ComputerName', 'Username', 0x123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);


INSERT INTO [dbo].[desechos] ([nombreId], [enabled], [desTipoId], [desClasificacionId], [createdAt], [updatedAt], [computer], [username], [checksum])
VALUES
(68, 1, 1, 1, GETDATE(), NULL, 'Computer1', 'User1', CONVERT(varbinary(150), 'checksum1')),
(69, 1, 2, 2, GETDATE(), NULL, 'Computer2', 'User2', CONVERT(varbinary(150), 'checksum2')),
(70, 1, 3, 3, GETDATE(), NULL, 'Computer3', 'User3', CONVERT(varbinary(150), 'checksum3')),
(71, 1, 4, 2, GETDATE(), NULL, 'Computer4', 'User4', CONVERT(varbinary(150), 'checksum4')),
(72, 1, 5, 1, GETDATE(), NULL, 'Computer5', 'User5', CONVERT(varbinary(150), 'checksum5'));

INSERT INTO [dbo].[plantas] ([nombre], [direccionId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES
('Planta A', 2, 1, GETDATE(), 'ComputerA', 'UserA', 0x),
('Planta B', 12, 1, GETDATE(), 'ComputerB', 'UserB', 0x),
('Planta C', 17, 1, GETDATE(), 'ComputerC', 'UserC', 0x),
('Planta D', 18, 1, GETDATE(), 'ComputerD', 'UserD', 0x),
('Planta E', 14, 1, GETDATE(), 'ComputerE', 'UserE', 0x);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Standby', 2, 1),
       ('Pendiente limpieza', 2, 1),
       ('Vaciando', 2, 1),
       ('Limpiando', 2, 1),
       ('Desuso', 2, 1);

INSERT INTO [dbo].[estadosRecipientes] ([nombreId], [enabled])
VALUES (76, 1);
INSERT INTO [dbo].[estadosRecipientes] ([nombreId], [enabled])
VALUES (77, 1);
INSERT INTO [dbo].[estadosRecipientes] ([nombreId], [enabled])
VALUES (78, 1);
INSERT INTO [dbo].[estadosRecipientes] ([nombreId], [enabled])
VALUES (79, 1);
INSERT INTO [dbo].[estadosRecipientes] ([nombreId], [enabled])
VALUES (80, 1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Tratamiento 1', 2, 1);
INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Tratamiento 2', 2, 1);

INSERT INTO [dbo].[tratamientos] ([nombreId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (81, 1, GETDATE(), 'Computer1', 'User1', 0x1234567890);

INSERT INTO [dbo].[tratamientos] ([nombreId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (82, 1, GETDATE(), 'Computer1', 'User1', 0x1234567891);

INSERT INTO [dbo].[desechosStatuses] ([desStatusName], [enabled])
VALUES ('Pendiente', 1);
INSERT INTO [dbo].[desechosStatuses] ([desStatusName], [enabled])
VALUES ('Procesando', 1);
INSERT INTO [dbo].[desechosStatuses] ([desStatusName], [enabled])
VALUES ('Sintetizado', 1);
INSERT INTO [dbo].[desechosStatuses] ([desStatusName], [enabled])
VALUES ('Tratado', 1);
INSERT INTO [dbo].[desechosStatuses] ([desStatusName], [enabled])
VALUES ('Reciclado', 1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Email', 1, 1);
INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Phone number', 1, 1);

INSERT INTO [dbo].[contactTypes] ([nombreId], [enabled])
VALUES (83, 1);
INSERT INTO [dbo].[contactTypes] ([nombreId], [enabled])
VALUES (84, 1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Excelente', 2, 1);
INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Buena', 2, 1);
INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Mala', 2, 1);
INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Inutilizable', 2, 1);

INSERT INTO [dbo].[deterioroRecipientes] ([nombreId], [enabled])
VALUES (85, 1);
INSERT INTO [dbo].[deterioroRecipientes] ([nombreId], [enabled])
VALUES (86, 1);
INSERT INTO [dbo].[deterioroRecipientes] ([nombreId], [enabled])
VALUES (87, 1);
INSERT INTO [dbo].[deterioroRecipientes] ([nombreId], [enabled])
VALUES (88, 1);

-- Inserting 3 containers of type 1
INSERT INTO [dbo].[recipientes] ([reciCapacidad], [desTipoId], [modeloId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (100.00, 1, 1, 1, GETDATE(), 'Computer1', 'User1', 0x123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
       (150.00, 1, 1, 1, GETDATE(), 'Computer2', 'User2', 0x223456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
       (200.00, 1, 1, 1, GETDATE(), 'Computer3', 'User3', 0x323456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF);

-- Inserting 3 containers of type 2
INSERT INTO [dbo].[recipientes] ([reciCapacidad], [desTipoId], [modeloId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (250.00, 2, 1, 1, GETDATE(), 'Computer4', 'User4', 0x423456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
       (300.00, 2, 1, 1, GETDATE(), 'Computer5', 'User5', 0x523456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
       (350.00, 2, 1, 1, GETDATE(), 'Computer6', 'User6', 0x623456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF)

-- Inserting 3 containers of type 3
INSERT INTO [dbo].[recipientes] ([reciCapacidad], [desTipoId], [modeloId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (400.00, 3, 1, 1, GETDATE(), 'Computer7', 'User7', 0x723456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
       (450.00, 3, 1, 1, GETDATE(), 'Computer8', 'User8', 0x823456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
       (500.00, 3, 1, 1, GETDATE(), 'Computer9', 'User9', 0x923456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF)

-- Inserting 3 containers of type 4
INSERT INTO [dbo].[recipientes] ([reciCapacidad], [desTipoId], [modeloId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (550.00, 4, 1, 1, GETDATE(), 'Computer10', 'User10', 0xA23456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF),
       (600.00, 4, 1, 1, GETDATE(), 'Computer10', 'User10', 0xA23456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF)

INSERT INTO [dbo].[recipientes] ([reciCapacidad], [desTipoId], [modeloId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (712.5, 4, 1, 1, GETDATE(), 'COMPUTER1', 'USER1', 0x01)

INSERT INTO [dbo].[recipientes] ([reciCapacidad], [desTipoId], [modeloId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (442.5, 5, 1, 1, GETDATE(), 'COMPUTER1', 'USER1', 0x01)

INSERT INTO [dbo].[recipientes] ([reciCapacidad], [desTipoId], [modeloId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (624.0, 5, 1, 1, GETDATE(), 'COMPUTER1', 'USER1', 0x01)

INSERT INTO [dbo].[recipientes] ([reciCapacidad], [desTipoId], [modeloId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (590.0, 5, 1, 1, GETDATE(), 'COMPUTER1', 'USER1', 0x01)

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Vigente', 2, 1);
INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Cancelado', 2, 1);
INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Terminado', 2, 1);
INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Roto', 2, 1);

INSERT INTO [dbo].[estadosContratos] ([nombreId], [enabled])
VALUES (89, 1),
(90,1),
(91,1),
(92,1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Confirmado', 2, 1),
('Cancelado',2,1),
('Tarde', 2,1),
('A tiempo', 2,1);

INSERT INTO [dbo].[estadosEventos] ([nombreId], [enabled])
VALUES (93, 1),
(94,1),
(95,1),
(96,1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Pendiente', 2, 1),
('Cancelado',2,1),
('Pagado',2,1);

INSERT INTO [dbo].[facturaStatuses] ([nombreId], [enabled])
VALUES (97, 1),
(98,1),
(99,1);

INSERT INTO objectTypes (objectName, createdAt, computer, username, checksum) VALUES
('Dirección', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Ciudad', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Estado', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('País', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Región', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Local', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Productor', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Recolector', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Participante', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Recipiente', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Producto', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT')),
('Lote', GETDATE(), 'computer1', 'user1', HASHBYTES('SHA2_256', 'SQL SERVER INSERT'))

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Silla', 2, 1),
('Colchón',2,1),
('Cartera',2,1);

INSERT INTO [dbo].[productos] ([nombreId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (100, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(101, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(102, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Salida de planta', 2, 1),
('Llegada a local',2,1),
('Salida a local',2,1),
('Llegada a planta',2,1),
('Mantenimiento',2,1);

INSERT INTO [dbo].[tiposEventosViajesReci] ([nombreId], [enabled])
VALUES 
(103, 1),
(104,1),
(105,1),
(106,1),
(107,1);

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Recolección', 2, 1),
('Por ganancias',2,1),
('Ventas de productos',2,1),
('Pagos por empresas contaminantes',2,1);

INSERT INTO [dbo].[tiposItems] ([nombreId], [enabled])
VALUES (108, 1),
(109,1),
(110,1),
(111,1);

