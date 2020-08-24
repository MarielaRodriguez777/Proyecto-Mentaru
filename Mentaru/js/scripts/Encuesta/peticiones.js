// Aqui estaran todas las peticiones AJAX
const FN_Peticion_IdentificarPersona = () => {
    // Identificar la persona con las pruebas del COVID-19
    // Realizar peticion AJAX
    /** En caso de identificar al usuario, hacer:
     * Actualizar data_persona
     *
     * Llamar a las funciones:
     * FN_Peticion_Departamentos
     * FN_Peticion_AntecedentesP
     * FN_Peticion_Sintomas
     * FN_Peticion_AsistenciaMedica
     *
     * LLamar las funciones de renderizar:
     * FN_Render_InfoPersona
     * FN_Render_Departamentos
     * FN_Render_Patologias
     * FN_Render_NoPatologias
     * FN_Render_Municipios
     * FN_Render_Sintomas
     * FN_Render_Tratamientos
     * FN_Render_LugarAsistencia
     */
    $.ajax({
        //url: "https://mentaru.herokuapp.com/api/EN/EN_IDENTIFICAR",
        //url: "http://localhost:3000/api/EN/EN_IDENTIFICAR",
        url: "https://mentaru.herokuapp.com/api/EN/EN_IDENTIFICAR",
        data: {
            "accion": $('#identificarse').val(),
            "numeroIdentidad": $('#txtIdentidad').val(),
            "numeroTelefono": $('#txtTelefono').val(),
            "codigoLaboratorio": $('#laboratorios').val(),
            "codigoPrueba": $('#txtPrueba').val(),
        },
        dataType: "json",
        method: "POST",
        success: function(respuesta) {
            if (respuesta.output.pcodigoMensaje == 0) {
                // Accion
            } else {
                console.log(respuesta.output.pmensaje);
            }
            data_persona = respuesta.data[0];
        },
        error: function(error) {
            console.log(error.responseText);
        }
    });
    imprimir('Se ha identificado la persona');

    FN_Peticion_Departamentos();
    FN_Peticion_Antecedentes();
    FN_Peticion_Sintomas();
    FN_Peticion_AsistenciaMedica();

    //FN_Render_InfoPersona();
    //FN_Render_Departamentos();
    //FN_Render_Patologias();
    //FN_Render_NoPatologias();
    //FN_Render_Municipios();
    //FN_Render_Sintomas();
    //FN_Render_Tratamientos();
    //FN_Render_LugarAsistencia();
}










const FN_Peticion_Laboratorios = () => {
    // Realizar peticion AJAX
    $.ajax({
        async: false,
        //url: "https://mentaru.herokuapp.com/api/EN/EN_IDENTIFICAR",
        //url: "http://localhost:3000/api/EN/VW_LABORATORIOS",
        url: "https://mentaru.herokuapp.com/api/EN/VW_LABORATORIOS",
        data: {},
        dataType: "json",
        method: "POST",
        success: function(respuesta) {
            data_laboratorios.Laboratorios = respuesta.data;
        },
        error: function(error) {
            console.log(error.responseText);
        }
    });
}



const FN_Peticion_Departamentos = () => {
    // Realizar peticion AJAX
    $.ajax({
        async: false,
        //url: "https://mentaru.herokuapp.com/api/EN/EN_IDENTIFICAR",
        //url: "http://localhost:3000/api/EN/VW_MUNICIPIOS",
        url: "https://mentaru.herokuapp.com/api/EN/VW_MUNICIPIOS",
        data: {},
        dataType: "json",
        method: "POST",
        success: function(respuesta) {
            let mayor = 0;
            let listaDepartamentos = [];
            let departamento = {};
            let municipio = {};
            for (let i = 0; i < respuesta.data.length; i++) {
                if (respuesta.data[i].idDepartamento > mayor) {
                    mayor = respuesta.data[i].idDepartamento;
                    departamento = {
                        "idDepartamento": respuesta.data[i].idDepartamento,
                        "nombreDepartamento": respuesta.data[i].Departamento,
                        "municipios": []
                    }
                    for (let j = 0; j < respuesta.data.length; j++) {
                        if (respuesta.data[j].idDepartamento == mayor) {
                            municipio = {
                                "idMunicipio": respuesta.data[j].idMunicipio,
                                "nombreMunicipio": respuesta.data[j].Municipio
                            };
                            departamento.municipios.push(municipio);
                        }
                    }
                    listaDepartamentos.push(departamento);
                }
            }
            data_departamentos = listaDepartamentos;
        },
        error: function(error) {
            console.log(error.responseText);
        }
    });
}



const FN_Peticion_Antecedentes = () => {
    // Realizar peticion AJAX
    $.ajax({
        async: false,
        //url: "https://mentaru.herokuapp.com/api/EN/EN_IDENTIFICAR",
        //url: "http://localhost:3000/api/EN/VW_ANTECEDENTESP",
        url: "https://mentaru.herokuapp.com/api/EN/VW_ANTECEDENTESP",
        data: {},
        dataType: "json",
        method: "POST",
        success: function(respuesta) {
            let ListaAntecedentesP = [];
            let antecedentesP = {};
            for (let i = 0; i < respuesta.data.length; i++) {
                antecedentesP = {
                    "idPatologia": respuesta.data[i].id,
                    "nombrePatologia": respuesta.data[i].nombre
                }
                ListaAntecedentesP.push(antecedentesP);
            }
            data_antecedentes.AntecedentesP = ListaAntecedentesP;
        },
        error: function(error) {
            console.log(error.responseText);
        }
    });

    $.ajax({
        async: false,
        //url: "https://mentaru.herokuapp.com/api/EN/EN_IDENTIFICAR",
        //url: "http://localhost:3000/api/EN/VW_ANTECEDENTESNP",
        url: "https://mentaru.herokuapp.com/api/EN/VW_ANTECEDENTESNP",
        data: {},
        dataType: "json",
        method: "POST",
        success: function(respuesta) {
            let ListaAntecedentesNP = [];
            let antecedentesNP = {};
            for (let i = 0; i < respuesta.data.length; i++) {
                antecedentesNP = {
                    "idNoPatologia": respuesta.data[i].id,
                    "nombreNoPatologia": respuesta.data[i].nombreNoPatologia
                }
                ListaAntecedentesNP.push(antecedentesNP);
            }
            data_antecedentes.AntecedentesNP = ListaAntecedentesNP;
        },
        error: function(error) {
            console.log(error.responseText);
        }
    });
}



const FN_Peticion_Sintomas = () => {
    // Realizar peticion AJAX
    $.ajax({
        async: false,
        //url: "https://mentaru.herokuapp.com/api/EN/EN_IDENTIFICAR",
        //url: "http://localhost:3000/api/EN/VW_SINTOMAS",
        url: "https://mentaru.herokuapp.com/api/EN/VW_SINTOMAS",
        data: {},
        dataType: "json",
        method: "POST",
        success: function(respuesta) {
            let ListaSintomas = [];
            let sintoma = {};
            for (let i = 0; i < respuesta.data.length; i++) {
                sintoma = {
                    "idSintoma": respuesta.data[i].idSintoma,
                    "nombreSintoma": respuesta.data[i].nombreSintoma,
                    "idTipoSintoma": respuesta.data[i].idTipoSintoma,
                    "nombreTipoSiontma": respuesta.data[i].nombreTipoSintoma
                }
                ListaSintomas.push(sintoma);
            }
            data_sintomas = ListaSintomas;
        },
        error: function(error) {
            console.log(error.responseText);
        }
    });
}



const FN_Peticion_AsistenciaMedica = () => {
    // Realizar peticion AJAX
    $.ajax({
        async: false,
        //url: "https://mentaru.herokuapp.com/api/EN/EN_IDENTIFICAR",
        //url: "http://localhost:3000/api/EN/VW_TRATAMIENTOS",
        url: "https://mentaru.herokuapp.com/api/EN/VW_TRATAMIENTOS",
        data: {},
        dataType: "json",
        method: "POST",
        success: function(respuesta) {
            let ListaTratamientos = [];
            let tratamiento = {};
            for (let i = 0; i < respuesta.data.length; i++) {
                tratamiento = {
                    "idTratamiento": respuesta.data[i].idTratamiento,
                    "nombreTratamiento": respuesta.data[i].nombreTratamiento
                }
                ListaTratamientos.push(tratamiento);
            }
            data_asistencia_medica.Tratamientos = ListaTratamientos;
        },
        error: function(error) {
            console.log(error.responseText);
        }
    });

    $.ajax({
        async: false,
        //url: "https://mentaru.herokuapp.com/api/EN/EN_IDENTIFICAR",
        //url: "http://localhost:3000/api/EN/VW_LASISTENCIA",
        url: "https://mentaru.herokuapp.com/api/EN/VW_LASISTENCIA",
        data: {},
        dataType: "json",
        method: "POST",
        success: function(respuesta) {
            let ListaLugarAsistencia = [];
            let lugarAsistencia = {};
            for (let i = 0; i < respuesta.data.length; i++) {
                lugarAsistencia = {
                    "idLugarAsistencia": respuesta.data[i].idLugarAsistencia,
                    "nombreLugarAsistencia": respuesta.data[i].nombreLugarAsistencia
                }
                ListaLugarAsistencia.push(lugarAsistencia);
            }
            data_asistencia_medica.LugaresAsistencia = ListaLugarAsistencia;
        },
        error: function(error) {
            console.log(error.responseText);
        }
    });
}












const FN_Peticion_EnviarEncuesta = () => {
    // Realizar peticion AJAX
    // Enviar todos los datos recopilados por la encuesta
    imprimir('Se ha enviado la encuesta al servidor');
}