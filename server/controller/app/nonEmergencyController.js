const db = require('../../config/db');
const moment = require('moment');
exports.create = (req, res) => {
    const { name_lastname, age, id_card, sex, tel, drug_allergy, doctor, address, landmark, disease, symptom, date_service, time_service, member_id, hospital_id, status, lat, lng } = req.body
    const Date_service = moment(date_service, 'DD-MM-YYYY').toDate();
    console.log(lat);
    const date_inform = new Date();



    const sql = `INSERT INTO non_emergency_patients (name_lastname, age, id_card,sex,tel, drug_allergy, doctor, address, landmark, disease, symptom,date_service,time_service,member_id,hospital_id,status,lng,Lat,date_inform ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;
    db.query(sql, [name_lastname, age, id_card, sex, tel, drug_allergy, doctor, address, landmark, disease, symptom, Date_service, time_service, member_id, hospital_id, status, lng, lat, date_inform], (err, result) => {
        if (err) {
            throw err;
        }
        console.log(result);

        res.json({
            status: 'success',
        });
    });
}
