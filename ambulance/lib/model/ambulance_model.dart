// To parse this JSON data, do
//
//     final ambulanceModel = ambulanceModelFromJson(jsonString);

import 'dart:convert';

AmbulanceModel ambulanceModelFromJson(String str) =>
    AmbulanceModel.fromJson(json.decode(str));

String ambulanceModelToJson(AmbulanceModel data) => json.encode(data.toJson());

class AmbulanceModel {
  int? id;
  String? ambulanceRegistration;
  String? driverName;
  String? username;
  String? password;
  String? status;
  dynamic lat;
  dynamic lng;
  dynamic type;
  dynamic caseLat;
  dynamic caseLng;

  AmbulanceModel({
    this.id,
    this.ambulanceRegistration,
    this.driverName,
    this.username,
    this.password,
    this.status,
    this.lat,
    this.lng,
    this.type,
    this.caseLat,
    this.caseLng,
  });

  factory AmbulanceModel.fromJson(Map<String, dynamic> json) => AmbulanceModel(
        id: json["id"],
        ambulanceRegistration: json["ambulance_registration"],
        driverName: json["driver_name"],
        username: json["username"],
        password: json["password"],
        status: json["status"],
        lat: json["lat"],
        lng: json["lng"],
        type: json["type"],
        caseLat: json["case_lat"],
        caseLng: json["case_lng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ambulance_registration": ambulanceRegistration,
        "driver_name": driverName,
        "username": username,
        "password": password,
        "status": status,
        "lat": lat,
        "lng": lng,
        "type": type,
        "case_lat": caseLat,
        "case_lng": caseLng,
      };
}
