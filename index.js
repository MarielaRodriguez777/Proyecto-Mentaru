'use strict'
const config = require('./Server/settings/config');
const app = require('./app');
//var fs = require('fs');
//var https = require('https');

/*
//CONFIGURANDO HTTPS
https.createServer({
    key: fs.readFileSync(__dirname + '/Server/security/server_key.pem'),
    cert: fs.readFileSync(__dirname + '/Server/security/server_crt.pem')
}, app).listen(
    config.configServer.port,
    function() {
        console.log(`aplicacion corriendo en https://localhost:${config.configServer.port}/`);
    }
);
*/


//start the server
app.listen(
    config.configServer.port,
    function() {
        console.log(`aplicacion corriendo en http://localhost:${config.configServer.port}/view/`);
    }
);




/*

prueba();*/