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
  int perPage;
  String nextUrl;
  String previousUrl;

  WaniKaniPages({
    this.perPage,
    this.nextUrl,
    this.previousUrl,
  });

  factory WaniKaniPages.fromJson(Map<String, dynamic> json) => WaniKaniPages(
        perPage: json["per_page"],
        nextUrl: json["next_url"],
        previousUrl: json["previous_url"],
      );

  Map<String, dynamic> toJson() => {
        "per_page": perPage,
        "next_url": nextUrl,
        "previous_url": previousUrl,
      };
}

enum WaniKaniSrsStageName {
  INITIATE,
  APPRENTICE_I,
  APPRENTICE_II,
  APPRENTICE_III,
  APPRENTICE_IV,
  GURU_I,
  GURU_II,
  MASTER,
  ENLIGHTENED,
  BURNED,
}

final waniKaniSrsStageNameValues = WaniKaniEnumValues({
  "Initiate": WaniKaniSrsStageName.INITIATE,
  "Apprentice I": WaniKaniSrsStageName.APPRENTICE_I,
  "Apprentice II": WaniKaniSrsStageName.APPRENTICE_II,
  "Apprentice III": WaniKaniSrsStageName.APPRENTICE_III,
  "Apprentice IV": WaniKaniSrsStageName.APPRENTICE_IV,
  "Guru I": WaniKaniSrsStageName.GURU_I,
  "Guru II": WaniKaniSrsStageName.GURU_II,
  "Master": WaniKaniSrsStageName.MASTER,
  "Enlightened": WaniKaniSrsStageName.ENLIGHTENED,
  "Burned": WaniKaniSrsStageName.BURNED,
});
