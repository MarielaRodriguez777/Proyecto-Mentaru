// Aqui estaran todas las renderizaciones de la pantalla encuesta
const FN_Render_InfoPersona = () => {
    // Actualizar la informacion del paciente
    document.getElementById('info_txtNombres').value = data_persona.primerNombre + " " + data_persona.segundoNombre;
    document.getElementById('info_txtApellidos').value = data_persona.primerApellido + " " + data_persona.segundoApellido;
    document.getElementById('info_txtIdentidad').value = data_persona.numeroIdentidad;
    document.getElementById('info_txtTelefono').value = data_persona.numeroTelefono;
    document.getElementById('info_txtEdad').value = data_persona.edad;

    if (data_persona.idGenero = 1) {
        document.getElementById('info_optMasculino').checked = true;
    } else if (data_persona.idGenero = 2) {
        document.getElementById('info_optFemenino').checked = true;
    }

    imprimir('Se ha actualizado la informacion del paciente');
}

const FN_Render_Departamentos = () => {
    let opcionHTML = ``;
    let mayor = 0;
    for (let i = 0; i < data_departamentos.length; i++) {
        if (data_departamentos[i].idDepartamento > mayor) {
            mayor = data_departamentos[i].idDepartamento;
            opcionHTML += `
			<option class="select-option" value="${data_departamentos[i].idDepartamento}">${data_departamentos[i].nombreDepartamento}</option>
			`;
        }
    }
    let html = `
		<option class="select-option" value="" disabled selected>Departamento</option>
		${opcionHTML}
	`;
    document.getElementById('info_cmbDepartamentos').innerHTML = html;

    // Actualizar combobox de Departamentos
    imprimir('Se ha actualizado el combobox de Departamentos');
}

const FN_Render_Municipios = () => {
    let opcionHTML = ``;
    let idDep = document.getElementById('info_cmbDepartamentos').value;
    let index = data_departamentos.findIndex(function(el) {
        return el.idDepartamento == idDep;
    });
    for (let i = 0; i < data_departamentos[index].municipios.length; i++) {
        let id, nombre;
        id = data_departamentos[index].municipios[i].idMunicipio;
        nombre = data_departamentos[index].municipios[i].nombreMunicipio;
        opcionHTML += `
		<option class="select-option" value="${id}">${nombre}</option>
		`;
    }
    let html = `
		<option class="select-option" value="" disabled selected>Departamento</option>
		${opcionHTML}
	`;
    document.getElementById('info_cmbMunicipios').innerHTML = html;

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
        FN_Peticion_Laboratorios();
        let htmlLaboratorios = ``;
        for (let i = 0; i < data_laboratorios.Laboratorios.length; i++) {
            htmlLaboratorios += `
			<option class="select-option" value="${data_laboratorios.Laboratorios[i].codigo}">${data_laboratorios.Laboratorios[i].nombre}</option>
			`;
        }

        html = `
		<div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6 col-xl-6">
                <form id="contactForm" data-toggle="validator" data-focus="false">
                    <div class="form-group">
                        <select class="form-control-select form-control form-control-lg" id="laboratorios" required>
							<option class="select-option" value="" disabled selected>Elija el laboratorio donde se realizó la prueba</option>
							${htmlLaboratorios}
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