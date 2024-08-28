const { json } = require('body-parser');
const db = require('../../config/db');
const moment = require('moment');
exports.create = (req, res) => {
    var case_image = [];
    const { data_patient } = req.body
    const { case_number_patients, case_breathe, case_symtomSelect, case_other_symptoms, case_landmark, case_name, case_tel, case_idcard, case_drugallergy, case_type, member_id } = JSON.parse(data_patient);
    // console.log(data_patient);

    // console.log(data_patient);
    if (req.files.length > 0) {
        case_image = req.files.map(item => item.path);
    }


    const sql = 'SELECT * FROM case_data ORDER BY case_number DESC LIMIT 1';

    db.query(sql, (err, results_number) => {

        let number = ''
        const case_date = new Date();
        // console.log(results_number);
        if (results_number.length > 0) {
            number = parseInt(results_number[0].case_number) + 1;
            number = number.toString().padStart(4, '0')
        } else {
            number = '0001'
        }


        const sql_insert = 'INSERT INTO case_data (case_number,case_number_patients , case_tel,case_location_landmark, case_breathing, case_other_symptoms ,case_idcard,case_date,case_type,member_id) VALUES (?,?,?,?,?,?,?,?,?,?)';
        db.query(sql_insert, [number, case_number_patients, case_tel, case_landmark, case_breathe, case_other_symptoms, case_idcard, case_date, case_type, member_id], (err, result) => {
            if (err) {
                throw err;
            }

            if (case_symtomSelect.length > 0) {
                const values_case_symtomSelect = case_symtomSelect.map(item => [result.insertId, item]);
                const sql_case_symptom = 'INSERT INTO case_symptom (case_id , symptom_id) VALUES ?';
                db.query(sql_case_symptom, [values_case_symtomSelect], (err, result) => {
                    if (err) {
                        throw err;
                    }
                });
            }

            if (case_image.length > 0) {
                const values_case_image = case_image.map(item => [result.insertId, item]);
                const sql_case_image = 'INSERT INTO case_image (case_id , case_image_path) VALUES ?';
                db.query(sql_case_image, [values_case_image], (err, result) => {
                    if (err) {
                        throw err;
                    }
                    res.json({
                        status: 'success',
                    });
                });
            }

        });
    }
    )
}

exports.index = (req, res) => {
    const { id } = req.params
    // console.log(id);
    const sql = "SELECT * FROM case_data WHERE member_id = ?"
    db.query(sql, [id], (err, results) => {
        if (err) {
            throw err
        }
        res.json({ "case_data": results })
    })
}
