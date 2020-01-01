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
        object: json["object"],
        url: json["url"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: WaniKaniUserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "url": url,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": data.toJson(),
      };
}

class WaniKaniUserData {
  String id;
  String username;
  int level;
  String profileUrl;
  DateTime startedAt;
  WaniKaniUserDataSubscription subscription;
  bool subscribed;
  int maxLevelGrantedBySubscription;
  dynamic currentVacationStartedAt;
  WaniKaniUserDataPreferences preferences;

  WaniKaniUserData({
    this.id,
    this.username,
    this.level,
    this.profileUrl,
    this.startedAt,
    this.subscription,
    this.subscribed,
    this.maxLevelGrantedBySubscription,
    this.currentVacationStartedAt,
    this.preferences,
  });

  factory WaniKaniUserData.fromJson(Map<String, dynamic> json) =>
      WaniKaniUserData(
        id: json["id"],
        username: json["username"],
        level: json["level"],
        profileUrl: json["profile_url"],
        startedAt: DateTime.parse(json["started_at"]),
        subscription:
            WaniKaniUserDataSubscription.fromJson(json["subscription"]),
        subscribed: json["subscribed"],
        maxLevelGrantedBySubscription:
            json["max_level_granted_by_subscription"],
        currentVacationStartedAt: json["current_vacation_started_at"],
        preferences: WaniKaniUserDataPreferences.fromJson(json["preferences"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "level": level,
        "profile_url": profileUrl,
        "started_at": startedAt.toIso8601String(),
        "subscription": subscription.toJson(),
        "subscribed": subscribed,
        "max_level_granted_by_subscription": maxLevelGrantedBySubscription,
        "current_vacation_started_at": currentVacationStartedAt,
        "preferences": preferences.toJson(),
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
        lessonsBatchSize: json["lessons_batch_size"],
        lessonsAutoplayAudio: json["lessons_autoplay_audio"],
        reviewsAutoplayAudio: json["reviews_autoplay_audio"],
        lessonsPresentationOrder: json["lessons_presentation_order"],
        reviewsDisplaySrsIndicator: json["reviews_display_srs_indicator"],
      );

  Map<String, dynamic> toJson() => {
        "lessons_batch_size": lessonsBatchSize,
        "lessons_autoplay_audio": lessonsAutoplayAudio,
        "reviews_autoplay_audio": reviewsAutoplayAudio,
        "lessons_presentation_order": lessonsPresentationOrder,
        "reviews_display_srs_indicator": reviewsDisplaySrsIndicator,
      };
}

class WaniKaniUserDataSubscription {
  bool active;
  String type;
  int maxLevelGranted;
  dynamic periodEndsAt;

  WaniKaniUserDataSubscription({
    this.active,
    this.type,
    this.maxLevelGranted,
    this.periodEndsAt,
  });

  factory WaniKaniUserDataSubscription.fromJson(Map<String, dynamic> json) =>
      WaniKaniUserDataSubscription(
        active: json["active"],
        type: json["type"],
        maxLevelGranted: json["max_level_granted"],
        periodEndsAt: json["period_ends_at"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "type": type,
        "max_level_granted": maxLevelGranted,
        "period_ends_at": periodEndsAt,
      };
}
