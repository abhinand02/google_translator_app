import 'package:dio/dio.dart';

class APIConstants {

  static const apiKey = '47f008e4eemsh2b50d38d51b047bp14fa9ajsn7a02f29aaf04';

  static const unEncodedPath = '/language/translate/v2';
  
  static Dio dio = Dio(BaseOptions(baseUrl: 'https://google-translate1.p.rapidapi.com'));

}
