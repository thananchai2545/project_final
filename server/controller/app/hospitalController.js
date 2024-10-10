const db = require('../../config/db');
exports.index = (req, res) => {
    const sql = 'SELECT * FROM hospital'
    db.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
        res.send(result)
    })

} 