const mysql = require('mysql')

const config = {
    host: process.env.DB_HOST,
    user: "root"    ,
    password:""    ,
    database: process.env.DB_DATABASE,
}

const con = mysql.createConnection(config)

module.exports = con;