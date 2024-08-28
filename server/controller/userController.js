const saltRounds = 10;
const bcrypt = require('bcryptjs');
const db = require('../config/db');

exports.index = (req, res) => {
    const sql = "SELECT * FROM user";

    db.query(sql, (err, results) => {
        if (err) {
            throw err;
        }
        res.json({
            status: 'success',
            data: results
        })
    });
}

exports.store = (req, res) => {
    const { user_name, user_lastname, username, password, user_position, user_role } = req.body;
    bcrypt.hash(password, saltRounds, (err, hash) => {
        if (err) {
            return console.error('Error hashing password:', err);
        }

        const sql_number = "SELECT * FROM user ORDER BY user_number DESC LIMIT 1";
        db.query(sql_number, (err, results_number) => {
            if (err) {
                throw err;
            }
            let number = ''
            if (results_number.length > 0) {
                number = parseInt(results_number[0].user_number) + 1;
                number = number.toString().padStart(4, '0')
            } else {
                number = '0001'
            }
            const sql = 'INSERT INTO user (user_number, user_name,user_lastname,username,password,user_position,user_role) VALUES (?,?,?,?,?,?,?)';
            db.query(sql, [number, user_name, user_lastname, username, hash, user_position, user_role], (err, result) => {
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

exports.update = (req, res) => {
    // const {  } = req.params;
    const { id, user_name, user_lastname, user_position, user_role, username, password } = req.body

    if (password === "") {
        const sql = "UPDATE user SET user_name = ? ,user_lastname = ? , user_position = ? , user_role = ? ,username = ?  WHERE id = ?";
        db.query(sql, [user_name, user_lastname, user_position, user_role, username, id], (err, results) => {
            if (err) {
                throw err;
            }
            res.json({
                status: 'success',
                data: results[0]
            })
        });
    } else {
        const sql = "UPDATE user SET user_name = ? ,user_lastname = ? , user_position = ? , user_role = ? ,username = ? ,password = ? WHERE id = ?";
        db.query(sql, [user_name, user_lastname, user_position, user_role, username, password, id], (err, results) => {
            if (err) {
                throw err;
            }
            res.json({
                status: 'success',
                data: results[0]
            })
        });
    }

}

exports.delete = (req, res) => {
    const { id } = req.body
    const sql = "DELETE FROM user WHERE id = ? ";
    db.query(sql, [id], (err) => {
        if (err) {
            throw err;
        }
        res.json({
            status: 'success',
        })
    });
}

// exports.update = (req, res) => {
//     res.send('STORE');
// }

// exports.delete = (req, res) => {
//     res.send('asdasdasdasd');
// }

