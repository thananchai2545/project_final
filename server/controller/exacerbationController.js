const db = require('../config/db');
exports.index = (req, res) => {
    const sql = "SELECT * FROM view_exacerbation_ambulance_user;"
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json({
            status: 200,
            exacerbation: results
        });
    })
}

exports.indexId = (req, res) => {
    const { id } = req.params
    const sql = "SELECT * FROM view_exacerbation_ambulance_user WHERE id = ?"
    db.query(sql, [id], (err, results) => {
        if (err) throw err;
        res.json({
            status: 200,
            exacerbation: results
        });
    })

}
exports.selectAmbulance = (req, res) => {
    const { id, ambulance_id, status } = req.body

    const sql = "UPDATE exacerbation SET ambulance_id = ? ,status = ? WHERE id = ?"
    db.query(sql, [ambulance_id, status, id,], (err, results) => {
        if (err) throw err;
        res.json({
            status: 200
        });
    })

}

exports.updateStatus = (req, res) => {
    const { status, id } = req.body
    const sql = "UPDATE exacerbation SET status = ? WHERE id = ?"
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

exports.receiveCase = (req, res) => {
    const { id, user_id, tool, ambulance_id, status } = req.body
    const type = 'exacerbation'
    var date_receive = new Date()
    const sql = "UPDATE exacerbation SET ambulance_id = ?, user_id = ?,status = ?,type=?,date_receive=? WHERE id = ?"
    db.query(sql, [ambulance_id, user_id, status, type, date_receive, id], (err, results) => {
        if (err) throw err;
        if (tool.length > 0) {
            const tool_id = tool.map((tool) => [id, tool])
            const sql = "INSERT INTO exacerbation_tool (exacerbation_id, tool_id) VALUES ?"
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
}

exports.getAmbulance = (req, res) => {
    console.log(2131);

    const sql = "SELECT * FROM ambulance WHERE status = 'true'"
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json({
            status: 'success',
            ambulance: results
        });
    })
}