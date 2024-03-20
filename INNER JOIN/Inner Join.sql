use [BD_PEDIDO]
go

/*Consultas Usando Inner Join*/

-- INNER JOIN:
--1. Listado de montos totales por categoría de cada año “2019, 2020, 2021”

SELECT c.idCategoria, d.nombrecategoria ,YEAR([FechaPedido]) as Anio ,SUM(a.preciounidad * cantidad) as MontoTotal
FROM tb_detalle_pedido a inner join [dbo].[tb_pedido] b
on a.idpedido = b.idpedido inner join tb_producto c 
on a.idproducto = c.idproducto inner join tb_categoria d 
on c.idCategoria = d.idcategoria
where YEAR([FechaPedido]) in (2019,2020,2021)
group by c.idCategoria, d.nombrecategoria , YEAR([FechaPedido])
order by 1, 2 asc 

--2. Listar los 5 primeros empleados que tengan más ventas en el mes de agosto del año 2019.

SELECT TOP 5 WITH TIES a.IdEmpleado, a.Nombre, a.Apellidos , COUNT(1) aS cANTIDAD
FROM tb_empleado a inner join tb_pedido b
on a.IdEmpleado = b.IdEmpleado
where YEAR(b.FechaPedido) = 2019 and MONTH(b.FechaPedido) = 8
group by a.IdEmpleado, a.Nombre, a.Apellidos
ORDER BY cANTIDAD  DESC

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
