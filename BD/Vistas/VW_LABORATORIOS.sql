/* Vista: VW_LABORATORIOS
 * Descripcion vista: Lista de laboratorios
 *
 * Datos de Salida: idLaboratorio, codigoLaboratorio, nombreLaboratorio
 *
*/
CREATE OR ALTER VIEW VW_LABORATORIOS
AS SELECT
	la.idLaboratorio AS id
	, la.codigoLaboratio AS codigo
	, la.nombreLaboratorio AS nombre
FROM Laboratorio la
--INNER JOIN...
--WHERE T1.campo1 = @condicion1