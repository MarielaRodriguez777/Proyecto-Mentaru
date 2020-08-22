/* Vista: VW_LABORATORIOS
 * Descripcion vista: Lista de laboratorios
 *
 * Datos de Salida: idLaboratorio, codigoLaboratorio, nombreLaboratorio
 *
*/
CREATE OR ALTER VIEW VW_LABORATORIOS
AS SELECT
	T1.campo1 AS alias1
	, T1.campo2 AS alias2
	, T1.campo3 AS alias3
FROM nombreTabla T1
--INNER JOIN...
--WHERE T1.campo1 = @condicion1