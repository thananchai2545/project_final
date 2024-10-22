const db = require("../../config/db")
exports.getCase = (req, res) => {
    const { id } = req.params
    const sql = "SELECT * FROM view_infectious_hospital_ambulance WHERE id = ? ;"
    db.query(sql, [id], (err, results) => {
        if (err) throw err
        res.json({
            status: 'success',
            data: results
        })
    })
};

exports.getTool = (req, res) => {
    const { id } = req.params
    const sql = "SELECT id,infectious_id, tool_name FROM view_infectious_tool WHERE infectious_id = ? ;"
    db.query(sql, [id], (err, results) => {
        if (err) throw err
        res.json({
            status: 'success',
            tool: results
        })
    })
}

exports.confirm = (req, res) => {
    const { id, case_lat, case_lng, case_type, case_id, case_status } = req.body
    if (case_type == 'infectious') {
        db.query('UPDATE ambulance SET case_lat = ?, case_lng = ?, case_type = ?, case_id = ?, case_status = ? WHERE id = ?', [case_lat, case_lng, case_type, case_id, case_status, id], (err, results) => {
            if (err) throw err
            const sql = "UPDATE infectious_patients SET status = ? WHERE id = ?;"
            db.query(sql, [case_status, case_id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })
        })
    }
}
