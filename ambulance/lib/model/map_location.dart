// To parse this JSON data, do
//
//     final mapLocation = mapLocationFromJson(jsonString);

import 'dart:convert';

MapLocation mapLocationFromJson(String str) =>
    MapLocation.fromJson(json.decode(str));

String mapLocationToJson(MapLocation data) => json.encode(data.toJson());

class MapLocation {
  String? caseLat;
  String? caseLng;
  String? caseType;
  int? caseId;
  String? caseStatus;

  MapLocation({
    this.caseLat,
    this.caseLng,
    this.caseType,
    this.caseId,
    this.caseStatus,
  });

  factory MapLocation.fromJson(Map<String, dynamic> json) => MapLocation(
        caseLat: json["case_lat"],
        caseLng: json["case_lng"],
        caseType: json["case_type"],
        caseId: json["case_id"],
        caseStatus: json["case_status"],
      );

  Map<String, dynamic> toJson() => {
        "case_lat": caseLat,
        "case_lng": caseLng,
        "case_type": caseType,
        "case_id": caseId,
        "case_status": caseStatus,
      };
}
