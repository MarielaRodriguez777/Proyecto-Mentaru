-- <=== Encuesta ===>
/* Requisitos de las acciones:
 * Estas acciones no tienen la utltima validacion, por lo tanto no habrá un codigo numero 6.
 *
 * INSERT-ASISTENCIA: @pidPersona, @pidTratamiento, @pidLugarAsistencia, @pfecha
 * Nota: Se debe insertar los datos en la tabla AsistenciaMédica
*/
CREATE OR ALTER PROCEDURE SP_EN_TRATAMIENTO ( --Ejemplo: SP_GU_LOGIN: Procedimiento Almacenado, Modulo GestionUsuario, Procedimiento para el Login. Puede borrar este comentario.
	-- Parametros de Entrada
	@pidPersona					INT,
	@pidTratamiento				INT,
	@pidLugarAsistencia			INT,
	@pfecha						DATE,
	@paccion					VARCHAR(45),

	-- Parametros de Salida
	-- Codigo de mensaje
	@pcodigoMensaje				INT OUTPUT,
	@pmensaje 					VARCHAR(1000) OUTPUT

	-- Otros parametros de salida

) AS
BEGIN
	-- Declaracion de Variables
	DECLARE	@vconteo INT;
	DECLARE	@vIdEncuesta INT;

	-- Setear Valores
	SET @pcodigoMensaje=0;
	SET @pmensaje=NULL;	



	/* Funcionalidad: <nombre_funcionalidad>
	 * Descripcion Funcionalidad:
	*/
	IF @paccion = 'INSERT-ASISTENCIA' BEGIN


		-- Validacion de campos nulos
		IF @pidPersona = '' OR @pidPersona IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pidPersona ');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = CONCAT('Error: Campos vacios: ' , @pmensaje);
			RETURN;
		END;

		-- Validacion de campos nulos
		IF @pidTratamiento = '' OR @pidTratamiento IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pidTratamiento ');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = CONCAT('Error: Campos vacios: ' , @pmensaje);
			RETURN;
		END;


		-- Validacion de campos nulos
		IF @pidLugarAsistencia = '' OR @pidLugarAsistencia IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pidLugarAsistencia ');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = CONCAT('Error: Campos vacios: ' , @pmensaje);
			RETURN;
		END;

				-- Validacion de campos nulos
		IF @pfecha = '' OR @pfecha IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pfecha ');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = CONCAT('Error: Campos vacios: ' , @pmensaje);
			RETURN;
		END;


		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Encuesta
		WHERE Persona_idPersona = @pidPersona;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pidPersona , ' para @pidPersona');
		END;

		SELECT @vconteo = COUNT(*) FROM Tratamiento
		WHERE idTratamiento = @pidTratamiento	;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pidTratamiento , ' @pidTratamiento');
		END;

		SELECT @vconteo = COUNT(*) FROM LugarAsistencia
		WHERE idLugarAsistencia = @pidLugarAsistencia	;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pidLugarAsistencia , ' @pidLugarAsistencia');
		END;

		-- Validar que el identificador no deba existir en la tabla
		SELECT @vIdEncuesta = idEncuesta FROM Encuesta
		WHERE Persona_idPersona = Persona_idPersona;


		SELECT @vconteo = COUNT(*) FROM AsistenciaMedica
		WHERE Encuesta_idEncuesta = @vIdEncuesta;
		IF @vconteo <> 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' Ya existe el identificador => ' , 'asistencia medica para esta encuesta' , ' ');
		END;

		-- NOTA: Si da error es porque ncesita convertir el parametro entero a cadena, ejemplo: CAST(@parametro1 AS VARCHAR)

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = CONCAT('Error: Identificadores no validos: ' , @pmensaje);
			RETURN;
		END;

		SELECT @vconteo = COUNT(*) FROM AsistenciaMedica;
		SET @vconteo = @vconteo + 1;

		-- Accion del procedimiento
		INSERT INTO AsistenciaMedica
           (idAsistenciaMedica,
		   fecha,
           Encuesta_idEncuesta,
           Tratamiento_idTratamiento,
           LugarAsistencia_idLugarAsistencia)
    	 VALUES
           (@vconteo,
		   @pfecha,
           @vIdEncuesta,
           @pidTratamiento,
           @pidLugarAsistencia)


		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;

	-- En caso de no elegir una accion
	IF @pmensaje IS NULL BEGIN
		SET @pcodigoMensaje = 3;
		SET @pmensaje = CONCAT('Error: No se definio la accion a realizar ' , @pmensaje);
	END;
END
