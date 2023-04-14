import 'dart:convert';

LanguageList languageListFromJson(String str) => LanguageList.fromJson(json.decode(str));

String languageListToJson(LanguageList data) => json.encode(data.toJson());

class LanguageList {
    LanguageList({
        required this.data,
    });

    Data data;

    factory LanguageList.fromJson(Map<String, dynamic> json) => LanguageList(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.languages,
    });

    List<Language> languages;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    };
}

class Language {
    Language({
        required this.language,
    });

    String language;

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        language: json["language"],
    );

    Map<String, dynamic> toJson() => {
        "language": language,
    };
}
