-- <=== Devolver codigo Empleado ===>
/* Parametros de entrada:
 * Opcional: @piniciales, @pnitem, @pitem_max
 *
 * RETUNR: @vcodigo VARCHAR(45)
 *
 * Funcionalidad: Genera un código con iniciales.
 * Dicho código sirve para identificar ya sea:
 * Una Factura: FA-0000001
 * Un empleado: EMP-000001
 * O un producto: PR000001
*/
CREATE FUNCTION FN_GENERAR_CODIGO (
    -- Parametros de Entrada
    @piniciales					VARCHAR(45),	--Iniciales para el código
    @pnitem						INT,			--Número del item que desea poner en el código
    @pitem_max					INT				--Tamaño máximo de caracteres numéricos para el código
)
-- Return
RETURNS VARCHAR(45) --<TIPO_DATO>
AS BEGIN
    -- Declaracion de Variables
    DECLARE	@vcodigo VARCHAR(45);
	SET @vcodigo = CAST(@pnitem AS VARCHAR);
	IF (LEN(@vcodigo) > @pitem_max) BEGIN
		RETURN NULL;
	END;

	DECLARE @i INT = 1;
	WHILE ( @i <= @pitem_max - LEN(CAST(@pnitem AS VARCHAR)) ) BEGIN
		SET @vcodigo = '0' + @vcodigo;
		SET @i = @i + 1;
	END;
    RETURN CAST(@piniciales AS VARCHAR) + @vcodigo;
END;
