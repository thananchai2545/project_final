// To parse this JSON data, do
//
//     final toolModel = toolModelFromJson(jsonString);

import 'dart:convert';

ToolModel toolModelFromJson(String str) => ToolModel.fromJson(json.decode(str));

String toolModelToJson(ToolModel data) => json.encode(data.toJson());

class ToolModel {
  int? id;
  String? toolName;

  ToolModel({
    this.id,
    this.toolName,
  });

  factory ToolModel.fromJson(Map<String, dynamic> json) => ToolModel(
        id: json["id"],
        toolName: json["tool_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tool_name": toolName,
      };
}
