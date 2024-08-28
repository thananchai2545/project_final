// To parse this JSON data, do
//
//     final caseModel = caseModelFromJson(jsonString);

import 'dart:convert';

CaseModel caseModelFromJson(String str) => CaseModel.fromJson(json.decode(str));

String caseModelToJson(CaseModel data) => json.encode(data.toJson());

class CaseModel {
  int? id;
  String? caseNumber;
  dynamic caseLocation;
  String? caseLocationLandmark;
  String? caseBreathing;
  String? caseOtherSymptoms;
  dynamic caseStatus;
  dynamic userId;
  int? memberId;
  DateTime? caseDate;
  dynamic caseDateReceive;
  dynamic caseStatusNotification;
  dynamic symptomId;
  String? caseType;
  String? caseIdcard;
  String? caseNumberPatients;
  String? caseTel;
  dynamic caseName;

  CaseModel({
    this.id,
    this.caseNumber,
    this.caseLocation,
    this.caseLocationLandmark,
    this.caseBreathing,
    this.caseOtherSymptoms,
    this.caseStatus,
    this.userId,
    this.memberId,
    this.caseDate,
    this.caseDateReceive,
    this.caseStatusNotification,
    this.symptomId,
    this.caseType,
    this.caseIdcard,
    this.caseNumberPatients,
    this.caseTel,
    this.caseName,
  });

  factory CaseModel.fromJson(Map<String, dynamic> json) => CaseModel(
        id: json["id"],
        caseNumber: json["case_number"],
        caseLocation: json["case_location"],
        caseLocationLandmark: json["case_location_landmark"],
        caseBreathing: json["case_breathing"],
        caseOtherSymptoms: json["case_other_symptoms"],
        caseStatus: json["case_status"],
        userId: json["user_id"],
        memberId: json["member_id"],
        caseDate: json["case_date"] == null
            ? null
            : DateTime.parse(json["case_date"]),
        caseDateReceive: json["case_date_receive"],
        caseStatusNotification: json["case_status_notification"],
        symptomId: json["symptom_id"],
        caseType: json["case_type"],
        caseIdcard: json["case_idcard"],
        caseNumberPatients: json["case_number_patients"],
        caseTel: json["case_tel"],
        caseName: json["case_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "case_number": caseNumber,
        "case_location": caseLocation,
        "case_location_landmark": caseLocationLandmark,
        "case_breathing": caseBreathing,
        "case_other_symptoms": caseOtherSymptoms,
        "case_status": caseStatus,
        "user_id": userId,
        "member_id": memberId,
        "case_date": caseDate?.toIso8601String(),
        "case_date_receive": caseDateReceive,
        "case_status_notification": caseStatusNotification,
        "symptom_id": symptomId,
        "case_type": caseType,
        "case_idcard": caseIdcard,
        "case_number_patients": caseNumberPatients,
        "case_tel": caseTel,
        "case_name": caseName,
      };
}
