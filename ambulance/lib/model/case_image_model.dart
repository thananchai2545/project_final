import 'dart:convert';

CaseImageModel caseImageModelFromJson(String str) =>
    CaseImageModel.fromJson(json.decode(str));

String caseImageModelToJson(CaseImageModel data) => json.encode(data.toJson());

class CaseImageModel {
  String? caseImagePath;

  CaseImageModel({
    this.caseImagePath,
  });

  factory CaseImageModel.fromJson(Map<String, dynamic> json) => CaseImageModel(
        caseImagePath: json["case_image_path"],
      );

  Map<String, dynamic> toJson() => {
        "case_image_path": caseImagePath,
      };
}
