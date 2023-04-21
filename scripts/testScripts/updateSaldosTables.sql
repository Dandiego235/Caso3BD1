-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/21/2023
-- Descripcion: En este script se modifican las tablas de saldosDistribucion, beneficiariosPorContaminante,
-- y saldosPorItem para agregar la posibilidad de que los saldos se distribuyan con base en un tipo de desecho.
-- Se agrega un FK entre saldosPorItem y saldosDistribución para enlazar de qué saldo se extrajo el saldo en el ítem de la factura.
-----------------------------------------------------------

ALTER TABLE saldosDistribucion
ADD desTipoId SMALLINT NULL

ALTER TABLE saldosDistribucion
ADD CONSTRAINT FK_saldosDistribucion_tiposDesechos FOREIGN KEY (desTipoId)
REFERENCES tiposDesechos (desTipoId)
ON DELETE NO ACTION
ON UPDATE NO ACTION
GO

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