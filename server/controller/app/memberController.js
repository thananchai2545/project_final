const db = require('../../config/db');
const bcrypt = require('bcryptjs')
const saltRounds = 10;
const moment = require('moment');
const jwt = require('jsonwebtoken');

// const fs = require('fs');
// const { log } = require('console');



exports.create = (req, res) => {
    const {
        member_name,
        member_lastname,
        // member_address,
        member_tel,
        // member_idcard,
        username, password,
        member_birthdate } = req.body
    const date_birthdate = moment(member_birthdate, 'DD/MM/YYYY').format('YYYY-MM-DD');
    bcrypt.hash(password, saltRounds, (err, hash) => {
        if (err) {
            return console.error('Error hashing password:', err);
        }
        const sql_number = "SELECT * FROM member ORDER BY member_number DESC LIMIT 1";
        db.query(sql_number, (err, results_number) => {
            if (err) {
                throw err;
            }
            let number = ''
            let member_image;
            if (results_number.length > 0) {
                number = parseInt(results_number[0].member_number) + 1;
                number = number.toString().padStart(4, '0')
            } else {
                number = '0001'
            }

            if (req.file != null) {
                member_image = req.file.path
            }
            const sql = 'INSERT INTO member (member_number, member_name,member_lastname,username,password,member_tel ,member_birthdate,member_image) VALUES (?,?,?,?,?,?,?,?)';
            db.query(sql, [number, member_name, member_lastname, username, hash, member_tel, date_birthdate, member_image], (err, result) => {
                if (err) {
                    throw err;
                }
                res.json({
                    status: 'success',
                });
            });
        });
    });
}

exports.login = (req, res) => {
    const { username, password } = req.body;
    const sql = "SELECT * FROM member WHERE username = ?";
    db.query(sql, [username], async (err, results) => {
        if (err) {
            console.error('Error querying the database:', err);
            return res.status(500).json({ error: 'Error during login' });
        }

        try {
            if (results.length > 0) {
                const storedHash = await results[0].password;
                const match = await bcrypt.compareSync(password, storedHash);
                if (match) {
                    const token = jwt.sign({ results }, process.env.JWT_SECRET, { expiresIn: '1h' });
                    res.json({
                        token,
                        status: 'success',
                        data: results
                    })
                } else {
                    res.status(401).json({
                        error: 'Invalid username or password',
                        status: 'failed',
                        message: 'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง'
                    });
                }
            } else {
                res.status(401).json({
                    error: 'Invalid username or password',
                    status: 'failed',
                    message: 'ชื่อผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง'
                });
            }
        } catch (error) {
            res.status(500).json({ error: 'Error during login' });
        }

    });
}

exports.index = (req, res) => {
    const id = req.params.id
    const sql = "SELECT * FROM member WHERE id = ?";

    db.query(sql, [id], (err, results) => {
        if (err) {
            throw err;
        }

        res.json({
            status: 'success',
            data: results
        })
    });
}

