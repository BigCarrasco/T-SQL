use [BD_PEDIDO]
go

/*Consultas Usando Inner Join*/

-- INNER JOIN:
--1. Listado de montos totales por categoría de cada año “2019, 2020, 2021”

SELECT * FROM [dbo].[tb_categoria] a
SELECT * FROM [dbo].[tb_pedido] b
SELECT * FROM [dbo].[tb_detalle_pedido] c
SELECT * FROM [dbo].[tb_producto] d

SELECT
	  d.idCategoria as idCategoria
	  ,a.nombrecategoria, YEAR(b.FechaPedido) as [Fecha de pedido]
	  ,FORMAT(SUM(c.preciounidad * c.cantidad),'N0', 'en-US') as resultado
 
FROM [dbo].[tb_detalle_pedido] AS c 
INNER JOIN [dbo].[tb_producto] AS d ON c.idproducto = d.idproducto 
INNER JOIN [dbo].[tb_categoria] AS a ON a.idcategoria = d.idCategoria
INNER JOIN [dbo].[tb_pedido] AS b ON b.IdPedido = c.idpedido
WHERE YEAR(b.FechaPedido) IN (2019, 2020,2021)
GROUP BY d.idCategoria, a.nombrecategoria, YEAR(b.FechaPedido)
ORDER BY 1,2 ASC
 

--2. Listar los 5 primeros empleados que tengan más ventas en el mes de agosto del año 2019.


SELECT * FROM [dbo].[tb_pedido] AS A
SELECT * FROM [dbo].[tb_empleado] AS B
----------------------------------------------------------------------

SELECT TOP 5 WITH TIES B.IdEmpleado, B.Nombre, B.Apellidos, COUNT(*) AS CANTIDAD
FROM [dbo].[tb_pedido] AS A
INNER JOIN  [dbo].[tb_empleado] AS B ON A.IdEmpleado = B.IdEmpleado
WHERE MONTH(A.FechaPedido) = 8 AND YEAR(A.FechaPedido) = 2019
GROUP BY B.IdEmpleado ,B.Nombre, B.Apellidos
ORDER BY CANTIDAD desc
--------------------------------------
--3. Listar los montos totales vendidos por producto.

select a.idproducto, b.nombreProducto, SUM(a.preciounidad * a.cantidad) As MontoTotal
from tb_detalle_pedido a inner join tb_producto b 
on a.idproducto = b.idproducto
group by a.idproducto, b.nombreProducto
order by b.nombreProducto 

--4. Listar la suma total vendida del producto "Cerveza tibetana Barley" en el año 2020. 

select a.idproducto, b.nombreProducto, SUM(a.preciounidad * a.cantidad) As MontoTotal
from tb_detalle_pedido a inner join tb_producto b 
on a.idproducto = b.idproducto inner join tb_pedido c 
on a.idpedido = c.IdPedido
Where b.nombreProducto = 'Cerveza tibetana Barley'
and YEAR(c.FechaPedido) = 2020
group by a.idproducto, b.nombreProducto
order by b.nombreProducto 

--5. Listar el  precio promedio de los productos por categoría.

select A.idCategoria, b.nombrecategoria ,AVG(a.precioUnidad) As Promedio
from tb_producto a inner join tb_categoria b 
on a.idCategoria = b.idcategoria
group by A.idCategoria, b.nombrecategoria

--6. Listar la cantidad de pedidos por cliente.

SELECT a.IdCliente, a.Nombre_empresa , COUNT(1) aS cANTIDAD
FROM tb_cliente a inner join tb_pedido b
on a.IdCliente = b.IdCliente
group by  a.IdCliente, a.Nombre_empresa
ORDER BY 1 

--7. Mostrar solo los productos de los proveedores "Exotic Liquids" y "Tokyo Traders".

select a.idproducto, a.nombreProducto, b.nombre_empresa as Proveedor
from tb_producto a inner join tb_proveedor b
on a.idProveedor = b.idProveedor
where b.nombre_empresa in ('Exotic Liquids','Tokyo Traders')


--- Extra: Obten el precio total por pedido y el nombre del cliente del pedido

SELECT * FROM tb_categoria
SELECT * FROM tb_detalle_pedido as a
SELECT * FROM tb_pedido as b
SELECT * FROM tb_cliente as c

SELECT a.idpedido, SUM(a.preciounidad * a.cantidad) as [Total del pedido], c.nombre_empresa as [Nombre empresa]
FROM tb_detalle_pedido as a INNER JOIN tb_pedido as b 
ON a.idpedido = b.idPedido INNER JOIN tb_cliente as c
ON b.IdCliente = c.idCliente 
group by a.idpedido, c.Nombre_empresa
