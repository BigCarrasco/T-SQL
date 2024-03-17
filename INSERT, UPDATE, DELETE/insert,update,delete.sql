/*USO INSERT*/ 
--1. Insertar una nuea empresa de envio, considerar la empresa DHL.

SELECT * FROM [tb_empresa_envio]

-- Haremos una función en donde siempre me de el ultimo id del pedido para poder usarlo despues dentro de 
-- una variable.
DECLARE @IdEmpresaEnvio_Max int
Set @IdEmpresaEnvio_Max = (Select Max(idEmpresaenvio) from [tb_empresa_envio]) + 1
-- //INVOCAR LA VARIABLE // SELECT @IdEmpresaEnvio_Max
-- iNSERTAR UN NUEVO REGISTRO CON LA VARIABLE PARA CON LA VIARBLE PONER EL NUMERO DE ID EN EL QUE VA 
-- (Esta sentencia se debe ejecutar sola
INSERT INTO [dbo].[tb_empresa_envio]
(idEmpresaEnvio, nombre_empresa, telefono)
VALUES (@IdEmpresaEnvio_Max, 'DHL',' 5030');



-- /* USO UPDATE */
-- 2. Actualizar la empresa de envio "DHL" a "DHL SAC"

UPDATE A
SET nombre_empresa = 'DHL SAC'
--SELECT * 
FROM tb_empresa_envio  A 
WHERE nombre_empresa = 'DHL'

-- /* USO DELETE */
-- 3.Eliminar la empresa de envio "DHL SAC".
DELETE FROM [tb_empresa_envio] WHERE nombre_empresa = 'DHL SAC'


