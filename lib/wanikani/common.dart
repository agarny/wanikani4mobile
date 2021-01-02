// Note: most of the code found in this directory was automatically generated
//       using https://app.quicktype.io/, making all properties optional.

class WaniKaniEnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  WaniKaniEnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class WaniKaniPages {
  WaniKaniPages({
    this.perPage,
    this.nextUrl,
    this.previousUrl,
  });

  int perPage;
  String nextUrl;
  String previousUrl;

  factory WaniKaniPages.fromJson(Map<String, dynamic> json) => WaniKaniPages(
        perPage: json["per_page"] == null ? null : json["per_page"],
        nextUrl: json["next_url"] == null ? null : json["next_url"],
        previousUrl: json["previous_url"] == null ? null : json["previous_url"],
      );

  Map<String, dynamic> toJson() => {
        "per_page": perPage == null ? null : perPage,
        "next_url": nextUrl == null ? null : nextUrl,
        "previous_url": previousUrl == null ? null : previousUrl,
      };
}

enum WaniKaniSubjectType { VOCABULARY, KANJI, RADICAL }

final waniKaniSubjectTypeValues = WaniKaniEnumValues({
  "kanji": WaniKaniSubjectType.KANJI,
  "radical": WaniKaniSubjectType.RADICAL,
  "vocabulary": WaniKaniSubjectType.VOCABULARY
});
