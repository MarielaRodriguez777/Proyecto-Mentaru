// IMPORTANDO MODULOS NECESARIOS
const bodyParser = require('body-parser');
const express = require('express');
const session = require('express-session');
const config = require('./Server/settings/config');
const apisViews = require('./Server/views/apisViews');

// DEFINIENDO LA VARIABLE 'app' QUE ES EL SERVIDOR
const app = express();


// DEFINIENDO MIDDLEWARE'S
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(session(config.configSession));
app.use('/mentaru/', apisViews);

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