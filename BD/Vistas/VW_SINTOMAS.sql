/* Vista: VW_SINTOMAS
 * Descripcion vista: lista de los sintomas
 *
 * Datos de Salida: idSintoma, descripcion, TipoSintomas_idTipoSintomas
 *
*/
CREATE OR ALTER VIEW VW_SINTOMAS
AS SELECT
	s.idSintoma AS idSintoma
	, s.descripcion AS nombreSintoma
	, s.TipoSintomas_idTipoSintomas AS idTipoSintoma
	, ts.descripcion as nombreTipoSintoma
FROM Sintoma s
inner join TipoSintoma ts on ts.idTipoSintoma = s.TipoSintomas_idTipoSintomas
--INNER JOIN...
--WHERE T1.campo1 = @condicion1