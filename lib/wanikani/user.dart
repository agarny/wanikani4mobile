class WaniKaniUser {
  String object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniUserData data;

  WaniKaniUser({
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniUser.fromJson(Map<String, dynamic> json) => WaniKaniUser(
        object: json["object"] == null ? null : json["object"],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : WaniKaniUserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "object": object == null ? null : object,
        "url": url == null ? null : url,
        "data_updated_at":
            dataUpdatedAt == null ? null : dataUpdatedAt.toIso8601String(),
        "data": data == null ? null : data.toJson(),
      };
}

class WaniKaniUserData {
  String id;
  String username;
  int level;
  String profileUrl;
  DateTime startedAt;
  WaniKaniUserDataSubscription subscription;
  DateTime currentVacationStartedAt;
  WaniKaniUserDataPreferences preferences;

  WaniKaniUserData({
    this.id,
    this.username,
    this.level,
    this.profileUrl,
    this.startedAt,
    this.subscription,
    this.currentVacationStartedAt,
    this.preferences,
  });

  factory WaniKaniUserData.fromJson(Map<String, dynamic> json) =>
      WaniKaniUserData(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        level: json["level"] == null ? null : json["level"],
        profileUrl: json["profile_url"] == null ? null : json["profile_url"],
        startedAt: json["started_at"] == null
            ? null
            : DateTime.parse(json["started_at"]),
        subscription: json["subscription"] == null
            ? null
            : WaniKaniUserDataSubscription.fromJson(json["subscription"]),
        currentVacationStartedAt: json["current_vacation_started_at"] == null
            ? null
            : DateTime.parse(json["current_vacation_started_at"]),
        preferences: json["preferences"] == null
            ? null
            : WaniKaniUserDataPreferences.fromJson(json["preferences"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "username": username == null ? null : username,
        "level": level == null ? null : level,
        "profile_url": profileUrl == null ? null : profileUrl,
        "started_at": startedAt == null ? null : startedAt.toIso8601String(),
        "subscription": subscription == null ? null : subscription.toJson(),
        "current_vacation_started_at": currentVacationStartedAt == null
            ? null
            : currentVacationStartedAt.toIso8601String(),
        "preferences": preferences == null ? null : preferences.toJson(),
      };
}

class WaniKaniUserDataPreferences {
  int lessonsBatchSize;
  bool lessonsAutoplayAudio;
  bool reviewsAutoplayAudio;
  String lessonsPresentationOrder;
  bool reviewsDisplaySrsIndicator;

  WaniKaniUserDataPreferences({
    this.lessonsBatchSize,
    this.lessonsAutoplayAudio,
    this.reviewsAutoplayAudio,
    this.lessonsPresentationOrder,
    this.reviewsDisplaySrsIndicator,
  });

  factory WaniKaniUserDataPreferences.fromJson(Map<String, dynamic> json) =>
      WaniKaniUserDataPreferences(
        lessonsBatchSize: json["lessons_batch_size"] == null
            ? null
            : json["lessons_batch_size"],
        lessonsAutoplayAudio: json["lessons_autoplay_audio"] == null
            ? null
            : json["lessons_autoplay_audio"],
        reviewsAutoplayAudio: json["reviews_autoplay_audio"] == null
            ? null
            : json["reviews_autoplay_audio"],
        lessonsPresentationOrder: json["lessons_presentation_order"] == null
            ? null
            : json["lessons_presentation_order"],
        reviewsDisplaySrsIndicator:
            json["reviews_display_srs_indicator"] == null
                ? null
                : json["reviews_display_srs_indicator"],
      );

  Map<String, dynamic> toJson() => {
        "lessons_batch_size":
            lessonsBatchSize == null ? null : lessonsBatchSize,
        "lessons_autoplay_audio":
            lessonsAutoplayAudio == null ? null : lessonsAutoplayAudio,
        "reviews_autoplay_audio":
            reviewsAutoplayAudio == null ? null : reviewsAutoplayAudio,
        "lessons_presentation_order":
            lessonsPresentationOrder == null ? null : lessonsPresentationOrder,
        "reviews_display_srs_indicator": reviewsDisplaySrsIndicator == null
            ? null
            : reviewsDisplaySrsIndicator,
      };
}

class WaniKaniUserDataSubscription {
  bool active;
  String type;
  int maxLevelGranted;
  DateTime periodEndsAt;

  WaniKaniUserDataSubscription({
    this.active,
    this.type,
    this.maxLevelGranted,
    this.periodEndsAt,
  });

  factory WaniKaniUserDataSubscription.fromJson(Map<String, dynamic> json) =>
      WaniKaniUserDataSubscription(
        active: json["active"] == null ? null : json["active"],
        type: json["type"] == null ? null : json["type"],
        maxLevelGranted: json["max_level_granted"] == null
            ? null
            : json["max_level_granted"],
        periodEndsAt: json["period_ends_at"] == null
            ? null
            : DateTime.parse(json["period_ends_at"]),
      );

  Map<String, dynamic> toJson() => {
        "active": active == null ? null : active,
        "type": type == null ? null : type,
        "max_level_granted": maxLevelGranted == null ? null : maxLevelGranted,
        "period_ends_at":
            periodEndsAt == null ? null : periodEndsAt.toIso8601String(),
      };
}
