const db = require('../../config/db');
exports.create = (req, res) => {
    const { name_lastname, age, id_card, sex, tel, drug_allergy, doctor, address, landmark, disease, symptom, date_service, time_service, member_id, hospital_id } = req.body
    const Date_service = new Date(date_service);

    const sql = 'INSERT INTO non_emergency_patients (name_lastname, age, id_card,sex,tel, drug_allergy, doctor, address, landmark, disease, symptom,date_service,time_service,member_id,hospital_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)';
    db.query(sql, [name_lastname, age, id_card, sex, tel, drug_allergy, doctor, address, landmark, disease, symptom, Date_service, time_service, member_id, hospital_id], (err, result) => {
        if (err) {
            throw err;
        }
        res.json({
            status: 'success',
        });
    });
}
