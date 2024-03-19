USE BD_PEDIDO
GO
 
/* Funciones de Texto  ---
LEFT: Extrae caracteres desde la izquierda.
RIGHT: Extrae caracteres desde la derecha. 
LEN: Contabiliza los caracteres.
LOWER: Muestra en minúscula los textos.
UPPER: Muestra en mayúscula los textos. 
REPLACE: Reemplaza valores de Texto.
LTRIM: Quita Espacios vacios de la izquierda de un texto.
RTRIM: Quita Espacios vacios de la derecha de un texto. 
CONCAT: Cancatena cadenas de texto.
SUBSTRING: Extrae caracteres indicandole el inicio y longitud.
SPACE: Añade espacios a un texto.
TRIM: Elimina espacios de adelante y atrás del texto.
(Disponible en versión SQL Server 2017 (14.x) en adelante)
*/
 
DECLARE @NOMBRE VARCHAR(100)
SET @NOMBRE = 'JUAN pEREZ'

--SPACE: Añade espacios a un texto.
SELECT @NOMBRE + SPACE(1) + 'MORALES'

--SUBSTRING: Extrae caracteres indicandole el inicio y longitud.
SELECT SUBSTRING(@NOMBRE, 3, 5)

--CONCAT: Cancatena cadenas de texto.
SELECT CONCAT(@NOMBRE, ' MORALES', ' - JPM')

--RTRIM: Quita Espacios vacios de la derecha de un texto. 
SELECT RTRIM(@NOMBRE)

--LTRIM: Quita Espacios vacios de la izquierda de un texto.
SELECT LTRIM(@NOMBRE)

---REPLACE: Reemplaza valores de Texto.
SELECT REPLACE(REPLACE(@NOMBRE, ' ','-'),'p','P')

--UPPER: Muestra en mayúscula los textos. 
SELECT UPPER(@NOMBRE)

--LOWER: Muestra en minúscula los textos.
SELECT LOWER(@NOMBRE)

--LEN: Contabiliza los caracteres.
SELECT LEN(@NOMBRE)
--RIGHT: Extrae caracteres desde la derecha. 
SELECT RIGHT(@NOMBRE,5)
--LEFT: Extrae caracteres desde la izquierda.
SELECT LEFT(@NOMBRE,5)

/*
Otras funciones:
https://docs.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver15
*/

