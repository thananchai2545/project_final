const db = require("../../config/db")
const jwt = require('jsonwebtoken');
const SECRET_KEY = 'mysecretkey';
exports.login = (req, res) => {
    const { username, password } = req.body
    const sql = 'SELECT * FROM ambulance WHERE username = ? AND password = ?'
    db.query(sql, [username, password], (err, results) => {
        if (err) throw err
        if (results.length > 0) {
            const token = jwt.sign({ results }, process.env.JWT_SECRET, {
                expiresIn: '1h' // Token expiration time
            });
            res.json({
                data: results,
                status: 'success',
                token,
            })
        } else {
            console.log('ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง');

            res.json({ error: 'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง' })
        }

    })
}


exports.getCase = (req, res) => {
    const { id } = req.params;


    const sql = `
    SELECT * FROM view_case_exacerbation_infectious_none_emergency WHERE ambulance_id = ? AND NOT status = 'complete';
    `
    var items = []
    db.query(sql, [id, id, id], (err, results) => {
        if (err) throw err




        // va data = data.sort((a, b) => b.date - a.date);
        var data = results.sort((a, b) => Date.parse(b.date_receive) - Date.parse(a.date_receive));

        res.json({ status: 'success', data: data })
    })
}

exports.status = (req, res) => {
    const { id, status } = req.body
    const sql = 'UPDATE ambulance SET status = ? WHERE id = ?'
    db.query(sql, [status, id], (err, results) => {
        if (err) throw err
        res.json({ status: 'success' })
    })
}

exports.getAmbulance = (req, res) => {
    const { id } = req.params
    const sql = 'SELECT * FROM ambulance WHERE id = ?'
    db.query(sql, [id], (err, results) => {
        if (err) throw err
        res.json({ status: 'success', ambulance: results })
    })
}
