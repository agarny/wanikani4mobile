import 'package:wanikani4mobile/wanikani/common.dart';

class WaniKaniSpacedRepetitionSystems {
  WaniKaniSpacedRepetitionSystems({
    this.object,
    this.url,
    this.pages,
    this.totalCount,
    this.dataUpdatedAt,
    this.data,
  });

  String object;
  String url;
  WaniKaniPages pages;
  int totalCount;
  DateTime dataUpdatedAt;
  List<WaniKaniSpacedRepetitionSystemsData> data;

  factory WaniKaniSpacedRepetitionSystems.fromJson(Map<String, dynamic> json) =>
      WaniKaniSpacedRepetitionSystems(
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
            : List<WaniKaniSpacedRepetitionSystemsData>.from(json["data"]
                .map((x) => WaniKaniSpacedRepetitionSystemsData.fromJson(x))),
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

class WaniKaniSpacedRepetitionSystemsData {
  WaniKaniSpacedRepetitionSystemsData({
    this.id,
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  int id;
  String object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniSpacedRepetitionSystemsDataData data;

  factory WaniKaniSpacedRepetitionSystemsData.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniSpacedRepetitionSystemsData(
        id: json["id"] == null ? null : json["id"],
        object: json["object"] == null ? null : json["object"],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : WaniKaniSpacedRepetitionSystemsDataData.fromJson(json["data"]),
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

class WaniKaniSpacedRepetitionSystemsDataData {
  WaniKaniSpacedRepetitionSystemsDataData({
    this.createdAt,
    this.name,
    this.description,
    this.unlockingStagePosition,
    this.startingStagePosition,
    this.passingStagePosition,
    this.burningStagePosition,
    this.stages,
  });

  DateTime createdAt;
  String name;
  String description;
  int unlockingStagePosition;
  int startingStagePosition;
  int passingStagePosition;
  int burningStagePosition;
  List<WaniKaniSpacedRepetitionSystemsDataDataStage> stages;

  factory WaniKaniSpacedRepetitionSystemsDataData.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniSpacedRepetitionSystemsDataData(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        unlockingStagePosition: json["unlocking_stage_position"] == null
            ? null
            : json["unlocking_stage_position"],
        startingStagePosition: json["starting_stage_position"] == null
            ? null
            : json["starting_stage_position"],
        passingStagePosition: json["passing_stage_position"] == null
            ? null
            : json["passing_stage_position"],
        burningStagePosition: json["burning_stage_position"] == null
            ? null
            : json["burning_stage_position"],
        stages: json["stages"] == null
            ? null
            : List<WaniKaniSpacedRepetitionSystemsDataDataStage>.from(
                json["stages"].map((x) =>
                    WaniKaniSpacedRepetitionSystemsDataDataStage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "unlocking_stage_position":
            unlockingStagePosition == null ? null : unlockingStagePosition,
        "starting_stage_position":
            startingStagePosition == null ? null : startingStagePosition,
        "passing_stage_position":
            passingStagePosition == null ? null : passingStagePosition,
        "burning_stage_position":
            burningStagePosition == null ? null : burningStagePosition,
        "stages": stages == null
            ? null
            : List<dynamic>.from(stages.map((x) => x.toJson())),
      };
}

class WaniKaniSpacedRepetitionSystemsDataDataStage {
  WaniKaniSpacedRepetitionSystemsDataDataStage({
    this.interval,
    this.position,
    this.intervalUnit,
  });

  int interval;
  int position;
  WaniKaniSpacedRepetitionSystemsDataDataStageIntervalUnit intervalUnit;

  factory WaniKaniSpacedRepetitionSystemsDataDataStage.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniSpacedRepetitionSystemsDataDataStage(
        interval: json["interval"] == null ? null : json["interval"],
        position: json["position"] == null ? null : json["position"],
        intervalUnit: json["interval_unit"] == null
            ? null
            : waniKaniSpacedRepetitionSystemsDataDataStageIntervalUnitValues
                .map[json["interval_unit"]],
      );

  Map<String, dynamic> toJson() => {
        "interval": interval == null ? null : interval,
        "position": position == null ? null : position,
        "interval_unit": intervalUnit == null
            ? null
            : waniKaniSpacedRepetitionSystemsDataDataStageIntervalUnitValues
                .reverse[intervalUnit],
      };
}

enum WaniKaniSpacedRepetitionSystemsDataDataStageIntervalUnit { SECONDS }

final waniKaniSpacedRepetitionSystemsDataDataStageIntervalUnitValues =
    WaniKaniEnumValues({
  "seconds": WaniKaniSpacedRepetitionSystemsDataDataStageIntervalUnit.SECONDS
});
