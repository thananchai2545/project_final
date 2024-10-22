// To parse this JSON data, do
//
//     final infectiousModel = infectiousModelFromJson(jsonString);

import 'dart:convert';

InfectiousModel infectiousModelFromJson(String str) =>
    InfectiousModel.fromJson(json.decode(str));

String infectiousModelToJson(InfectiousModel data) =>
    json.encode(data.toJson());

class InfectiousModel {
  int? id;
  String? nameLastname;
  String? age;
  String? idCard;
  String? sex;
  String? tel;
  String? address;
  String? landmark;
  String? lat;
  String? lng;
  String? nameDisease;
  String? symptom;
  String? period;
  DateTime? dateService;
  String? timeService;
  int? hospitalId;
  String? status;
  int? ambulanceId;
  int? memberId;
  String? type;
  int? userId;
  DateTime? dateReceive;
  dynamic dateDeparture;
  dynamic dateDestination;
  dynamic dateHopital;
  String? hospitalName;
  String? ambulanceRegistration;
  String? ambulanceDriverName;
  String? userName;
  String? userLastname;

  InfectiousModel({
    this.id,
    this.nameLastname,
    this.age,
    this.idCard,
    this.sex,
    this.tel,
    this.address,
    this.landmark,
    this.lat,
    this.lng,
    this.nameDisease,
    this.symptom,
    this.period,
    this.dateService,
    this.timeService,
    this.hospitalId,
    this.status,
    this.ambulanceId,
    this.memberId,
    this.type,
    this.userId,
    this.dateReceive,
    this.dateDeparture,
    this.dateDestination,
    this.dateHopital,
    this.hospitalName,
    this.ambulanceRegistration,
    this.ambulanceDriverName,
    this.userName,
    this.userLastname,
  });

  factory InfectiousModel.fromJson(Map<String, dynamic> json) =>
      InfectiousModel(
        id: json["id"],
        nameLastname: json["name_lastname"],
        age: json["age"],
        idCard: json["id_card"],
        sex: json["sex"],
        tel: json["tel"],
        address: json["address"],
        landmark: json["landmark"],
        lat: json["lat"],
        lng: json["lng"],
        nameDisease: json["name_disease"],
        symptom: json["symptom"],
        period: json["period"],
        dateService: json["date_service"] == null
            ? null
            : DateTime.parse(json["date_service"]),
        timeService: json["time_service"],
        hospitalId: json["hospital_id"],
        status: json["status"],
        ambulanceId: json["ambulance_id"],
        memberId: json["member_id"],
        type: json["type"],
        userId: json["user_id"],
        dateReceive: json["date_receive"] == null
            ? null
            : DateTime.parse(json["date_receive"]),
        dateDeparture: json["date_departure"],
        dateDestination: json["date_destination"],
        dateHopital: json["date_hopital"],
        hospitalName: json["hospital_name"],
        ambulanceRegistration: json["ambulance_registration"],
        ambulanceDriverName: json["ambulance_driver_name"],
        userName: json["user_name"],
        userLastname: json["user_lastname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_lastname": nameLastname,
        "age": age,
        "id_card": idCard,
        "sex": sex,
        "tel": tel,
        "address": address,
        "landmark": landmark,
        "lat": lat,
        "lng": lng,
        "name_disease": nameDisease,
        "symptom": symptom,
        "period": period,
        "date_service":
            "${dateService!.year.toString().padLeft(4, '0')}-${dateService!.month.toString().padLeft(2, '0')}-${dateService!.day.toString().padLeft(2, '0')}",
        "time_service": timeService,
        "hospital_id": hospitalId,
        "status": status,
        "ambulance_id": ambulanceId,
        "member_id": memberId,
        "type": type,
        "user_id": userId,
        "date_receive": dateReceive?.toIso8601String(),
        "date_departure": dateDeparture,
        "date_destination": dateDestination,
        "date_hopital": dateHopital,
        "hospital_name": hospitalName,
        "ambulance_registration": ambulanceRegistration,
        "ambulance_driver_name": ambulanceDriverName,
        "user_name": userName,
        "user_lastname": userLastname,
      };
}
