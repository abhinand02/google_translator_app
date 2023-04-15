import 'package:dio/dio.dart';
import 'package:google_translator/model/lang_code_list.dart';
import '../model/language_model.dart';
import '../model/translator_model.dart';
import 'constants.dart';

class APIService {
  static Dio dio = APIConstants.dio;
  static Future<List<Language>> getLanguages() async {
    var res;
    try {
      var resp = await dio.get(
        '${APIConstants.unEncodedPath}/languages',
        options: Options(
          headers: {
            'X-RapidAPI-Key': APIConstants.apiKey,
          },
        ),
      );
      if (resp.statusCode == 200) {
        res = LanguageList.fromJson(resp.data);
      } else {
        print('error');
      }
      // print(LangList.isoLangs[res.data.languages[0].language]);
    } catch (e) {
      print(e.toString());
    }
    return res.data.languages;
  }

  static Future<String> translations(
      {required String text,
      required String target,
      required String source}) async {
    var res;
    try {
      var resp = await dio.post(APIConstants.unEncodedPath,
          data: {'q': text, 'target': target, 'source': source},
          options: Options(headers: {
            'content-type': 'application/x-www-form-urlencoded',
            'Accept-Encoding': 'application/gzip',
            'X-RapidAPI-Key': APIConstants.apiKey,
            'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
          }));
      res = TranslatorModel.fromJson(resp.data);
      // print(res.data.translations.first.translatedText);
    } catch (e) {
      print(e.toString());
    }
    return res.data.translations.first.translatedText;
  }
}
