-----------------------------------------------------------
-- Autor: Daniel Granados
-- Fecha: 04/18/2023
-- Descripcion: En este script se convierten algunas tablas que tienen columnas de validTo y validFrom en temporal tables para que mantengan el history.
-----------------------------------------------------------

-- beneficiariosPorContaminante
-- hacemos validTo y validFrom NOT NULL
ALTER TABLE beneficiariosPorContaminante
ALTER COLUMN validFrom DATETIME2 NOT NULL
GO

ALTER TABLE beneficiariosPorContaminante
ALTER COLUMN validTo DATETIME2 NOT NULL
GO

ALTER TABLE beneficiariosPorContaminante
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE beneficiariosPorContaminante
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.beneficiariosPorContaminante_History, DATA_CONSISTENCY_CHECK = ON))
GO

-- deteriorosReciPlantas
ALTER TABLE deteriorosReciPlantas
   ADD deterReciPlantId INT IDENTITY NOT NULL
       CONSTRAINT PK_deteriorosReciPlantas PRIMARY KEY CLUSTERED

ALTER TABLE deteriorosReciPlantas
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE deteriorosReciPlantas
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.deteriorosReciPlantas_History,
DATA_CONSISTENCY_CHECK = ON))
GO

-- estadosReciPlantas
ALTER TABLE estadosReciPlantas
   ADD estadoReciPlantId INT IDENTITY NOT NULL
       CONSTRAINT PK_estadosReciPlantas PRIMARY KEY CLUSTERED

ALTER TABLE estadosReciPlantas
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE estadosReciPlantas
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.estadosReciPlantas_History,
DATA_CONSISTENCY_CHECK = ON))
GO

-- eventosPorViaje
ALTER TABLE eventosPorViaje
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE eventosPorViaje
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.eventosPorViaje_History,
DATA_CONSISTENCY_CHECK = ON))
GO

-- inventarioCamiones
ALTER TABLE inventarioCamiones
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE inventarioCamiones
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.inventarioCamiones_History,
DATA_CONSISTENCY_CHECK = ON))
GO

-- inventarioLocales
ALTER TABLE inventarioLocales
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE inventarioLocales
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.inventarioLocales_History,
DATA_CONSISTENCY_CHECK = ON))
GO

-- inventarioPlantas
ALTER TABLE inventarioPlantas
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE inventarioPlantas
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.inventarioPlantas_History,
DATA_CONSISTENCY_CHECK = ON))
GO

-- productores
ALTER TABLE productores
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE productores
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.productores_History,
DATA_CONSISTENCY_CHECK = ON))
GO

-- saldosDistribucion
ALTER TABLE saldosDistribucion
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE saldosDistribucion
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.saldosDistribucion_History,
DATA_CONSISTENCY_CHECK = ON))
GO

-- tiposDeCambio
ALTER TABLE tiposDeCambio
ADD PERIOD FOR SYSTEM_TIME (validFrom, validTo)

ALTER TABLE tiposDeCambio
SET(SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.tiposDeCambio_History,
DATA_CONSISTENCY_CHECK = ON))
GO


