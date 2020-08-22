/*
DECLARE -- Parametros de Entrada
	@pidPersona					INT,
	@pidMunicipio				INT,
	@pidEstadoPaciente			INT,
	@pnumeroTelefono			VARCHAR(45),
	@pnumeroIdentidad			VARCHAR(45),
	@pidPatologia				INT,
	@pinfectadoAnteriormente	INT,
	@pidNoPatologia				INT,
	@pcPersonaVivienda			INT,
	@paccion					VARCHAR(45),

	@pcodigoMensaje				INT,
	@pmensaje 					VARCHAR(1000)
;

--SET	@pidPersona					= 0;
SET	@pidMunicipio				= '';
SET	@pidEstadoPaciente			= 0;
SET	@pnumeroTelefono			= '';
SET	@pnumeroIdentidad			= '';
SET	@pidPatologia				= 0;
SET	@pinfectadoAnteriormente	= '';
SET	@pidNoPatologia				= 0;
SET	@pcPersonaVivienda			= '';
SET	@paccion					= 'INSERT-INFO';

SET	@pcodigoMensaje				= 0;
SET	@pmensaje 					= '';


EXEC SP_EN_INFO 
	@pidPersona,
	@pidMunicipio,
	@pidEstadoPaciente,
	@pnumeroTelefono,
	@pnumeroIdentidad,
	@pidPatologia,
	@pinfectadoAnteriormente,
	@pidNoPatologia,
	@pcPersonaVivienda,
	@paccion,

	@pcodigoMensaje OUTPUT,
	@pmensaje OUTPUT
;

-- OUTPUT
SELECT @pcodigoMensaje;
SELECT @pmensaje;
*/



-- SP_EN_INFO
DECLARE -- Parametros de Entrada
	@pidPersona					INT,
	@pidMunicipio				INT,
	@pidEstadoPaciente			INT,
	@pnumeroTelefono			VARCHAR(45),
	@pnumeroIdentidad			VARCHAR(45),
	@pidPatologia				INT,
	@pinfectadoAnteriormente	INT,
	@pidNoPatologia				INT,
	@pcPersonaVivienda			INT,
	@paccion					VARCHAR(45),

	@pcodigoMensaje				INT,
	@pmensaje 					VARCHAR(1000)
;

SET	@pidPersona					= 1;
SET	@pidMunicipio				= 220;
SET	@pidEstadoPaciente			= 1;
SET	@pnumeroTelefono			= '';
SET	@pnumeroIdentidad			= '';
SET	@pidPatologia				= 0;
SET	@pinfectadoAnteriormente	= '';
SET	@pidNoPatologia				= 0;
SET	@pcPersonaVivienda			= '';
SET	@paccion					= 'INSERT-INFO';

SET	@pcodigoMensaje				= 0;
SET	@pmensaje 					= '';


EXEC SP_EN_INFO 
	@pidPersona,
	@pidMunicipio,
	@pidEstadoPaciente,
	@pnumeroTelefono,
	@pnumeroIdentidad,
	@pidPatologia,
	@pinfectadoAnteriormente,
	@pidNoPatologia,
	@pcPersonaVivienda,
	@paccion,

	@pcodigoMensaje OUTPUT,
	@pmensaje OUTPUT
;

-- OUTPUT
SELECT @pcodigoMensaje;
SELECT @pmensaje;

-- SELECT GETDATE();
SELECT * FROM Persona
SELECT * FROM Encuesta
SELECT * FROM AntecedentesP
SELECT * FROM AntecedentesNP

/*
DELETE FROM AntecedentesP WHERE Encuesta_idEncuesta = 52;
DELETE FROM AntecedentesNP WHERE Encuesta_idEncuesta = 52;
DELETE FROM Encuesta WHERE idEncuesta = 52;
*/