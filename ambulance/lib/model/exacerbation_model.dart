import 'dart:convert';

class ExacerbationModel {
  int? id;
  String? nameLastname;
  String? age;
  String? idCard;
  String? drugAllergy;
  String? prescriptionDrugs;
  String? sex;
  String? dateIncident;
  dynamic timeIncident;
  String? locationIncident;
  String? symptom;
  String? period;
  String? assistance;
  String? address;
  String? landmarks;
  String? lat;
  String? lng;
  String? nameLastnameInformer;
  String? relationship;
  String? tel;
  int? memberId;
  int? ambulanceId;
  String? status;
  String? violence;
  String? type;
  int? userId;
  DateTime? dateReceive;
  String? ambulanceRegistration;
  String? ambulanceDriverName;
  String? userName;
  String? userLastname;

  ExacerbationModel({
    this.id,
    this.nameLastname,
    this.age,
    this.idCard,
    this.drugAllergy,
    this.prescriptionDrugs,
    this.sex,
    this.dateIncident,
    this.timeIncident,
    this.locationIncident,
    this.symptom,
    this.period,
    this.assistance,
    this.address,
    this.landmarks,
    this.lat,
    this.lng,
    this.nameLastnameInformer,
    this.relationship,
    this.tel,
    this.memberId,
    this.ambulanceId,
    this.status,
    this.violence,
    this.type,
    this.userId,
    this.dateReceive,
    this.ambulanceRegistration,
    this.ambulanceDriverName,
    this.userName,
    this.userLastname,
  });

  factory ExacerbationModel.fromRawJson(String str) =>
      ExacerbationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExacerbationModel.fromJson(Map<String, dynamic> json) =>
      ExacerbationModel(
        id: json["id"],
        nameLastname: json["name_lastname"],
        age: json["age"],
        idCard: json["id_card"],
        drugAllergy: json["drug_allergy"],
        prescriptionDrugs: json["prescription_drugs"],
        sex: json["sex"],
        dateIncident: json["date_incident"],
        timeIncident: json["time_incident"],
        locationIncident: json["location_incident"],
        symptom: json["symptom"],
        period: json["period"],
        assistance: json["assistance"],
        address: json["address"],
        landmarks: json["landmarks"],
        lat: json["lat"],
        lng: json["lng"],
        nameLastnameInformer: json["name_lastname_Informer"],
        relationship: json["relationship"],
        tel: json["tel"],
        memberId: json["member_id"],
        ambulanceId: json["ambulance_id"],
        status: json["status"],
        violence: json["violence"],
        type: json["type"],
        userId: json["user_id"],
        dateReceive: json["date_receive"] == null
            ? null
            : DateTime.parse(json["date_receive"]),
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
        "drug_allergy": drugAllergy,
        "prescription_drugs": prescriptionDrugs,
        "sex": sex,
        "date_incident": dateIncident,
        "time_incident": timeIncident,
        "location_incident": locationIncident,
        "symptom": symptom,
        "period": period,
        "assistance": assistance,
        "address": address,
        "landmarks": landmarks,
        "lat": lat,
        "lng": lng,
        "name_lastname_Informer": nameLastnameInformer,
        "relationship": relationship,
        "tel": tel,
        "member_id": memberId,
        "ambulance_id": ambulanceId,
        "status": status,
        "violence": violence,
        "type": type,
        "user_id": userId,
        "date_receive": dateReceive?.toIso8601String(),
        "ambulance_registration": ambulanceRegistration,
        "ambulance_driver_name": ambulanceDriverName,
        "user_name": userName,
        "user_lastname": userLastname,
      };
}
