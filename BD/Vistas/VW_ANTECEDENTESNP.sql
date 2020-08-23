/* Vista: VW_ANTECEDENTESNP
 * Descripcion vista: Obtiene todos los antecedentes no patologicos del paciente
 *
 * Datos de Salida: idNoPatologia, nombreNoPatologia
 *
*/
CREATE OR ALTER VIEW VW_ANTECEDENTESNP
AS SELECT
	n.idNoPatologia AS id
	, n.descripcion AS nombreNoPatologia
FROM NoPatologia n
--INNER JOIN...
--WHERE T1.campo1 = @condicion1