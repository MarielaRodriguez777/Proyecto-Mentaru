'use strict'

// IMPORTANDO LOS MODULOS NECESARIOS
const sql = require('mssql');
const conn = require('../../db/connectionDB');
const messagesMiscelaneos = require('../../others/messagesMiscelaneos');

// DEFINIENDO LAS FUNCIONES
function EN_IDENTIFICAR(req, res) {
    console.log('API EN_IDENTIFICAR');
    conn.connect().then(
        function() {
            var reqDB = new sql.Request(conn);
            reqDB.input('pnumeroIdentidad', sql.VarChar, req.body.numeroIdentidad);
            reqDB.input('pnumeroTelefono', sql.VarChar, req.body.numeroTelefono);
            reqDB.input('pcodigoLaboratorio', sql.VarChar, req.body.codigoLaboratorio);
            reqDB.input('pcodigoPrueba', sql.VarChar, req.body.codigoPrueba);
            reqDB.input('paccion', sql.VarChar, req.body.accion);
            reqDB.output('pcodigoMensaje', sql.Int);
            reqDB.output('pmensaje', sql.VarChar);
            reqDB.execute('SP_EN_IDENTIFICACION').then(function(result) {
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
    );
};




function EN_SINTOMAS(req, res) {
    console.log('API EN_SINTOMAS');
    conn.connect().then(
        function() {
            var reqDB = new sql.Request(conn);
            reqDB.input('pidPersona', sql.VarChar, req.body.idPersona);
            reqDB.input('pdiasCuarentena', sql.VarChar, req.body.diasCuarentena);
            reqDB.input('pdiasSintomas', sql.VarChar, req.body.diasSintomas);
            reqDB.input('pfechaRecuperacion', sql.VarChar, req.body.fechaRecuperacion);
            reqDB.input('pidSintoma', sql.VarChar, req.body.idSintoma);
            reqDB.input('paccion', sql.VarChar, req.body.accion);
            reqDB.output('pcodigoMensaje', sql.Int);
            reqDB.output('pmensaje', sql.VarChar);
            reqDB.execute('SP_EN_SINTOMAS').then(function(result) {
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
    );
};




function EN_TRATAMIENTOS(req, res) {
    console.log('API EN_TRATAMIENTO');
    conn.connect().then(
        function() {
            var reqDB = new sql.Request(conn);
            reqDB.input('pidPersona', sql.VarChar, req.body.idPersona);
            reqDB.input('pidTratamiento', sql.VarChar, req.body.idTratamiento);
            reqDB.input('pidLugarAsistencia', sql.VarChar, req.body.idLugarAsistencia);
            reqDB.input('pfecha', sql.VarChar, req.body.fecha);
            reqDB.input('paccion', sql.VarChar, req.body.accion);
            reqDB.output('pcodigoMensaje', sql.Int);
            reqDB.output('pmensaje', sql.VarChar);
            reqDB.execute('SP_EN_TRATAMIENTO').then(function(result) {
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
    );
};




// EXPORTANDO LAS FUNCIONES QUE ATENDERAN LAS PETICIONES
module.exports = {
    EN_IDENTIFICAR,
    EN_SINTOMAS,
    EN_TRATAMIENTOS
};