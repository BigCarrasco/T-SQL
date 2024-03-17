USE BD_PEDIDO
GO

/* DML: 

	Las consultas SQL de tipo DDL (Data definition Language ó Lenguaje de definición de datos)
	son las consultas SQL para:
	*Create: Crear un objeto (Tabla, Procedimiento, Función, etc.)
	*Alter: Alterar o Recompilar un objeto (Tabla, Procedimiento, Función, etc.)
	*Truncate: Eliminar toda la información de una tabla. 
	*Drop: Eliminar un Objeto (BD, Tabla, Procedimiento, Función, etc.)

	Revoke: revocar o quitar los privilegios de un usuario o rol de la base de datos.
	Grant: 	Conceder privilegios, roles, a un usuario o a otro rol.
*/

Create Table TB_EJEMPLO(
ID INT IDENTITY PRIMARY KEY,
DESCRIPCION VARCHAR(100)
);

INSERT INTO TB_EJEMPLO 
(DESCRIPCION) 
VALUES ('EJEMPLO 1'), ('EJEMPLO 2');

SELECT * 
FROM TB_EJEMPLO

/*USO DE ALTER */
ALTER TABLE TB_EJEMPLO
ADD ESTADO BIT 

ALTER TABLE TB_EJEMPLO
ALTER COLUMN ESTADO VARCHAR(2)

/*USO DE TRUNCATE*/

DELETE FROM TB_EJEMPLO -- ( Un delete borra los registros conservando memoria, ademas de eso conserva el ultimo ID registrado pero no las columnas)

TRUNCATE TABLE TB_EJEMPLO -- (A diferencia de un delete, el truncate borra la memoria y por lo tanto el ultimo numero del consecutivo ID pero no las columnas)

/*USO DE DROP */

DROP TABLE IF EXISTS TB_EJEMPLO -- (Borra la tabla, la columna, los registros y la memoria)








