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
app.use('/mentaru/', apisViews);
app.use('/mentaru/api/EN', apisEN);
//app.use('/mentaru/api/ES', apisES);
//app.use('/mentaru/api/US', apisUS);
//app.use('/mentaru/api/Miscelaneos', apisMiscelaneos);


// Punto de inicio
app.get('/mentaru/probarAPI', (req, res) => {
    /*if (req.session.name) {
    	functionsMiscelaneos.redirectById(req, res);
    } else {
    	res.redirect('/Mentaru/view/index');
    }*/
    res.redirect('/mentaru/api/EN/EN_IDENTIFICAR');
});

// Punto de inicio
app.get('/mentaru/', (req, res) => {
    /*if (req.session.name) {
    	functionsMiscelaneos.redirectById(req, res);
    } else {
    	res.redirect('/Mentaru/view/index');
    }*/
    res.redirect('/mentaru/');
});



module.exports = app;