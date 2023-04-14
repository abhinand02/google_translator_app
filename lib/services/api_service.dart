import 'package:dio/dio.dart';
import 'package:google_translator/model/lang_code_list.dart';
import '../model/language_model.dart';
import '../model/translator_model.dart';
import 'constants.dart';

class APIService {
  static Dio dio = APIConstants.dio;
  static Future getLanguages() async {
    try {
      var resp = await dio.get(
        '${APIConstants.unEncodedPath}/languages',
        options: Options(
          headers: {
            'X-RapidAPI-Key': APIConstants.apiKey,
          },
        ),
      );
      var res = LanguageList.fromJson(resp.data);
      print(LangList.isoLangs[res.data.languages[0].language]);
    } catch (e) {
      print(e.toString());
    }
  }

  static Future translations() async {
    try {
      var resp = await dio.post(APIConstants.unEncodedPath,
          data: {'q': 'Hello, world!', 'target': 'es', 'source': 'en'},
          options: Options(headers: {
            'content-type': 'application/x-www-form-urlencoded',
            'Accept-Encoding': 'application/gzip',
            'X-RapidAPI-Key': APIConstants.apiKey,
            'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
          }));
      var res = TranslatorModel.fromJson(resp.data);
      print(res.data.translations.first.translatedText);
    } catch (e) {
      print(e.toString());
    }
  }
}
