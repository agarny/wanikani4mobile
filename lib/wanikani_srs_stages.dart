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
        object: json["object"],
        url: json["url"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: List<WaniKaniSrsStagesData>.from(
            json["data"].map((x) => WaniKaniSrsStagesData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "url": url,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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
        srsStage: json["srs_stage"],
        srsStageName: json["srs_stage_name"],
        interval: json["interval"],
        acceleratedInterval: json["accelerated_interval"],
      );

  Map<String, dynamic> toJson() => {
        "srs_stage": srsStage,
        "srs_stage_name": srsStageName,
        "interval": interval,
        "accelerated_interval": acceleratedInterval,
      };
}
