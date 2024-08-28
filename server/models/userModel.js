const db = require('../config/db');
const user = {
    getAll: function (callback) {
        const sql = "SELECT * FROM user";
        db.query(sql, callback);
    },

    insertUser: function (callback) {
       return 'asdasdas';
    }    
};


module.exports = user;