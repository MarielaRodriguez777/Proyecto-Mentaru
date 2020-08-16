-- -----------------------------------------------------
-- Schema MENTARUDB
-- -----------------------------------------------------
--CREATE DATABASE MENTARUDB;
USE MENTARUDB ;

-- -----------------------------------------------------
-- Table Genero
-- -----------------------------------------------------
CREATE TABLE Genero (
	idGenero INT NOT NULL,
	descripcion VARCHAR(45) NULL,
	PRIMARY KEY (idGenero)
)


-- -----------------------------------------------------
-- Table Departamento
-- -----------------------------------------------------
CREATE TABLE Departamento (
	idDepartamento INT NOT NULL,
	descripcion VARCHAR(45) NULL,
	PRIMARY KEY (idDepartamento)
)


-- -----------------------------------------------------
-- Table Municipio
-- -----------------------------------------------------
CREATE TABLE Municipio (
	idMunicipio INT NOT NULL,
	descripcion VARCHAR(100) NULL,
	Departamento_idDepartamento INT NOT NULL,
	PRIMARY KEY (idMunicipio)
)


-- -----------------------------------------------------
-- Table Persona
-- -----------------------------------------------------
CREATE TABLE Persona (
	idPersona INT NOT NULL,
	primerNombre VARCHAR(45) NULL,
	segundoNombre VARCHAR(45) NULL,
	primerApellido VARCHAR(45) NULL,
	segundoApellido VARCHAR(45) NULL,
	numeroIdentidad VARCHAR(45) NULL,
	numeroTelefono VARCHAR(45) NULL,
	edad INT NULL,
	Genero_idGenero INT NOT NULL,
	Municipio_idMunicipio INT NULL,
	PRIMARY KEY (idPersona)
)


-- -----------------------------------------------------
-- Table Patologia
-- -----------------------------------------------------
CREATE TABLE Patologia (
	idPatologia INT NOT NULL,
	descripcion VARCHAR(45) NULL,
	PRIMARY KEY (idPatologia)
)


-- -----------------------------------------------------
-- Table NoPatologia
-- -----------------------------------------------------
CREATE TABLE NoPatologia (
	idNoPatologia INT NOT NULL,
	descripcion VARCHAR(45) NULL,
	PRIMARY KEY (idNoPatologia)
)


-- -----------------------------------------------------
-- Table EstadoPaciente
-- -----------------------------------------------------
CREATE TABLE EstadoPaciente (
	idEstadoPaciente INT NOT NULL,
	descripcion VARCHAR(45) NULL,
	PRIMARY KEY (idEstadoPaciente)
)


-- -----------------------------------------------------
-- Table Encuesta
-- -----------------------------------------------------
CREATE TABLE Encuesta (
	idEncuesta INT NOT NULL,
	codigoEncuesta VARCHAR(45) NOT NULL,
	fechaEncuesta DATE NULL,
	EstadoPaciente_idEstadoPaciente INT NOT NULL,
	Persona_idPersona INT NOT NULL,
	PRIMARY KEY (idEncuesta)
)


-- -----------------------------------------------------
-- Table Cronologia
-- -----------------------------------------------------
CREATE TABLE Cronologia (
	idCronologia INT NOT NULL,
	fechaPrueba DATE NULL,
	diasSintomas INT NULL,
	diasCuarentena INT NULL,
	fechaRecuperacion DATE NULL,
	Encuesta_idEncuesta INT NOT NULL,
	PRIMARY KEY (idCronologia)
)


-- -----------------------------------------------------
-- Table TipoSintoma
-- -----------------------------------------------------
CREATE TABLE TipoSintoma (
	idTipoSintoma INT NOT NULL,
	descripcion VARCHAR(45) NULL,
	PRIMARY KEY (idTipoSintoma)
)


-- -----------------------------------------------------
-- Table Sintoma
-- -----------------------------------------------------
CREATE TABLE Sintoma (
	idSintoma INT NOT NULL,
	descripcion VARCHAR(100) NULL,
	TipoSintomas_idTipoSintomas INT NOT NULL,
	PRIMARY KEY (idSintoma)
)


-- -----------------------------------------------------
-- Table listaSintomas
-- -----------------------------------------------------
CREATE TABLE listaSintomas (
	Encuesta_idEncuesta INT NOT NULL,
	Sintoma_idSintoma INT NOT NULL,
	diasSintoma INT NULL,
	fechaSintoma DATE NULL,
	PRIMARY KEY (Encuesta_idEncuesta, Sintoma_idSintoma)
)


-- -----------------------------------------------------
-- Table Laboratorio
-- -----------------------------------------------------
CREATE TABLE Laboratorio (
	idLaboratorio INT NOT NULL,
	codigoLaboratio VARCHAR(45) NOT NULL,
	nombreLaboratorio VARCHAR(45) NULL,
	direccion VARCHAR(200) NULL,
	Municipio_idMunicipio INT NOT NULL,
	PRIMARY KEY (idLaboratorio)
)


-- -----------------------------------------------------
-- Table Tratamiento
-- -----------------------------------------------------
CREATE TABLE Tratamiento (
	idTratamiento INT NOT NULL,
	descripcion VARCHAR(100) NULL,
	PRIMARY KEY (idTratamiento)
)


-- -----------------------------------------------------
-- Table LugarAsistencia
-- -----------------------------------------------------
CREATE TABLE LugarAsistencia (
	idLugarAsistencia INT NOT NULL,
	descripcion VARCHAR(200) NULL,
	PRIMARY KEY (idLugarAsistencia)
)


-- -----------------------------------------------------
-- Table AsistenciaMedica
-- -----------------------------------------------------
CREATE TABLE AsistenciaMedica (
	idAsistenciaMedica INT NOT NULL,
	fecha DATE NULL,
	Encuesta_idEncuesta INT NOT NULL,
	Tratamiento_idTratamiento INT NOT NULL,
	LugarAsistencia_idLugarAsistencia INT NOT NULL,
	PRIMARY KEY (idAsistenciaMedica)
)


-- -----------------------------------------------------
-- Table Prueba
-- -----------------------------------------------------
CREATE TABLE Prueba (
	idPrueba INT NOT NULL,
	codigoPrueba VARCHAR(45) NOT NULL,
	fecha DATE NULL,
	infectado INT NULL,
	Persona_idPersona INT NOT NULL,
	PRIMARY KEY (idPrueba)
)


-- -----------------------------------------------------
-- Table ListaPruebas
-- -----------------------------------------------------
CREATE TABLE ListaPruebas (
	Prueba_idPrueba INT NOT NULL,
	Laboratorio_idLaboratorio INT NOT NULL,
	PRIMARY KEY (Prueba_idPrueba, Laboratorio_idLaboratorio)
)


-- -----------------------------------------------------
-- Table AntecedentesNP
-- -----------------------------------------------------
CREATE TABLE AntecedentesNP (
	idAntecedentesNP INT NOT NULL,
	cPersonaVivienda INT NULL,
	Encuesta_idEncuesta INT NOT NULL,
	PRIMARY KEY (idAntecedentesNP)
)


-- -----------------------------------------------------
-- Table CronologiaContagios
-- -----------------------------------------------------
CREATE TABLE CronologiaContagios (
	idCronologiaContagios INT NOT NULL,
	fecha DATE NULL,
	cantidadContagios INT NULL,
	cantidadMuertes INT NULL,
	cantidadRecuperados INT NULL,
	cantidadActivos INT NULL,
	Municipio_idMunicipio INT NOT NULL,
	PRIMARY KEY (idCronologiaContagios)
)


-- -----------------------------------------------------
-- Table Usuarios
-- -----------------------------------------------------
CREATE TABLE Usuarios (
	idUsuarios INT NOT NULL,
	correoElectronico VARCHAR(45) NOT NULL,
	contraseña VARCHAR(45) NOT NULL,
	Persona_idPersona INT NOT NULL,
	PRIMARY KEY (idUsuarios)
)


-- -----------------------------------------------------
-- Table AntecedentesP
-- -----------------------------------------------------
CREATE TABLE AntecedentesP (
	idAntecedentesP INT NOT NULL,
	infectadoAnteriormente INT NULL,
	Encuesta_idEncuesta INT NOT NULL,
	PRIMARY KEY (idAntecedentesP)
)


-- -----------------------------------------------------
-- Table ListaAntecedentesP
-- -----------------------------------------------------
CREATE TABLE ListaAntecedentesP (
	Patologia_idPatologia INT NOT NULL,
	AntecedentesP_idAntecedentesP INT NOT NULL,
	PRIMARY KEY (Patologia_idPatologia, AntecedentesP_idAntecedentesP)
)


-- -----------------------------------------------------
-- Table ListaAntecedentesNP
-- -----------------------------------------------------
CREATE TABLE ListaAntecedentesNP (
	NoPatologia_idNoPatologia INT NOT NULL,
	AntecedentesNP_idAntecedentesNP INT NOT NULL,
	PRIMARY KEY (NoPatologia_idNoPatologia, AntecedentesNP_idAntecedentesNP)
)
