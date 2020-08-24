/* Vista: VW_LASISTENCIA
 * Descripcion vista: Lista de los lugares de asistencia
 *
 * Datos de Salida: idLugarAsistencia, LugarAsistencia
 *
*/
CREATE OR ALTER VIEW VW_LASISTENCIA
AS SELECT
	la.idLugarAsistencia AS id
	, la.descripcion AS lugar
	FROM LugarAsistencia la
--INNER JOIN...
--WHERE T1.campo1 = @condicion1