const db = require('../config/db');

exports.index = (req, res) => {
    try {

        const query = `
        
        SELECT * FROM tool; 

        SELECT 
    symptom.id as symptom_id, 
    symptom.symptom_name, 
    

    view_symptom_tool.id as symptom_tool_id,
    view_symptom_tool.tool_id as tool_id,
    view_symptom_tool.tool_name 


    FROM symptom
    LEFT JOIN view_symptom_tool ON symptom.id = view_symptom_tool.symptom_id;

  `;


        db.query(query, (err, results) => {
            if (err) throw err;

            const data_symptom = {};
            results[1].forEach(row => {
                if (!data_symptom[row.symptom_id]) {
                    data_symptom[row.symptom_id] = {
                        id: row.symptom_id,
                        symptom_name: row.symptom_name,
                        symptom_tool_arr: []
                    };
                }
                if (row.symptom_tool_id) {

                    data_symptom[row.symptom_id].symptom_tool_arr.push({
                        id: row.symptom_id,
                        tool_id: row.tool_id,
                        tool_name: row.tool_name
                    });
                }
            });
            // console.log(data_symptom);

            res.json({
                status: 'success',
                data_tool: results[0],
                data_symptom: data_symptom,
                // symptom : results
                // data_symptom1: results[1]
            })
            // console.log(results[1].symptom_id);

        });
    } catch (error) {
        console.log(error);
    }
}

exports.insert = (req, res) => {
    try {
        const { symptom_name, tool_arr } = req.body

        //    const { symptom_name } = req.body
        const sql = "INSERT INTO symptom (symptom_name) VALUES (?)"
        db.query(sql, [symptom_name], (err, results) => {
            if (err) throw err;
            const values = tool_arr.map(tool_id => [tool_id, results.insertId]);
            const sql = 'INSERT INTO symptom_tool (tool_id, symptom_id) VALUES ?';
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


exports.delete = (req, res) => {
    try {
        const { symptom_id } = req.body

        const sql_symptom = "DELETE FROM symptom WHERE id = ?";

        const sql_symptom_tool = "DELETE FROM symptom_tool WHERE symptom_id = ?";
        db.query(sql_symptom, [symptom_id], (err) => {
            if (err) {
                throw err;
            }

            db.query(sql_symptom_tool, [symptom_id], (err) => {
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

exports.update = (req, res) => {

    const { id, symptom_name, tool_arr } = req.body
    const sql = "UPDATE symptom SET symptom_name = ? WHERE id = ?";


    db.query(sql, [symptom_name, id], (err1, result1) => {
        if (err1) {
            throw err1;
        }
        if (tool_arr.length > 0) {
            const sql_symptom_tool = "DELETE FROM symptom_tool WHERE symptom_id = ?";
            db.query(sql_symptom_tool, [id], (err2, result2) => {
                if (err2) {
                    throw err2;
                }
                const values = tool_arr.map(tool_id => [tool_id, id]);
                const sql = 'INSERT INTO symptom_tool (tool_id, symptom_id) VALUES ?';
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
