'use strict'
const config = require('./Server/settings/config');
const app = require('./app');
var fs = require('fs');
var https = require('https');


/* //CONFIGURANDO HTTPS
https.createServer({
    key: fs.readFileSync(__dirname + '/Server/security/server_key.pem'),
    cert: fs.readFileSync(__dirname + '/Server/security/server_crt.pem')
}, app).listen(
    /* config.configServer.port, */
/* process.env.ALLWAYSDATA_HTTPD_PORT,
    process.env.ALLWAYSDATA_HTTPD_IP,
    function() {
        console.log(`aplicacion corriendo en https://localhost:${config.configServer.port}/mentaru/`);
        console.log(`aplicacion corriendo en http://mentaru.alwaysdata.net/mentaru/`);
    }
);
 */

//start the server
app.listen(
    /* config.configServer.port, */
    process.env.ALLWAYSDATA_HTTPD_PORT,
    process.env.ALLWAYSDATA_HTTPD_IP,
    function() {
        console.log(`aplicacion corriendo en http://localhost:${config.configServer.port}/mentaru/`);
        console.log(`aplicacion corriendo en http://mentaru.alwaysdata.net/`);
    }
);





// PROBANDO CONEXION CON LA BASE DE DATOS {MENTARU}
// IMPORTANDO LOS MODULOS NECESARIOS
const sql = require('mssql');
const conn = require('./Server/db/connectionDB');
const { Console } = require('console');

function prueba(req, res) {
    conn.connect().then(function() {
            var reqDB = new sql.Request(conn);
            reqDB.query('SELECT * FROM DATOS').then(function(result) {
                conn.close();
                console.log({ output: result.output, data: result.recordsets[0] });
            }).catch(function(err) {
                conn.close();
                console.log('Error consulta');
            });
        })
        .catch(function(err) {
            res.send(messagesMiscelaneos.errorC1);
            console.log('Error conexión');
        });
};
prueba();