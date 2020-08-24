-- <=== Encuesta ===>
/* Requisitos de las acciones:
 * Estas acciones no tienen la utltima validacion, por lo tanto no habrá un codigo numero 6.
 *
 * INSERT-INFO: @pidPersona, @pidMunicipio, @pidEstadoPaciente (1,2)
 * Parametros Opcional: @pnumeroIdentidad, @pnumeroTelefono
 * Validaciones: 1. La persona no puede llenar más de una vez la encuesta.
 * Nota: Se debe crear un registro de la encuesta, con su respectivo codigo y fecha
 * 		 Se debe crear un registro de los antecedentes patologicos
 * 		 Se debe crear un registro de los antecedentes no patologicos
 *
 * INSERT-PATOLOGIA: @pidPersona, @pidPatologia
 * Nota: Se debe insertar una patologia en la lista de patologias
 *
 * INSERT-NOPATOLOGIA: @pidPersona, @pidNoPatologia
 * Nota: Se debe insertar una patologia en la lista de no patologias
 *
 * INSERT-ANTECEDENTESP: @pidPersona, @pinfectadoAnteriormente (0,1)
 * Nota: Se debe actualizar el campo infectadoAnteriormente de la table AntecedentesP
 *
 * INSERT-ANTECEDENTESNP: @pidPersona, @pcPersonaVivienda
 * Nota: Se debe actualizar el campo cPersonaVivienda de la table AntecedentesNP
*/
CREATE OR ALTER PROCEDURE SP_EN_INFO (
	-- Parametros de Entrada
	@pidPersona					INT,
	@pidMunicipio				INT,
	@pidEstadoPaciente			INT,
	@pnumeroTelefono			VARCHAR(45),
	@pnumeroIdentidad			VARCHAR(45), 	-- CAMBIO: @pnumeroTelefono --> @pnumeroIdentidad
	@pidPatologia				INT,
	@pinfectadoAnteriormente	INT,			-- AGREGADO: @pinfectadoAnteriormente
	@pidNoPatologia				INT,
	@pcPersonaVivienda			INT,			-- AGREGADO: @pcPersonaVivienda
	@paccion					VARCHAR(45),
	
	@pcodigoMensaje				INT OUTPUT,
	@pmensaje 					VARCHAR(1000) OUTPUT

) AS
BEGIN
	-- Declaracion de Variables
	DECLARE	@vconteo INT;
	DECLARE	@vidresultado INT;
	DECLARE	@vcodigoencuesta VARCHAR(45);

	-- Establecer Valores
	SET @pcodigoMensaje=0;
	SET @pmensaje='';

	/* Funcionalidad: INSERT-INFO
	 * Descripcion Funcionalidad: Insertar datos en la tabla Encuesta, crear registro en las tablas AntecedentesNP y AntecedentesP con el ID recién insertado en la tabla Encuesta
	*/
	IF @paccion = 'INSERT-INFO' BEGIN

		-- Validacion de campos nulos
		IF @pidPersona IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pidPersona ';
		END;

		IF @pidMunicipio IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pidMunicipio ';
		END;

		IF  @pidEstadoPaciente IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @idEstadoPaciente ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = 'Error: Campos vacios: ' + @pmensaje;
			RETURN;
		END;



		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Persona
		WHERE idPersona = @pidPersona;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + CAST(@pidPersona AS VARCHAR) + ' ';
		END;

		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Municipio
		WHERE idMunicipio = @pidMunicipio;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + CAST(@pidMunicipio AS VARCHAR) + ' ';
		END;

		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM EstadoPaciente
		WHERE idEstadoPaciente = @pidEstadoPaciente;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + CAST(@pidEstadoPaciente AS VARCHAR) + ' ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = 'Error: Identificadores no validos: ' + @pmensaje;
			RETURN;
		END;
		



		-- Validacion de procedimientos
		/* Validaciones ha realizar
		 * 1. La persona no puede llenar más de una vez la encuesta.
		*/
		/*
		SELECT @vconteo = COUNT(*) FROM Encuesta
		WHERE Persona_idPersona = @pidPersona
		IF @vconteo <> 0 BEGIN
			SET @pmensaje = ' La persona ya ha rellenado la encuesta';
		END;
		*/


		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 6;
			SET @pmensaje = 'Error: Validacion en la condicion del procdimiento: ' + @pmensaje;
			RETURN;
		END;


		
		-- Accion del procedimiento
		-- INSERTAR EN LA TABLA ENCUESTA
		-- 1. Obtener nuevo ID a insertar
		SELECT @vidresultado = MAX(idEncuesta) FROM Encuesta;
		SET @vidresultado = @vidresultado + 1;
		-- 2. Generar el codigo de la encuesta
		SET @vcodigoencuesta = dbo.FN_GENERAR_CODIGO('EN', @vidresultado, 12);

		-- 3. Insertar parametros
		INSERT INTO Encuesta
		(idEncuesta, codigoEncuesta, fechaEncuesta, EstadoPaciente_idEstadoPaciente, Persona_idPersona)
		values (@vidresultado, @vcodigoencuesta, GETDATE(), @pidEstadoPaciente, @pidPersona);

		-- INERTAR EN LA TABLA ANTECEDENTESNP
		-- 1. Obtener nuevo ID a insertar
		SELECT @vconteo = MAX(idAntecedentesNP) FROM AntecedentesNP;
		SET @vconteo = @vconteo + 1;
		-- 2. Insertar parametros
		INSERT INTO AntecedentesNP
		(idAntecedentesNP, cPersonaVivienda, Encuesta_idEncuesta)
		values (@vconteo, @pcPersonaVivienda, @vidresultado);

		-- INSERTAR EN LA TABLA ANTECEDENTESP
		-- 1. Obtener nuevo ID a insertar
		SELECT @vconteo = MAX(idAntecedentesP) FROM AntecedentesP;
		SET @vconteo = @vconteo + 1;
		-- 2. Insertar parametros
		INSERT INTO AntecedentesP
		(idAntecedentesP, infectadoAnteriormente, Encuesta_idEncuesta)
		values (@vconteo, @pinfectadoAnteriormente, @vidresultado)

		-- Actualizar Municipio de la persona
		UPDATE Persona SET
			Municipio_idMunicipio = @pidMunicipio
		WHERE idPersona = @pidPersona;

		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;
	









	/* Funcionalidad: INSERT-PATOLOGIA
	 * Descripcion Funcionalidad: Insertar un antecedente patologico en la tabla LISTAANTECEDENTESP
	*/
	IF @paccion = 'INSERT-PATOLOGIA' BEGIN

		-- Validacion de campos nulos
		IF @pidPersona IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pidPersona ';
		END;
		IF @pidPatologia IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pidPatologia ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = 'Error: Campos vacios: ' + @pmensaje;
			RETURN;
		END;

		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Persona
		WHERE idPersona = @pidPersona;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + CAST(@pidPersona AS VARCHAR) + ' ';
		END;

		-- Validar que el identificador no deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Patologia
		WHERE idPatologia = @pidPatologia;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + CAST(@pidPatologia AS VARCHAR) + ' ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = 'Error: Identificadores no validos: ' + @pmensaje;
			RETURN;
		END;		
		
		-- Accion del procedimiento

		-- INSERTAR EN LA TABLA LISTAANTECEDENTESP
		-- 1. Obtener el ID del registro de la tabla AntecedentesP correspondiente al ID de Persona ingresado
		SELECT @vidresultado = ap.idAntecedentesP FROM AntecedentesP ap
		INNER JOIN Encuesta en ON ap.Encuesta_idEncuesta = en.idEncuesta
		WHERE en.Persona_idPersona = @pidPersona;
		-- 2. Insertar parametros		
		INSERT INTO ListaAntecedentesP
		(Patologia_idPatologia, AntecedentesP_idAntecedentesP)
		VALUES (@pidPatologia, @vidresultado);

		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;
	









	/* Funcionalidad: INSERT-NOPATOLOGIA
	 * Descripcion Funcionalidad: Insertar un antecedente no patologico en la tabla LISTAANTECEDENTESNP
	*/
	IF @paccion = 'INSERT-NOPATOLOGIA' BEGIN

		-- Validacion de campos nulos
		IF @pidPersona IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pidPersona ';
		END;
		IF @pidNoPatologia IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pidNoPatologia ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = 'Error: Campos vacios: ' + @pmensaje;
			RETURN;
		END;

		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Persona
		WHERE idPersona = @pidPersona;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + CAST(@pidPersona AS VARCHAR) + ' ';
		END;

		-- Validar que el identificador no deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM NoPatologia
		WHERE @pidNoPatologia = @pidNoPatologia;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + CAST(@pidNoPatologia AS VARCHAR) + ' ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = 'Error: Identificadores no validos: ' + @pmensaje;
			RETURN;
		END;		
		
		-- Accion del procedimiento

		-- INSERTAR EN LA TABLA LISTAANTECEDENTESNP
		-- 1. Obtener el ID del registro de la tabla AntecedentesNP correspondiente al ID de Persona ingresado
		SELECT @vidresultado = anp.idAntecedentesNP FROM AntecedentesNP anp
		INNER JOIN Encuesta en ON anp.Encuesta_idEncuesta = en.idEncuesta
		WHERE en.Persona_idPersona = @pidPersona;
		-- 2. Insertar parametros		
		INSERT INTO ListaAntecedentesNP
		(NoPatologia_idNoPatologia, AntecedentesNP_idAntecedentesNP)
		VALUES (@pidNoPatologia, @vidresultado);

		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;
	









	/* Funcionalidad: INSERT-ANTECEDENTESP
	 * Descripcion Funcionalidad: Actualizar el campo infectadoAnteriormente de la tabla ANTECEDENTESP
	*/
	IF @paccion = 'INSERT-ANTECEDENTESP' BEGIN

		-- Validacion de campos nulos
		IF @pidPersona IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pidPersona ';
		END;
		IF @pinfectadoAnteriormente IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pinfectadoAnteriormente ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = 'Error: Campos vacios: ' + @pmensaje;
			RETURN;
		END;

		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Persona
		WHERE idPersona = @pidPersona;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + CAST(@pidPersona AS VARCHAR) + ' ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = 'Error: Identificadores no validos: ' + @pmensaje;
			RETURN;
		END;		
		
		-- Accion del procedimiento

		-- ACTUALIZACION EN LA TABLA ANTECEDENTESP
		-- 1. Obtener el ID del registro de la tabla AntecedentesP correspondiente al ID de Persona ingresado
		SELECT @vidresultado = idEncuesta FROM Encuesta
		WHERE Persona_idPersona = @pidPersona;
		-- 2. Actualizar parametros		
		UPDATE AntecedentesP SET infectadoAnteriormente = @pinfectadoAnteriormente WHERE Encuesta_idEncuesta = @vidresultado;

		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;
	









	/* Funcionalidad: INSERT-ANTECEDENTESP
	 * Descripcion Funcionalidad: Actualizar el campo cPersonaVivienda de la tabla ANTECEDENTESP
	*/
	IF @paccion = 'INSERT-ANTECEDENTESNP' BEGIN

		-- Validacion de campos nulos
		IF @pidPersona IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pidPersona ';
		END;
		IF @pcPersonaVivienda IS NULL BEGIN
			SET @pmensaje = @pmensaje + ' @pcPersonaVivienda ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 4;
			SET @pmensaje = 'Error: Campos vacios: ' + @pmensaje;
			RETURN;
		END;

		-- Validacion de identificadores
		-- Validar que el identificador deba existir en la tabla
		SELECT @vconteo = COUNT(*) FROM Persona
		WHERE idPersona = @pidPersona;
		IF @vconteo = 0 BEGIN
			SET @pmensaje = @pmensaje + ' No existe el identificador => ' + CAST(@pidPersona AS VARCHAR) + ' ';
		END;

		IF @pmensaje <> '' BEGIN
			SET @pcodigoMensaje = 5;
			SET @pmensaje = 'Error: Identificadores no validos: ' + @pmensaje;
			RETURN;
		END;		
		
		-- Accion del procedimiento

		-- ACTUALIZACION EN LA TABLA ANTECEDENTESNP
		-- 1. Obtener el ID del registro de la tabla AntecedentesNP correspondiente al ID de Persona ingresado
		SELECT @vidresultado = idEncuesta FROM Encuesta
		WHERE Persona_idPersona = @pidPersona;
		-- 2. Actualizar parametros		
		UPDATE AntecedentesNP SET cPersonaVivienda = @pcPersonaVivienda WHERE Encuesta_idEncuesta = @vidresultado;

		SET @pmensaje = 'Finalizado con exito'; -- Cambiar mensaje
	END;

	-- En caso de no elegir una accion
	IF @pmensaje = '' BEGIN
		SET @pcodigoMensaje = 3;
		SET @pmensaje = 'Error: No se definio la accion a realizar ' + @pmensaje;
	END;
END
