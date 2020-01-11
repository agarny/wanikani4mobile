import 'package:wanikani4mobile/wanikani/common.dart';

class WaniKaniReviews {
  String object;
  String url;
  WaniKaniPages pages;
  int totalCount;
  DateTime dataUpdatedAt;
  List<WaniKaniReviewsData> data;

  WaniKaniReviews({
    this.object,
    this.url,
    this.pages,
    this.totalCount,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniReviews.fromJson(Map<String, dynamic> json) =>
      WaniKaniReviews(
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
            : List<WaniKaniReviewsData>.from(
                json["data"].map((x) => WaniKaniReviewsData.fromJson(x))),
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

class WaniKaniReviewsData {
  int id;
  Object object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniReviewsDataData data;

  WaniKaniReviewsData({
    this.id,
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniReviewsData.fromJson(Map<String, dynamic> json) =>
      WaniKaniReviewsData(
        id: json["id"] == null ? null : json["id"],
        object:
            json["object"] == null ? null : objectValues.map[json["object"]],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : WaniKaniReviewsDataData.fromJson(json["data"]),
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

class WaniKaniReviewsDataData {
  DateTime createdAt;
  int assignmentId;
  int subjectId;
  int startingSrsStage;
  WaniKaniSrsStageName startingSrsStageName;
  int endingSrsStage;
  WaniKaniSrsStageName endingSrsStageName;
  int incorrectMeaningAnswers;
  int incorrectReadingAnswers;

  WaniKaniReviewsDataData({
    this.createdAt,
    this.assignmentId,
    this.subjectId,
    this.startingSrsStage,
    this.startingSrsStageName,
    this.endingSrsStage,
    this.endingSrsStageName,
    this.incorrectMeaningAnswers,
    this.incorrectReadingAnswers,
  });

  factory WaniKaniReviewsDataData.fromJson(Map<String, dynamic> json) =>
      WaniKaniReviewsDataData(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        assignmentId:
            json["assignment_id"] == null ? null : json["assignment_id"],
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        startingSrsStage: json["starting_srs_stage"] == null
            ? null
            : json["starting_srs_stage"],
        startingSrsStageName: json["starting_srs_stage_name"] == null
            ? null
            : waniKaniSrsStageNameValues.map[json["starting_srs_stage_name"]],
        endingSrsStage:
            json["ending_srs_stage"] == null ? null : json["ending_srs_stage"],
        endingSrsStageName: json["ending_srs_stage_name"] == null
            ? null
            : waniKaniSrsStageNameValues.map[json["ending_srs_stage_name"]],
        incorrectMeaningAnswers: json["incorrect_meaning_answers"] == null
            ? null
            : json["incorrect_meaning_answers"],
        incorrectReadingAnswers: json["incorrect_reading_answers"] == null
            ? null
            : json["incorrect_reading_answers"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "assignment_id": assignmentId == null ? null : assignmentId,
        "subject_id": subjectId == null ? null : subjectId,
        "starting_srs_stage":
            startingSrsStage == null ? null : startingSrsStage,
        "starting_srs_stage_name": startingSrsStageName == null
            ? null
            : waniKaniSrsStageNameValues.reverse[startingSrsStageName],
        "ending_srs_stage": endingSrsStage == null ? null : endingSrsStage,
        "ending_srs_stage_name": endingSrsStageName == null
            ? null
            : waniKaniSrsStageNameValues.reverse[endingSrsStageName],
        "incorrect_meaning_answers":
            incorrectMeaningAnswers == null ? null : incorrectMeaningAnswers,
        "incorrect_reading_answers":
            incorrectReadingAnswers == null ? null : incorrectReadingAnswers,
      };
}

enum Object { REVIEW }

final objectValues = WaniKaniEnumValues({"review": Object.REVIEW});
