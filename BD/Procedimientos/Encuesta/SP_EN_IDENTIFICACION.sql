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
	DECLARE @vidpersona INT;

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


		-- Validacion de procedimientos
		/* Validaciones ha realizar
		 * 1. La persona debe de haber dado positivo.
		 *    *Es posible que la persona se haya hecho varias pruebas en varios laboratorios.
		 *    *Del conjunto de pruebas que se haya hecho la persona, al menos una debe de dar positivo, si no incumpliria con la validación y no podrá llenar la encuesta.
		 * 2. La persona no puede llenar más de una vez la encuesta.
		*/



		SELECT @vidpersona = idPersona
		FROM persona
		WHERE numeroIdentidad = @pnumeroIdentidad;


		SELECT  @vconteo=COUNT(*)
		FROM Prueba
		WHERE (Persona_idPersona = @vidpersona) AND infectado=1;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = 'No se han encontrado pruebas en  las cuales el usuario haya dado positivo';
		END;

		SELECT  @vconteo=COUNT(*)
		FROM Encuesta
		WHERE (Persona_idPersona = @vidpersona);
		IF @vconteo <> 0 BEGIN
			SET @pmensaje = CONCAT(@pmensaje,'  ','Esa persona ya ha llenado la encuesta anteriormente');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 6;
			SET @pmensaje = CONCAT('Error: Validacion en la condicion del procedimiento: ',@pmensaje);
			RETURN;
		END;



		--Accion del procedimiento
		SELECT p.idPersona, p.primerNombre, p.segundoNombre, p.primerApellido, p.segundoApellido, p.numeroIdentidad, p.numeroTelefono, p.edad, g.descripcion
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

		SELECT @vidpersona = idPersona
		FROM persona
		WHERE numeroTelefono = @pnumeroTelefono;


		SELECT  @vconteo=COUNT(*)
		FROM Prueba
		WHERE (Persona_idPersona = @vidpersona) AND infectado=1;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = 'No se han encontrado pruebas en  las cuales el usuario haya dado positivo';
		END;

		SELECT  @vconteo=COUNT(*)
		FROM Encuesta
		WHERE (Persona_idPersona = @vidpersona);
		IF @vconteo <> 0 BEGIN
			SET @pmensaje = CONCAT(@pmensaje,'  ','Esa persona ya ha llenado la encuesta anteriormente');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 6;
			SET @pmensaje = CONCAT('Error: Validacion en la condicion del procedimiento: ',@pmensaje);
			RETURN;
		END;


		-- Accion del procedimiento
		SELECT p.idPersona, p.primerNombre, p.segundoNombre, p.primerApellido, p.segundoApellido, p.numeroIdentidad, p.numeroTelefono, p.edad,  g.descripcion
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
		IF (@pcodigoPrueba = '' OR @pcodigoPrueba IS NULL) BEGIN
			SET @pmensaje = CONCAT(@pmensaje , ' @pcodigoPrueba');
		END;

		IF (@pcodigoLaboratorio = '' OR @pcodigoLaboratorio IS NULL)  BEGIN
			SET @pmensaje = CONCAT(@pmensaje , '  @pcodigoLaboratorio');
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
			SET @pmensaje = CONCAT(@pmensaje , ' No existe el identificador => ' , @pcodigoLaboratorio , '  o´ ' , @pcodigoPrueba , ' ');
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

		SELECT @vidpersona=psn.idPersona FROM ListaPruebas lp
		INNER JOIN Laboratorio l ON l.idLaboratorio = lp.Laboratorio_idLaboratorio
		INNER JOIN Prueba p ON p.idPrueba = lp.Prueba_idPrueba
		INNER JOIN Persona psn ON p.Persona_idPersona = psn.idPersona
		WHERE (codigoLaboratio = @pcodigoLaboratorio) AND (codigoPrueba = @pcodigoPrueba)


		SELECT  @vconteo=COUNT(*)
		FROM Prueba
		WHERE (Persona_idPersona = @vidpersona) AND infectado=1;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = 'No se han encontrado pruebas en  las cuales el usuario haya dado positivo';
		END;

		SELECT  @vconteo=COUNT(*)
		FROM Encuesta
		WHERE (Persona_idPersona = @vidpersona);
		IF @vconteo <> 0 BEGIN
			SET @pmensaje = CONCAT(@pmensaje,'  ','Esa persona ya ha llenado la encuesta anteriormente');
		END;

		IF @pmensaje IS NOT NULL BEGIN
			SET @pcodigoMensaje = 6;
			SET @pmensaje = CONCAT('Error: Validacion en la condicion del procedimiento: ',@pmensaje);
			RETURN;
		END;




		-- Accion del procedimiento
		SELECT psn.idPersona, psn.primerNombre, psn.segundoNombre, psn.primerApellido,  psn.segundoApellido,  psn.numeroIdentidad,  psn.numeroTelefono,  psn.edad,  g.descripcion
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
