// Aqui estaran todas las renderizaciones de la pantalla encuesta
const FN_Render_InfoPersona = () => {
    // Actualizar la informacion del paciente
    imprimir('Se ha actualizado la informacion del paciente');
}

const FN_Render_Departamentos = () => {
    // Actualizar combobox de Departamentos
    imprimir('Se ha actualizado el combobox de Departamentos');
}

const FN_Render_Municipios = () => {
    // Actualizar combobox de Municipio
    imprimir('Se ha actualizado el combobox de Municipios');
}

const FN_Render_Patologias = () => {
    // Actualizar lista de Patologias
    imprimir('Se ha actualizado la lista de Patologias');
}

const FN_Render_NoPatologias = () => {
    // Actualizar lista de No Patologias
    imprimir('Se ha actualizado la lista de No Patologias');
}

const FN_Render_Sintomas = () => {
    // Actualizar lista de Sintomas
    imprimir('Se ha actualizado la lista de Sintomas');
}

const FN_Render_Tratamientos = () => {
    // Actualizar combobox de Tratamientos
    imprimir('Se ha actualizado el combobox de Tratamientos');
}

const FN_Render_LugarAsistencia = () => {
    // Actualizar combobox de Lugar de Asistencia
    imprimir('Se ha actualizado el combobox de Lugar de Asistencia');
}

const FN_Render_Identificarse = () => {
    let html = '';

    if ($('#identificarse').val() == "TELEFONO") {
        console.log("se ha elegido la opción teléfono");
        html = `
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
				<form id="contactForm" data-toggle="validator" data-focus="false">
					<div class="form-group">
						<input type="text" class="form-control-input" id="txtTelefono" required>
						<label class="label-control" for="txtTelefono">Número de Telefono</label>
						<div class="help-block with-errors"></div>
					</div>
				</form>
			</div>
		</div>

		`;

    } else if ($('#identificarse').val() == "IDENTIDAD") {
        console.log("se ha elegido la opción identidad");
        html = `
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-6">
				<form id="contactForm" data-toggle="validator" data-focus="false">
					<div class="form-group">
						<input type="text" class="form-control-input" id="txtIdentidad" required>
						<label class="label-control" for="txtIdentidad">Número de Identidad</label>
						<div class="help-block with-errors"></div>
					</div>
				</form>
			</div>
		</div>

		`;

    } else if ($('#identificarse').val() == "PRUEBA") {

        console.log("se ha elegido la opción prueba");
        html = `
		<div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <form id="contactForm" data-toggle="validator" data-focus="false">
                    <div class="form-group">
                        <select class="form-control-select form-control form-control-lg" id="laboratorio" required>
							<option class="select-option" value="" disabled selected>Elija el laboratorio donde se realizó la prueba</option>
							<option class="select-option" value="Delete data">Delete my data</option>
							<option class="select-option" value="Show me data">Show me my data</option>
						</select>
                        <div class="help-block with-errors"></div>
                    </div>
                </form>
            </div>
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <form id="contactForm" data-toggle="validator" data-focus="false">
                    <div class="form-group">
                        <input type="text" class="form-control-input" id="txtPrueba" required>
                        <label class="label-control" for="txtPrueba">Ingrese el código de su examen</label>
                        <div class="help-block with-errors"></div>
                    </div>
                </form>
            </div>
        </div>
		`
    }
    document.getElementById('render-identificarse').innerHTML = html;
}