/* Vista: VW_ANTECEDENTESP
 * Descripcion vista: Obtiene todos los antecedentes patologicos del paciente
 *
 * Datos de Salida: idPatologia, nombrePatologia
 *
*/
CREATE OR ALTER VIEW VW_ANTECEDENTESP
AS SELECT
	p.idPatologia AS id
	, p.descripcion AS nombre
FROM Patologia p
--INNER JOIN...
--WHERE T1.campo1 = @condicion1