/* Vista: VW_MUNICIPIOS
 * Descripcion vista: Lista de los municipios con sus respectivos departamentos
 *
 * Datos de Salida: idMunicipio, Municipio, idDepartamento, Departamento
 *
*/
CREATE OR ALTER VIEW VW_MUNICIPIOS
AS SELECT
	M.idMunicipio AS idMunicipio
	, M.descripcion AS Municipio
	, D.idDepartamento AS idDepartamento
	, D.descripcion AS Departamento
FROM Municipio M
INNER JOIN Departamento D ON M.Departamento_idDepartamento = D.idDepartamento
