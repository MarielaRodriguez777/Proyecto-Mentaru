'use strict'

// IMPORTANDO LOS MODULOS NECESARIOS
const express = require('express');
const functionsES = require('./functionsQuerys/functionsES');
//const functionsMiscelaneos = require('./functionsMiscelaneos/functionsMiscelaneos');

// DEFINIENDO OBJETO QUE SE UTILIZAR PARA ATENDER LLAMADOS CON LA RUTA '/volvo/api/GU'
const apiES = express.Router();

// DEFINIENDO SUBRUTAS Y ATENCION A PETICIONES AL SERVIDOR
apiES.post('/ES_GENERAL', functionsES.ES_GENERAL);
//apiES.post('/ES_', functionsEN.EN_INFO);

apiES.post('/VW_TIPOESTADISTICAS', functionsES.VW_TIPOESTADISTICAS);



// EXPORTANDO EL OBJETO DESEADO
module.exports = apiES;