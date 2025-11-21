const mysql = require('mysql');
const db = mysql.createConnection({
    host: 'mariadb',
    port: 3306,
    user: 'root',
    password: '1234',
    database: 'db_spacial_patients',
    multipleStatements: true,
    dateStrings: 'date'
});

db.connect(err => {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }
    console.log('connected as id ' + db.threadId);
});

module.exports = db;