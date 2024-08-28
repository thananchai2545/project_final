// const { json } = require('express');
// const auth = require('../models/authModel');
const jwt = require('jsonwebtoken');
const db = require('../config/db');
const bcrypt = require('bcryptjs')

exports.login = (req, res) => {
    const { username, password } = req.body;
    const sql = "SELECT * FROM user WHERE username = ?";

    db.query(sql, [username], async (err, results) => {
        if (err) {
            console.error('Error querying the database:', err);
            return res.status(500).json({ error: 'Error during login' });
        }
        const storedHash = results[0].password;
        try {
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
        } catch (error) {
            res.status(500).json({ error: 'Error during login' });
        }

    });
}