'use strict'

// IMPORTANDO LOS MODULOS NECESARIOS
const express = require('express');
const functionsEN = require('./functionsQuerys/functionsEN');
//const functionsMiscelaneos = require('./functionsMiscelaneos/functionsMiscelaneos');

// DEFINIENDO OBJETO QUE SE UTILIZAR PARA ATENDER LLAMADOS CON LA RUTA '/volvo/api/GU'
const apiEN = express.Router();

// DEFINIENDO SUBRUTAS Y ATENCION A PETICIONES AL SERVIDOR
apiEN.post('/EN_IDENTIFICAR', functionsEN.EN_IDENTIFICAR);
//apiEN.post('/EN_INFO', functionsEN.EN_INFO);
apiEN.post('/EN_SINTOMAS', functionsEN.EN_SINTOMAS);
apiEN.post('/EN_TRATAMIENTOS', functionsEN.EN_TRATAMIENTOS);

apiEN.post('/VW_ANTECEDENTESP', functionsEN.VW_ANTECEDENTESP);
apiEN.post('/VW_ANTECEDENTESNP', functionsEN.VW_ANTECEDENTESNP);
apiEN.post('/VW_LABORATORIOS', functionsEN.VW_LABORATORIOS);
apiEN.post('/VW_LASISTENCIA', functionsEN.VW_LASISTENCIA);
apiEN.post('/VW_MUNICIPIOS', functionsEN.VW_MUNICIPIOS);
apiEN.post('/VW_SINTOMAS', functionsEN.VW_SINTOMAS);
apiEN.post('/VW_TRATAMIENTOS', functionsEN.VW_TRATAMIENTOS);



// EXPORTANDO EL OBJETO DESEADO
module.exports = apiEN;