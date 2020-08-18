'use strict'

// IMPORTANDO LOS MODULOS NECESARIOS
const express = require('express');
const functionsEN = require('./functionsQuerys/functionsEN');
//const functionsMiscelaneos = require('./functionsMiscelaneos/functionsMiscelaneos');

// DEFINIENDO OBJETO QUE SE UTILIZAR PARA ATENDER LLAMADOS CON LA RUTA '/volvo/api/GU'
const apiEN = express.Router();

// DEFINIENDO SUBRUTAS Y ATENCION A PETICIONES AL SERVIDOR
apiEN.post('/EN_IDENTIFICAR', /*functionsMiscelaneos.authToken,*/ functionsEN.EN_IDENTIFICAR);




// EXPORTANDO EL OBJETO DESEADO
module.exports = apiEN;