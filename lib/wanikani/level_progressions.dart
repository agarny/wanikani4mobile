import 'package:wanikani4mobile/wanikani/api.dart';

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
        object: json["object"],
        url: json["url"],
        pages: WaniKaniPages.fromJson(json["pages"]),
        totalCount: json["total_count"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: List<WaniKaniLevelProgressionsData>.from(
            json["data"].map((x) => WaniKaniLevelProgressionsData.fromJson(x))),
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
        id: json["id"],
        object: objectValues.map[json["object"]],
        url: json["url"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: WaniKaniLevelProgressionsDataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": objectValues.reverse[object],
        "url": url,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": data.toJson(),
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
        createdAt: DateTime.parse(json["created_at"]),
        level: json["level"],
        unlockedAt: DateTime.parse(json["unlocked_at"]),
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
        "created_at": createdAt.toIso8601String(),
        "level": level,
        "unlocked_at": unlockedAt.toIso8601String(),
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
