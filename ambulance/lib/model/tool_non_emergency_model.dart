// To parse this JSON data, do
//
//     final toolNonEmergencyModel = toolNonEmergencyModelFromJson(jsonString);

import 'dart:convert';

ToolNonEmergencyModel toolNonEmergencyModelFromJson(String str) =>
    ToolNonEmergencyModel.fromJson(json.decode(str));

String toolNonEmergencyModelToJson(ToolNonEmergencyModel data) =>
    json.encode(data.toJson());

class ToolNonEmergencyModel {
  int? id;
  String? toolName;

  ToolNonEmergencyModel({
    this.id,
    this.toolName,
  });

  factory ToolNonEmergencyModel.fromJson(Map<String, dynamic> json) =>
      ToolNonEmergencyModel(
        id: json["id"],
        toolName: json["tool_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tool_name": toolName,
      };
}
