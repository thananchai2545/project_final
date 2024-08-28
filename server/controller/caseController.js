const db = require('../config/db');

exports.indexAll = (req, res) => {
    const sql = `SELECT
	view_case.id, view_case.case_number, view_case.case_breathing,view_case.case_name,view_case.case_idcard,view_case.case_tel,
    view_case.case_type,

	view_case_symptom.id as case_symptom_id, view_case_symptom.symptom_name,
	view_symptom_tool.id as symptom_tool_id, view_symptom_tool.tool_name
FROM
	view_case
	LEFT JOIN
	view_case_symptom
	ON 
		view_case.id = view_case_symptom.case_id
	LEFT JOIN
	view_symptom_tool
	ON 
view_case_symptom.symptom_id = view_symptom_tool.symptom_id
`;

    try {
        db.query(sql, (err, results) => {
            const data = {};
            const tool = {};
            results.forEach((row, index) => {
                if (!data[row.id]) {
                    data[row.id] = {
                        id: row.id,
                        case_number: row.case_number,
                        case_breathing: row.case_breathing,
                        case_name: row.case_name,
                        case_idcard: row.case_idcard,
                        case_tel: row.case_tel,
                        case_type: row.case_type,
                        case_symptom: {},
                        case_tool: {}
                    };
                }

                if (row.case_symptom_id) {
                    if (!data[row.id].case_symptom[row.case_symptom_id]) {
                        data[row.id].case_symptom[row.case_symptom_id] = {
                            id: row.case_symptom_id,
                            symptom_name: row.symptom_name,
                            case_tool: []
                        };
                    }
                }


                if (row.tool_name) {
                    if (!data[row.id].case_tool[row.tool_name]) {
                        data[row.id].case_tool[row.tool_name] = {
                            id: row.symptom_tool_id,
                            tool_name: row.tool_name
                        };
                    }


                    // data[row.id].case_tool[row.symptom_tool_id] = {
                    //     id: row.symptom_tool_id,
                    //     tool_name: row.tool_name
                    // };
                }


                // console.log(JSON.stringify([...new Set(tool)], null, 2));
            });
            // data[row.id].case_tool.push([...new Set(tool)])

            res.json({
                status: 'success',
                case: data,
                // tool: [...new Set(tool)]
                // data_symptom: data_symptom,
                // data_symptom1: results[1]
            })
            console.log(JSON.stringify(data, null, 2));



            // console.log(data);


        })
    } catch (error) {
        console.log(error);
    }


}

exports.index = (req, res) => {
    const { id } = req.params
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
                    case_location: row.case_location,
                    case_location_landmark: row.case_location_landmark,
                    case_breathing: row.case_breathing,
                    case_other_symptom: row.case_other_symptom,
                    case_status: row.case_status,
                    user_id: row.user_id,
                    member_id: row.member_id,
                    case_date: row.case_date,
                    case_date_receive: row.case_date_receive,
                    case_status_notification: row.case_status_notification,
                    case_type: row.case_type,
                    case_idcard: row.case_idcard,
                    case_number_patients: row.case_number_patients,
                    case_tel: row.case_tel,
                    case_name: row.case_name,
                    case_other_symptom: row.case_other_symptom,
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