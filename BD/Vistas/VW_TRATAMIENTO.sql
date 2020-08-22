/* Vista: VW_TRATAMIENTOS
 * Descripcion vista: Lista de Tratamientos
 *
 * Datos de Salida: idTratamiento, Tratamiento
 *
*/
CREATE OR ALTER VIEW VW_TRATAMIENTOS
AS SELECT
	T1.campo1 AS alias1
	, T1.campo2 AS alias2
	, T1.campo3 AS alias3
FROM nombreTabla T1
--INNER JOIN...
--WHERE T1.campo1 = @condicion1