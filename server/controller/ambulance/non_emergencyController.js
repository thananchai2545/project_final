const db = require("../../config/db")
const { status } = require("./ambulanceController")
exports.getCase = (req, res) => {
    // console.log(1231);
    const { id } = req.params
    const sql = 'SELECT * FROM view_non_emergancy_patiens_hospital where id = ?'
    db.query(sql, [id], (err, results) => {
        if (err) throw err


        res.json({
            status: 'success',
            data: results
        })
    })
}

exports.getTool = (req, res) => {
    const { id } = req.params
    const sql = "SELECT id, tool_name FROM view_non_emergency_tool WHERE non_emergency_id =  ?;"
    db.query(sql, [id], (err, results) => {
        if (err) throw err;
        res.json({
            status: 'success',
            tool: results
        })
    })

}

exports.confirm = (req, res) => {
    const { id, case_lat, case_lng, case_type, case_id, case_status } = req.body


    if (case_type == 'non_emergency') {
        db.query('UPDATE ambulance SET case_lat = ?, case_lng = ?, case_type = ?, case_id = ?, case_status = ? WHERE id = ?', [case_lat, case_lng, case_type, case_id, case_status, id], (err, results) => {
            if (err) throw err
            const sql = "UPDATE non_emergency_patients SET status = ? WHERE id = ?;"
            db.query(sql, [case_status, case_id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })

        })
    }
}