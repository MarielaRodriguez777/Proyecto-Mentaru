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
 * Nota: Se debe insertar un sintoma en la tabla ListaSintomas
*/
CREATE OR ALTER PROCEDURE SP_EN_SINTOMAS ( --Ejemplo: SP_GU_LOGIN: Procedimiento Almacenado, Modulo GestionUsuario, Procedimiento para el Login. Puede borrar este comentario.
	-- Parametros de Entrada
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



	/* Funcionalidad: <nombre_funcionalidad>
	 * Descripcion Funcionalidad:
	*/
	IF @paccion = 'ACTION' BEGIN
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
		 * 1.
		 * 2.
		 * 3-
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
