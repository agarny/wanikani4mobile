class WaniKaniAssignments {
  String object;
  String url;
  WaniKaniAssignmentsPages pages;
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
        object: json["object"],
        url: json["url"],
        pages: WaniKaniAssignmentsPages.fromJson(json["pages"]),
        totalCount: json["total_count"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: List<WaniKaniAssignmentsData>.from(
            json["data"].map((x) => WaniKaniAssignmentsData.fromJson(x))),
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
        id: json["id"],
        object: objectValues.map[json["object"]],
        url: json["url"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: WaniKaniAssignmentsDataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": objectValues.reverse[object],
        "url": url,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": data.toJson(),
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
        createdAt: DateTime.parse(json["created_at"]),
        subjectId: json["subject_id"],
        subjectType: subjectTypeValues.map[json["subject_type"]],
        srsStage: json["srs_stage"],
        srsStageName: srsStageNameValues.map[json["srs_stage_name"]],
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
        passed: json["passed"],
        hidden: json["hidden"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "subject_id": subjectId,
        "subject_type": subjectTypeValues.reverse[subjectType],
        "srs_stage": srsStage,
        "srs_stage_name": srsStageNameValues.reverse[srsStageName],
        "unlocked_at": unlockedAt == null ? null : unlockedAt.toIso8601String(),
        "started_at": startedAt == null ? null : startedAt.toIso8601String(),
        "passed_at": passedAt == null ? null : passedAt.toIso8601String(),
        "burned_at": burnedAt == null ? null : burnedAt.toIso8601String(),
        "available_at":
            availableAt == null ? null : availableAt.toIso8601String(),
        "resurrected_at": resurrectedAt,
        "passed": passed,
        "hidden": hidden,
      };
}

enum SrsStageName {
  MASTER,
  ENLIGHTENED,
  INITIATE,
  APPRENTICE_IV,
  GURU_II,
  GURU_I,
  BURNED
}

final srsStageNameValues = EnumValues({
  "Apprentice IV": SrsStageName.APPRENTICE_IV,
  "Burned": SrsStageName.BURNED,
  "Enlightened": SrsStageName.ENLIGHTENED,
  "Guru I": SrsStageName.GURU_I,
  "Guru II": SrsStageName.GURU_II,
  "Initiate": SrsStageName.INITIATE,
  "Master": SrsStageName.MASTER
});

enum SubjectType { VOCABULARY, KANJI, RADICAL }

final subjectTypeValues = EnumValues({
  "kanji": SubjectType.KANJI,
  "radical": SubjectType.RADICAL,
  "vocabulary": SubjectType.VOCABULARY
});

enum Object { ASSIGNMENT }

final objectValues = EnumValues({"assignment": Object.ASSIGNMENT});

class WaniKaniAssignmentsPages {
  int perPage;
  String nextUrl;
  dynamic previousUrl;

  WaniKaniAssignmentsPages({
    this.perPage,
    this.nextUrl,
    this.previousUrl,
  });

  factory WaniKaniAssignmentsPages.fromJson(Map<String, dynamic> json) =>
      WaniKaniAssignmentsPages(
        perPage: json["per_page"],
        nextUrl: json["next_url"],
        previousUrl: json["previous_url"],
      );

  Map<String, dynamic> toJson() => {
        "per_page": perPage,
        "next_url": nextUrl,
        "previous_url": previousUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
