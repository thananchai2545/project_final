import 'dart:convert';

SymptomModel symptomModelFromJson(String str) =>
    SymptomModel.fromJson(json.decode(str));

String symptomModelToJson(SymptomModel data) => json.encode(data.toJson());

class SymptomModel {
  int? id;
  String? symptomName;
  bool? isChecked;

  SymptomModel({this.id, this.symptomName, this.isChecked});

  factory SymptomModel.fromJson(Map<String, dynamic> json) => SymptomModel(
      id: json["id"], symptomName: json["symptom_name"], isChecked: false);

  Map<String, dynamic> toJson() => {
        "id": id,
        "symptom_name": symptomName,
      };
}
