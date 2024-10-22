// To parse this JSON data, do
//
//     final accidentModel = accidentModelFromJson(jsonString);

import 'dart:convert';

AccidentModel accidentModelFromJson(String str) =>
    AccidentModel.fromJson(json.decode(str));

String accidentModelToJson(AccidentModel data) => json.encode(data.toJson());

class AccidentModel {
  int? id;
  String? caseNumber;
  String? caseLandmark;
  String? caseBreathing;
  String? caseOtherSymptom;
  String? caseStatus;
  int? userId;
  int? memberId;
  dynamic caseStatusNotification;
  String? caseType;
  String? caseTel;
  String? caseName;
  DateTime? dateReceive;
  String? caseLat;
  String? caseLng;
  int? ambulanceId;
  String? userName;
  String? userLastname;
  String? driverName;
  String? ambulanceRegistration;

  AccidentModel({
    this.id,
    this.caseNumber,
    this.caseLandmark,
    this.caseBreathing,
    this.caseOtherSymptom,
    this.caseStatus,
    this.userId,
    this.memberId,
    this.caseStatusNotification,
    this.caseType,
    this.caseTel,
    this.caseName,
    this.dateReceive,
    this.caseLat,
    this.caseLng,
    this.ambulanceId,
    this.userName,
    this.userLastname,
    this.driverName,
    this.ambulanceRegistration,
  });

  factory AccidentModel.fromJson(Map<String, dynamic> json) => AccidentModel(
        id: json["id"],
        caseNumber: json["case_number"],
        caseLandmark: json["case_landmark"],
        caseBreathing: json["case_breathing"],
        caseOtherSymptom: json["case_other_symptom"],
        caseStatus: json["case_status"],
        userId: json["user_id"],
        memberId: json["member_id"],
        caseStatusNotification: json["case_status_notification"],
        caseType: json["case_type"],
        caseTel: json["case_tel"],
        caseName: json["case_name"],
        dateReceive: json["date_receive"] == null
            ? null
            : DateTime.parse(json["date_receive"]),
        caseLat: json["case_lat"],
        caseLng: json["case_lng"],
        ambulanceId: json["ambulance_id"],
        userName: json["user_name"],
        userLastname: json["user_lastname"],
        driverName: json["driver_name"],
        ambulanceRegistration: json["ambulance_registration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "case_number": caseNumber,
        "case_landmark": caseLandmark,
        "case_breathing": caseBreathing,
        "case_other_symptom": caseOtherSymptom,
        "case_status": caseStatus,
        "user_id": userId,
        "member_id": memberId,
        "case_status_notification": caseStatusNotification,
        "case_type": caseType,
        "case_tel": caseTel,
        "case_name": caseName,
        "date_receive": dateReceive?.toIso8601String(),
        "case_lat": caseLat,
        "case_lng": caseLng,
        "ambulance_id": ambulanceId,
        "user_name": userName,
        "user_lastname": userLastname,
        "driver_name": driverName,
        "ambulance_registration": ambulanceRegistration,
      };
}
