// To parse this JSON data, do
//
//     final case = caseFromJson(jsonString);

import 'dart:convert';

Case caseFromJson(String str) => Case.fromJson(json.decode(str));

String caseToJson(Case data) => json.encode(data.toJson());

class Case {
  int? id;
  DateTime? dateReceive;
  String? type;
  String? tel;
  int? ambulanceId;
  String? status;

  Case({
    this.id,
    this.dateReceive,
    this.type,
    this.tel,
    this.ambulanceId,
    this.status,
  });

  factory Case.fromJson(Map<String, dynamic> json) => Case(
        id: json["id"],
        dateReceive: json["date_receive"] == null
            ? null
            : DateTime.parse(json["date_receive"]),
        type: json["type"],
        tel: json["tel"],
        ambulanceId: json["ambulance_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_receive": dateReceive?.toIso8601String(),
        "type": type,
        "tel": tel,
        "ambulance_id": ambulanceId,
        "status": status,
      };
}
