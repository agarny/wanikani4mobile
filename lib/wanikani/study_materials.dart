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
        object: json["object"],
        url: json["url"],
        pages: WaniKaniPages.fromJson(json["pages"]),
        totalCount: json["total_count"],
        dataUpdatedAt: json["data_updated_at"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "url": url,
        "pages": pages.toJson(),
        "total_count": totalCount,
        "data_updated_at": dataUpdatedAt,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
