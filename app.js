// IMPORTANDO MODULOS NECESARIOS
const bodyParser = require('body-parser');
const express = require('express');
const session = require('express-session');
const config = require('./Server/settings/config');

// IMPORTANTDO APIS
const apisViews = require('./Server/views/apisViews');
const apisEN = require('./Server/apis/apiEN');
const apisES = require('./Server/apis/apiES');
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
app.use('/api/ES', apisES);
//app.use('/api/US', apisUS);
//app.use('/api/Miscelaneos', apisMiscelaneos);

// Punto de inicio
app.get('/api/probarConexion', (req, res) => {
    // PROBANDO CONEXION CON LA BASE DE DATOS {MENTARU}
    // IMPORTANDO LOS MODULOS NECESARIOS
    const sql = require('mssql');
    const conn = require('./Server/db/connectionDB');
    const { Console } = require('console');
    console.log('API VW_MUNICIPIOS');
    conn.connect().then(
        function() {
            var reqDB = new sql.Request(conn);
            reqDB.query('SELECT * FROM Datos').then(function(result) {
                conn.close();
                res.send(result);
                console.log(result);
            }).catch(function(err) {
                conn.close();
                res.send(messagesMiscelaneos.errorC2);
            });
        }
    ).catch(
        function(err) {
            res.send(messagesMiscelaneos.errorC1);
        }
    );
});


// Punto de inicio
app.get('/', (req, res) => {
    res.redirect('/view/');
});



module.exports = app;