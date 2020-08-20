var data_persona = {
	"idPersona": "1",
	"primerNombre":"Luis",
	"segundoNombre":"Fernando",
	"primerApellido":"Solano",
	"segundoApellido":"Martínez",
	"numeroIdentidad":"9999-9999-99999",
	"numeroTelefono":"+504 9999-9999",
	"edad":22,
	"idGenero":1,
	"Genero":"Hombre",
};

var data_departamentos = [
	{
		"idDepartamento": 1,
		"nombreDepartamento": "Yoro",
		"municipios":[
			{
				"idMunicipio": 1,
				"nombreMunicipio": "El Progreso"
			},{
				"idMunicipio": 2,
				"nombreMunicipio": "Santa Rita"
			},{
				"idMunicipio": 3,
				"nombreMunicipio": "El Negrito"
			},{
				"idMunicipio": 4,
				"nombreMunicipio": "Morazán"
			},{
				"idMunicipio": 5,
				"nombreMunicipio": "Victoria"
			},{
				"idMunicipio": 6,
				"nombreMunicipio": "Sulaco"
			}
		]
	},{
		"idDepartamento": 2,
		"nombreDepartamento": "Comayagua",
		"municipios":[
			{
				"idMunicipio": 1,
				"nombreMunicipio": "Comayagua"
			},{
				"idMunicipio": 2,
				"nombreMunicipio": "Siguatepeque"
			},{
				"idMunicipio": 3,
				"nombreMunicipio": "San Sebastian"
			},{
				"idMunicipio": 4,
				"nombreMunicipio": "San Geronimo"
			}
		]
	},
];

var data_antecedentes = {
	"AntecedentesP":[
		{
			"idPatologia": 1,
			"nombrePatologia": "Diabetes"
		},{
			"idPatologia": 1,
			"nombrePatologia": "Hipertension"
		},{
			"idPatologia": 1,
			"nombrePatologia": "Insuficiencia Renal"
		}
	], "AntecedentesNP":[
		{
			"idNoPatologia": 1,
			"nombreNoPatologia": "Estuvo fuera de casa en los ultimos 14 dias"
		},{
			"idNoPatologia": 1,
			"nombreNoPatologia": "Estuvo en el extrangero en los ultimos 14 dias"
		},{
			"idNoPatologia": 1,
			"nombreNoPatologia": "Mantuvo contacto con una persona infectada"
		}
	]
};

var data_sintomas = [
	{
		"idSiontma": 1,
		"nombreSintoma":"Tos Seca",
		"tipoSintoma": 1,
		"nombreTipoSiontma":"Sintoma Comun"
	},{
		"idSiontma": 4,
		"nombreSintoma":"Secrecion Nazal",
		"tipoSintoma": 2,
		"nombreTipoSiontma":"Sintoma No Comun"
	},{
		"idSiontma": 8,
		"nombreSintoma":"Fiebre",
		"tipoSintoma": 3,
		"nombreTipoSiontma":"Sintoma Grave"
	}
]

var data_asistencia_medica = {
	"Tratamientos":[
		{
			"idTratamiento": 1,
			"nombreTratamiento":"Tratamiento del maiz"
		},{
			"idTratamiento": 2,
			"nombreTratamiento":"Tratamiento ibuprofeno"
		},{
			"idTratamiento": 3,
			"nombreTratamiento":"Tratamiento aspirinas"
		}
	],
	"LugaresAsistencia":[
		{
			"idLugarAsistencia": 1,
			"nombreLugarAsistencia":"En un Hospital"
		},{
			"idLugarAsistencia": 2,
			"nombreLugarAsistencia":"En un Clinica"
		},{
			"idLugarAsistencia": 3,
			"nombreLugarAsistencia":"En internet"
		},{
			"idLugarAsistencia": 4,
			"nombreLugarAsistencia":"Con un familiar"
		}
	]
};
