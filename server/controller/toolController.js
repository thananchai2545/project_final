const db = require('../config/db');
const fs = require('fs');




exports.index = (req, res) => {
    const sql = "SELECT * FROM tool";

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
// upload.single('file'),
exports.insert = (req, res, callback) => {
    const { tool_name, tool_description } = req.body
    if (!req.file) {
        const sql = 'INSERT INTO tool (tool_name, tool_description) VALUES (?,?)';
        db.query(sql, [tool_name, tool_description], (err, result) => {
            if (err) {
                throw err;
            }
            res.json({
                status: 'success',
            });
        });
    } else {
        const imagePath = `/uploads/${req.file.filename}`;
        const sql = 'INSERT INTO tool (tool_name, tool_description, tool_img) VALUES (?,?,?)';
        db.query(sql, [tool_name, tool_description, imagePath], (err, result) => {
            if (err) {
                throw err;
            }
            res.json({
                status: 'success',
            });
        });
    }


}

exports.update = (req, res) => {
    // const { id } = req.params

    const { id, tool_name, tool_description } = req.body
    const sql = "SELECT * FROM tool WHERE id = ?";

    db.query(sql, [id], (err, results) => {
        if (err) {
            throw err;
        }
        if (req.file) {
            const path = '.' + results[0].tool_img;
            const fileExists = fs.existsSync(path);
            if (fileExists) {
                fs.access(path, fs.constants.F_OK, (err) => {
                    if (err) {
                        console.error('File does not exist:', err);
                        return;
                    }
                    fs.unlink(path, (err) => {
                        if (err) {
                            console.error('Error deleting file:', err);
                            return;
                        }

                    });
                });
            }
            const imagePath = `/uploads/${req.file.filename}`;
            const sql = "UPDATE tool SET tool_name = ?, tool_description = ?,tool_img = ? WHERE id = ?";
            db.query(sql, [tool_name, tool_description, imagePath, id], (err, result) => {
                if (err) {
                    throw err;
                }
                res.json({
                    status: 'success',
                });
            });
        } else {
            const sql = "UPDATE tool SET tool_name = ?, tool_description = ? WHERE id = ?";
            db.query(sql, [tool_name, tool_description, id], (err, result) => {
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

exports.delete = (req, res) => {
    const { id, tool_img } = req.body
    const path = '.' + tool_img
    const fileExists = fs.existsSync(path);
    const sql = "DELETE FROM tool WHERE id = ? ";

    db.query(sql, [id], (err) => {
        if (err) {
            throw err;
        }
        if (fileExists) {
            fs.access(path, fs.constants.F_OK, (err) => {
                if (err) {
                    console.error('File does not exist:', err);
                    return;
                }
                fs.unlink(path, (err) => {
                    if (err) {
                        console.error('Error deleting file:', err);
                        return;
                    }

                });
            });
        }
        res.json({
            status: 'success',
        })
    });
}