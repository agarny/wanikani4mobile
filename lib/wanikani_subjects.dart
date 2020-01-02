import 'package:wanikani4mobile/wanikani.dart';

class WaniKaniSubjects {
  String object;
  String url;
  WaniKaniSubjectsPages pages;
  int totalCount;
  DateTime dataUpdatedAt;
  List<WaniKaniSubjectsData> data;

  WaniKaniSubjects({
    this.object,
    this.url,
    this.pages,
    this.totalCount,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniSubjects.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjects(
        object: json["object"],
        url: json["url"],
        pages: WaniKaniSubjectsPages.fromJson(json["pages"]),
        totalCount: json["total_count"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: List<WaniKaniSubjectsData>.from(
            json["data"].map((x) => WaniKaniSubjectsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "object": object,
        "url": url,
        "pages": pages.toJson(),
        "total_count": totalCount,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WaniKaniSubjectsData {
  int id;
  Object object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniSubjectsDataData data;

  WaniKaniSubjectsData({
    this.id,
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  factory WaniKaniSubjectsData.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjectsData(
        id: json["id"],
        object: objectValues.map[json["object"]],
        url: json["url"],
        dataUpdatedAt: DateTime.parse(json["data_updated_at"]),
        data: WaniKaniSubjectsDataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": objectValues.reverse[object],
        "url": url,
        "data_updated_at": dataUpdatedAt.toIso8601String(),
        "data": data.toJson(),
      };
}

class WaniKaniSubjectsDataData {
  DateTime createdAt;
  int level;
  String slug;
  DateTime hiddenAt;
  String documentUrl;
  String characters;
  List<WaniKaniSubjectsDataDataCharacterImage> characterImages;
  List<WaniKaniSubjectsDataDataMeaning> meanings;
  List<WaniKaniSubjectsDataDataAuxiliaryMeaning> auxiliaryMeanings;
  List<int> amalgamationSubjectIds;
  String meaningMnemonic;
  int lessonPosition;
  List<WaniKaniSubjectsDataDataReading> readings;
  List<int> componentSubjectIds;
  List<int> visuallySimilarSubjectIds;
  String meaningHint;
  String readingMnemonic;
  String readingHint;

  WaniKaniSubjectsDataData({
    this.createdAt,
    this.level,
    this.slug,
    this.hiddenAt,
    this.documentUrl,
    this.characters,
    this.characterImages,
    this.meanings,
    this.auxiliaryMeanings,
    this.amalgamationSubjectIds,
    this.meaningMnemonic,
    this.lessonPosition,
    this.readings,
    this.componentSubjectIds,
    this.visuallySimilarSubjectIds,
    this.meaningHint,
    this.readingMnemonic,
    this.readingHint,
  });

  factory WaniKaniSubjectsDataData.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjectsDataData(
        createdAt: DateTime.parse(json["created_at"]),
        level: json["level"],
        slug: json["slug"],
        hiddenAt: json["hidden_at"] == null
            ? null
            : DateTime.parse(json["hidden_at"]),
        documentUrl: json["document_url"],
        characters: json["characters"],
        characterImages: json["character_images"] == null
            ? null
            : List<WaniKaniSubjectsDataDataCharacterImage>.from(
                json["character_images"].map(
                    (x) => WaniKaniSubjectsDataDataCharacterImage.fromJson(x))),
        meanings: List<WaniKaniSubjectsDataDataMeaning>.from(json["meanings"]
            .map((x) => WaniKaniSubjectsDataDataMeaning.fromJson(x))),
        auxiliaryMeanings: List<WaniKaniSubjectsDataDataAuxiliaryMeaning>.from(
            json["auxiliary_meanings"].map(
                (x) => WaniKaniSubjectsDataDataAuxiliaryMeaning.fromJson(x))),
        amalgamationSubjectIds:
            List<int>.from(json["amalgamation_subject_ids"].map((x) => x)),
        meaningMnemonic: json["meaning_mnemonic"],
        lessonPosition: json["lesson_position"],
        readings: json["readings"] == null
            ? null
            : List<WaniKaniSubjectsDataDataReading>.from(json["readings"]
                .map((x) => WaniKaniSubjectsDataDataReading.fromJson(x))),
        componentSubjectIds: json["component_subject_ids"] == null
            ? null
            : List<int>.from(json["component_subject_ids"].map((x) => x)),
        visuallySimilarSubjectIds: json["visually_similar_subject_ids"] == null
            ? null
            : List<int>.from(
                json["visually_similar_subject_ids"].map((x) => x)),
        meaningHint: json["meaning_hint"] == null ? null : json["meaning_hint"],
        readingMnemonic:
            json["reading_mnemonic"] == null ? null : json["reading_mnemonic"],
        readingHint: json["reading_hint"] == null ? null : json["reading_hint"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt.toIso8601String(),
        "level": level,
        "slug": slug,
        "hidden_at": hiddenAt == null ? null : hiddenAt.toIso8601String(),
        "document_url": documentUrl,
        "characters": characters,
        "character_images": characterImages == null
            ? null
            : List<dynamic>.from(characterImages.map((x) => x.toJson())),
        "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
        "auxiliary_meanings":
            List<dynamic>.from(auxiliaryMeanings.map((x) => x.toJson())),
        "amalgamation_subject_ids":
            List<dynamic>.from(amalgamationSubjectIds.map((x) => x)),
        "meaning_mnemonic": meaningMnemonic,
        "lesson_position": lessonPosition,
        "readings": readings == null
            ? null
            : List<dynamic>.from(readings.map((x) => x.toJson())),
        "component_subject_ids": componentSubjectIds == null
            ? null
            : List<dynamic>.from(componentSubjectIds.map((x) => x)),
        "visually_similar_subject_ids": visuallySimilarSubjectIds == null
            ? null
            : List<dynamic>.from(visuallySimilarSubjectIds.map((x) => x)),
        "meaning_hint": meaningHint == null ? null : meaningHint,
        "reading_mnemonic": readingMnemonic == null ? null : readingMnemonic,
        "reading_hint": readingHint == null ? null : readingHint,
      };
}

class WaniKaniSubjectsDataDataAuxiliaryMeaning {
  AuxiliaryMeaningType type;
  String meaning;

  WaniKaniSubjectsDataDataAuxiliaryMeaning({
    this.type,
    this.meaning,
  });

  factory WaniKaniSubjectsDataDataAuxiliaryMeaning.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataAuxiliaryMeaning(
        type: auxiliaryMeaningTypeValues.map[json["type"]],
        meaning: json["meaning"],
      );

  Map<String, dynamic> toJson() => {
        "type": auxiliaryMeaningTypeValues.reverse[type],
        "meaning": meaning,
      };
}

enum AuxiliaryMeaningType { WHITELIST, BLACKLIST }

final auxiliaryMeaningTypeValues = WaniKaniEnumValues({
  "blacklist": AuxiliaryMeaningType.BLACKLIST,
  "whitelist": AuxiliaryMeaningType.WHITELIST
});

class WaniKaniSubjectsDataDataCharacterImage {
  String url;
  WaniKaniSubjectsDataDataCharacterImageMetadata metadata;
  ContentType contentType;

  WaniKaniSubjectsDataDataCharacterImage({
    this.url,
    this.metadata,
    this.contentType,
  });

  factory WaniKaniSubjectsDataDataCharacterImage.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataCharacterImage(
        url: json["url"],
        metadata: WaniKaniSubjectsDataDataCharacterImageMetadata.fromJson(
            json["metadata"]),
        contentType: contentTypeValues.map[json["content_type"]],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "metadata": metadata.toJson(),
        "content_type": contentTypeValues.reverse[contentType],
      };
}

enum ContentType { IMAGE_SVG_XML, IMAGE_PNG }

final contentTypeValues = WaniKaniEnumValues({
  "image/png": ContentType.IMAGE_PNG,
  "image/svg+xml": ContentType.IMAGE_SVG_XML
});

class WaniKaniSubjectsDataDataCharacterImageMetadata {
  bool inlineStyles;
  Color color;
  Dimensions dimensions;
  StyleName styleName;

  WaniKaniSubjectsDataDataCharacterImageMetadata({
    this.inlineStyles,
    this.color,
    this.dimensions,
    this.styleName,
  });

  factory WaniKaniSubjectsDataDataCharacterImageMetadata.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataCharacterImageMetadata(
        inlineStyles:
            json["inline_styles"] == null ? null : json["inline_styles"],
        color: json["color"] == null ? null : colorValues.map[json["color"]],
        dimensions: json["dimensions"] == null
            ? null
            : dimensionsValues.map[json["dimensions"]],
        styleName: json["style_name"] == null
            ? null
            : styleNameValues.map[json["style_name"]],
      );

  Map<String, dynamic> toJson() => {
        "inline_styles": inlineStyles == null ? null : inlineStyles,
        "color": color == null ? null : colorValues.reverse[color],
        "dimensions":
            dimensions == null ? null : dimensionsValues.reverse[dimensions],
        "style_name":
            styleName == null ? null : styleNameValues.reverse[styleName],
      };
}

enum Color { THE_000000 }

final colorValues = WaniKaniEnumValues({"#000000": Color.THE_000000});

enum Dimensions {
  THE_1024_X1024,
  THE_512_X512,
  THE_256_X256,
  THE_128_X128,
  THE_64_X64,
  THE_32_X32
}

final dimensionsValues = WaniKaniEnumValues({
  "1024x1024": Dimensions.THE_1024_X1024,
  "128x128": Dimensions.THE_128_X128,
  "256x256": Dimensions.THE_256_X256,
  "32x32": Dimensions.THE_32_X32,
  "512x512": Dimensions.THE_512_X512,
  "64x64": Dimensions.THE_64_X64
});

enum StyleName {
  ORIGINAL,
  THE_1024_PX,
  THE_512_PX,
  THE_256_PX,
  THE_128_PX,
  THE_64_PX,
  THE_32_PX
}

final styleNameValues = WaniKaniEnumValues({
  "original": StyleName.ORIGINAL,
  "1024px": StyleName.THE_1024_PX,
  "128px": StyleName.THE_128_PX,
  "256px": StyleName.THE_256_PX,
  "32px": StyleName.THE_32_PX,
  "512px": StyleName.THE_512_PX,
  "64px": StyleName.THE_64_PX
});

class WaniKaniSubjectsDataDataMeaning {
  String meaning;
  bool primary;
  bool acceptedAnswer;

  WaniKaniSubjectsDataDataMeaning({
    this.meaning,
    this.primary,
    this.acceptedAnswer,
  });

  factory WaniKaniSubjectsDataDataMeaning.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataMeaning(
        meaning: json["meaning"],
        primary: json["primary"],
        acceptedAnswer: json["accepted_answer"],
      );

  Map<String, dynamic> toJson() => {
        "meaning": meaning,
        "primary": primary,
        "accepted_answer": acceptedAnswer,
      };
}

class WaniKaniSubjectsDataDataReading {
  ReadingType type;
  bool primary;
  String reading;
  bool acceptedAnswer;

  WaniKaniSubjectsDataDataReading({
    this.type,
    this.primary,
    this.reading,
    this.acceptedAnswer,
  });

  factory WaniKaniSubjectsDataDataReading.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataReading(
        type: readingTypeValues.map[json["type"]],
        primary: json["primary"],
        reading: json["reading"],
        acceptedAnswer: json["accepted_answer"],
      );

  Map<String, dynamic> toJson() => {
        "type": readingTypeValues.reverse[type],
        "primary": primary,
        "reading": reading,
        "accepted_answer": acceptedAnswer,
      };
}

enum ReadingType { ONYOMI, KUNYOMI, NANORI }

final readingTypeValues = WaniKaniEnumValues({
  "kunyomi": ReadingType.KUNYOMI,
  "nanori": ReadingType.NANORI,
  "onyomi": ReadingType.ONYOMI
});

enum Object { RADICAL, KANJI }

final objectValues =
    WaniKaniEnumValues({"kanji": Object.KANJI, "radical": Object.RADICAL});

class WaniKaniSubjectsPages {
  int perPage;
  String nextUrl;
  dynamic previousUrl;

  WaniKaniSubjectsPages({
    this.perPage,
    this.nextUrl,
    this.previousUrl,
  });

  factory WaniKaniSubjectsPages.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjectsPages(
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
