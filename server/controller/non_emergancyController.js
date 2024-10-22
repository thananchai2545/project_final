const db = require('../config/db');
exports.index = (req, res) => {
    const sql = "SELECT * FROM view_non_emergancy_patiens_hospital;"
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json({
            status: 200,
            non_emergancy: results
        });
    })
}

exports.indexId = (req, res) => {
    const { id } = req.params;
    const sql = "SELECT * FROM view_non_emergancy_patiens_hospital WHERE id = ?"
    db.query(sql, [id], (err, results) => {
        if (err) throw err;
        res.json({
            status: 200,
            non_emergancy: results
        });
    })
}

exports.selectAmbulance = (req, res) => {
    const { id, ambulance_id, user_id, tool, status } = req.body
    const type = 'non_emergency'
    var date_receive = new Date()
    const sql = "UPDATE non_emergency_patients SET ambulance_id = ?, user_id = ?,status = ?,date_receive=?,type=? WHERE id = ?"
    console.log(id);



    db.query(sql, [ambulance_id, user_id, status, date_receive, type, id], (err, results) => {
        if (err) throw err;

        if (tool.length > 0) {
            const tool_id = tool.map((tool) => [id, tool])
            const sql = "INSERT INTO non_emergency_tool (non_emergency_id, tool_id) VALUES ?"
            db.query(sql, [tool_id], (err, results) => {
                if (err) throw err;
                console.log(results[0]);
            })
        }
        res.json({
            status: 'success',
            // receive: results
        });
    })
}

exports.updateStatus = (req, res) => {
    const { status, id } = req.body
    console.log(req.body);

    const sql = "UPDATE non_emergency_patients SET status = ? WHERE id = ?"
    db.query(sql, [status, id,], (err, results) => {
        if (err) throw err;
        res.json({
            status: 200
        });
    })
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