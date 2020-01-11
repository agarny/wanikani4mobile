import 'package:wanikani4mobile/wanikani/common.dart';

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
        object: json["object"] == null ? null : json["object"],
        url: json["url"] == null ? null : json["url"],
        pages: json["pages"] == null
            ? null
            : WaniKaniPages.fromJson(json["pages"]),
        totalCount: json["total_count"] == null ? null : json["total_count"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : List<WaniKaniResetsData>.from(
                json["data"].map((x) => WaniKaniResetsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "object": object == null ? null : object,
        "url": url == null ? null : url,
        "pages": pages == null ? null : pages.toJson(),
        "total_count": totalCount == null ? null : totalCount,
        "data_updated_at":
            dataUpdatedAt == null ? null : dataUpdatedAt.toIso8601String(),
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
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
        id: json["id"] == null ? null : json["id"],
        object: json["object"] == null ? null : json["object"],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : WaniKaniResetsDataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "object": object == null ? null : object,
        "url": url == null ? null : url,
        "data_updated_at":
            dataUpdatedAt == null ? null : dataUpdatedAt.toIso8601String(),
        "data": data == null ? null : data.toJson(),
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        originalLevel:
            json["original_level"] == null ? null : json["original_level"],
        targetLevel: json["target_level"] == null ? null : json["target_level"],
        confirmedAt: json["confirmed_at"] == null
            ? null
            : DateTime.parse(json["confirmed_at"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "original_level": originalLevel == null ? null : originalLevel,
        "target_level": targetLevel == null ? null : targetLevel,
        "confirmed_at":
            confirmedAt == null ? null : confirmedAt.toIso8601String(),
      };
}
