const db = require('../config/db');
exports.index = (req, res) => {
    const sql = "SELECT * FROM view_non_emergancy_patiens_hospital;"
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json({
            status: 200,
            exacerbation: results
        });
    })
}