IF OBJECT_ID ('VW_contratoDesechosLogs', 'view') IS NOT NULL
   DROP VIEW VW_contratoDesechosLogs ;
GO
CREATE VIEW VW_contratoDesechosLogs
AS
SELECT COUNT_BIG(*) AS countbig, dsp.desechoId AS desecho, 
dsp.viajeId AS viaje, vr.recPasoId AS paso, pr.recHorarioId AS horario, hr.recContratoId AS contratoRec, 
rpp.prodContratoId AS contratoProd FROM desechosPlantasLogs dsp
INNER JOIN viajesRecoleccion vr ON vr.viajeId = dsp.viajeId 
INNER JOIN pasosRecoleccion pr ON pr.recPasoId = vr.recPasoId
INNER JOIN horariosRecoleccion hr ON hr.recHorarioId = pr.recHorarioId
INNER JOIN contratosRecoleccion cr ON cr.recContratoId = hr.recContratoId
INNER JOIN recoleccionesPorProduccion rpp ON rpp.recContratoId = cr.recContratoId
INNER JOIN contratosProduccion cp ON cp.prodContratoId = rpp.prodContratoId
GROUP BY dsp.desechoId, dsp.viajeId, vr.recPasoId, pr.recHorarioId, hr.recContratoId, rpp.prodContratoId
GO

SELECT dsp.viajeId AS viaje, vr.recPasoId AS paso, pr.recHorarioId AS horario, hr.recContratoId AS contratoRec, 
rpp.prodContratoId AS contratoProd FROM desechosPlantasLogs dsp
INNER JOIN viajesRecoleccion vr ON vr.viajeId = dsp.viajeId 
INNER JOIN pasosRecoleccion pr ON pr.recPasoId = vr.recPasoId
INNER JOIN horariosRecoleccion hr ON hr.recHorarioId = pr.recHorarioId
INNER JOIN contratosRecoleccion cr ON cr.recContratoId = hr.recContratoId
INNER JOIN recoleccionesPorProduccion rpp ON rpp.recContratoId = cr.recContratoId
INNER JOIN contratosProduccion cp ON cp.prodContratoId = rpp.prodContratoId

IF OBJECT_ID ('VW_contratoDesechosLogsIDX', 'view') IS NOT NULL
   DROP VIEW [dbo].VW_contratoDesechosLogsIDX ;
GO
CREATE VIEW VW_contratoDesechosLogsIDX
WITH SCHEMABINDING
AS
SELECT COUNT_BIG(*) AS countbig, dsp.desechoId AS desecho, dsp.viajeId AS viaje, vr.recPasoId AS paso, pr.recHorarioId AS horario, hr.recContratoId AS contratoRec, rpp.prodContratoId AS contratoProd 
FROM [dbo].desechosPlantasLogs dsp
INNER JOIN [dbo].viajesRecoleccion vr ON vr.viajeId = dsp.viajeId 
INNER JOIN [dbo].pasosRecoleccion pr ON pr.recPasoId = vr.recPasoId
INNER JOIN [dbo].horariosRecoleccion hr ON hr.recHorarioId = pr.recHorarioId
INNER JOIN [dbo].contratosRecoleccion cr ON cr.recContratoId = hr.recContratoId
INNER JOIN [dbo].recoleccionesPorProduccion rpp ON rpp.recContratoId = cr.recContratoId
INNER JOIN [dbo].contratosProduccion cp ON cp.prodContratoId = rpp.prodContratoId 
GROUP BY dsp.desechoId, dsp.viajeId, vr.recPasoId, pr.recHorarioId, hr.recContratoId, rpp.prodContratoId
GO
DROP INDEX [dbo].IDX_contratoDesechosView
GO
CREATE UNIQUE CLUSTERED INDEX IDX_contratoDesechosView
	ON VW_contratoDesechosLogsIDX (desecho, viaje, paso, horario, contratoRec, contratoProd);
GO
DROP INDEX [dbo].IDX_contratoDesechosView2
GO
CREATE NONCLUSTERED INDEX IDX_contratoDesechosView2
	ON VW_contratoDesechosLogsIDX (desecho);
GO
DROP INDEX [dbo].IDX_contratoDesechosView3
GO
CREATE NONCLUSTERED INDEX IDX_contratoDesechosView3
	ON VW_contratoDesechosLogsIDX (viaje);
GO
DROP INDEX [dbo].IDX_contratoDesechosView4
GO
CREATE NONCLUSTERED INDEX IDX_contratoDesechosView4
	ON VW_contratoDesechosLogsIDX (horario);
GO
DROP INDEX [dbo].IDX_contratoDesechosView5
GO
CREATE NONCLUSTERED INDEX IDX_contratoDesechosView5
	ON VW_contratoDesechosLogsIDX (contratoProd);
GO
SET STATISTICS TIME ON;
SELECT * FROM VW_contratoDesechosLogs;
SELECT * FROM VW_contratoDesechosLogsIDX WITH (NOEXPAND);
SET STATISTICS TIME OFF;
