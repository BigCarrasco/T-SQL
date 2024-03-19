/*SubConsultas*/ --	Una subconsulta es una consulta anidada en una instrucción SELECT, INSERT, UPDATE o DELETE, o bien en otra subconsulta.--1. Listar los 3 primeros proveedores que tengan más productos.select * from tb_proveedorselect * from tb_productoSELECT idProveedor, COUNT(1) as cantidad_prodfrom tb_productogroup by idProveedororder by cantidad_prod desc--resultado de subconsulta:	select *	from tb_proveedor 	where idProveedor in (				select idProveedor				from (						select top 3 idProveedor, COUNT(1) as cantidad_prod						from tb_producto						group by idProveedor 						order by cantidad_prod desc )				as t )--2. Listar todos los pedidos del cliente "Familia Wang" realizados en el año 2020.

	select * 
	from tb_pedido
	where  YEAR(FechaPedido) = 2020
	and IdCliente in (
			select IdCliente
			from tb_cliente c
			where c.NombreContacto like '%Wang%' )  

--3. Mostrar el numero de empleado, Nombre,  el apellido y la fecha de alta del empleado mas antiguo de la empresa

select IdEmpleado, Nombre,  Apellidos, FechaContratacion
from tb_empleado 
where FechaContratacion = (
							select MIN (FechaContratacion)
							from tb_empleado 
							)


--4. Mostrar los productos más vendidos en el año 2019. 

set language spanish

select *
from tb_producto
where idproducto in (
					select idproducto 
					from (
							select top 3 idproducto, SUM(cantidad) as SumaCant
							from tb_detalle_pedido a inner join tb_pedido b
							on a.idpedido = b.IdPedido
							where YEAR(b.FechaPedido) = 2019
							group by idproducto
							order by SumaCant desc ) 
					as t  )

					-- Otra forma
select pr.idproducto, pr.nombreProducto, bb.SumaCant
from tb_producto pr inner join (
								select top 3 idproducto, SUM(cantidad) as SumaCant
								from tb_detalle_pedido a inner join tb_pedido b
								on a.idpedido = b.IdPedido
								where YEAR(b.FechaPedido) = 2019
								group by idproducto
								order by SumaCant desc ) bb 
on pr.idproducto = bb.idproducto
			 

--5. Visualizar el Nombre y apellido de los empleados con el mismo cargo que "Nancy Davolio".

select * 
from tb_empleado  
where cargo in (
				select cargo 
				from tb_empleado 
				where Nombre = 'Nancy' and Apellidos = 'Davolio' )


--6. Queremos saber el apellido, cargo, salario y dirección de los empleados con salario mayor que el mejor salario de los empleados.

SELECT *
FROM tb_empleado e
WHERE sueldoBasico >= (
						select MAX(sueldoBasico)
						from tb_empleado )

--7. Mostrar las 3 categorias con más productos.

select * 
from tb_categoria  
where idCategoria in (
						select idCategoria
						from (
								select top 3 with ties idCategoria, COUNT(1) cant -- El ties es para que pueda permitir identificar numeros que son igual y los saca del top 3
								from tb_producto
								group by idCategoria
								order by cant desc 
						) as t  )

--8. Mostrar los 3 proveedores con el promedio de precio de sus productos más altos.
 
 select *
 from tb_proveedor 
 where idProveedor in (
			 select idProveedor 
			 from (
					 select top 3 with ties idProveedor, AVG(precioUnidad) Prom
					 from tb_producto 
					 group by idProveedor
					 order by Prom desc ) 
					 as t )

