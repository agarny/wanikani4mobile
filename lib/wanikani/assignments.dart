import 'package:wanikani4mobile/wanikani/common.dart';

class WaniKaniAssignments {
  String object;
  String url;
  WaniKaniPages pages;
  int totalCount;
  DateTime dataUpdatedAt;
  List<WaniKaniAssignmentsData> data;

  WaniKaniAssignments({
    this.object,
    this.url,
    this.pages,
    this.totalCount,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniAssignments.fromJson(Map<String, dynamic> json) =>
      WaniKaniAssignments(
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
            : List<WaniKaniAssignmentsData>.from(
                json["data"].map((x) => WaniKaniAssignmentsData.fromJson(x))),
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

class WaniKaniAssignmentsData {
  int id;
  Object object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniAssignmentsDataData data;

  WaniKaniAssignmentsData({
    this.id,
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniAssignmentsData.fromJson(Map<String, dynamic> json) =>
      WaniKaniAssignmentsData(
        id: json["id"] == null ? null : json["id"],
        object:
            json["object"] == null ? null : objectValues.map[json["object"]],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : WaniKaniAssignmentsDataData.fromJson(json["data"]),
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

class WaniKaniAssignmentsDataData {
  DateTime createdAt;
  int subjectId;
  SubjectType subjectType;
  int srsStage;
  SrsStageName srsStageName;
  DateTime unlockedAt;
  DateTime startedAt;
  DateTime passedAt;
  DateTime burnedAt;
  DateTime availableAt;
  dynamic resurrectedAt;
  bool passed;
  bool hidden;

  WaniKaniAssignmentsDataData({
    this.createdAt,
    this.subjectId,
    this.subjectType,
    this.srsStage,
    this.srsStageName,
    this.unlockedAt,
    this.startedAt,
    this.passedAt,
    this.burnedAt,
    this.availableAt,
    this.resurrectedAt,
    this.passed,
    this.hidden,
  });

  factory WaniKaniAssignmentsDataData.fromJson(Map<String, dynamic> json) =>
      WaniKaniAssignmentsDataData(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        subjectType: json["subject_type"] == null
            ? null
            : subjectTypeValues.map[json["subject_type"]],
        srsStage: json["srs_stage"] == null ? null : json["srs_stage"],
        srsStageName: json["srs_stage_name"] == null
            ? null
            : srsStageNameValues.map[json["srs_stage_name"]],
        unlockedAt: json["unlocked_at"] == null
            ? null
            : DateTime.parse(json["unlocked_at"]),
        startedAt: json["started_at"] == null
            ? null
            : DateTime.parse(json["started_at"]),
        passedAt: json["passed_at"] == null
            ? null
            : DateTime.parse(json["passed_at"]),
        burnedAt: json["burned_at"] == null
            ? null
            : DateTime.parse(json["burned_at"]),
        availableAt: json["available_at"] == null
            ? null
            : DateTime.parse(json["available_at"]),
        resurrectedAt: json["resurrected_at"],
        passed: json["passed"] == null ? null : json["passed"],
        hidden: json["hidden"] == null ? null : json["hidden"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "subject_id": subjectId == null ? null : subjectId,
        "subject_type":
            subjectType == null ? null : subjectTypeValues.reverse[subjectType],
        "srs_stage": srsStage == null ? null : srsStage,
        "srs_stage_name": srsStageName == null
            ? null
            : srsStageNameValues.reverse[srsStageName],
        "unlocked_at": unlockedAt == null ? null : unlockedAt.toIso8601String(),
        "started_at": startedAt == null ? null : startedAt.toIso8601String(),
        "passed_at": passedAt == null ? null : passedAt.toIso8601String(),
        "burned_at": burnedAt == null ? null : burnedAt.toIso8601String(),
        "available_at":
            availableAt == null ? null : availableAt.toIso8601String(),
        "resurrected_at": resurrectedAt,
        "passed": passed == null ? null : passed,
        "hidden": hidden == null ? null : hidden,
      };
}

enum SrsStageName {
  INITIATE,
  APPRENTICE_I,
  APPRENTICE_II,
  APPRENTICE_III,
  APPRENTICE_IV,
  GURU_I,
  GURU_II,
  MASTER,
  ENLIGHTENED,
  BURNED,
}

final srsStageNameValues = WaniKaniEnumValues({
  "Initiate": SrsStageName.INITIATE,
  "Apprentice I": SrsStageName.APPRENTICE_I,
  "Apprentice II": SrsStageName.APPRENTICE_II,
  "Apprentice III": SrsStageName.APPRENTICE_III,
  "Apprentice IV": SrsStageName.APPRENTICE_IV,
  "Guru I": SrsStageName.GURU_I,
  "Guru II": SrsStageName.GURU_II,
  "Master": SrsStageName.MASTER,
  "Enlightened": SrsStageName.ENLIGHTENED,
  "Burned": SrsStageName.BURNED,
});

enum SubjectType { VOCABULARY, KANJI, RADICAL }

final subjectTypeValues = WaniKaniEnumValues({
  "kanji": SubjectType.KANJI,
  "radical": SubjectType.RADICAL,
  "vocabulary": SubjectType.VOCABULARY
});

enum Object { ASSIGNMENT }

final objectValues = WaniKaniEnumValues({"assignment": Object.ASSIGNMENT});
