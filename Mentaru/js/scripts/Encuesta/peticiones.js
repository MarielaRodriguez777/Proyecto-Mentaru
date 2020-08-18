// Aqui estaran todas las peticiones AJAX
const FN_Peticion_IdentificarPersona = () => {
    // Identificar la persona con las pruebas del COVID-19
    // Realizar peticion AJAX
    $.ajax({
        url: "https://localhost:3000/mentaru/api/ruta",
        data: {
            "accion": "PRUEBA",
            "campo1": "valor1",
            "campo2": "valor2",
        },
        dataType: "json",
        method: "POST",
        success: function(respuesta) {
            if (respuesta.pcodigoMensaje == 0) {
                // Accion
            } else {
                console.log(respuesta.pmensaje);
            }
        },
        error: function(error) {
            console.log(error.responseText);
        }
    });
    return false;

    /** En caso de identificar al usuario, hacer:
     * Actualizar data_persona
     *
     * Llamar a las funciones:
     * FN_Peticion_Departamentos
     * FN_Peticion_Antecedents
     * FN_Peticion_Sintomas
     * FN_Peticion_AsistenciaMedica
     *
     * LLamar las funciones de renderizar:
     * FN_Render_InfoPersona
     * FN_Render_Departamentos
     * FN_Render_Patologias
     * FN_Render_NoPatologias
     */

    imprimir('Se ha identificado la persona');
}

const FN_Peticion_Departamentos = () => {
    // Realizar peticion AJAX
    // Actualizar data_departamentos
    imprimir('Se ha actualizado la data de departamentos');
}

const FN_Peticion_Antecedentes = () => {
    // Realizar peticion AJAX
    // Actualizar data_antecedentes
    imprimir('Se ha actualizado la data de antecedentes');
}

const FN_Peticion_Sintomas = () => {
    // Realizar peticion AJAX
    // Actualizar data_sintomas
    imprimir('Se ha actualizado la data de sintomas');
}

const FN_Peticion_AsistenciaMedica = () => {
    // Realizar peticion AJAX
    // Actualizar data_asistencia_medica
    imprimir('Se ha actualizado la data de asistencia medica');
}

const FN_Peticion_EnviarEncuesta = () => {
    // Realizar peticion AJAX
    // Enviar todos los datos recopilados por la encuesta
    imprimir('Se ha enviado la encuesta al servidor');
}