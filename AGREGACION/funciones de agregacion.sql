USE [BD_PEDIDO]
GO

/*Funciones de Agregaci�n*/
/*
AVG:	Devuelve el promedio de los valores en una columna.
COUNT:	Cuenta el n�mero de filas que contienen un valor que no sea nulo en una columna.
SUM:	Devuelve la suma de los valores de una determinada columna agrupada.
MAX:	Devuelve el valor m�ximo de una determinada columna agrupada.
MIN:	Devuelve el valor m�nimo de una determinada columna agrupada.
*/

/*AVG*/
-- 1. Mostrar el precio promedio de todos los productos.

SELECT CAST(round(AVG(precioUnidad),2) AS DECIMAL(18,2)) FROM tb_producto

/*COUNT*/
-- 2. Mostrar la cantidad de productos por categoria.

select COUNT(1)
from tb_producto
 
select idCategoria, COUNT(1)
from tb_producto
group by idCategoria

/*SUM*/
-- 3. Mostrar el monto vendido del a�o 2020. 

select SUM(b.preciounidad * b.cantidad)
from tb_pedido a inner join tb_detalle_pedido b
on a.IdPedido = b.idpedido 
where YEAR(a.FechaPedido) = 2020

/*MAX*/
-- 4. Mostrar el precio m�s alto de un producto. 

select MAX(precioUnidad) 
from tb_producto 

select * from tb_producto


/*MIN*/
-- 5. Mostrar el precio m�s bajo de un producto.

select min(precioUnidad) 
from tb_producto 
 

select top 1  precioUnidad 
from tb_producto
order by precioUnidad desc 


/*
Otras Funciones:  
https://docs.microsoft.com/en-us/sql/t-sql/functions/aggregate-functions-transact-sql?view=sql-server-ver15
APPROX_COUNT_DISTINCT
CHECKSUM_AGG
COUNT_BIG
GROUPING
GROUPING_ID
STDEV
STDEVP
STRING_AGG
VAR
VARP
*/