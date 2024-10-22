const db = require('../config/db');
const { status } = require('./ambulance/ambulanceController');
exports.getAmbulance = (req, res) => {
    // console.log(123);

    const sql = "SELECT * FROM ambulance WHERE status = 'true'";
    db.query(sql, (err, result) => {
        if (err) throw err;
        res.json({
            ambulance: result
        })
    })
}
exports.index = (req, res) => {
    const sql = `SELECT * FROM tool; 

        SELECT 
    ambulance.id as ambulance_id, 
    ambulance.*,
    
    

    view_ambulance_tool.id as ambulance_tool_id,
    view_ambulance_tool.tool_id as tool_id,
    view_ambulance_tool.tool_name ,
    view_ambulance_tool.driver_name as driver_name


    FROM ambulance
    LEFT JOIN view_ambulance_tool ON ambulance.id = view_ambulance_tool.ambulance_id;
    `;

    db.query(sql, (err, results) => {
        if (err) throw err;

        const data_ambulance = {};
        results[1].forEach(row => {
            // console.log(row.driver_name);

            if (!data_ambulance[row.ambulance_id]) {
                data_ambulance[row.ambulance_id] = {
                    id: row.ambulance_id,
                    ambulance_registration: row.ambulance_registration,
                    ambulance_driver_name: row.driver_name,
                    status: row.status,
                    ambulance_tool_arr: []
                };
            }
            if (row.ambulance_tool_id) {
                data_ambulance[row.ambulance_id].ambulance_tool_arr.push({
                    id: row.ambulance_id,
                    tool_id: row.tool_id,
                    tool_name: row.tool_name
                });
            }
        });
        // console.log(data_symptom);

        res.json({
            status: 'success',
            data_tool: results[0],
            data_ambulance: data_ambulance,
            // symptom : results
            // data_symptom1: results[1]
        })
        // console.log(results[1].symptom_id);

    });
}

exports.insert = (req, res) => {
    try {
        const { driver_name, ambulance_registration, tool_arr } = req.body
        const sql = "INSERT INTO ambulance (driver_name,ambulance_registration) VALUES (?,?)"
        db.query(sql, [driver_name, ambulance_registration], (err, results) => {
            if (err) throw err;
            const values = tool_arr.map(tool_id => [tool_id, results.insertId]);
            const sql = 'INSERT INTO ambulance_tool (tool_id, ambulance_id) VALUES ?';
            db.query(sql, [values], (err, result) => {
                res.json({
                    status: 'success',
                    data: results
                })
            });
        })
    } catch (error) {
        console.log(error);
    }
}

exports.update = (req, res) => {
    const { id, driver_name, ambulance_registration, tool_arr } = req.body
    const sql = "UPDATE ambulance SET driver_name = ?, ambulance_registration = ? WHERE id = ?";

    console.log(req.body);

    db.query(sql, [driver_name, ambulance_registration, id], (err1, result1) => {
        if (err1) {
            throw err1;
        }
        if (tool_arr.length > 0) {
            const sql_ambulance_tool = "DELETE FROM ambulance_tool WHERE ambulance_id = ?";
            db.query(sql_ambulance_tool, [id], (err2, result2) => {
                if (err2) {
                    throw err2;
                }
                const values = tool_arr.map(tool_id => [tool_id, id]);
                const sql = 'INSERT INTO ambulance_tool (tool_id, ambulance_id) VALUES ?';
                db.query(sql, [values], (err3, result3) => {
                    if (err3) {
                        throw err3;
                    }
                });
            });
        }

        res.json({
            status: 'success',
        });
    });
}


exports.delete = (req, res) => {
    try {
        const { ambulance_id } = req.body




        const sql_ambulance = "DELETE FROM ambulance WHERE id = ?";

        const sql_ambulance_tool = "DELETE FROM ambulance_tool WHERE ambulance_id = ?";
        db.query(sql_ambulance, [ambulance_id], (err) => {
            if (err) {
                throw err;
            }

            db.query(sql_ambulance_tool, [ambulance_id], (err) => {
                if (err) {
                    throw err;
                }
                res.json({
                    status: 'success',
                })
            })
        })
    } catch (error) {
        console.log(error);
    }
}
