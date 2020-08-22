/* Vista: VW_LASISTENCIA
 * Descripcion vista: Lista de los lugares de asistencia
 *
 * Datos de Salida: idLugarAsistencia, LugarAsistencia
 *
*/
CREATE OR ALTER VIEW VW_LASISTENCIA
AS SELECT
	T1.campo1 AS alias1
	, T1.campo2 AS alias2
	, T1.campo3 AS alias3
FROM nombreTabla T1
--INNER JOIN...
--WHERE T1.campo1 = @condicion1