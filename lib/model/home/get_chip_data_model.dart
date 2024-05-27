import 'dart:convert';

GetChipsDataResponse getChipsDataResponseFromJson(String str) =>
    GetChipsDataResponse.fromJson(json.decode(str));

String getChipsDataResponseToJson(GetChipsDataResponse data) =>
    json.encode(data.toJson());

class GetChipsDataResponse {
  List<CommunityGroup> communityGroups;

  GetChipsDataResponse({
    required this.communityGroups,
  });

  factory GetChipsDataResponse.fromJson(Map<String, dynamic> json) =>
      GetChipsDataResponse(
        communityGroups: List<CommunityGroup>.from(
            json["communityGroups"].map((x) => CommunityGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "communityGroups":
            List<dynamic>.from(communityGroups.map((x) => x.toJson())),
      };
}

class CommunityGroup {
  String id;
  String name;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic datapointId;
  String createdById;

  CommunityGroup({
    required this.id,
    required this.name,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.datapointId,
    required this.createdById,
  });

  factory CommunityGroup.fromJson(Map<String, dynamic> json) => CommunityGroup(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        datapointId: json["datapoint_id"],
        createdById: json["created_by_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "datapoint_id": datapointId,
        "created_by_id": createdById,
      };
}
