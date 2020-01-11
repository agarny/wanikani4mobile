class WaniKaniSrsStages {
  String object;
  String url;
  DateTime dataUpdatedAt;
  List<WaniKaniSrsStagesData> data;

  WaniKaniSrsStages({
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniSrsStages.fromJson(Map<String, dynamic> json) =>
      WaniKaniSrsStages(
        object: json["object"] == null ? null : json["object"],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : List<WaniKaniSrsStagesData>.from(
                json["data"].map((x) => WaniKaniSrsStagesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "object": object == null ? null : object,
        "url": url == null ? null : url,
        "data_updated_at":
            dataUpdatedAt == null ? null : dataUpdatedAt.toIso8601String(),
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WaniKaniSrsStagesData {
  int srsStage;
  String srsStageName;
  int interval;
  int acceleratedInterval;

  WaniKaniSrsStagesData({
    this.srsStage,
    this.srsStageName,
    this.interval,
    this.acceleratedInterval,
  });

  factory WaniKaniSrsStagesData.fromJson(Map<String, dynamic> json) =>
      WaniKaniSrsStagesData(
        srsStage: json["srs_stage"] == null ? null : json["srs_stage"],
        srsStageName:
            json["srs_stage_name"] == null ? null : json["srs_stage_name"],
        interval: json["interval"] == null ? null : json["interval"],
        acceleratedInterval: json["accelerated_interval"] == null
            ? null
            : json["accelerated_interval"],
      );

  Map<String, dynamic> toJson() => {
        "srs_stage": srsStage == null ? null : srsStage,
        "srs_stage_name": srsStageName == null ? null : srsStageName,
        "interval": interval == null ? null : interval,
        "accelerated_interval":
            acceleratedInterval == null ? null : acceleratedInterval,
      };
}
