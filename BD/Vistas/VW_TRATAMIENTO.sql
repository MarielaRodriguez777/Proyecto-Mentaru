/* Vista: VW_TRATAMIENTOS
 * Descripcion vista: Lista de Tratamientos
 *
 * Datos de Salida: idTratamiento, Tratamiento
 *
*/
CREATE OR ALTER VIEW VW_TRATAMIENTOS
AS SELECT
	t.idTratamiento AS idTratamiento
	, t.descripcion AS nombreTratamiento
FROM Tratamiento t
--INNER JOIN...
--WHERE T1.campo1 = @condicion1