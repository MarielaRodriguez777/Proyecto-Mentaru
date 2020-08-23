// Aqui estaran todas las funciones que llamen a las renderizaciones segun sea el evento de los objetos
// Por ejemplo: Cuando se elija un departamento, es un evento el cual debe renderizar el combobox de Municipios
// Estaran todos los llamados a la renderizacion menos el de InfoPersona, ese se llama al identificar la persona
imprimir('Hola');
imprimir(data_persona);
imprimir(data_departamentos);
imprimir(data_antecedentes);
imprimir(data_sintomas);
imprimir(data_asistencia_medica);
imprimir('');

imprimir('Funciones de renderizacion');
FN_Render_InfoPersona();
FN_Render_Departamentos();
FN_Render_Patologias();
FN_Render_NoPatologias();
FN_Render_Sintomas();
FN_Render_Tratamientos();
FN_Render_LugarAsistencia();
imprimir('');

imprimir('Funciones de peticiones AJAX');
/* FN_Peticion_IdentificarPersona(); */
FN_Peticion_Departamentos();
FN_Peticion_Antecedentes();
FN_Peticion_Sintomas();
FN_Peticion_AsistenciaMedica();
FN_Peticion_EnviarEncuesta();


$("#identificarse").change(function() {
    imprimir('Se ha cambiado el valor del combobox ...');

    FN_Render_Identificarse();
});


$("#btn-encontrarPrueba").click(function() {
    imprimir('Se ha pulsado el boton ...');
    FN_Peticion_IdentificarPersona();
});