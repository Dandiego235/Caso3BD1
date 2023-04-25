-----------------------------------------------------------
-- Autor: Rnunez
-- Fecha: 4/23/2023
-- Descripción: 
-----------------------------------------------------------

CREATE TYPE viajesTabla
	AS TABLE
		(viajeId INT);
GO

CREATE PROCEDURE [dbo].[SP_registrarFacturaRecoleccion]
	@viajes [dbo].[viajesTabla] READONLY
AS 
BEGIN
	
	SET NOCOUNT ON -- no retorne metadatos
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables

	-- operaciones de select que no tengan que ser bloqueadas
	-- tratar de hacer todo lo posible antes de q inicie la transaccion
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001
		-- put your code here
		INSERT INTO [dbo].[itemsRecoleccion] ([productorId], [montoTotal], [recolectorId], [montoRec], [montoTrato], 
		[montoComisionEV],[viajeId],[fechaFactura], [descuentoSaldo], [montoAPagar], [enabled], [createdAt], [computer],[username],[checksum])
		SELECT locales.productorId, (costosPasoRecoleccion.costoRec + costosPasoRecoleccion.costoTrato + costosPasoRecoleccion.comisionEV) * tCC.conversion as total, camiones.recolectorId, costosPasoRecoleccion.costoRec, costosPasoRecoleccion.costoTrato, 
		costosPasoRecoleccion.comisionEV, v.viajeId, '2023-04-24 00:00:00', 
		(CASE 
			WHEN (costosPasoRecoleccion.costoRec + costosPasoRecoleccion.costoTrato + costosPasoRecoleccion.comisionEV) * tCC.conversion > saldosDistribucion.montoSaldo * tcs.conversion THEN saldosDistribucion.montoSaldo * tCS.conversion
			ELSE (costosPasoRecoleccion.costoRec + costosPasoRecoleccion.costoTrato + costosPasoRecoleccion.comisionEV) * tCC.conversion
		END ) AS descuento,(costosPasoRecoleccion.costoRec + costosPasoRecoleccion.costoTrato + costosPasoRecoleccion.comisionEV) * tCC.conversion - (CASE 
			WHEN (costosPasoRecoleccion.costoRec + costosPasoRecoleccion.costoTrato + costosPasoRecoleccion.comisionEV) * tCC.conversion > saldosDistribucion.montoSaldo * tcs.conversion THEN saldosDistribucion.montoSaldo * tCS.conversion
			ELSE (costosPasoRecoleccion.costoRec + costosPasoRecoleccion.costoTrato + costosPasoRecoleccion.comisionEV) * tCC.conversion
		END ) as montoAPagar, 1, '2023-04-24 10:00:00', 'ComputerName', 'Username', 0x0123456789ABCDEF 
		FROM @viajes v
		INNER JOIN viajesRecoleccion ON viajesRecoleccion.viajeId = v.viajeId
		INNER JOIN locales ON locales.localId = viajesRecoleccion.localId
		INNER JOIN camiones ON camiones.camionId = viajesRecoleccion.camionId
		INNER JOIN costosPasoRecoleccion ON viajesRecoleccion.recPasoId = costosPasoRecoleccion.recPasoId
		INNER JOIN saldosDistribucion ON viajesRecoleccion.localId = saldosDistribucion.localId
		INNER JOIN tiposDeCambio tCC ON costosPasoRecoleccion.monedaId = tCC.monedaCambioId
		INNER JOIN tiposDeCambio tCS ON saldosDistribucion.monedaId = tCS.monedaCambioId
		INNER JOIN direcciones ON locales.direccionId = direcciones.direccionId
		INNER JOIN ciudades ON direcciones.ciudadId = ciudades.ciudadId
		INNER JOIN estados ON estados.estadoId = ciudades.estadoId
		INNER JOIN paises ON estados.paisId = paises.paisId
		WHERE costosPasoRecoleccion.areaEfectoId = (CASE 
			WHEN costosPasoRecoleccion.objectTypeId = 1 THEN locales.direccionId
			WHEN costosPasoRecoleccion.objectTypeId = 2 THEN direcciones.ciudadId
			WHEN costosPasoRecoleccion.objectTypeId = 3 THEN ciudades.estadoId
			WHEN costosPasoRecoleccion.objectTypeId = 4 THEN estados.paisId
			ELSE
			CASE 
				WHEN (SELECT direccionId FROM elementosPorRegion WHERE elementosPorRegion.regionId = costosPasoRecoleccion.areaEfectoId AND elementosPorRegion.direccionId = locales.direccionId) IS NOT NULL THEN costosPasoRecoleccion.areaEfectoId
				WHEN (SELECT ciudadId FROM elementosPorRegion WHERE elementosPorRegion.regionId = costosPasoRecoleccion.areaEfectoId AND elementosPorRegion.ciudadId = direcciones.ciudadId) IS NOT NULL THEN costosPasoRecoleccion.areaEfectoId
				WHEN (SELECT estadoId FROM elementosPorRegion WHERE elementosPorRegion.regionId = costosPasoRecoleccion.areaEfectoId AND elementosPorRegion.estadoId = ciudades.estadoId) IS NOT NULL THEN costosPasoRecoleccion.areaEfectoId
				WHEN (SELECT paisId FROM elementosPorRegion WHERE elementosPorRegion.regionId = costosPasoRecoleccion.areaEfectoId AND elementosPorRegion.paisId = estados.paisId) IS NOT NULL THEN costosPasoRecoleccion.areaEfectoId
				ELSE NULL
			END

		END);

		
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError)
	END CATCH	
END
RETURN 0
GO