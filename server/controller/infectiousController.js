const db = require('../config/db');
exports.index = (req, res) => {
    const sql = "SELECT * FROM view_infectious_hospital_ambulance;"
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json({
            status: 200,
            infectious: results
        });
    })
}


exports.indexId = (req, res) => {
    const { id } = req.params
    const sql = "SELECT * FROM view_infectious_hospital_ambulance WHERE id = ?"
    db.query(sql, [id], (err, results) => {
        if (err) throw err;
        res.json({
            status: 200,
            infectious: results
        });
    })

}

exports.updateStatus = (req, res) => {
    // const { status, id } = req.body
    // const sql = "UPDATE infectious_patients SET status = ? WHERE id = ?"
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

exports.selectAmbulance = (req, res) => {


    const { id, user_id, tool, ambulance_id, status } = req.body
    var date_receive = new Date()
    const type = 'infectious'
    const sql = "UPDATE infectious_patients SET ambulance_id = ?, user_id = ?,status = ?,date_receive=?,type=? WHERE id = ?"

    db.query(sql, [ambulance_id, user_id, status, date_receive, type, id], (err, results) => {
        if (err) throw err;

        if (tool.length > 0) {
            const tool_id = tool.map((tool) => [id, tool])
            const sql = "INSERT INTO infectious_tool (infectious_id, tool_id) VALUES ?"
            db.query(sql, [tool_id], (err, results) => {
                if (err) throw err;
                console.log(results);
            })
        }
        console.log(results);

        res.json({
            status: 'success',
            // receive: results
        });
    })

    // const sql = "UPDATE infectious_patients SET ambulance_id = ? ,status = ? WHERE id = ?"
    // db.query(sql, [ambulance_id, status, id,], (err, results) => {
    //     if (err) throw err;
    //     res.json({
    //         status: 200
    //     });
    // })
}

exports.getTool = (req, res) => {
    const sql = "SELECT id, tool_name FROM tool"
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json({
            status: 'success',
            tool: results
        });
    })
}