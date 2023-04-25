-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/24/2023
-- Descripcion: Se agrega una columna de fecha en facturas.
-----------------------------------------------------------

INSERT INTO tiposDeCambio (monedaBaseId, conversion, monedaCambioId, enabled, createdAt, computer, username, checksum)
VALUES (1, 0.9123, 2, 1, GETDATE(), 'Server1', 'User1', 0x00)

INSERT INTO tiposDeCambio (monedaBaseId, conversion, monedaCambioId, enabled, createdAt, computer, username, checksum)
VALUES (1, 0.80, 3, 1, GETDATE(), 'Server1', 'User1', 0x00)

INSERT INTO tiposDeCambio (monedaBaseId, conversion, monedaCambioId, enabled, createdAt, computer, username, checksum)
VALUES (1, 530.53, 4,  1, GETDATE(), 'Server1', 'User1', 0x00)

INSERT INTO tiposDeCambio (monedaBaseId, conversion, monedaCambioId, enabled, createdAt, computer, username, checksum)
VALUES (1, 1, 1,  1, GETDATE(), 'Server1', 'User1', 0x00)