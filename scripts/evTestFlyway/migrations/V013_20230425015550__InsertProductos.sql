-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/24/2023
-- Descripcion: Se insertan más productos para tener 15 en total
-----------------------------------------------------------

INSERT INTO [dbo].[nombres] ([nombreBase], [idiomaId], [enabled])
VALUES ('Billetera', 2, 1),
('Botella',2,1),
('Sombrero',2,1),
('Gorra',2,1),
('Jacket',2,1),
('Mesa',2,1),
('Maseta',2,1),
('Juguete',2,1),
('Sombrero',2,1),
('Alcancía',2,1),
('Sombrilla',2,1),
('Basurero',2,1)

INSERT INTO [dbo].[productos] ([nombreId], [enabled], [createdAt], [computer], [username], [checksum])
VALUES (112, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(113, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(114, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(115, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(116, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(117, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(118, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(119, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(120, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(121, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(122, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00),
(123, 1, GETDATE(), 'COMPUTER01', 'USER01', 0x00);
