-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/21/2023
-- Descripcion: En este script se modifican las tablas de saldosDistribucion, beneficiariosPorContaminante,
-- y saldosPorItem para agregar la posibilidad de que los saldos se distribuyan con base en un tipo de desecho.
-- Se agrega un FK entre saldosPorItem y saldosDistribución para enlazar de qué saldo se extrajo el saldo en el ítem de la factura.
-- Se modifica SaldosDistribucion para que los saldos estén distribuidos directamente en los locales y sea más claro cuánto le corresponde a cada local
-- Se elimina la tabla de descuentosPorItem
-----------------------------------------------------------

ALTER TABLE saldosDistribucion
ADD localId INT NOT NULL

ALTER TABLE saldosDistribucion
ADD CONSTRAINT FK_saldosDistribucion_locales FOREIGN KEY (localId)
REFERENCES locales (localId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE saldosDistribucion
DROP CONSTRAINT FK_saldosDistribucion_productores

ALTER TABLE saldosDistribucion
DROP COLUMN productorId

ALTER TABLE saldosDistribucion
DROP COLUMN areaEfectoId

ALTER TABLE saldosDistribucion
DROP CONSTRAINT FK_saldosDistribucion_objectTypes

ALTER TABLE saldosDistribucion
DROP COLUMN objectTypeId

ALTER TABLE saldosDistribucion
ADD montoSaldo MONEY NOT NULL

ALTER TABLE saldosDistribucion
ADD monedaId INT NOT NULL

ALTER TABLE saldosDistribucion
ADD CONSTRAINT FK_saldosDistribucion_monedas FOREIGN KEY (monedaId)
REFERENCES monedas (monedaId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE beneficiariosPorContaminante
ADD desTipoId SMALLINT NULL

ALTER TABLE beneficiariosPorContaminante
ADD CONSTRAINT FK_beneficiariosPorContaminante_tiposDesechos FOREIGN KEY (desTipoId)
REFERENCES tiposDesechos (desTipoId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE saldosPorItem
ADD desTipoId SMALLINT NULL

ALTER TABLE saldosPorItem
ADD CONSTRAINT FK_saldosPorItem_tiposDesechos FOREIGN KEY (desTipoId)
REFERENCES tiposDesechos (desTipoId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE saldosPorItem
ADD saldoId INT NOT NULL

ALTER TABLE saldosPorItem
ADD CONSTRAINT FK_saldosPorItem_saldosDistribucion FOREIGN KEY (saldoId)
REFERENCES saldosDistribucion (saldoId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

ALTER TABLE descuentosPorItem
DROP CONSTRAINT FK_descuentosPorFactura_facturasRecoleccion

ALTER TABLE descuentosPorItem
DROP CONSTRAINT FK_descuentosPorFactura_saldosDistribucion

DROP TABLE descuentosPorItem