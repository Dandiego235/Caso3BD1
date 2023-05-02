




















/*
Por cada factura, la cual se compone de ítemes de venta de productos, obtener la cantidad total de los productos vendidos,
exceptuando el tipo de producto 2 "colchón",
que fueron producidos en un proceso donde participó un productor. 
Obtener el dinero correspondiente a cada productor en cada factura, con base en los porcentajes de ganancia y el monto de la venta.
El dinero se presenta en la moneda base
Se excluyen los resultados correspondientes
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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
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


-- V2: agregamos un nonclustered index en itemsProductos.fecha para que sea más fácil extraer las fechas en el intervalo.

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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
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

-- V3: agregamos un nonclustered index en itemsProductos.fecha para que sea más fácil extraer las fechas en el intervalo.
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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
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




-- V5: Analizar el query para ver si se pueden eliminar excepts/intersects por medio de una desigualdad/igualdad.

SET STATISTICS TIME ON;
SET STATISTICS IO ON;

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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;
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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO



-- V7: Se agrega un índice en productoid y prodContratoId en la tabla lotesProduccionLogs para convertir un Clustered index scan a un Index Seek NonClustered
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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO

-- V8: Se agrega un índice en objectTypeId en actoresContratoProd para pasarlo de un clustered index scan a un index seek

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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO

-- V9: Se agrega un índice en objectTypeId en actoresContratoProd para pasarlo de un clustered index scan a un index scan (Nonclustered)
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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO

-- Comparación inicio-final

-- Inicio
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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
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
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
lpl.productoId != 2 AND-- si la venta no involucra el producto 2.
productores.productorId != 5 -- se sustitye el except por una desigualdad
GROUP BY facturas.facturaId, facturas.fecha, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id], actores.genericId
FOR JSON PATH, ROOT ('Facturas');

SET STATISTICS TIME, IO OFF;
GO

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



-- CTE

SET STATISTICS TIME ON;

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

SET STATISTICS TIME OFF;
GO
/*
USE [evtest]

DECLARE @startdate DATETIME, @enddate DATETIME;

SET @startdate = '2022-01-01 00:00:00'
SET @enddate = getDATE()

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
WHERE items.fecha BETWEEN @startdate AND @enddate AND
itemsFactura.tipoItemId = 3 AND -- si es un item de venta de producto
actores.objectTypeId = 7 AND -- si el actor es un productor
porcentajes.productoId = lpl.productoId AND -- si el actor tiene un porcentaje del producto, participó en la producción de ese producto
lpl.productoId != 2 -- si la venta no involucra el producto 2.
GROUP BY facturas.facturaId, facturas.fecha, lpl.productoId, actores.genericId, productores.productorId, productores.nombre
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
WHERE items.fecha BETWEEN @startdate AND @enddate AND
itemsFactura.tipoItemId = 3 AND
actores.objectTypeId = 7 AND
porcentajes.productoId = lpl.productoId AND 
lpl.productoId != 2 AND
productores.productorId = 5 -- excluimos el productor 5
GROUP BY facturas.facturaId, facturas.fecha, lpl.productoId, actores.genericId, productores.productorId, productores.nombre
ORDER BY [Factura.Id]
FOR JSON PATH, ROOT ('Facturas')

--,cantidadProductosTotal, dineroProductor;


-- select * from lotesProduccionLogs WHERE loteId = 10005

SELECT itemsFactura.facturaId, itemsFactura.itemId, itemsProductos.*, lpl.productoId FROM itemsFactura
INNER JOIN itemsProductos ON itemsFactura.itemId = itemsProductos.itemProdId
INNER JOIN lotesProduccionLogs lpl ON lpl.loteId = itemsProductos.loteId
WHERE itemsFactura.tipoItemId = 3
ORDER BY itemsFactura.facturaId

DECLARE @startdate DATETIME, @enddate DATETIME;

SET @startdate = '2022-01-01 00:00:00'
SET @enddate = getDATE()

SELECT facturas.facturaId, contProd.prodContratoId, items.itemProdId, items.cantidadProductos, items.loteId, actores.actorId, productores.productorId,
productores.nombre, actores.objectTypeId, lpl.productoId, porcentajes.productoId porcentajeProd, items.montoTotal, porcentajes.porcentaje, nombresMonedas.nombreBase,
tiposDeCambio.conversion, items.montoTotal / tiposDeCambio.conversion montoConvertido, items.montoTotal / tiposDeCambio.conversion * porcentajes.porcentaje / 100 finPerc
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
LEFT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN tiposDeCambio ON tiposDeCambio.monedaCambioId = items.monedaId
INNER JOIN monedas ON items.monedaId = monedas.monedaId
INNER JOIN nombres nombresMonedas ON monedas.nombreId = nombresMonedas.nombreId
WHERE items.fecha BETWEEN @startdate AND @enddate AND
itemsFactura.tipoItemId = 3 AND
actores.objectTypeId = 7 AND
lpl.productoId = porcentajes.productoId
ORDER BY facturas.facturaId, contProd.prodContratoId


SELECT contProd.prodContratoId, productores.productorId, productores.nombre, actores.objectTypeId
FROM contratosProduccion contProd
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
WHERE actores.objectTypeId = 7 AND
contProd.prodContratoId IN (80, 611, 913, 929)
ORDER BY contProd.prodContratoId

SELECT contratosProduccion.prodContratoId, actoresContratoProd.genericId, porcentajesActores.porcentajeId, porcentajesActores.porcentaje, porcentajesactores.productoId
FROM contratosProduccion INNER JOIN actoresContratoProd ON actoresContratoProd.prodContratoId = contratosProduccion.prodContratoId
INNER JOIN porcentajesActores ON actoresContratoProd.actorId = porcentajesActores.actorId
WHERE contratosProduccion.prodContratoId IN (145, 849)
AND actoresContratoProd.objectTypeId = 7


DECLARE @startdate DATETIME, @enddate DATETIME;

SET @startdate = '2022-01-01 00:00:00'
SET @enddate = getDATE()

SELECT facturas.facturaId, items.itemProdId, productores.productorId, productores.nombre, lpl.productoId, items.cantidadProductos, 
items.montoTotal * porcentajes.porcentaje / 100
FROM facturas LEFT JOIN itemsFactura ON facturas.facturaId = itemsFactura.facturaId
INNER JOIN itemsProductos items ON items.itemProdId = itemsFactura.itemId
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN productos ON productos.productoId = lpl.productoId
INNER JOIN nombres ON productos.nombreId = nombres.nombreId
WHERE items.fecha BETWEEN @startdate AND @enddate AND
itemsFactura.tipoItemId = 3 AND
actores.objectTypeId = 7 AND
porcentajes.productoId = lpl.productoId

ORDER BY facturaid --,cantidadProductosTotal, dineroProductor;

GROUP BY facturas.facturaId, lpl.productoId, actores.genericId, productores.productorId, productores.nombre, items

786 ggmaes
*/


/*
CREATE NONCLUSTERED INDEX IX_itemsFactura_tipoItemId
ON itemsFactura (tipoItemId)
INCLUDE (facturaId, itemId)
/*
DROP INDEX [IX_itemsFactura_tipoItemId] ON [dbo].[itemsFactura]
GO
*/


/*
Este parece no servir tan bien
CREATE NONCLUSTERED INDEX IX_itemsFactura_tipoItemIdFacturaId
ON itemsFactura (tipoItemId, facturaId)
INCLUDE (itemId)

DROP INDEX IX_itemsFactura_tipoItemIdFacturaId ON [dbo].[itemsFactura]
GO
*/


CREATE NONCLUSTERED INDEX IX_itemsProductos_fecha
ON itemsProductos (fecha)
INCLUDE (itemProdId, loteId, cantidadProductos, montoTotal, monedaId);

/*
DROP INDEX [IX_itemsProductos_fecha] ON [dbo].[itemsProductos]
GO
*/
*/