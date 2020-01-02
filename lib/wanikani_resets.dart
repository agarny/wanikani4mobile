import 'package:wanikani4mobile/wanikani.dart';

class WaniKaniResets {
  String object;
  String url;
  WaniKaniPages pages;
  int totalCount;
  DateTime dataUpdatedAt;
  List<WaniKaniResetsData> data;

  WaniKaniResets({
    this.object,
    this.url,
    this.pages,
    this.totalCount,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniResets.fromJson(Map<String, dynamic> json) => WaniKaniResets(
        object: json["object"],
        url: json["url"],
        pages: WaniKaniPages.fromJson(json["pages"]),
        totalCount: json["total_count"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: List<WaniKaniResetsData>.from(
            json["data"].map((x) => WaniKaniResetsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "url": url,
        "pages": pages.toJson(),
        "total_count": totalCount,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WaniKaniResetsData {
  int id;
  String object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniResetsDataData data;

  WaniKaniResetsData({
    this.id,
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniResetsData.fromJson(Map<String, dynamic> json) =>
      WaniKaniResetsData(
        id: json["id"],
        object: json["object"],
        url: json["url"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: WaniKaniResetsDataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "url": url,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": data.toJson(),
      };
}

class WaniKaniResetsDataData {
  DateTime createdAt;
  int originalLevel;
  int targetLevel;
  DateTime confirmedAt;

  WaniKaniResetsDataData({
    this.createdAt,
    this.originalLevel,
    this.targetLevel,
    this.confirmedAt,
  });

  factory WaniKaniResetsDataData.fromJson(Map<String, dynamic> json) =>
      WaniKaniResetsDataData(
        createdAt: DateTime.parse(json["created_at"]),
        originalLevel: json["original_level"],
        targetLevel: json["target_level"],
        confirmedAt: DateTime.parse(json["confirmed_at"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "original_level": originalLevel,
        "target_level": targetLevel,
        "confirmed_at": confirmedAt.toIso8601String(),
      };
}
