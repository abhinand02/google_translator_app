class TranslatorModel {
    TranslatorModel({
        required this.data,
    });

    Data data;

    factory TranslatorModel.fromJson(Map<String, dynamic> json) => TranslatorModel(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.translations,
    });

    List<Translation> translations;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
    };
}

class Translation {
    Translation({
        required this.translatedText,
    });

    String translatedText;

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        translatedText: json["translatedText"],
    );

    Map<String, dynamic> toJson() => {
        "translatedText": translatedText,
    };
}
