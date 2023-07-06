const mysql = require('mysql');

const pool = mysql.createPool({
    host:'jdbc:mysql://localhost:3306/northwind',
    user: 'root',
    password: 'admin',
    database: 'befitmamas'
});

module.exports = pool;