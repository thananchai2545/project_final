const db = require('../config/db');

exports.index = (req, res) => {
    // const { hospital_name, lat, lng } = req.body
    const sql = "SELECT * FROM hospital;"
    db.query(sql, (err, results) => {
        if (err) throw err;
        res.json({
            status: 200,
            hospital: results
        });
    })
}

exports.insert = (req, res) => {
    const { hospital_name, lat, lng, sub_district, district, province } = req.body
    const sql = "INSERT INTO hospital (hospital_name,lat, lng, sub_district, district, province) VALUES (?,?,?,?,?,?)"
    db.query(sql, [hospital_name, lat, lng, sub_district, district, province], (err, results) => {
        if (err) throw err;
        res.json({
            status: 200
        });
    })
}

exports.update = (req, res) => {
    const { id, hospital_name, lat, lng, sub_district, district, province } = req.body
    const sql = "UPDATE hospital SET hospital_name = ?, lat = ?, lng = ? ,sub_district = ?, district = ?, province = ? WHERE id = ?"
    db.query(sql, [hospital_name, lat, lng, sub_district, district, province, id,], (err, results) => {
        if (err) throw err;
        res.json({
            status: 200
        });
    })
}

exports.delete = (req, res) => {
    const { id } = req.params
    const sql = "DELETE FROM hospital WHERE id = ?"
    db.query(sql, [id], (err, results) => {
        if (err) throw err;
        res.json({
            status: 200
        });
    })
}