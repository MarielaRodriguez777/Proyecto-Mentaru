'use strict'

// IMPORTANDO LOS MODULOS NECESARIOS
const sql = require('mssql');
const conn = require('../../db/connectionDB');
const messagesMiscelaneos = require('../../others/messagesMiscelaneos');

// DEFINIENDO LAS FUNCIONES
function ES_GENERAL(req, res) {
    console.log('API ES_GENERAL');
    res.send('API ES_GENERAL');
    /* conn.connect().then(
        function() {
            var reqDB = new sql.Request(conn);
            reqDB.input('paccion', sql.VarChar, req.body.accion);
            reqDB.output('pcodigoMensaje', sql.Int);
            reqDB.output('pmensaje', sql.VarChar);
            reqDB.execute('SP_ES_GENERAL').then(function(result) {
                conn.close();
                res.send({ output: result.output, data: result.recordsets[0] });
            }).catch(function(err) {
                conn.close();
                res.send(messagesMiscelaneos.errorC2);
            });
        }
    ).catch(
        function(err) {
            res.send(messagesMiscelaneos.errorC1);
        }
    ); */
};










function VW_TIPOESTADISTICAS(req, res) {
    console.log('API VW_TIPOESTADISTICAS');
    conn.connect().then(
        function() {
            var reqDB = new sql.Request(conn);
            reqDB.query('SELECT * FROM VW_TIPOESTADISTICAS').then(function(result) {
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
};

// EXPORTANDO LAS FUNCIONES QUE ATENDERAN LAS PETICIONES
module.exports = {
    ES_GENERAL,
    VW_TIPOESTADISTICAS
    //, ES_ESPECIFICO
};