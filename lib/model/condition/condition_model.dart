// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Condition conditionFromJson(String str) => Condition.fromJson(json.decode(str));

String conditionToJson(Condition data) => json.encode(data.toJson());

class Condition {
  List<Datapoint> datapoints;
  PaginationDetails paginationDetails;

  Condition({
    required this.datapoints,
    required this.paginationDetails,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        datapoints: List<Datapoint>.from(
            json["datapoints"].map((x) => Datapoint.fromJson(x))),
        paginationDetails:
            PaginationDetails.fromJson(json["pagination_details"]),
      );

  Map<String, dynamic> toJson() => {
        "datapoints": List<dynamic>.from(datapoints.map((x) => x.toJson())),
        "pagination_details": paginationDetails.toJson(),
      };
}

class Datapoint {
  String id;
  String name;
  String dptype;
  String category;
  String dptypeTitle;
  String categoryTitle;

  Datapoint({
    required this.id,
    required this.name,
    required this.dptype,
    required this.category,
    required this.dptypeTitle,
    required this.categoryTitle,
  });

  factory Datapoint.fromJson(Map<String, dynamic> json) => Datapoint(
        id: json["id"],
        name: json["name"],
        dptype: json["dptype"]!,
        category: json["category"]!,
        dptypeTitle: json["dptype_title"]!,
        categoryTitle: json["category_title"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dptype": dptypeTitle,
        "category": category,
        "dptype_title": dptypeTitle,
        "category_title": categoryTitle,
      };
}

class PaginationDetails {
  int next;
  dynamic prev;
  int pages;
  int total;

  PaginationDetails({
    required this.next,
    required this.prev,
    required this.pages,
    required this.total,
  });

  factory PaginationDetails.fromJson(Map<String, dynamic> json) =>
      PaginationDetails(
        next: json["next"],
        prev: json["prev"],
        pages: json["pages"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "next": next,
        "prev": prev,
        "pages": pages,
        "total": total,
      };
}
