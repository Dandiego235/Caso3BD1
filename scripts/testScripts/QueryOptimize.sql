/*
Obtener todos los productos vendidos exceptuando alguno, que fueron producidos bajo cierto contrato, 
donde participaba un productor seleccionado en el where, y en un rango de fechas. Obtener el dinero obtenido,
con base en los porcentajes venta.
*/

USE [evtest]

DECLARE @startdate DATETIME, @enddate DATETIME;

SET @startdate = '2022-01-01 00:00:00'
SET @enddate = getDATE()

SELECT items.itemProdId, items.cantidadProductos, productores.productorId, productores.nombre, productos.productoId, nombres.nombreBase, SUM(items.cantidadProductos) cantidadProductosTotal, 
SUM(items.montoTotal * porcentajes.porcentaje) dineroProductor
FROM itemsProductos items
INNER JOIN lotesProduccionLogs lpl ON items.loteId = lpl.loteId
INNER JOIN productos ON productos.productoId = lpl.productoId
INNER JOIN contratosProduccion contProd ON contProd.prodContratoId = lpl.prodContratoId
INNER JOIN actoresContratoProd actores ON actores.prodContratoId = contProd.prodContratoId
INNER JOIN porcentajesActores porcentajes ON porcentajes.actorId = actores.actorId
RIGHT JOIN productores ON productores.productorId = actores.genericId
INNER JOIN nombres ON productos.nombreId = nombres.nombreId
WHERE items.fecha BETWEEN @startdate AND @enddate AND
productores.productorId = 1 AND
actores.objectTypeId = 7 AND
lpl.productoId NOT IN (2) AND
porcentajes.productoId = lpl.productoId
GROUP BY items.itemProdId, items.cantidadProductos, lpl.productoId, actores.genericId, productores.productorId, productores.nombre, productos.productoId, nombres.nombreBase
ORDER BY cantidadProductosTotal, dineroProductor

select * from lotesProduccionLogs WHERE loteId = 10005
