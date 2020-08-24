-- <=== Pantalla ===>
/* Requisitos de las acciones:
 * ES_CONTAGIOSHN: @paccion
 * Salida mediante SELECT: idMunicipio, nombreMunicipio, idDepartamento, Departamento, totalContagios
 *
 * ES_SINTOMAS: @paccion
 * Salida mediante SELECT: idSintoma, nombreSintoma, idTipoSintoma, descripcionTipoSintoma, cantidadSintomas
 *
 * ES_TRATAMIENTOS: @paccion
 * Salida mediante SELECT: idTratamiento, nombreTratamiento, idLugarAsistencia, nombreLugarAsistencia, cantidadTratamientos
 *
 * ES_NOPATOLOGIA: @paccion
 * Salida mediante SELECT: idNoPatologia, descripicionNoPatologia, cantidadNoPatologia
 *
 * ES_PATOLOGIA: @paccion
 * Salida mediante SELECT: idPatologia, descripicionPatologia, cantidadPatologia
 *
*/
CREATE OR ALTER PROCEDURE SP_ES_GENERAL (
	-- Parametros de Entrada
	@paccion					VARCHAR(45),

	-- Parametros de Salida
	-- Codigo de mensaje
	@pcodigoMensaje				INT OUTPUT,
	@pmensaje 					VARCHAR(1000) OUTPUT

	-- Otros parametros de salida

) AS
BEGIN

	-- Establecer Valores
	SET @pcodigoMensaje=0;
	SET @pmensaje='';

	/* Funcionalidad: ES_CONTAGIOSHN
	 * Descripcion Funcionalidad: obtener las estadisticas generales sobre contagios a nivel nacional
	*/
	IF @paccion = 'ES_CONTAGIOSHN' BEGIN



		-- Accion del procedimiento
		SELECT mu.idMunicipio, mu.descripcion nombreMunicipio, dp.idDepartamento, dp.descripcion Departamento, SUM(cc.cantidadContagios) totalContagios FROM Municipio mu
		INNER JOIN Departamento dp ON mu.Departamento_idDepartamento = dp.idDepartamento
		INNER JOIN CronologiaContagios cc ON mu.idMunicipio = cc.Municipio_idMunicipio
		GROUP BY mu.idMunicipio, mu.descripcion, dp.idDepartamento, dp.descripcion;


		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;



	/* Funcionalidad: ES_SINTOMAS
	 * Descripcion Funcionalidad: obtener las estadisticas de los sintomas que presentan las personas encuestadas
	*/
	IF @paccion = 'ES_SINTOMAS' BEGIN



		-- Accion del procedimiento
		SELECT si.idSintoma, si.descripcion nombreSintoma, ts.idTipoSintoma, ts.descripcion, COUNT(ls.Sintoma_idSintoma) cantidadSintomas FROM Sintoma si
		INNER JOIN TipoSintoma ts ON si.TipoSintomas_idTipoSintomas = ts.idTipoSintoma
		INNER JOIN listaSintomas ls ON si.idSintoma = ls.Sintoma_idSintoma
		GROUP BY si.idSintoma, si.descripcion, ts.idTipoSintoma, ts.descripcion;


		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;



	/* Funcionalidad: ES_TRATAMIENTOS
	 * Descripcion Funcionalidad: obtener las estadisticas de los tratamientos que han tomado las personas que respondieron la encuesta
	*/
	IF @paccion = 'ES_TRATAMIENTOS' BEGIN



		-- Accion del procedimiento
		SELECT tr.idTratamiento, tr.descripcion nombreTratamiento, la.idLugarAsistencia, la.descripcion nombreLugarAsistencia, SUM(am.Tratamiento_idTratamiento) cantidadTratamientos FROM Tratamiento tr
		INNER JOIN AsistenciaMedica am ON tr.idTratamiento = am.Tratamiento_idTratamiento
		INNER JOIN LugarAsistencia la ON am.LugarAsistencia_idLugarAsistencia = la.idLugarAsistencia
		GROUP BY tr.idTratamiento, tr.descripcion, la.idLugarAsistencia, la.descripcion;


		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;



	/* Funcionalidad: ES_NOPATOLOGIA
	 * Descripcion Funcionalidad: obtener las estadisticas de los antecedentes no patologicos de las personas encuestadas
	*/
	IF @paccion = 'ES_NOPATOLOGIA' BEGIN



		-- Accion del procedimiento
		SELECT np.idNoPatologia, np.descripcion descripcionNoPatologia, SUM(ln.NoPatologia_idNoPatologia) cantidadNoPatologia FROM NoPatologia np
		INNER JOIN ListaAntecedentesNP ln ON NP.idNoPatologia = ln.NoPatologia_idNoPatologia
		GROUP BY np.idNoPatologia, np.descripcion;


		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;



	/* Funcionalidad: ES_PATOLOGIA
	 * Descripcion Funcionalidad: obtener las estadisticas de los antecedentes patologicos de las personas que respondieron la encuesta
	*/
	IF @paccion = 'ES_PATOLOGIA' BEGIN



		-- Accion del procedimiento
		SELECT p.idPatologia, p.descripcion descripcionPatologia, SUM(lp.Patologia_idPatologia) cantidadPatologia FROM Patologia p
		INNER JOIN ListaAntecedentesP lp ON p.idPatologia = lp.Patologia_idPatologia
		GROUP BY p.idPatologia, p.descripcion;


		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;

	-- En caso de no elegir una accion
	IF @pmensaje = '' BEGIN
		SET @pcodigoMensaje = 3;
		SET @pmensaje = 'Error: No se definio la accion a realizar ' + @pmensaje;
	END;
END
