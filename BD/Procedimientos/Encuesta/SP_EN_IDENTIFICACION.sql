-- <=== Encuesta ===>
/* Requisitos de las acciones:
 * IDENTIDAD: @pnumeroIdentidad
 * Salida mediante SELECT: idPersona, nombres, apellidos, numeroIdentidad,
 * numeroTelefono, edad, genero
 *
 * TELEFONO:  @pnumeroTelefono
 * Salida mediante SELECT: idPersona, nombres, apellidos, numeroIdentidad,
 * numeroTelefono, edad, genero
 *
 * PRUEBA:  @pcodigoLaboratorio, @pcodigoPrueba
 * Salida mediante SELECT: idPersona, nombres, apellidos, numeroIdentidad,
 * numeroTelefono, edad, genero
*/
CREATE OR ALTER PROCEDURE SP_EN_IDENTIFICACION ( --Ejemplo: SP_GU_LOGIN: Procedimiento Almacenado, Modulo GestionUsuario, Procedimiento para el Login. Puede borrar este comentario.
	-- Parametros de Entrada
	@pnumeroIdentidad			VARCHAR(45),
	@pnumeroTelefono			VARCHAR(45),
	@pcodigoLaboratorio			VARCHAR(45),
	@pcodigoPrueba				VARCHAR(45),
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



	/* Funcionalidad: Identificar_identidad
	 * Descripcion Funcionalidad:
	*/
	IF @paccion = 'IDENTIDAD' BEGIN
		-- Setear Valores
		SET @pcodigoMensaje=0;
		SET @pmensaje='';



		-- Validacion de campos nulos
		IF @parametro1 = '' OR @parametro1 IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' campo1 ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = 'Error: Campos vacios: ' + @pmensaje;
			RETURN;
		END;



		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Tabla
		WHERE campo1 = @parametro1;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + @parametro1 + ' ';
		END;

		-- Validar que el identificador no deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Tabla
		WHERE campo1 = @parametro1;
		IF @vconteo <> 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = @pmensaje + ' Ya existe el identificador => ' + @parametro1 + ' ';
		END;

		-- NOTA: Si da error es porque ncesita convertir el parametro entero a cadena, ejemplo: CAST(@parametro1 AS VARCHAR)

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = 'Error: Identificadores no validos: ' + @pmensaje;
			RETURN;
		END;



		-- Validacion de procedimientos
		/* Validaciones ha realizar
		 * 1. La persona debe de haber dado positivo.
		 *    *Es posible que la persona se haya hecho varias pruebas en varios laboratorios.
		 *    *Del conjunto de pruebas que se haya hecho la persona, al menos una debe de dar positivo, si no incumpliria con la validación y no podrá llenar la encuesta.
		 * 2. La persona no puede llenar más de una vez la encuesta.
		*/



		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 6;
			SET @pmensaje = 'Error: Validacion en la condicion del procdimiento: ' + @pmensaje;
			RETURN;
		END;



		-- Accion del procedimiento



		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;










	/* Funcionalidad: Identificar_telefono
	 * Descripcion Funcionalidad:
	*/
	IF @paccion = 'TELEFONO' BEGIN
		-- Setear Valores
		SET @pcodigoMensaje=0;
		SET @pmensaje='';



		-- Validacion de campos nulos
		IF @parametro1 = '' OR @parametro1 IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' campo1 ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = 'Error: Campos vacios: ' + @pmensaje;
			RETURN;
		END;



		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Tabla
		WHERE campo1 = @parametro1;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + @parametro1 + ' ';
		END;

		-- Validar que el identificador no deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Tabla
		WHERE campo1 = @parametro1;
		IF @vconteo <> 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = @pmensaje + ' Ya existe el identificador => ' + @parametro1 + ' ';
		END;

		-- NOTA: Si da error es porque ncesita convertir el parametro entero a cadena, ejemplo: CAST(@parametro1 AS VARCHAR)

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = 'Error: Identificadores no validos: ' + @pmensaje;
			RETURN;
		END;



		-- Validacion de procedimientos
		/* Validaciones ha realizar
		 * 1. La persona debe de haber dado positivo.
		 *    *Es posible que la persona se haya hecho varias pruebas en varios laboratorios.
		 *    *Del conjunto de pruebas que se haya hecho la persona, al menos una debe de dar positivo, si no incumpliria con la validación y no podrá llenar la encuesta.
		 * 2. La persona no puede llenar más de una vez la encuesta.
		*/



		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 6;
			SET @pmensaje = 'Error: Validacion en la condicion del procdimiento: ' + @pmensaje;
			RETURN;
		END;



		-- Accion del procedimiento



		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;










	/* Funcionalidad: Identificar_prueba
	 * Descripcion Funcionalidad:
	*/
	IF @paccion = 'PRUEBA' BEGIN
		-- Setear Valores
		SET @pcodigoMensaje=0;
		SET @pmensaje='';



		-- Validacion de campos nulos
		IF @parametro1 = '' OR @parametro1 IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' campo1 ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = 'Error: Campos vacios: ' + @pmensaje;
			RETURN;
		END;



		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Tabla
		WHERE campo1 = @parametro1;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + @parametro1 + ' ';
		END;

		-- Validar que el identificador no deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Tabla
		WHERE campo1 = @parametro1;
		IF @vconteo <> 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = @pmensaje + ' Ya existe el identificador => ' + @parametro1 + ' ';
		END;

		-- NOTA: Si da error es porque ncesita convertir el parametro entero a cadena, ejemplo: CAST(@parametro1 AS VARCHAR)

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = 'Error: Identificadores no validos: ' + @pmensaje;
			RETURN;
		END;



		-- Validacion de procedimientos
		/* Validaciones ha realizar
		 * 1. La prueba debe de haber dado positivo.
		 * 2. La persona no puede llenar más de una vez la encuesta.
		*/



		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 6;
			SET @pmensaje = 'Error: Validacion en la condicion del procdimiento: ' + @pmensaje;
			RETURN;
		END;



		-- Accion del procedimiento



		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;

	-- En caso de no elegir una accion
	IF @pmensaje = '' BEGIN
		SET @pcodigoMensaje = 3;
		SET @pmensaje = 'Error: No se definio la accion a realizar ' + @pmensaje;
	END;
END
