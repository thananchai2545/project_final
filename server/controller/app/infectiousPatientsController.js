const db = require('../../config/db');
exports.create = (req, res) => {
    const { name_lastname, age, id_card, sex, tel, address, landmark, name_disease, symptom, period, date_service, time_service, hospital_id } = req.body
    const Date_service = new Date(date_service);

    const sql = 'INSERT INTO infectious_patients (name_lastname, age, id_card, sex, tel, address, landmark, name_disease, symptom, period,date_service,time_service,hospital_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)';
    db.query(sql, [name_lastname, age, id_card, sex, tel, address, landmark, name_disease, symptom, period, Date_service, time_service, hospital_id], (err, result) => {
        if (err) {
            throw err;
        }
        res.json({
            status: 'success',
        });
    });
}