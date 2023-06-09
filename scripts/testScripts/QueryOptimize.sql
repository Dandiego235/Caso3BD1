-----------------------------------------------------------
-- Autor: Daniel Granados y Diego Granados
-- Fecha: 04/30/2023
-- Descripcion: Se realiza la optimizaci�n del query
-----------------------------------------------------------

/*
Por cada factura, la cual se compone de �tems de venta de productos, obtener la cantidad total de los productos vendidos,
donde el tipo de producto no sea 2 ("colchon"),
que fueron producidos en un proceso donde particip� un productor (objectType = 7). 
Obtener el dinero correspondiente a cada productor en cada factura, con base en los porcentajes de ganancia y el monto de la venta.
El dinero se presenta en la moneda base
Se excluyen los resultados correspondientes al productor 5 (GGGames)
*/

-- V1
SET STATISTICS TIME ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 -- si la venta no involucra el producto 2.
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
EXCEPT
SELECT facturas.facturaId, facturas.fecha, productores.productorId, productores.nombre, SUM(items.cantidadProductos) cantidadProductosTotal, 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) dineroProductor
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND
actores.objectTypeId = 7 AND
porcentajes.productoId = lpl.productoId AND 
lpl.productoId != 2 AND
productores.productorId = 5 -- excluimos el productor 5
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME OFF; 
GO


-- V2: agregamos un nonclustered index en itemsProductos.fecha para que sea m�s f�cil extraer las fechas en el intervalo.

CREATE NONCLUSTERED INDEX IX_itemsProductos_fecha
ON itemsProductos (fecha);

/*
DROP INDEX [IX_itemsProductos_fecha] ON [dbo].[itemsProductos]
GO
*/

SET STATISTICS TIME ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 -- si la venta no involucra el producto 2.
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
EXCEPT
SELECT facturas.facturaId, facturas.fecha, productores.productorId, productores.nombre, SUM(items.cantidadProductos) cantidadProductosTotal, 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) dineroProductor
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND
actores.objectTypeId = 7 AND
porcentajes.productoId = lpl.productoId AND 
lpl.productoId != 2 AND
productores.productorId = 5 -- excluimos el productor 5
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME OFF;
GO

-- V3: agregamos un nonclustered index en itemsProductos.fecha para que sea m�s f�cil extraer las fechas en el intervalo.
--     Las columnas que ocupa en el output list se agregan como included columns

CREATE NONCLUSTERED INDEX IX_itemsProductos_fecha
ON itemsProductos (fecha)
INCLUDE (itemProdId, loteId, cantidadProductos, montoTotal, monedaId);

/*
DROP INDEX [IX_itemsProductos_fecha] ON [dbo].[itemsProductos]
GO
*/

SET STATISTICS TIME ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 -- si la venta no involucra el producto 2.
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
EXCEPT
SELECT facturas.facturaId, facturas.fecha, productores.productorId, productores.nombre, SUM(items.cantidadProductos) cantidadProductosTotal, 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) dineroProductor
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND
actores.objectTypeId = 7 AND
porcentajes.productoId = lpl.productoId AND 
lpl.productoId != 2 AND
productores.productorId = 5 -- excluimos el productor 5
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME OFF;
GO

-- V4: agregamos un NonClustered Index con Included Columns en itemsFactura.tipoItemId y
-- ponemos el output list (facturaId y itemId) como los included Columns.

CREATE NONCLUSTERED INDEX IX_itemsFactura_tipoItemId
ON itemsFactura (tipoItemId)
INCLUDE (facturaId, itemId)

/*
DROP INDEX [IX_itemsFactura_tipoItemId] ON [dbo].[itemsFactura]
GO
*/

SET STATISTICS TIME, IO ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 -- si la venta no involucra el producto 2.
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
EXCEPT
SELECT facturas.facturaId, facturas.fecha, productores.productorId, productores.nombre, SUM(items.cantidadProductos) cantidadProductosTotal, 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) dineroProductor
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND
actores.objectTypeId = 7 AND
porcentajes.productoId = lpl.productoId AND 
lpl.productoId != 2 AND
productores.productorId = 5 -- excluimos el productor 5
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO




-- V5: Analizar el query para ver si se pueden eliminar excepts/intersects por medio de una desigualdad/igualdad.

SET STATISTICS TIME, IO ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO


-- V6: Agregar un clustered index en itemsFactura en las columnas de facturaId y itemId para convertir un Hash Match en un Merge Join

CREATE CLUSTERED INDEX IX_itemsFactura_facturaIdItemId
ON itemsFactura (facturaId ASC, itemId ASC)

/*
DROP INDEX [IX_itemsFactura_facturaIdItemId] ON [dbo].[itemsFactura] WITH ( ONLINE = OFF )
GO
*/


SET STATISTICS TIME, IO ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO



-- V7: Se agrega un �ndice en productoid y prodContratoId en la tabla lotesProduccionLogs para convertir un Clustered index scan a un Index Seek NonClustered
CREATE NONCLUSTERED INDEX IX_lotesProduccionLogs_productoIdcontratoId
ON lotesProduccionLogs (productoId, prodContratoId)
INCLUDE (loteId)

/*
DROP INDEX [IX_lotesProduccionLogs_productoIdcontratoId] ON [dbo].[lotesProduccionLogs]
GO
*/


SET STATISTICS TIME, IO ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO

-- V8: Se agrega un �ndice en objectTypeId en actoresContratoProd para pasarlo de un clustered index scan a un index seek

CREATE NONCLUSTERED INDEX IX_actoresContratoProd_objectTypeId
ON actoresContratoProd (objectTypeId)
INCLUDE (prodContratoId, actorId, genericId)

/*
DROP INDEX [IX_actoresContratoProd_objectTypeId] ON [dbo].[actoresContratoProd]
GO
*/


SET STATISTICS TIME, IO ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO

-- V9: Se agrega un �ndice en objectTypeId en actoresContratoProd para pasarlo de un clustered index scan a un index scan (Nonclustered)
--     y generar un merge join

CREATE NONCLUSTERED INDEX IX_porcentajesActores_actorId
ON porcentajesActores (actorId)
INCLUDE (porcentaje, productoId)

/*
DROP INDEX [IX_porcentajesActores_actorId] ON [dbo].[porcentajesActores]
GO
*/

SET STATISTICS TIME, IO ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO

-- Comparaci�n inicio-final

-- Inicio
SET STATISTICS TIME,IO ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 -- si la venta no involucra el producto 2.
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
EXCEPT
SELECT facturas.facturaId, facturas.fecha, productores.productorId, productores.nombre, SUM(items.cantidadProductos) cantidadProductosTotal, 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) dineroProductor
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND
actores.objectTypeId = 7 AND
porcentajes.productoId = lpl.productoId AND 
lpl.productoId != 2 AND
productores.productorId = 5 -- excluimos el productor 5
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF; 
GO

-- V3
CREATE NONCLUSTERED INDEX IX_itemsProductos_fecha
ON itemsProductos (fecha)
INCLUDE (itemProdId, loteId, cantidadProductos, montoTotal, monedaId);

-- V4
CREATE NONCLUSTERED INDEX IX_itemsFactura_tipoItemId
ON itemsFactura (tipoItemId)
INCLUDE (facturaId, itemId)

-- V6
CREATE CLUSTERED INDEX IX_itemsFactura_facturaIdItemId
ON itemsFactura (facturaId ASC, itemId ASC)

-- V7
CREATE NONCLUSTERED INDEX IX_lotesProduccionLogs_productoIdcontratoId
ON lotesProduccionLogs (productoId, prodContratoId)
INCLUDE (loteId)

-- V8
CREATE NONCLUSTERED INDEX IX_actoresContratoProd_objectTypeId
ON actoresContratoProd (objectTypeId)
INCLUDE (prodContratoId, actorId, genericId)

-- V9
CREATE NONCLUSTERED INDEX IX_porcentajesActores_actorId
ON porcentajesActores (actorId)
INCLUDE (porcentaje, productoId)

/*
DROP INDEX [IX_itemsProductos_fecha] ON [dbo].[itemsProductos]
GO

DROP INDEX [IX_itemsFactura_tipoItemId] ON [dbo].[itemsFactura]
GO

DROP INDEX [IX_itemsFactura_facturaIdItemId] ON [dbo].[itemsFactura] WITH ( ONLINE = OFF )
GO

DROP INDEX [IX_lotesProduccionLogs_productoIdcontratoId] ON [dbo].[lotesProduccionLogs]
GO

DROP INDEX [IX_actoresContratoProd_objectTypeId] ON [dbo].[actoresContratoProd]
GO

DROP INDEX [IX_porcentajesActores_actorId] ON [dbo].[porcentajesActores]
GO
*/

SET STATISTICS TIME, IO ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id], actores.genericId
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO

-- CTE encapsulada

SET STATISTICS TIME, IO ON;
GO

WITH cteQuery ([Factura.Id], [Factura.Fecha], [Productor.Id], [Productor.Nombre], [Productor.CantidadProductosTotal],
[Productor.DineroTotalProductor]) AS 
(
	SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
	productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
	SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
	SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
	FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
	INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
	INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
	INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
	INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
	INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
	RIGHT JOIN productores ON productores.productorId = actores.genericId
	INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
	WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
	itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
	actores.objectTypeId = 7 AND -- si el actor es un productor
	porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
	lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
	productores.productorId != 5 -- se sustitye el except por una desigualdad
	GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
)
SELECT * FROM cteQuery
	ORDER BY [Factura.Id]
	FOR JSON PATH, ROOT ('Facturas')

SET STATISTICS TIME, IO OFF;
GO

-- CTE simplificada

SET STATISTICS TIME, IO ON;

WITH itemsProductosSort (itemProdId, loteId, cantidadProductos, montoTotal, monedaId) AS
(
	SELECT itemProdId, loteId, cantidadProductos, montoTotal, monedaId FROM itemsProductos
	WHERE fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE()
),
ventasFacturas (facturaId, itemId) AS
(
	SELECT facturaId, itemId FROM itemsFactura
	WHERE itemsFactura.tipoItemId = 3
),
lotesProductos (loteId, prodContratoId, productoId) AS 
(
	SELECT loteId, prodContratoId, productoId FROM lotesProduccionLogs
	WHERE lotesProduccionLogs.productoId != 2
),
actores (actorId, prodContratoId, genericId) AS
(
	SELECT actorId, prodContratoId, genericId FROM actoresContratoProd
	WHERE objectTypeId = 7 AND genericId != 5
)
SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(itemsProductosSort.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((itemsProductosSort.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor] 
FROM facturas 
INNER JOIN ventasFacturas ON ventasFacturas.facturaId = facturas.facturaId
INNER JOIN itemsProductosSort ON itemsProductosSort.itemProdId = ventasFacturas.itemId
INNER JOIN lotesProductos ON lotesProductos.loteId = itemsProductosSort.loteId
INNER JOIN contratosProduccion ON contratosProduccion.prodContratoId = lotesProductos.prodContratoId
INNER JOIN actores ON actores.prodContratoId = contratosProduccion.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
INNER JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = itemsProductosSort.monedaId
WHERE porcentajes.productoId = lotesProductos.productoId
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO

-- normal, para comparar
SET STATISTICS TIME, IO ON;

SELECT facturas.facturaId AS [Factura.Id], facturas.fecha AS [Factura.Fecha],
productores.productorId AS [Productor.Id], productores.nombre AS [Productor.Nombre], 
SUM(items.cantidadProductos) AS [Productor.CantidadProductosTotal], 
SUM((items.montoTotal/tiposDeCambio.conversion) * porcentajes.porcentaje / 100) AS [Productor.DineroTotalProductor]
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
WHERE items.fecha BETWEEN '2022-01-01 00:00:00' AND GETDATE() AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, particip� en la producci�n de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id], actores.genericId
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO