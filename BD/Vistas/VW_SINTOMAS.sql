/* Vista: VW_SINTOMAS
 * Descripcion vista: lista de los sintomas
 *
 * Datos de Salida: idSintoma, descripcion, TipoSintomas_idTipoSintomas
 *
*/
CREATE OR ALTER VIEW VW_SINTOMAS
AS SELECT
	s.idSintoma AS id
	, s.descripcion AS sintoma
	, s.TipoSintomas_idTipoSintomas AS TipoDeSintoma
	
FROM Sintoma s
--INNER JOIN...
--WHERE T1.campo1 = @condicion1