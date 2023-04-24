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
		SELECT locales.productorId, (costosPasoRecoleccion.costoRec + costosPasoRecoleccion.costoTrato + costosPasoRecoleccion.comisionEV) as total, camiones.recolectorId, costosPasoRecoleccion.costoRec, costosPasoRecoleccion.costoTrato, 
		costosPasoRecoleccion.comisionEV, v.viajeId, '2023-04-24 00:00:00', 
		(CASE 
			WHEN (costosPasoRecoleccion.costoRec + costosPasoRecoleccion.costoTrato + costosPasoRecoleccion.comisionEV) * > saldosDistribucion.montoSaldo THEN saldos.Distribucion.montoSaldo
			ELSE costosPasoRecoleccion.costoRec + costosPasoRecoleccion.costoTrato + costosPasoRecoleccion.comisionEV
		END )
		FROM @viajes v
		INNER JOIN viajesRecoleccion ON viajesRecoleccion.viajeId = v.viajeId
		INNER JOIN locales ON locales.localId = viajesRecoleccion.localId
		INNER JOIN camiones ON camiones.camionId = viajesRecoleccion.camionId
		INNER JOIN costosPasoRecoleccion ON viajesRecoleccion.recPasoId = costosPasoRecoleccion.recPasoId
		INNER JOIN saldosDistribucion ON viajesRecoleccion.localId = saldosDistribucion.localId
		INNER JOIN tiposDeCambio tCC ON costosPasoRecoleccion.monedaId = tCC.monedaCambioId


1, -- Example value for [productorId]
100.50, -- Example value for [montoTotal]
2, -- Example value for [recolectorId]
80.25, -- Example value for [montoRec]
10.50, -- Example value for [montoTrato]
5.25, -- Example value for [montoComisionEV]
3, -- Example value for [viajeId]
, -- Example value for [fechaFactura]
0, -- Example value for [descuentoSaldo]
85.50, -- Example value for [montoAPagar]
1, -- Example value for [enabled]
'2023-04-24 10:00:00', -- Example value for [createdAt]
'ComputerName', -- Example value for [computer]
'UserName', -- Example value for [username]
0x0123456789ABCDEF -- Example value for [checksum]
);
		
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