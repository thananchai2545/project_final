import 'dart:convert';

Hospital hospitalFromJson(String str) => Hospital.fromJson(json.decode(str));

String hospitalToJson(Hospital data) => json.encode(data.toJson());

class Hospital {
  int? id;
  String? hospitalName;
  String? lat;
  String? lng;

  Hospital({
    this.id,
    this.hospitalName,
    this.lat,
    this.lng,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) => Hospital(
        id: json["id"],
        hospitalName: json["hospital_name"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hospital_name": hospitalName,
        "lat": lat,
        "lng": lng,
      };
}
