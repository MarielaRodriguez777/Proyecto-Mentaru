'use strict'

// IMPORTANDO LOS MODULOS NECESARIOS
const express = require('express');
const directorio = require('../../ruta');

// DEFINIENDO OBJETOS IMPORTANTES
const path = directorio.ruta.replace(/\\/g, '/') + "/Mentaru";

// DEFINIENDO OBJETO QUE MANEJARA LA RUTA '/mentaru'
const apisViews = express.Router();

// DEFINIENDO MIDDLEWARES PARA SERVIR ARCHIVOS ESTATICOS
apisViews.use(express.static(path));



// DEFINIENDO APIS PARA MOSTRAR CADA UNA DE LAS VISTA
// -- VISTA index


apisViews.get('/', (req, res) => {
    /*if (req.session.name) {
    	res.redirect('/mentaru')
    } else {
    	res.sendFile(path + '/index.html');
    }*/
    res.sendFile(path + '/index.html');
});

apisViews.get('/estadisticas', (req, res) => {
    /*if (req.session.name) {
    	res.redirect('/mentaru')
    } else {
    	res.sendFile(path + '/index.html');
    }*/
    res.sendFile(path + '/estadisticas.html');
});


// EXPORTANDO LA API QUE MUESTRA LA VISTA
module.exports = apisViews;