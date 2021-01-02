import 'package:wanikani4mobile/wanikani/common.dart';

class WaniKaniSubjects {
  WaniKaniSubjects({
    this.object,
    this.url,
    this.pages,
    this.totalCount,
    this.dataUpdatedAt,
    this.data,
  });

  String object;
  String url;
  WaniKaniPages pages;
  int totalCount;
  DateTime dataUpdatedAt;
  List<WaniKaniSubjectsData> data;

  factory WaniKaniSubjects.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjects(
        object: json["object"] == null ? null : json["object"],
        url: json["url"] == null ? null : json["url"],
        pages: json["pages"] == null
            ? null
            : WaniKaniPages.fromJson(json["pages"]),
        totalCount: json["total_count"] == null ? null : json["total_count"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : List<WaniKaniSubjectsData>.from(
                json["data"].map((x) => WaniKaniSubjectsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "object": object == null ? null : object,
        "url": url == null ? null : url,
        "pages": pages == null ? null : pages.toJson(),
        "total_count": totalCount == null ? null : totalCount,
        "data_updated_at":
            dataUpdatedAt == null ? null : dataUpdatedAt.toIso8601String(),
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class WaniKaniSubjectsData {
  WaniKaniSubjectsData({
    this.id,
    this.object,
    this.url,
    this.dataUpdatedAt,
    this.data,
  });

  int id;
  WaniKaniSubjectsDataObject object;
  String url;
  DateTime dataUpdatedAt;
  WaniKaniSubjectsDataData data;

  factory WaniKaniSubjectsData.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjectsData(
        id: json["id"] == null ? null : json["id"],
        object: json["object"] == null
            ? null
            : waniKaniSubjectsDataObjectValues.map[json["object"]],
        url: json["url"] == null ? null : json["url"],
        dataUpdatedAt: json["data_updated_at"] == null
            ? null
            : DateTime.parse(json["data_updated_at"]),
        data: json["data"] == null
            ? null
            : WaniKaniSubjectsDataData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "object": object == null
            ? null
            : waniKaniSubjectsDataObjectValues.reverse[object],
        "url": url == null ? null : url,
        "data_updated_at":
            dataUpdatedAt == null ? null : dataUpdatedAt.toIso8601String(),
        "data": data == null ? null : data.toJson(),
      };
}

class WaniKaniSubjectsDataData {
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
    this.spacedRepetitionSystemId,
    this.readings,
    this.componentSubjectIds,
    this.visuallySimilarSubjectIds,
    this.meaningHint,
    this.readingMnemonic,
    this.readingHint,
  });

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
  int spacedRepetitionSystemId;
  List<WaniKaniSubjectsDataDataReading> readings;
  List<int> componentSubjectIds;
  List<int> visuallySimilarSubjectIds;
  String meaningHint;
  String readingMnemonic;
  String readingHint;

  factory WaniKaniSubjectsDataData.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjectsDataData(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        level: json["level"] == null ? null : json["level"],
        slug: json["slug"] == null ? null : json["slug"],
        hiddenAt: json["hidden_at"] == null
            ? null
            : DateTime.parse(json["hidden_at"]),
        documentUrl: json["document_url"] == null ? null : json["document_url"],
        characters: json["characters"] == null ? null : json["characters"],
        characterImages: json["character_images"] == null
            ? null
            : List<WaniKaniSubjectsDataDataCharacterImage>.from(
                json["character_images"].map(
                    (x) => WaniKaniSubjectsDataDataCharacterImage.fromJson(x))),
        meanings: json["meanings"] == null
            ? null
            : List<WaniKaniSubjectsDataDataMeaning>.from(json["meanings"]
                .map((x) => WaniKaniSubjectsDataDataMeaning.fromJson(x))),
        auxiliaryMeanings: json["auxiliary_meanings"] == null
            ? null
            : List<WaniKaniSubjectsDataDataAuxiliaryMeaning>.from(
                json["auxiliary_meanings"].map((x) =>
                    WaniKaniSubjectsDataDataAuxiliaryMeaning.fromJson(x))),
        amalgamationSubjectIds: json["amalgamation_subject_ids"] == null
            ? null
            : List<int>.from(json["amalgamation_subject_ids"].map((x) => x)),
        meaningMnemonic:
            json["meaning_mnemonic"] == null ? null : json["meaning_mnemonic"],
        lessonPosition:
            json["lesson_position"] == null ? null : json["lesson_position"],
        spacedRepetitionSystemId: json["spaced_repetition_system_id"] == null
            ? null
            : json["spaced_repetition_system_id"],
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
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "level": level == null ? null : level,
        "slug": slug == null ? null : slug,
        "hidden_at": hiddenAt == null ? null : hiddenAt.toIso8601String(),
        "document_url": documentUrl == null ? null : documentUrl,
        "characters": characters == null ? null : characters,
        "character_images": characterImages == null
            ? null
            : List<dynamic>.from(characterImages.map((x) => x.toJson())),
        "meanings": meanings == null
            ? null
            : List<dynamic>.from(meanings.map((x) => x.toJson())),
        "auxiliary_meanings": auxiliaryMeanings == null
            ? null
            : List<dynamic>.from(auxiliaryMeanings.map((x) => x.toJson())),
        "amalgamation_subject_ids": amalgamationSubjectIds == null
            ? null
            : List<dynamic>.from(amalgamationSubjectIds.map((x) => x)),
        "meaning_mnemonic": meaningMnemonic == null ? null : meaningMnemonic,
        "lesson_position": lessonPosition == null ? null : lessonPosition,
        "spaced_repetition_system_id":
            spacedRepetitionSystemId == null ? null : spacedRepetitionSystemId,
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
  WaniKaniSubjectsDataDataAuxiliaryMeaning({
    this.type,
    this.meaning,
  });

  WaniKaniSubjectsDataDataAuxiliaryMeaningType type;
  String meaning;

  factory WaniKaniSubjectsDataDataAuxiliaryMeaning.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataAuxiliaryMeaning(
        type: json["type"] == null
            ? null
            : waniKaniSubjectsDataDataAuxiliaryMeaningTypeValues
                .map[json["type"]],
        meaning: json["meaning"] == null ? null : json["meaning"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null
            ? null
            : waniKaniSubjectsDataDataAuxiliaryMeaningTypeValues.reverse[type],
        "meaning": meaning == null ? null : meaning,
      };
}

enum WaniKaniSubjectsDataDataAuxiliaryMeaningType { WHITELIST, BLACKLIST }

final waniKaniSubjectsDataDataAuxiliaryMeaningTypeValues = WaniKaniEnumValues({
  "blacklist": WaniKaniSubjectsDataDataAuxiliaryMeaningType.BLACKLIST,
  "whitelist": WaniKaniSubjectsDataDataAuxiliaryMeaningType.WHITELIST
});

class WaniKaniSubjectsDataDataCharacterImage {
  WaniKaniSubjectsDataDataCharacterImage({
    this.url,
    this.metadata,
    this.contentType,
  });

  String url;
  WaniKaniSubjectsDataDataCharacterImageMetadata metadata;
  WaniKaniSubjectsDataDataCharacterImageContentType contentType;

  factory WaniKaniSubjectsDataDataCharacterImage.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataCharacterImage(
        url: json["url"] == null ? null : json["url"],
        metadata: json["metadata"] == null
            ? null
            : WaniKaniSubjectsDataDataCharacterImageMetadata.fromJson(
                json["metadata"]),
        contentType: json["content_type"] == null
            ? null
            : waniKaniSubjectsDataDataCharacterImageContentTypeValues
                .map[json["content_type"]],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "metadata": metadata == null ? null : metadata.toJson(),
        "content_type": contentType == null
            ? null
            : waniKaniSubjectsDataDataCharacterImageContentTypeValues
                .reverse[contentType],
      };
}

enum WaniKaniSubjectsDataDataCharacterImageContentType {
  IMAGE_SVG_XML,
  IMAGE_PNG
}

final waniKaniSubjectsDataDataCharacterImageContentTypeValues =
    WaniKaniEnumValues({
  "image/png": WaniKaniSubjectsDataDataCharacterImageContentType.IMAGE_PNG,
  "image/svg+xml":
      WaniKaniSubjectsDataDataCharacterImageContentType.IMAGE_SVG_XML
});

class WaniKaniSubjectsDataDataCharacterImageMetadata {
  WaniKaniSubjectsDataDataCharacterImageMetadata({
    this.inlineStyles,
    this.color,
    this.dimensions,
    this.styleName,
  });

  bool inlineStyles;
  WaniKaniSubjectsDataDataCharacterImageMetadataColor color;
  WaniKaniSubjectsDataDataCharacterImageMetadataDimensions dimensions;
  WaniKaniSubjectsDataDataCharacterImageMetadataStyleName styleName;

  factory WaniKaniSubjectsDataDataCharacterImageMetadata.fromJson(
          Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataCharacterImageMetadata(
        inlineStyles:
            json["inline_styles"] == null ? null : json["inline_styles"],
        color: json["color"] == null
            ? null
            : waniKaniSubjectsDataDataCharacterImageMetadataColorValues
                .map[json["color"]],
        dimensions: json["dimensions"] == null
            ? null
            : waniKaniSubjectsDataDataCharacterImageMetadataDimensionsValues
                .map[json["dimensions"]],
        styleName: json["style_name"] == null
            ? null
            : waniKaniSubjectsDataDataCharacterImageMetadataStyleNameValues
                .map[json["style_name"]],
      );

  Map<String, dynamic> toJson() => {
        "inline_styles": inlineStyles == null ? null : inlineStyles,
        "color": color == null
            ? null
            : waniKaniSubjectsDataDataCharacterImageMetadataColorValues
                .reverse[color],
        "dimensions": dimensions == null
            ? null
            : waniKaniSubjectsDataDataCharacterImageMetadataDimensionsValues
                .reverse[dimensions],
        "style_name": styleName == null
            ? null
            : waniKaniSubjectsDataDataCharacterImageMetadataStyleNameValues
                .reverse[styleName],
      };
}

enum WaniKaniSubjectsDataDataCharacterImageMetadataColor { THE_000000 }

final waniKaniSubjectsDataDataCharacterImageMetadataColorValues =
    WaniKaniEnumValues({
  "#000000": WaniKaniSubjectsDataDataCharacterImageMetadataColor.THE_000000
});

enum WaniKaniSubjectsDataDataCharacterImageMetadataDimensions {
  THE_1024_X1024,
  THE_512_X512,
  THE_256_X256,
  THE_128_X128,
  THE_64_X64,
  THE_32_X32
}

final waniKaniSubjectsDataDataCharacterImageMetadataDimensionsValues =
    WaniKaniEnumValues({
  "1024x1024":
      WaniKaniSubjectsDataDataCharacterImageMetadataDimensions.THE_1024_X1024,
  "128x128":
      WaniKaniSubjectsDataDataCharacterImageMetadataDimensions.THE_128_X128,
  "256x256":
      WaniKaniSubjectsDataDataCharacterImageMetadataDimensions.THE_256_X256,
  "32x32": WaniKaniSubjectsDataDataCharacterImageMetadataDimensions.THE_32_X32,
  "512x512":
      WaniKaniSubjectsDataDataCharacterImageMetadataDimensions.THE_512_X512,
  "64x64": WaniKaniSubjectsDataDataCharacterImageMetadataDimensions.THE_64_X64
});

enum WaniKaniSubjectsDataDataCharacterImageMetadataStyleName {
  ORIGINAL,
  THE_1024_PX,
  THE_512_PX,
  THE_256_PX,
  THE_128_PX,
  THE_64_PX,
  THE_32_PX
}

final waniKaniSubjectsDataDataCharacterImageMetadataStyleNameValues =
    WaniKaniEnumValues({
  "original": WaniKaniSubjectsDataDataCharacterImageMetadataStyleName.ORIGINAL,
  "1024px": WaniKaniSubjectsDataDataCharacterImageMetadataStyleName.THE_1024_PX,
  "128px": WaniKaniSubjectsDataDataCharacterImageMetadataStyleName.THE_128_PX,
  "256px": WaniKaniSubjectsDataDataCharacterImageMetadataStyleName.THE_256_PX,
  "32px": WaniKaniSubjectsDataDataCharacterImageMetadataStyleName.THE_32_PX,
  "512px": WaniKaniSubjectsDataDataCharacterImageMetadataStyleName.THE_512_PX,
  "64px": WaniKaniSubjectsDataDataCharacterImageMetadataStyleName.THE_64_PX
});

class WaniKaniSubjectsDataDataMeaning {
  WaniKaniSubjectsDataDataMeaning({
    this.meaning,
    this.primary,
    this.acceptedAnswer,
  });

  String meaning;
  bool primary;
  bool acceptedAnswer;

  factory WaniKaniSubjectsDataDataMeaning.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataMeaning(
        meaning: json["meaning"] == null ? null : json["meaning"],
        primary: json["primary"] == null ? null : json["primary"],
        acceptedAnswer:
            json["accepted_answer"] == null ? null : json["accepted_answer"],
      );

  Map<String, dynamic> toJson() => {
        "meaning": meaning == null ? null : meaning,
        "primary": primary == null ? null : primary,
        "accepted_answer": acceptedAnswer == null ? null : acceptedAnswer,
      };
}

class WaniKaniSubjectsDataDataReading {
  WaniKaniSubjectsDataDataReading({
    this.type,
    this.primary,
    this.reading,
    this.acceptedAnswer,
  });

  WaniKaniSubjectsDataDataReadingReadingType type;
  bool primary;
  String reading;
  bool acceptedAnswer;

  factory WaniKaniSubjectsDataDataReading.fromJson(Map<String, dynamic> json) =>
      WaniKaniSubjectsDataDataReading(
        type: json["type"] == null
            ? null
            : waniKaniSubjectsDataDataReadingReadingTypeValues
                .map[json["type"]],
        primary: json["primary"] == null ? null : json["primary"],
        reading: json["reading"] == null ? null : json["reading"],
        acceptedAnswer:
            json["accepted_answer"] == null ? null : json["accepted_answer"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null
            ? null
            : waniKaniSubjectsDataDataReadingReadingTypeValues.reverse[type],
        "primary": primary == null ? null : primary,
        "reading": reading == null ? null : reading,
        "accepted_answer": acceptedAnswer == null ? null : acceptedAnswer,
      };
}

enum WaniKaniSubjectsDataDataReadingReadingType { ONYOMI, KUNYOMI, NANORI }

final waniKaniSubjectsDataDataReadingReadingTypeValues = WaniKaniEnumValues({
  "kunyomi": WaniKaniSubjectsDataDataReadingReadingType.KUNYOMI,
  "nanori": WaniKaniSubjectsDataDataReadingReadingType.NANORI,
  "onyomi": WaniKaniSubjectsDataDataReadingReadingType.ONYOMI
});

enum WaniKaniSubjectsDataObject { RADICAL, KANJI }

final waniKaniSubjectsDataObjectValues = WaniKaniEnumValues({
  "kanji": WaniKaniSubjectsDataObject.KANJI,
  "radical": WaniKaniSubjectsDataObject.RADICAL
});
