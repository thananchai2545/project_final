import 'dart:convert';

CaseSymptomModel caseSymptomModelFromJson(String str) =>
    CaseSymptomModel.fromJson(json.decode(str));

String caseSymptomModelToJson(CaseSymptomModel data) =>
    json.encode(data.toJson());

class CaseSymptomModel {
  String? symptomName;

  CaseSymptomModel({
    this.symptomName,
  });

  factory CaseSymptomModel.fromJson(Map<String, dynamic> json) =>
      CaseSymptomModel(
        symptomName: json["symptom_name"],
      );

  Map<String, dynamic> toJson() => {
        "symptom_name": symptomName,
      };
}
