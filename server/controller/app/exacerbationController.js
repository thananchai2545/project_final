const db = require('../../config/db');
exports.create = (req, res) => {

    var date_inform = new Date();
    const { name_lastname, age, id_card, drug_allergy, prescription_drugs, sex, date_incident, location_incident, symptom, period, assistance, address, landmarks, name_lastname_Informer, relationship, tel, member_id, status, violence, lat, lng } = req.body
    const sql = `INSERT INTO exacerbation ( name_lastname, age, id_card, drug_allergy, prescription_drugs, sex, date_incident, location_incident, symptom, period, assistance, address, landmarks,name_lastname_Informer,relationship,tel,member_id,status,violence,lat,lng,date_inform) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;
    db.query(sql, [name_lastname, age, id_card, drug_allergy, prescription_drugs, sex, date_incident, location_incident, symptom, period, assistance, address, landmarks, name_lastname_Informer, relationship, tel, member_id, status, violence, lat, lng, date_inform], (err, result) => {
        if (err) {
            throw err;
        }
        res.json({
            status: 'success',
        });
    });


};