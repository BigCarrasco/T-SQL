use [BD_PEDIDO]
go

/*Consultas Básicas.*/

--1. Listar clientes que vivan en españa y ordenarlos por nombre de manera descendente.

SELECT *
FROM tb_cliente c
WHERE c.Pais = 'España' 
order by c.NombreContacto desc 

--2. Listar los nombres de los clientes en mayúsculas, para los nombres que empiecen con la letra A.

select UPPER(c.NombreContacto)
from tb_cliente c 
WHERE c.NombreContacto LIKE 'A%'

--3. Listar los pedidos que fueron entregados de 15 días despues de la fecha de envio.

SELECT *
FROM tb_pedido 
WHERE DATEDIFF(DAY,[FechaEnvio],[FechaEntrega]) > 15

--4. Listar los productos cuyo precio este entre 30 y 50

select *
from tb_producto p 
where p.precioUnidad between 30 and 50

--5. Listar todos los empleados que no tengan un sueldo básico registrado.

select * 
from tb_empleado 
where isnull(sueldoBasico,0) = 0 -- convierte los null a ceros y si es 0 lo deja en 0

--6. Listar todos los proveedores que sean de Estados Unidos o Reino Unido.

select *
from tb_proveedor p 
where p.pais in ('Estados Unidos','Reino Unido')

--7. Listar el nombre de contacto del proveedor que tenga cargo de gerente.

select * 
from tb_proveedor
where cargocontacto like '%Gerente%' or  cargocontacto like '%Ger.%'


--8. Listar los empleados que sus nombres empiecen con cualquiera de las letras a,b,c

select *
from tb_empleado e
where e.Nombre like '[A-C]%'



 
