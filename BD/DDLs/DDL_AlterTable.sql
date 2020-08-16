-- -----------------------------------------------------
-- Schema MENTARUDB
-- -----------------------------------------------------
USE MENTARUDB ;


-- -----------------------------------------------------
-- Table Municipio
-- -----------------------------------------------------
ALTER TABLE Municipio ADD
	CONSTRAINT fk_Municipio_Departamento1
		FOREIGN KEY (Departamento_idDepartamento)
		REFERENCES Departamento (idDepartamento)


-- -----------------------------------------------------
-- Table Persona
-- -----------------------------------------------------
ALTER TABLE Persona ADD
	CONSTRAINT numeroIdentidad_UNIQUE
		UNIQUE (numeroIdentidad),
	CONSTRAINT numeroTelefono_UNIQUE
		UNIQUE (numeroTelefono),
	CONSTRAINT fk_Persona_Genero
		FOREIGN KEY (Genero_idGenero)
		REFERENCES Genero (idGenero),
	CONSTRAINT fk_Persona_Municipio1
		FOREIGN KEY (Municipio_idMunicipio)
		REFERENCES Municipio (idMunicipio)


-- -----------------------------------------------------
-- Table Encuesta
-- -----------------------------------------------------
ALTER TABLE Encuesta ADD
	CONSTRAINT codigoEncuesta_UNIQUE
		UNIQUE (codigoEncuesta),
	CONSTRAINT fk_Encuesta_EstadoPaciente1
		FOREIGN KEY (EstadoPaciente_idEstadoPaciente)
		REFERENCES EstadoPaciente (idEstadoPaciente),
	CONSTRAINT fk_Encuesta_Persona1
		FOREIGN KEY (Persona_idPersona)
		REFERENCES Persona (idPersona)


-- -----------------------------------------------------
-- Table Cronologia
-- -----------------------------------------------------
ALTER TABLE Cronologia ADD
	CONSTRAINT fk_Cronologia_Encuesta1
		FOREIGN KEY (Encuesta_idEncuesta)
		REFERENCES Encuesta (idEncuesta)


-- -----------------------------------------------------
-- Table Sintoma
-- -----------------------------------------------------
ALTER TABLE Sintoma ADD
	CONSTRAINT fk_Sintomas_TipoSintomas1
		FOREIGN KEY (TipoSintomas_idTipoSintomas)
		REFERENCES TipoSintoma (idTipoSintoma)


-- -----------------------------------------------------
-- Table listaSintomas
-- -----------------------------------------------------
ALTER TABLE listaSintomas ADD
	CONSTRAINT fk_Persona_has_Sintomas_Sintomas1
		FOREIGN KEY (Sintoma_idSintoma)
		REFERENCES Sintoma (idSintoma),
	CONSTRAINT fk_listaSintomas_Encuesta1
		FOREIGN KEY (Encuesta_idEncuesta)
		REFERENCES Encuesta (idEncuesta)


-- -----------------------------------------------------
-- Table Laboratorio
-- -----------------------------------------------------
ALTER TABLE Laboratorio ADD
	CONSTRAINT fk_Laboratorio_Municipio1
		FOREIGN KEY (Municipio_idMunicipio)
		REFERENCES Municipio (idMunicipio)


-- -----------------------------------------------------
-- Table AsistenciaMedica
-- -----------------------------------------------------
ALTER TABLE AsistenciaMedica ADD
	CONSTRAINT fk_AsistenciaMedica_Encuesta1
		FOREIGN KEY (Encuesta_idEncuesta)
		REFERENCES Encuesta (idEncuesta),
	CONSTRAINT fk_AsistenciaMedica_Tratamiento1
		FOREIGN KEY (Tratamiento_idTratamiento)
		REFERENCES Tratamiento (idTratamiento),
	CONSTRAINT fk_AsistenciaMedica_LugarAsistencia1
		FOREIGN KEY (LugarAsistencia_idLugarAsistencia)
		REFERENCES LugarAsistencia (idLugarAsistencia)


-- -----------------------------------------------------
-- Table Prueba
-- -----------------------------------------------------
ALTER TABLE Prueba ADD
	CONSTRAINT fk_Prueba_Persona1
		FOREIGN KEY (Persona_idPersona)
		REFERENCES Persona (idPersona)


-- -----------------------------------------------------
-- Table ListaPruebas
-- -----------------------------------------------------
ALTER TABLE ListaPruebas ADD
	CONSTRAINT fk_Prueba_has_Laboratorio_Prueba1
		FOREIGN KEY (Prueba_idPrueba)
		REFERENCES Prueba (idPrueba),
	CONSTRAINT fk_Prueba_has_Laboratorio_Laboratorio1
		FOREIGN KEY (Laboratorio_idLaboratorio)
		REFERENCES Laboratorio (idLaboratorio)


-- -----------------------------------------------------
-- Table AntecedentesNP
-- -----------------------------------------------------
ALTER TABLE AntecedentesNP ADD
	CONSTRAINT fk_InfoAntecedentes_Encuesta1
		FOREIGN KEY (Encuesta_idEncuesta)
		REFERENCES Encuesta (idEncuesta)


-- -----------------------------------------------------
-- Table CronologiaContagios
-- -----------------------------------------------------
ALTER TABLE CronologiaContagios ADD
	CONSTRAINT fk_CronologiaContagios_Municipio1
		FOREIGN KEY (Municipio_idMunicipio)
		REFERENCES Municipio (idMunicipio)


-- -----------------------------------------------------
-- Table Usuarios
-- -----------------------------------------------------
ALTER TABLE Usuarios ADD
	CONSTRAINT correoElectronico_UNIQUE
		UNIQUE (correoElectronico),
	CONSTRAINT fk_Usuarios_Persona1
		FOREIGN KEY (Persona_idPersona)
		REFERENCES Persona (idPersona)


-- -----------------------------------------------------
-- Table AntecedentesP
-- -----------------------------------------------------
ALTER TABLE AntecedentesP ADD
	CONSTRAINT fk_AntecedentesP_Encuesta1
		FOREIGN KEY (Encuesta_idEncuesta)
		REFERENCES Encuesta (idEncuesta)


-- -----------------------------------------------------
-- Table ListaAntecedentesP
-- -----------------------------------------------------
ALTER TABLE ListaAntecedentesP ADD
	CONSTRAINT fk_Patologia_has_AntecedentesP_Patologia1
		FOREIGN KEY (Patologia_idPatologia)
		REFERENCES Patologia (idPatologia),
	CONSTRAINT fk_Patologia_has_AntecedentesP_AntecedentesP1
		FOREIGN KEY (AntecedentesP_idAntecedentesP)
		REFERENCES AntecedentesP (idAntecedentesP)


-- -----------------------------------------------------
-- Table ListaAntecedentesNP
-- -----------------------------------------------------
ALTER TABLE ListaAntecedentesNP ADD
	CONSTRAINT fk_NoPatologia_has_AntecedentesNP_NoPatologia1
		FOREIGN KEY (NoPatologia_idNoPatologia)
		REFERENCES NoPatologia (idNoPatologia),
	CONSTRAINT fk_NoPatologia_has_AntecedentesNP_AntecedentesNP1
		FOREIGN KEY (AntecedentesNP_idAntecedentesNP)
		REFERENCES AntecedentesNP (idAntecedentesNP)
