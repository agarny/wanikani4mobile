class WaniKaniSummary {
  WaniKaniSummary({
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  String object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniSummaryData data;

  factory WaniKaniSummary.fromJson(Map<String, dynamic> json) =>
      WaniKaniSummary(
        object: json["object"] == null ? null : json["object"],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : WaniKaniSummaryData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "object": object == null ? null : object,
        "url": url == null ? null : url,
        "data_updated_at":
            dataUpdatedAt == null ? null : dataUpdatedAt.toIso8601String(),
        "data": data == null ? null : data.toJson(),
      };
}

class WaniKaniSummaryData {
  WaniKaniSummaryData({
    this.lessons,
    this.nextReviewsAt,
    this.reviews,
  });

  List<WaniKaniSummaryDataLesson> lessons;
  DateTime nextReviewsAt;
  List<WaniKaniSummaryDataLesson> reviews;

  factory WaniKaniSummaryData.fromJson(Map<String, dynamic> json) =>
      WaniKaniSummaryData(
        lessons: json["lessons"] == null
            ? null
            : List<WaniKaniSummaryDataLesson>.from(json["lessons"]
                .map((x) => WaniKaniSummaryDataLesson.fromJson(x))),
        nextReviewsAt: json["next_reviews_at"] == null
            ? null
            : DateTime.parse(json["next_reviews_at"]),
        reviews: json["reviews"] == null
            ? null
            : List<WaniKaniSummaryDataLesson>.from(json["reviews"]
                .map((x) => WaniKaniSummaryDataLesson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lessons": lessons == null
            ? null
            : List<dynamic>.from(lessons.map((x) => x.toJson())),
        "next_reviews_at":
            nextReviewsAt == null ? null : nextReviewsAt.toIso8601String(),
        "reviews": reviews == null
            ? null
            : List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class WaniKaniSummaryDataLesson {
  WaniKaniSummaryDataLesson({
    this.availableAt,
    this.subjectIds,
  });

  DateTime availableAt;
  List<int> subjectIds;

  factory WaniKaniSummaryDataLesson.fromJson(Map<String, dynamic> json) =>
      WaniKaniSummaryDataLesson(
        availableAt: json["available_at"] == null
            ? null
            : DateTime.parse(json["available_at"]),
        subjectIds: json["subject_ids"] == null
            ? null
            : List<int>.from(json["subject_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "available_at":
            availableAt == null ? null : availableAt.toIso8601String(),
        "subject_ids": subjectIds == null
            ? null
            : List<dynamic>.from(subjectIds.map((x) => x)),
      };
}
