const db = require('../config/db');

const auth = {
    login: function (data ,callback) {
        const sql = "SELECT * FROM officer WHERE username = ? AND password = ?";
        // bcrypt.compare(password, hash, (err, result) => {
        //     if (err) {
        //         return console.error('Error comparing password:', err);
        //     }
        //     console.log('Password Match:', result); // true if the password matches, false otherwise
        // });
        db.query(sql, [data.username, data.password], callback);
    },
};

module.exports = auth;