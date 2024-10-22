// To parse this JSON data, do
//
//     final nonEmergencyModel = nonEmergencyModelFromJson(jsonString);

import 'dart:convert';

NonEmergencyModel nonEmergencyModelFromJson(String str) =>
    NonEmergencyModel.fromJson(json.decode(str));

String nonEmergencyModelToJson(NonEmergencyModel data) =>
    json.encode(data.toJson());

class NonEmergencyModel {
  int? id;
  String? nameLastname;
  String? sex;
  String? tel;
  String? address;
  String? landmark;
  String? lng;
  String? lat;
  String? symptom;
  String? disease;
  String? drugAllergy;
  String? doctor;
  DateTime? dateService;
  dynamic timeService;
  dynamic hospitalId;
  int? memberId;
  String? age;
  dynamic idCard;
  String? status;
  int? ambulanceId;
  String? type;
  int? userId;
  DateTime? dateReceive;
  dynamic hospitalName;
  String? ambulanceRegistration;
  String? ambulanceDriverName;
  String? userName;
  String? userLastname;

  NonEmergencyModel({
    this.id,
    this.nameLastname,
    this.sex,
    this.tel,
    this.address,
    this.landmark,
    this.lng,
    this.lat,
    this.symptom,
    this.disease,
    this.drugAllergy,
    this.doctor,
    this.dateService,
    this.timeService,
    this.hospitalId,
    this.memberId,
    this.age,
    this.idCard,
    this.status,
    this.ambulanceId,
    this.type,
    this.userId,
    this.dateReceive,
    this.hospitalName,
    this.ambulanceRegistration,
    this.ambulanceDriverName,
    this.userName,
    this.userLastname,
  });

  factory NonEmergencyModel.fromJson(Map<String, dynamic> json) =>
      NonEmergencyModel(
        id: json["id"],
        nameLastname: json["name_lastname"],
        sex: json["sex"],
        tel: json["tel"],
        address: json["address"],
        landmark: json["landmark"],
        lng: json["lng"],
        lat: json["lat"],
        symptom: json["symptom"],
        disease: json["disease"],
        drugAllergy: json["drug_allergy"],
        doctor: json["doctor"],
        dateService: json["date_service"] == null
            ? null
            : DateTime.parse(json["date_service"]),
        timeService: json["time_service"],
        hospitalId: json["hospital_id"],
        memberId: json["member_id"],
        age: json["age"],
        idCard: json["id_card"],
        status: json["status"],
        ambulanceId: json["ambulance_id"],
        type: json["type"],
        userId: json["user_id"],
        dateReceive: json["date_receive"] == null
            ? null
            : DateTime.parse(json["date_receive"]),
        hospitalName: json["hospital_name"],
        ambulanceRegistration: json["ambulance_registration"],
        ambulanceDriverName: json["ambulance_driver_name"],
        userName: json["user_name"],
        userLastname: json["user_lastname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_lastname": nameLastname,
        "sex": sex,
        "tel": tel,
        "address": address,
        "landmark": landmark,
        "lng": lng,
        "lat": lat,
        "symptom": symptom,
        "disease": disease,
        "drug_allergy": drugAllergy,
        "doctor": doctor,
        "date_service": dateService?.toIso8601String(),
        "time_service": timeService,
        "hospital_id": hospitalId,
        "member_id": memberId,
        "age": age,
        "id_card": idCard,
        "status": status,
        "ambulance_id": ambulanceId,
        "type": type,
        "user_id": userId,
        "date_receive": dateReceive?.toIso8601String(),
        "hospital_name": hospitalName,
        "ambulance_registration": ambulanceRegistration,
        "ambulance_driver_name": ambulanceDriverName,
        "user_name": userName,
        "user_lastname": userLastname,
      };
}
