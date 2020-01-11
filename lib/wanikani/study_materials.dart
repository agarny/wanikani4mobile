import 'package:wanikani4mobile/wanikani/common.dart';

class WaniKaniStudyMaterials {
  String object;
  String url;
  WaniKaniPages pages;
  int totalCount;
  dynamic dataUpdatedAt;
  List<dynamic> data;

  WaniKaniStudyMaterials({
    this.object,
    this.url,
    this.pages,
    this.totalCount,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniStudyMaterials.fromJson(Map<String, dynamic> json) =>
      WaniKaniStudyMaterials(
        object: json["object"] == null ? null : json["object"],
        url: json["url"] == null ? null : json["url"],
        pages: json["pages"] == null
            ? null
            : WaniKaniPages.fromJson(json["pages"]),
        totalCount: json["total_count"] == null ? null : json["total_count"],
        dataUpdatedAt: json["data_updated_at"],
        data: json["data"] == null
            ? null
            : List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "object": object == null ? null : object,
        "url": url == null ? null : url,
        "pages": pages == null ? null : pages.toJson(),
        "total_count": totalCount == null ? null : totalCount,
        "data_updated_at": dataUpdatedAt,
        "data": data == null ? null : List<dynamic>.from(data.map((x) => x)),
      };
}
