// IMPORTANDO MODULOS NECESARIOS
const bodyParser = require('body-parser');
const express = require('express');
const session = require('express-session');
const config = require('./Server/settings/config');

// IMPORTANTDO APIS
const apisViews = require('./Server/views/apisViews');
const apisEN = require('./Server/apis/apiEN');
//const apisES = require('./Server/apis/apiES');
//const apisUS = require('./Server/apis/apiUS');
//const apisMiscelaneos = require('./Server/apis/apiMiscelaneos');

// DEFINIENDO LA VARIABLE 'app' QUE ES EL SERVIDOR
const app = express();


// DEFINIENDO MIDDLEWARE'S
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(session(config.configSession));
app.use('/view/', apisViews);
app.use('/api/EN', apisEN);
//app.use('/api/ES', apisES);
//app.use('/api/US', apisUS);
//app.use('/api/Miscelaneos', apisMiscelaneos);


// Punto de inicio
app.get('/probarAPI', (req, res) => {
    /*if (req.session.name) {
    	functionsMiscelaneos.redirectById(req, res);
    } else {
    	res.redirect('/view/index');
    }*/
    res.redirect('/api/EN/EN_IDENTIFICAR');
});

// Punto de inicio
app.get('/', (req, res) => {
    /*if (req.session.name) {
    	functionsMiscelaneos.redirectById(req, res);
    } else {
    	res.redirect('/view/index');
    }*/
    res.redirect('/view/');
});



module.exports = app;