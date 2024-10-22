const db = require('../config/db');
const { use } = require('../routes/case');

exports.indexAll = (req, res) => {
    const sql = `
SELECT * FROM view_case
`;

    try {
        db.query(sql, (err, results) => {
            console.log(results);
            res.json({
                status: 'success',
                case: results,
            })

        })
    } catch (error) {
        console.log(error);
    }


}

exports.index = (req, res) => {
    const { id } = req.params
    // console.log(req.params);

    const sql = `
        SELECT
    view_case.*,
    view_case_symptom.id AS case_symptom_id, view_case_symptom.symptom_name,view_case_symptom.symptom_id,
    view_symptom_tool.id AS symptom_tool_id,view_symptom_tool.tool_name,view_symptom_tool.tool_id,
    case_image.id AS case_image_id ,case_image.case_image_path
    FROM view_case
    LEFT JOIN view_case_symptom ON view_case.id = view_case_symptom.case_id
    LEFT JOIN view_symptom_tool ON view_case_symptom.symptom_id = view_symptom_tool.symptom_id
    LEFT JOIN case_image ON view_case.id = case_image.case_id
    WHERE view_case.id = ?;
        `
    db.query(sql, [id], (err, results) => {
        if (err) throw err;

        const data = {}
        results.forEach((row, index) => {
            if (!data[row.id]) {
                data[row.id] = {
                    id: row.id,
                    case_number: row.case_number,
                    case_location_landmark: row.case_location_landmark,
                    case_breathing: row.case_breathing,
                    case_other_symptom: row.case_other_symptom,
                    case_status: row.case_status,
                    user_id: row.user_id,
                    member_id: row.member_id,
                    case_status_notification: row.case_status_notification,
                    case_type: row.case_type,
                    case_lat: row.case_lat,
                    case_lng: row.case_lng,
                    case_tel: row.case_tel,
                    case_name: row.case_name,
                    date_receive: row.date_receive,
                    ambulance_id: row.ambulance_id,
                    user_name: row.user_name,
                    user_lastname: row.user_lastname,
                    ambulance_driver_name: row.driver_name,
                    ambulance_registration: row.ambulance_registration,
                    case_symptom: {},
                    case_tool: {},
                    case_image: {}
                }
            }

            if (row.case_symptom_id) {
                if (!data[row.id].case_symptom[row.symptom_id]) {
                    data[row.id].case_symptom[row.symptom_id] = {
                        id: row.case_symptom_id,
                        symptom_id: row.symptom_id,
                        symptom_name: row.symptom_name,
                        // case_tool: []
                    };
                }
            }

            if (row.tool_name) {
                if (!data[row.id].case_tool[row.tool_id]) {
                    data[row.id].case_tool[row.tool_id] = {
                        id: row.symptom_tool_id,
                        tool_id: row.tool_id,
                        tool_name: row.tool_name
                    };
                }
            }

            if (row.case_image_id) {
                if (!data[row.id].case_image[row.case_image_id]) {
                    data[row.id].case_image[row.case_image_id] = {
                        id: row.case_image_id,
                        case_image_path: row.case_image_path
                    };
                }
            }
        })
        res.json({
            case: data
        })
    })
}

exports.getAmbulance = (req, res) => {
    const { id } = req.params
    const sql = `
    SELECT * FROM ambulance
    
    `
    db.query(sql, [id], (err, results) => {
        if (err) throw err;
        res.json({
            ambulance: results
        })
    })
}

exports.selectAmbulance = (req, res) => {
    const { id, user_id, tool, ambulance_id } = req.body
    const date_receive = new Date()
    const sql = "UPDATE case_data SET ambulance_id = ?, user_id = ? ,date_receive=? WHERE id = ?"
    db.query(sql, [ambulance_id, user_id, date_receive, id], (err, results) => {
        if (err) throw err;

        if (tool.length > 0) {
            const tool_id = tool.map((tool) => [id, tool])
            const sql = "INSERT INTO case_data_tool (case_data_id, tool_id) VALUES ?"
            db.query(sql, [tool_id], (err, results) => {
                if (err) throw err;
                console.log(results);
            })
        }
        console.log(results);

        res.json({
            status: 'success',
            // receive: results
        });
    })
}