-- <=== Nombre_Funcion ===>
/* Parametros de entrada:
 * Opcional: @psize, @pop
 *
 * RETUNR: @strPass VARCHAR(62)
 *
 * Funcionalidad: Devuelve una cadena de texto completamente aleatoria.
 * Se debe especificar el tamaño de la cadena y que tipo de caracteres quiere en la cadena.
*/
CREATE FUNCTION FN_RANDOM_STRING (
    @psize AS INT, --Tamaño de la cadena aleatoria
    @pop AS VARCHAR(2) --Opcion para letras: 'C', numeros: 'N', o  letras y numeros: 'CN'.
)
-- Return
RETURNS VARCHAR(62) --<TIPO_DATO>
AS BEGIN
	-- Declaracion de Variables
	DECLARE @chars AS VARCHAR(52),
	@numbers AS VARCHAR(10),
	@strChars AS VARCHAR(62),
	@strPass AS VARCHAR(62),
	@index AS INT,
	@cont AS INT

	SET @strPass = ''
	SET @strChars = ''
	SET @chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
	SET @numbers = '0123456789'

	SET @strChars = (
		CASE @pop WHEN 'C' THEN @chars --Letras
			WHEN 'N' THEN @numbers --N�meros
			WHEN 'CN' THEN @chars + @numbers --Ambos (Letras y N�meros)
			ELSE '------'
		END
	);

	SET @cont = 0
	WHILE @cont < @psize
	BEGIN
		SET @index = ceiling( ( SELECT rnd FROM vwRandom ) * (len(@strChars)))--Uso de la vista para el Rand() y no generar error.
		SET @strPass = @strPass + substring(@strChars, @index, 1)
		SET @cont = @cont + 1
	END

	RETURN @strPass
END;
