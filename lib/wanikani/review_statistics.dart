import 'package:wanikani4mobile/wanikani/common.dart';

class WaniKaniReviewStatistics {
  WaniKaniReviewStatistics({
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
  List<WaniKaniReviewStatisticsData> data;

  factory WaniKaniReviewStatistics.fromJson(Map<String, dynamic> json) =>
      WaniKaniReviewStatistics(
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
            : List<WaniKaniReviewStatisticsData>.from(json["data"]
                .map((x) => WaniKaniReviewStatisticsData.fromJson(x))),
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

class WaniKaniReviewStatisticsData {
  WaniKaniReviewStatisticsData({
    this.id,
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  int id;
  WaniKaniReviewStatisticsDataObject object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniReviewStatisticsDataData data;

  factory WaniKaniReviewStatisticsData.fromJson(Map<String, dynamic> json) =>
      WaniKaniReviewStatisticsData(
        id: json["id"] == null ? null : json["id"],
        object: json["object"] == null
            ? null
            : waniKaniReviewStatisticsDataObjectValues.map[json["object"]],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : WaniKaniReviewStatisticsDataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "object": object == null
            ? null
            : waniKaniReviewStatisticsDataObjectValues.reverse[object],
        "url": url == null ? null : url,
        "data_updated_at":
            dataUpdatedAt == null ? null : dataUpdatedAt.toIso8601String(),
        "data": data == null ? null : data.toJson(),
      };
}

class WaniKaniReviewStatisticsDataData {
  WaniKaniReviewStatisticsDataData({
    this.createdAt,
    this.subjectId,
    this.subjectType,
    this.meaningCorrect,
    this.meaningIncorrect,
    this.meaningMaxStreak,
    this.meaningCurrentStreak,
    this.readingCorrect,
    this.readingIncorrect,
    this.readingMaxStreak,
    this.readingCurrentStreak,
    this.percentageCorrect,
    this.hidden,
  });

  DateTime createdAt;
  int subjectId;
  WaniKaniSubjectType subjectType;
  int meaningCorrect;
  int meaningIncorrect;
  int meaningMaxStreak;
  int meaningCurrentStreak;
  int readingCorrect;
  int readingIncorrect;
  int readingMaxStreak;
  int readingCurrentStreak;
  int percentageCorrect;
  bool hidden;

  factory WaniKaniReviewStatisticsDataData.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniReviewStatisticsDataData(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        subjectType: json["subject_type"] == null
            ? null
            : waniKaniSubjectTypeValues.map[json["subject_type"]],
        meaningCorrect:
            json["meaning_correct"] == null ? null : json["meaning_correct"],
        meaningIncorrect: json["meaning_incorrect"] == null
            ? null
            : json["meaning_incorrect"],
        meaningMaxStreak: json["meaning_max_streak"] == null
            ? null
            : json["meaning_max_streak"],
        meaningCurrentStreak: json["meaning_current_streak"] == null
            ? null
            : json["meaning_current_streak"],
        readingCorrect:
            json["reading_correct"] == null ? null : json["reading_correct"],
        readingIncorrect: json["reading_incorrect"] == null
            ? null
            : json["reading_incorrect"],
        readingMaxStreak: json["reading_max_streak"] == null
            ? null
            : json["reading_max_streak"],
        readingCurrentStreak: json["reading_current_streak"] == null
            ? null
            : json["reading_current_streak"],
        percentageCorrect: json["percentage_correct"] == null
            ? null
            : json["percentage_correct"],
        hidden: json["hidden"] == null ? null : json["hidden"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "subject_id": subjectId == null ? null : subjectId,
        "subject_type": subjectType == null
            ? null
            : waniKaniSubjectTypeValues.reverse[subjectType],
        "meaning_correct": meaningCorrect == null ? null : meaningCorrect,
        "meaning_incorrect": meaningIncorrect == null ? null : meaningIncorrect,
        "meaning_max_streak":
            meaningMaxStreak == null ? null : meaningMaxStreak,
        "meaning_current_streak":
            meaningCurrentStreak == null ? null : meaningCurrentStreak,
        "reading_correct": readingCorrect == null ? null : readingCorrect,
        "reading_incorrect": readingIncorrect == null ? null : readingIncorrect,
        "reading_max_streak":
            readingMaxStreak == null ? null : readingMaxStreak,
        "reading_current_streak":
            readingCurrentStreak == null ? null : readingCurrentStreak,
        "percentage_correct":
            percentageCorrect == null ? null : percentageCorrect,
        "hidden": hidden == null ? null : hidden,
      };
}

enum WaniKaniReviewStatisticsDataObject { REVIEW_STATISTIC }

final waniKaniReviewStatisticsDataObjectValues = WaniKaniEnumValues(
    {"review_statistic": WaniKaniReviewStatisticsDataObject.REVIEW_STATISTIC});
