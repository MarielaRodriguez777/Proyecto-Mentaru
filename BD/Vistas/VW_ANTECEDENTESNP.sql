/* Vista: VW_ANTECEDENTESNP
 * Descripcion vista: Obtiene todos los antecedentes no patologicos del paciente
 *
 * Datos de Salida: idNoPatologia, nombreNoPatologia
 *
*/
CREATE OR ALTER VIEW VW_ANTECEDENTESNP
AS SELECT
	T1.campo1 AS alias1
	, T1.campo2 AS alias2
	, T1.campo3 AS alias3
FROM nombreTabla T1
--INNER JOIN...
--WHERE T1.campo1 = @condicion1