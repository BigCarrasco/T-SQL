
/*Funciones de Fecha*/ 
/*
GETDATE():	Devuelve la fecha y la hora actual
DATEPART():	Devuelve una sola parte de una fecha / hora
DATENAME(): Devuelve el nombre de una parte de la fecha
DATEADD():	Suma o resta un intervalo de tiempo especificado desde una fecha
DATEDIFF():	Devuelve el tiempo entre dos fechas
CONVERT():	Muestra datos de fecha / hora en formatos diferentes
*/
 
SELECT GETDATE() ;

SELECT	 DATEPART(year, GETDATE())   as Anio
		,DATEPART(month, GETDATE())   as mes
		,DATEPART(day, GETDATE())  as día
		,DATEPART(dayofyear, GETDATE())   as [día del anio]
		,DATEPART(weekday, GETDATE())   as [Numero Dia de Semana]


SET LANGUAGE SPANISH -- Por si la fecha de mi IDE esta en ingles
SELECT  DATENAME(MONTH,getdate()) as [Nombre Mes],
		DATENAME(WEEKDAY,getdate()) as [Nombre día]


SELECT GETDATE() FECHA_ACTUAL,
	 DATEADD(MM,-4,GETDATE())	As [Fecha Hace 4 Meses],	---MONTH
	 DATEADD(Q,-2,GETDATE())	 AS [Hace 2 Trimestres],	---QUARTER
	 DATEADD(YYYY,-5,GETDATE()) as [Hace 5 Años]	---YEAR


	DECLARE @start_dt DATETIME,  @end_dt DATETIME
	SET @start_dt = '2020-03-10 00:43:57.370'
	SET @end_dt = GETDATE() 

SELECT 
    DATEDIFF(year, @start_dt, @end_dt) as [diferencia en años], 
    DATEDIFF(quarter, @start_dt, @end_dt) as [diferencia en quarter], 
    DATEDIFF(month, @start_dt, @end_dt) as [diferencia en mes], 
    DATEDIFF(dayofyear, @start_dt, @end_dt) as [diferencia en años], 
    DATEDIFF(day, @start_dt, @end_dt) as [diferencia en dia], 
    DATEDIFF(week, @start_dt, @end_dt) as [diferencia en semana], 
    DATEDIFF(hour, @start_dt, @end_dt) as [diferencia en hora], 
    DATEDIFF(minute, @start_dt, @end_dt) as [diferencia en minutos], 
    DATEDIFF(second, @start_dt, @end_dt) as [diferencia en segundos];
 
SELECT CONVERT(varchar, GETDATE(), 13) 

-- AQUI ABAJO SOLO ES UN EJEMPLO DE COMO PROGRAMAR CODIGO EN SQL Y ACERCA DE TODAS LAS FORMAS DE VER FECHAS
DECLARE @Contador INT = 0
DECLARE @Fecha DATETIME = getdate()

drop table if exists #ListaFormat
CREATE TABLE #ListaFormat (OpcionFormato int, FechaResult nvarchar(40))

WHILE (@Contador <= 150 )
BEGIN
   BEGIN TRY
      INSERT INTO #ListaFormat
	  (OpcionFormato, FechaResult)
      SELECT CONVERT(Nvarchar, @Contador), CONVERT(Nvarchar,@Fecha, @Contador) 
      SET @Contador = @Contador + 1
   END TRY
   BEGIN CATCH;
   PRINT '...'
      SET @Contador = @Contador + 1
      IF @Contador >= 150
      BEGIN
         BREAK
      END
   END CATCH
END

SELECT * FROM #ListaFormat


 