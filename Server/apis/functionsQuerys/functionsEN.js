'use strict'

// IMPORTANDO LOS MODULOS NECESARIOS
const sql = require('mssql');
const conn = require('../../db/connectionDB');
//const messagesMiscelaneos = require('../../others/messagesMiscelaneos');

// DEFINIENDO LAS FUNCIONES
function EN_IDENTIFICAR(req, res) {
    console.log('API IDENTIFICAR');
    /*conn.connect().then(
        function() {
            var reqDB = new sql.Request(conn);
            reqDB.input('pnumeroIdentidad', sql.VarChar, req.body.numeroIdentidad);
            reqDB.input('pnumeroTelefono', sql.VarChar, req.body.numeroTelefono);
            reqDB.input('pidLaboratorio', sql.VarChar, req.body.idLaboratorio);
            reqDB.input('pcodigoPrueba', sql.VarChar, req.body.codigoPrueba);
            reqDB.output('pcodigoMensaje', sql.Int);
            reqDB.output('pmensaje', sql.VarChar);
            reqDB.execute('SP_EN_IDENTIFICAR').then(function(result) {
                conn.close();
                console.log({ output: result.output, data: result.recordsets[0] });
            }).catch(function(err) {
                conn.close();
                res.send(messagesMiscelaneos.errorC2);
            });
        }
    ).catch(
        function(err) {
            res.send(messagesMiscelaneos.errorC1);
        }
    );*/
};





// EXPORTANDO LAS FUNCIONES QUE ATENDERAN LAS PETICIONES
module.exports = {
    EN_IDENTIFICAR
};