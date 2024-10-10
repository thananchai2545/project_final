const db = require('../../config/db');
exports.create = (req, res) => {
    //อย่าลืมแยกเวลาและวันที่เกิดเหตุ
    const { name_lastname, age, id_card, drug_allergy, prescription_drugs, sex, date_incident, location_incident, symptom, period, assistance, address, landmarks, name_lastname_Informer, relationship, tel } = req.body
    const sql = 'INSERT INTO exacerbation ( name_lastname, age, id_card, drug_allergy, prescription_drugs, sex, date_incident, location_incident, symptom, period, assistance, address, landmarks,name_lastname_Informer,relationship,tel) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)';
    db.query(sql, [name_lastname, age, id_card, drug_allergy, prescription_drugs, sex, date_incident, location_incident, symptom, period, assistance, address, landmarks, name_lastname_Informer, relationship, tel], (err, result) => {
        if (err) {
            throw err;
        }
        res.json({
            status: 'success',
        });
    });

    // console.log(req.body);
    // res.send('232')
};