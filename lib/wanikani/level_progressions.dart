import 'package:wanikani4mobile/wanikani/common.dart';

class WaniKaniLevelProgressions {
  String object;
  String url;
  WaniKaniPages pages;
  int totalCount;
  DateTime dataUpdatedAt;
  List<WaniKaniLevelProgressionsData> data;

  WaniKaniLevelProgressions({
    this.object,
    this.url,
    this.pages,
    this.totalCount,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniLevelProgressions.fromJson(Map<String, dynamic> json) =>
      WaniKaniLevelProgressions(
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
            : List<WaniKaniLevelProgressionsData>.from(json["data"]
                .map((x) => WaniKaniLevelProgressionsData.fromJson(x))),
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

class WaniKaniLevelProgressionsData {
  int id;
  Object object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniLevelProgressionsDataData data;

  WaniKaniLevelProgressionsData({
    this.id,
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniLevelProgressionsData.fromJson(Map<String, dynamic> json) =>
      WaniKaniLevelProgressionsData(
        id: json["id"] == null ? null : json["id"],
        object:
            json["object"] == null ? null : objectValues.map[json["object"]],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : WaniKaniLevelProgressionsDataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "object": object == null ? null : objectValues.reverse[object],
        "url": url == null ? null : url,
        "data_updated_at":
            dataUpdatedAt == null ? null : dataUpdatedAt.toIso8601String(),
        "data": data == null ? null : data.toJson(),
      };
}

class WaniKaniLevelProgressionsDataData {
  DateTime createdAt;
  int level;
  DateTime unlockedAt;
  DateTime startedAt;
  DateTime passedAt;
  dynamic completedAt;
  DateTime abandonedAt;

  WaniKaniLevelProgressionsDataData({
    this.createdAt,
    this.level,
    this.unlockedAt,
    this.startedAt,
    this.passedAt,
    this.completedAt,
    this.abandonedAt,
  });

  factory WaniKaniLevelProgressionsDataData.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniLevelProgressionsDataData(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        level: json["level"] == null ? null : json["level"],
        unlockedAt: json["unlocked_at"] == null
            ? null
            : DateTime.parse(json["unlocked_at"]),
        startedAt: json["started_at"] == null
            ? null
            : DateTime.parse(json["started_at"]),
        passedAt: json["passed_at"] == null
            ? null
            : DateTime.parse(json["passed_at"]),
        completedAt: json["completed_at"],
        abandonedAt: json["abandoned_at"] == null
            ? null
            : DateTime.parse(json["abandoned_at"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "level": level == null ? null : level,
        "unlocked_at": unlockedAt == null ? null : unlockedAt.toIso8601String(),
        "started_at": startedAt == null ? null : startedAt.toIso8601String(),
        "passed_at": passedAt == null ? null : passedAt.toIso8601String(),
        "completed_at": completedAt,
        "abandoned_at":
            abandonedAt == null ? null : abandonedAt.toIso8601String(),
      };
}

enum Object { LEVEL_PROGRESSION }

final objectValues =
    WaniKaniEnumValues({"level_progression": Object.LEVEL_PROGRESSION});
