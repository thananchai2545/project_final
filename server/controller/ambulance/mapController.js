const db = require("../../config/db")
exports.getLocation = (req, res) => {
    const { id } = req.params
    const sql = "SELECT case_lat, case_lng,case_type,case_id,case_status FROM ambulance WHERE id = ?;"
    db.query(sql, [id], (err, results) => {
        if (err) throw err
        res.json({ status: 'success', data: results })
    })
}

exports.updateStatus = (req, res) => {
    const { id, case_id, case_status, case_type } = req.body
    console.log(req.body);

    if (case_type == 'non_emergency' && case_status != 'complete') {
        const sql = "UPDATE non_emergency_patients SET  status = ? WHERE id = ?;"
        db.query(sql, [case_status, case_id], (err, results) => {
            if (err) throw err
            const sql2 = "UPDATE ambulance SET  case_status = ? WHERE id = ?;"
            db.query(sql2, [case_status, id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })
        })
    } else if (case_type == 'non_emergency' && case_status == 'complete') {
        const sql = "UPDATE non_emergency_patients SET status = 'complete' WHERE id = ?;"
        db.query(sql, [case_id], (err, results) => {
            if (err) throw err
            const sql = "UPDATE ambulance SET case_lat = null, case_lng = null,  case_type = null, case_id = null, case_status = null WHERE id = ?;"
            db.query(sql, [id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })
        })

    }

    if (case_type == 'exacerbation' && case_status != 'complete') {
        const sql = "UPDATE exacerbation SET  status = ? WHERE id = ?;"
        db.query(sql, [case_status, case_id], (err, results) => {
            if (err) throw err
            const sql2 = "UPDATE ambulance SET  case_status = ? WHERE id = ?;"
            db.query(sql2, [case_status, id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })
        })
    }
    else if (case_type == 'exacerbation' && case_status == 'complete') {
        const sql = "UPDATE exacerbation SET status = 'complete' WHERE id = ?;"
        db.query(sql, [case_id], (err, results) => {
            if (err) throw err
            const sql = "UPDATE ambulance SET case_lat = null, case_lng = null,  case_type = null, case_id = null, case_status = null WHERE id = ?;"
            db.query(sql, [id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })
        })

    }

    if (case_type == 'accident' && case_status != 'complete') {
        const sql = "UPDATE case_data SET  case_status = ? WHERE id = ?;"
        db.query(sql, [case_status, case_id], (err, results) => {
            if (err) throw err
            const sql2 = "UPDATE ambulance SET  case_status = ? WHERE id = ?;"
            db.query(sql2, [case_status, id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })
        })
    }
    else if (case_type == 'accident' && case_status == 'complete') {
        const sql = "UPDATE case_data SET case_status = 'complete' WHERE id = ?;"
        db.query(sql, [case_id], (err, results) => {
            if (err) throw err
            const sql = "UPDATE ambulance SET case_lat = null, case_lng = null,  case_type = null, case_id = null, case_status = null WHERE id = ?;"
            db.query(sql, [id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })
        })

    }

    if (case_type == 'infectious' && case_status != 'complete') {
        const sql = "UPDATE infectious_patients SET  status = ? WHERE id = ?;"
        db.query(sql, [case_status, case_id], (err, results) => {
            if (err) throw err
            const sql2 = "UPDATE ambulance SET  case_status = ? WHERE id = ?;"
            db.query(sql2, [case_status, id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })
        })
        console.log(21231);

    }
    else if (case_type == 'infectious' && case_status == 'complete') {
        const sql = "UPDATE infectious_patients SET status = 'complete' WHERE id = ?;"
        db.query(sql, [case_id], (err, results) => {
            if (err) throw err
            const sql = "UPDATE ambulance SET case_lat = null, case_lng = null,  case_type = null, case_id = null, case_status = null WHERE id = ?;"
            db.query(sql, [id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })
        })

    }
}