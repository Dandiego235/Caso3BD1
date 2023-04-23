SELECT * FROM desechosPlantasLogs dsp
INNER JOIN viajesRecoleccion vr ON vr.viajeId = dsp.viajeId 
INNER JOIN pasosRecoleccion pr ON pr.recPasoId = vr.recPasoId
INNER JOIN horariosRecoleccion hr ON hr.recHorarioId = pr.recHorarioId
INNER JOIN contratosRecoleccion cr ON cr.recContratoId = hr.recContratoId
INNER JOIN recoleccionesPorProduccion rpp ON rpp.recContratoId = cr.recContratoId
INNER JOIN contratosProduccion cp ON cp.prodContratoId = rpp.prodContratoId