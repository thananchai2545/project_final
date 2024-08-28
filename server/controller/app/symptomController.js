const db = require('../../config/db');
exports.index = (req, res) => {
    const sql = "SELECT * FROM symptom";
    db.query(sql, (err, result) => {
        if (err) {
            throw err;
        }
        res.json({
            status: 'success',
            symptom: result
        })

    })
}