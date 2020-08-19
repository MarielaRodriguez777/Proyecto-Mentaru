-- <=== Encuesta ===>
/* Requisitos de las acciones:
 * Estas acciones no tienen la utltima validacion, por lo tanto no habrá un codigo numero 6.
 *
 * INSERT-CRONOLOGIA: @pidPersona, @pdiasCuarentena
 * Parametros Opcional: @pdiasSintomas, @pfechaRecuperacion
 * Nota: Se debe crear un registro de la cronologia
 * 		 Se debe encontrar la fecha en que se realizo la prueba el paciente
 *
 * INSERT-SINTOMAS: @pidPersona, @pidSintoma
 * Parametros Opcional: @pdiasSintomasListaSintomas, @pfechaSintoma
 * Nota: Se debe insertar un sintoma en la tabla ListaSintomas
*/
CREATE OR ALTER PROCEDURE SP_EN_SINTOMAS ( --Ejemplo: SP_GU_LOGIN: Procedimiento Almacenado, Modulo GestionUsuario, Procedimiento para el Login. Puede borrar este comentario.
	-- Parametros de Entrada
	@pidPersona					INT,
	@pdiasCuarentena			INT,
	@pdiasSintomas				INT,
	@pfechaRecuperacion			DATE,
	@pidSintoma					INT,
	@pdiasSintomasListaSintomas INT,
	@pfechaSintoma				DATE,
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
	DECLARE @vfechaprueba DATE;
	DECLARE @videncuesta INT;



	/* Funcionalidad: <nombre_funcionalidad>
	 * Descripcion Funcionalidad:
	*/
	IF @paccion = 'INSERT-CRONOLOGIA' BEGIN
		-- Setear Valores
		SET @pcodigoMensaje = 0;
		SET @pmensaje = NULL;



		-- Validacion de campos nulos
		IF @pidPersona = '' OR @pidPersona IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pidPersona ');
		END;

		-- Validacion de campos nulos
		IF @pdiasCuarentena = '' OR @pdiasCuarentena IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pdiasCuarentena ');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = CONCAT('Error: Campos vacios: ' , @pmensaje);
			RETURN;
		END;



		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM persona 
		WHERE idPersona = @pidPersona;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pidPersona , '  @pidPersona');
		END;

		-- NOTA: Si da error es porque ncesita convertir el parametro entero a cadena, ejemplo: CAST(@parametro1 AS VARCHAR)

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = CONCAT('Error: Identificadores no validos: ' , @pmensaje);
			RETURN;
		END;

		-- Accion del procedimiento


		--id de la encuesta
		SELECT @videncuesta = idEncuesta
		FROM Encuesta
		WHERE Persona_idPersona = @pidPersona;


		
		--fecha en la que se hizo la prueba
		SELECT @vfechaprueba = fecha
		FROM Prueba
		WHERE (Persona_idPersona = @pidPersona) AND (infectado = 1);

		--id del nuevo registro en cronologia 
		SELECT @vconteo = COUNT(*) FROM Cronologia 

		SET @vconteo = @vconteo + 1; 

		--INSERT
		INSERT INTO Cronologia
           (idCronologia
            ,fechaPrueba
           ,diasSintomas
           ,diasCuarentena
           ,fechaRecuperacion
           ,Encuesta_idEncuesta)
     VALUES
           (@vconteo,
		   @vfechaprueba,
		   @pdiasSintomas,
		   @pdiasCuarentena,
		   @pfechaRecuperacion,
		   @videncuesta);

		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;


	IF @paccion = 'INSERT-SINTOMAS' BEGIN
		-- Setear Valores
		SET @pcodigoMensaje = 0;
		SET @pmensaje = NULL;



		-- Validacion de campos nulos
		IF @pidPersona = '' OR @pidPersona IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pidPersona ');
		END;

		-- Validacion de campos nulos
		IF @pidSintoma = '' OR @pidSintoma IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pidSintoma ');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = CONCAT('Error: Campos vacios: ' , @pmensaje);
			RETURN;
		END;



		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM persona 
		WHERE idPersona = @pidPersona;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pidPersona , '  @pidPersona');
		END;

		  SELECT @vconteo = COUNT(*)
		  FROM Sintoma
		  WHERE idSintoma = @pidSintoma;
		  IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pidSintoma , '  @pidSintoma');
		  END;

		-- NOTA: Si da error es porque ncesita convertir el parametro entero a cadena, ejemplo: CAST(@parametro1 AS VARCHAR)

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = CONCAT('Error: Identificadores no validos: ' , @pmensaje);
			RETURN;
		END;

		-- Accion del procedimiento


		--id de la encuesta
		SELECT @videncuesta = idEncuesta
		FROM Encuesta
		WHERE Persona_idPersona = @pidPersona;

		--INSERT
		INSERT INTO listaSintomas
           (Encuesta_idEncuesta
           ,Sintoma_idSintoma
           ,diasSintoma
           ,fechaSintoma)
     VALUES
           (@videncuesta,
		   @pidSintoma,
		   @pdiasSintomasListaSintomas,
		   @pfechaSintoma);
		   
		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;


	-- En caso de no elegir una accion
	IF @pmensaje IS NULL BEGIN
		SET @pcodigoMensaje = 3;
		SET @pmensaje = CONCAT('Error: No se definio la accion a realizar ' , @pmensaje);
	END;
END
