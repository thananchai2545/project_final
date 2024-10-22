const db = require("../../config/db")
exports.getCase = (req, res) => {
    const { id } = req.params


    const sql = "SELECT * FROM view_exacerbation_ambulance_user WHERE id = ? ;"
    db.query(sql, [id], (err, results) => {
        if (err) throw err;
        res.json({
            status: 'success',
            data: results
        })
    })
}

exports.getTool = (req, res) => {
    const { id } = req.params

    const sql = "SELECT id, tool_name FROM view_exacerbation_tool WHERE exacerbation_id =  ?;"
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


    if (case_type == 'exacerbation') {
        db.query('UPDATE ambulance SET case_lat = ?, case_lng = ?, case_type = ?, case_id = ?, case_status = ? WHERE id = ?', [case_lat, case_lng, case_type, case_id, case_status, id], (err, results) => {
            if (err) throw err
            const sql = "UPDATE exacerbation SET status = ? WHERE id = ?;"
            db.query(sql, [case_status, case_id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })

        })
    }

}