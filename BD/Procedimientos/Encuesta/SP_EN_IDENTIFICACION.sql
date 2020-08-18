-- <=== Encuesta ===>
/* Requisitos de las acciones:
 * IDENTIDAD: @pnumeroIdentidad
 * Salida mediante parametros: @idPersona, @pNombre, @sNombre, @pApellido, @Sapellido, @numeroIdentidad, @numeroTelefono, @edad, @genero
 * Salida mediante SELECT: idPersona, nombres, apellidos, numeroIdentidad,
 * numeroTelefono, edad, genero
 *
 * TELEFONO:  @pnumeroTelefono
 * Salida mediante parametros: @idPersona, @pNombre, @sNombre, @pApellido, @Sapellido, @numeroIdentidad, @numeroTelefono, @edad, @genero
 * Salida mediante SELECT: idPersona, nombres, apellidos, numeroIdentidad,
 * numeroTelefono, edad, genero
 *
 * PRUEBA:  @pcodigoLaboratorio, @pcodigoPrueba
 * Salida mediante parametros: @idPersona, @pNombre, @sNombre, @pApellido, @Sapellido, @numeroIdentidad, @numeroTelefono, @edad, @genero
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
	@pmensaje 					VARCHAR(1000) OUTPUT,
	
	-- Otros parametros de salida
	@idPersona					INT OUTPUT,
	@pNombre					VARCHAR(45) OUTPUT,
	@sNombre					VARCHAR(45) OUTPUT,
	@pApellido					VARCHAR(45) OUTPUT,
	@Sapellido					VARCHAR(45) OUTPUT,
	@numeroIdentidad			VARCHAR(45) OUTPUT,
	@numeroTelefono				VARCHAR(45) OUTPUT,
	@edad						INT OUTPUT,
	@genero						VARCHAR(45) OUTPUT

) AS
BEGIN
	-- Declaracion de Variables
	DECLARE	@vconteo INT;

		-- Setear Valores
		SET @pcodigoMensaje=0;
		SET @pmensaje = NULL;

	/* Funcionalidad: Identificar_identidad
	 * Descripcion Funcionalidad: localiza la informacion de la persona, realizando una busqueda a traves de su numero de identidad como filtro
	*/
	IF @paccion = 'IDENTIDAD' BEGIN


		-- Validacion de campos nulos
		IF @pnumeroIdentidad = '' OR @pnumeroIdentidad IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pnumeroIdentidad ');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = CONCAT('Error: Campos vacios: ' , @pmensaje);
			RETURN;
		END;

		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM persona
		WHERE numeroIdentidad = @pnumeroIdentidad;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pnumeroIdentidad , ' ');
		END;

		

		-- NOTA: Si da error es porque ncesita convertir el parametro entero a cadena, ejemplo: CAST(@parametro1 AS VARCHAR)

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = CONCAT('Error: Identificadores no validos: ' , @pmensaje);
			RETURN;
		END;


		SELECT @idPersona = p.idPersona, @pNombre = p.primerNombre, @sNombre = p.segundoNombre, @pApellido = p.primerApellido, @Sapellido = p.segundoApellido, @numeroIdentidad = p.numeroIdentidad, @numeroTelefono = p.numeroTelefono, @edad = p.edad, @genero = g.descripcion
		FROM  persona p
		INNER JOIN genero g on g.idGenero=p.Genero_idGenero
		WHERE numeroIdentidad = @pnumeroIdentidad;


		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;


	/* Funcionalidad: Identificar_telefono
	 * Descripcion Funcionalidad: localiza la informacion de la persona, realizando una busqueda a traves de su numero de telefono como filtro
	*/
	IF @paccion = 'TELEFONO' BEGIN
	
		-- Validacion de campos nulos
		IF @pnumeroTelefono = '' OR @pnumeroTelefono IS NULL BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pnumeroTelefono ');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = CONCAT('Error: Campos vacios: ' , @pmensaje);
			RETURN;
		END;



		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM persona
		WHERE numeroTelefono = @pnumeroTelefono;
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pnumeroTelefono , ' ');
		END;

	

		-- NOTA: Si da error es porque ncesita convertir el parametro entero a cadena, ejemplo: CAST(@parametro1 AS VARCHAR)

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = CONCAT('Error: Identificadores no validos: ' , @pmensaje);
			RETURN;
		END;



		-- Validacion de procedimientos
		/* Validaciones ha realizar
		 * 1. La persona debe de haber dado positivo.
		 *    *Es posible que la persona se haya hecho varias pruebas en varios laboratorios.
		 *    *Del conjunto de pruebas que se haya hecho la persona, al menos una debe de dar positivo, si no incumpliria con la validación y no podrá llenar la encuesta.
		 * 2. La persona no puede llenar más de una vez la encuesta.
		*/




		-- Accion del procedimiento
		SELECT @idPersona = p.idPersona, @pNombre = p.primerNombre, @sNombre = p.segundoNombre, @pApellido = p.primerApellido, @Sapellido = p.segundoApellido, @numeroIdentidad = p.numeroIdentidad, @numeroTelefono = p.numeroTelefono, @edad = p.edad, @genero = g.descripcion
		FROM  persona p
		INNER JOIN genero g on g.idGenero=p.Genero_idGenero
		WHERE numeroTelefono = @pnumeroTelefono;


		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;

	/* Funcionalidad: Identificar_prueba
	 * Descripcion Funcionalidad:
	*/
	IF @paccion = 'PRUEBA' BEGIN

		-- Validacion de campos nulos @pcodigoLaboratorio	
		IF (@pcodigoPrueba = '' OR @pcodigoPrueba IS NULL) OR (@pcodigoLaboratorio = '' OR @pcodigoLaboratorio IS NULL) BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pcodigoPrueba, @pcodigoLaboratorio ');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = CONCAT('Error: Campos vacios: ' , @pmensaje);
			RETURN;
		END;

	
		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM ListaPruebas lp
		INNER JOIN Laboratorio l ON l.idLaboratorio = lp.Laboratorio_idLaboratorio
		INNER JOIN Prueba p ON p.idPrueba = lp.Prueba_idPrueba
		WHERE (codigoLaboratio = @pcodigoLaboratorio) AND (codigoPrueba = @pcodigoPrueba);
		IF @vconteo = 0 BEGIN --Usar cuando en caso de ser necesario
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pcodigoLaboratorio , ', ' , @pcodigoPrueba , ' ');
		END;


		-- NOTA: Si da error es porque ncesita convertir el parametro entero a cadena, ejemplo: CAST(@parametro1 AS VARCHAR)

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = CONCAT('Error: Identificadores no validos: ' , @pmensaje);
			RETURN;
		END;



		-- Validacion de procedimientos
		/* Validaciones ha realizar
		 * 1. La prueba debe de haber dado positivo.
		 * 2. La persona no puede llenar más de una vez la encuesta.
		*/




		-- Accion del procedimiento
		SELECT @idPersona = psn.idPersona, @pNombre = psn.primerNombre, @sNombre = psn.segundoNombre, @pApellido = psn.primerApellido, @Sapellido = psn.segundoApellido, @numeroIdentidad = psn.numeroIdentidad, @numeroTelefono = psn.numeroTelefono, @edad = psn.edad, @genero = g.descripcion
		FROM ListaPruebas lp
		INNER JOIN Laboratorio l ON l.idLaboratorio = lp.Laboratorio_idLaboratorio
		INNER JOIN Prueba p ON p.idPrueba = lp.Prueba_idPrueba
		INNER JOIN Persona psn ON psn.idPersona = p.Persona_idPersona
		INNER JOIN genero g on g.idGenero=psn.Genero_idGenero;

		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;

	-- En caso de no elegir una accion
	IF @pmensaje IS NULL BEGIN
		SET @pcodigoMensaje = 3;
		SET @pmensaje = CONCAT('Error: No se definio la accion a realizar ' , @pmensaje);
	END;


END
