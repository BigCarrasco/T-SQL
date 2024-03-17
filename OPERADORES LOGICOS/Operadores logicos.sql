USE [BD_PEDIDO]
GO

/*Operadores Lógicos*/

--1. WHERE: Es utilizado para realizar filtros de registros de las tablas.

SELECT * 
FROM tb_cliente 
WHERE IdCliente = 1 

--2. BETWEEN: Intervalo de valores de un campo 

SELECT * 
FROM tb_cliente 
WHERE IdCliente between 1 and 10


--3. LIKE: Para comparar cadenas o realizar busquedas con patrones.

SELECT * 
FROM tb_cliente 
WHERE NombreContacto like 'A%'

SELECT * 
FROM tb_cliente 
WHERE NombreContacto like '[A-C]%'

SELECT * 
FROM tb_cliente 
WHERE NombreContacto like '%TA%'


--4. And: para agregar otro criterio de busqueda, Devuelve True si ambos elementos son True.

SELECT * 
FROM tb_cliente 
WHERE NombreContacto like '%TA%' AND Nombre_empresa LIKE '%Delícia%'

--5. Or: para agregar otro criterio de busqueda, Devuelve True si al menos un elemento es True.

SELECT * 
FROM tb_cliente 
WHERE NombreContacto like '%TA%' OR Nombre_empresa LIKE '%zzzzzzz%'

--6. IN: Para incluir valores a buscar.

SELECT * 
FROM tb_cliente 
WHERE IdCliente IN (1, 10 , 20, 23 , 30)

--7. Not: Devuelve el contrario, True si es Falso y viceversa.

SELECT * 
FROM tb_cliente  
where Not IdCliente IN (1,10)


--8. =, <, >, <=, >=, <> (comparación)

SELECT * 
FROM tb_cliente  
where IdCliente = 25 


SELECT * 
FROM tb_cliente  
where IdCliente > 25 

SELECT * 
FROM tb_cliente  
where IdCliente < 25 


SELECT * 
FROM tb_cliente  
where IdCliente >= 25 

SELECT * 
FROM tb_cliente  
where IdCliente <= 25 

SELECT * 
FROM tb_cliente  
where IdCliente <> 1


