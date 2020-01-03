import 'package:wanikani4mobile/wanikani/api.dart';

class WaniKaniReviewStatistics {
  String object;
  String url;
  WaniKaniPages pages;
  int totalCount;
  DateTime dataUpdatedAt;
  List<WaniKaniReviewStatisticsData> data;

  WaniKaniReviewStatistics({
    this.object,
    this.url,
    this.pages,
    this.totalCount,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniReviewStatistics.fromJson(Map<String, dynamic> json) =>
      WaniKaniReviewStatistics(
        object: json["object"],
        url: json["url"],
        pages: WaniKaniPages.fromJson(json["pages"]),
        totalCount: json["total_count"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: List<WaniKaniReviewStatisticsData>.from(
            json["data"].map((x) => WaniKaniReviewStatisticsData.fromJson(x))),
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

class WaniKaniReviewStatisticsData {
  int id;
  Object object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniReviewStatisticsDataData data;

  WaniKaniReviewStatisticsData({
    this.id,
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniReviewStatisticsData.fromJson(Map<String, dynamic> json) =>
      WaniKaniReviewStatisticsData(
        id: json["id"],
        object: objectValues.map[json["object"]],
        url: json["url"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: WaniKaniReviewStatisticsDataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": objectValues.reverse[object],
        "url": url,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": data.toJson(),
      };
}

class WaniKaniReviewStatisticsDataData {
  DateTime createdAt;
  int assignmentId;
  int subjectId;
  int startingSrsStage;
  IngSrsStageName startingSrsStageName;
  int endingSrsStage;
  IngSrsStageName endingSrsStageName;
  int incorrectMeaningAnswers;
  int incorrectReadingAnswers;

  WaniKaniReviewStatisticsDataData({
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

  factory WaniKaniReviewStatisticsDataData.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniReviewStatisticsDataData(
        createdAt: DateTime.parse(json["created_at"]),
        assignmentId: json["assignment_id"],
        subjectId: json["subject_id"],
        startingSrsStage: json["starting_srs_stage"],
        startingSrsStageName:
            ingSrsStageNameValues.map[json["starting_srs_stage_name"]],
        endingSrsStage: json["ending_srs_stage"],
        endingSrsStageName:
            ingSrsStageNameValues.map[json["ending_srs_stage_name"]],
        incorrectMeaningAnswers: json["incorrect_meaning_answers"],
        incorrectReadingAnswers: json["incorrect_reading_answers"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "assignment_id": assignmentId,
        "subject_id": subjectId,
        "starting_srs_stage": startingSrsStage,
        "starting_srs_stage_name":
            ingSrsStageNameValues.reverse[startingSrsStageName],
        "ending_srs_stage": endingSrsStage,
        "ending_srs_stage_name":
            ingSrsStageNameValues.reverse[endingSrsStageName],
        "incorrect_meaning_answers": incorrectMeaningAnswers,
        "incorrect_reading_answers": incorrectReadingAnswers,
      };
}

enum IngSrsStageName {
  ENLIGHTENED,
  APPRENTICE_II,
  APPRENTICE_IV,
  MASTER,
  GURU_II,
  GURU_I,
  APPRENTICE_III,
  APPRENTICE_I,
  BURNED
}

final ingSrsStageNameValues = WaniKaniEnumValues({
  "Apprentice I": IngSrsStageName.APPRENTICE_I,
  "Apprentice II": IngSrsStageName.APPRENTICE_II,
  "Apprentice III": IngSrsStageName.APPRENTICE_III,
  "Apprentice IV": IngSrsStageName.APPRENTICE_IV,
  "Burned": IngSrsStageName.BURNED,
  "Enlightened": IngSrsStageName.ENLIGHTENED,
  "Guru I": IngSrsStageName.GURU_I,
  "Guru II": IngSrsStageName.GURU_II,
  "Master": IngSrsStageName.MASTER
});

enum Object { REVIEW }

final objectValues = WaniKaniEnumValues({"review": Object.REVIEW});
