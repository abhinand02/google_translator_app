import 'package:dio/dio.dart';

class APIConstants {

  static const baseUrl = 'google-translate1.p.rapidapi.com';

  static const apiKey = '15322c9f01mshe7b3854663d28fdp12cdc4jsna410c19846ca';

  static const unEncodedPath = '/language/translate/v2';
  
  static Dio dio = Dio(BaseOptions(baseUrl: 'https://google-translate1.p.rapidapi.com'));

}
