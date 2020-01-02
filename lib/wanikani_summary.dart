class WaniKaniSummary {
  String object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniSummaryData data;

  WaniKaniSummary({
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniSummary.fromJson(Map<String, dynamic> json) =>
      WaniKaniSummary(
        object: json["object"],
        url: json["url"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: WaniKaniSummaryData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "url": url,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": data.toJson(),
      };
}

class WaniKaniSummaryData {
  List<WaniKaniSummaryDataLesson> lessons;
  DateTime nextReviewsAt;
  List<WaniKaniSummaryDataLesson> reviews;

  WaniKaniSummaryData({
    this.lessons,
    this.nextReviewsAt,
    this.reviews,
  });

  factory WaniKaniSummaryData.fromJson(Map<String, dynamic> json) =>
      WaniKaniSummaryData(
        lessons: List<WaniKaniSummaryDataLesson>.from(
            json["lessons"].map((x) => WaniKaniSummaryDataLesson.fromJson(x))),
        nextReviewsAt: DateTime.parse(json["next_reviews_at"]),
        reviews: List<WaniKaniSummaryDataLesson>.from(
            json["reviews"].map((x) => WaniKaniSummaryDataLesson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lessons": List<dynamic>.from(lessons.map((x) => x.toJson())),
        "next_reviews_at": nextReviewsAt.toIso8601String(),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class WaniKaniSummaryDataLesson {
  DateTime availableAt;
  List<int> subjectIds;

  WaniKaniSummaryDataLesson({
    this.availableAt,
    this.subjectIds,
  });

  factory WaniKaniSummaryDataLesson.fromJson(Map<String, dynamic> json) =>
      WaniKaniSummaryDataLesson(
        availableAt: DateTime.parse(json["available_at"]),
        subjectIds: List<int>.from(json["subject_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "available_at": availableAt.toIso8601String(),
        "subject_ids": List<dynamic>.from(subjectIds.map((x) => x)),
      };
}
