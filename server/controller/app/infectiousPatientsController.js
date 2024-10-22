const db = require('../../config/db');
const moment = require('moment');
exports.create = (req, res) => {
    const { name_lastname, age, id_card, sex, tel, address, landmark, name_disease, symptom, period, date_service, time_service, hospital_id, status, member_id, lat, lng } = req.body
    const Date_service = moment(date_service, 'DD-MM-YYYY').toDate();

    const sql = 'INSERT INTO infectious_patients (name_lastname, age, id_card, sex, tel, address, landmark, name_disease, symptom, period,date_service,time_service,hospital_id,status,member_id,lat,lng) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)';
    db.query(sql, [name_lastname, age, id_card, sex, tel, address, landmark, name_disease, symptom, period, Date_service, time_service, hospital_id, status, member_id, lat, lng], (err, result) => {
        if (err) {
            throw err;
        }
        res.json({
            status: 'success',
        });
    });
}