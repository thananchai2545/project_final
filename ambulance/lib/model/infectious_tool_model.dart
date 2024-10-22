import 'dart:convert';

InfectiousToolModel infectiousToolModelFromJson(String str) =>
    InfectiousToolModel.fromJson(json.decode(str));

String infectiousToolModelToJson(InfectiousToolModel data) =>
    json.encode(data.toJson());

class InfectiousToolModel {
  int? id;
  int? infectiousId;
  String? toolName;

  InfectiousToolModel({
    this.id,
    this.infectiousId,
    this.toolName,
  });

  factory InfectiousToolModel.fromJson(Map<String, dynamic> json) =>
      InfectiousToolModel(
        id: json["id"],
        infectiousId: json["infectious_id"],
        toolName: json["tool_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "infectious_id": infectiousId,
        "tool_name": toolName,
      };
}
