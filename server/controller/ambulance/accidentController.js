const db = require("../../config/db")

exports.index = (req, res) => {
    const { id } = req.params

    const sql = "SELECT * FROM view_case WHERE id = ?;"
    db.query(sql, [id], (err, result) => {
        try {
            if (err) throw err
            res.json({ status: 'success', data: result })
        } catch (error) {
            res.json({ status: 'fail', data: error })
        }
    })
}

exports.getSymptom = (req, res) => {
    const { case_id } = req.body
    const sql = "SELECT symptom_name FROM view_case_symptom WHERE case_id = ?;"
    db.query(sql, [case_id], (err, result) => {
        if (err) throw err;


        res.json({ status: 'success', data: result })
    })

}

exports.getImage = (req, res) => {
    const { case_id } = req.body

    const sql = "SELECT case_image_path FROM case_image WHERE case_id = ?;"
    db.query(sql, [case_id], (err, result) => {
        if (err) throw err;
        res.json({ status: 'success', data: result })
    })
}

exports.confirm = (req, res) => {
    const { id, case_lat, case_lng, case_type, case_id, case_status } = req.body

    if (case_type == 'accident') {
        db.query('UPDATE ambulance SET case_lat = ?, case_lng = ?, case_type = ?, case_id = ?, case_status = ? WHERE id = ?', [case_lat, case_lng, case_type, case_id, case_status, id], (err, results) => {
            if (err) throw err
            const sql = "UPDATE case_data SET case_status = ? WHERE id = ?;"
            db.query(sql, [case_status, case_id], (err, results) => {
                if (err) throw err
                res.json({ status: 'success' })
            })

        })
    }

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

    // db.query('UPDATE ambulance SET case_lat = ?, case_lng = ?, case_type = ?, case_id = ?, case_status = ? WHERE id = ?', [case_lat, case_lng, case_type, case_id, case_status, id], (err, results) => {
    //     if (err) throw err
    //     if (case_type == 'accident') {
    //         const sql = "UPDATE case_data SET case_status = ? WHERE id = ?;"
    //         db.query(sql, [case_status, case_id], (err, results) => {
    //             if (err) throw err
    //             res.json({ status: 'success' })
    //         })
    //     }
    //     if (case_type == 'exacerbation') {
    //         const sql = "UPDATE exacerbation SET status = ? WHERE id = ?;"
    //         db.query(sql, [case_status, case_id], (err, results) => {
    //             if (err) throw err
    //             res.json({ status: 'success' })
    //         })
    //     }

    //     if (case_type == 'non_emergency') {
    //         const sql = "UPDATE non_emergency_patients SET status = ? WHERE id = ?;"
    //         db.query(sql, [case_status, case_id], (err, results) => {
    //             if (err) throw err
    //             res.json({ status: 'success' })
    //         })
    //     }
    //     if (case_type == 'infectious') {
    //         const sql = "UPDATE infectious_patients SET status = ? WHERE id = ?;"
    //         db.query(sql, [case_status, case_id], (err, results) => {
    //             if (err) throw err
    //             res.json({ status: 'success' })
    //         })
    //     }

    // })

}

exports.getTool = (req, res) => {
    const { id } = req.params
    const sql = "SELECT id, tool_name FROM view_case_tool WHERE case_data_id = ?;"
    db.query(sql, [id], (err, result) => {
        if (err) throw err
        res.json({ status: 'success', tool: result })
    })

}