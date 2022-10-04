import 'package:dio/dio.dart';

import '../core_shelf.dart';

class ApiService {
  static final instance = ApiService._();

  ApiService._();

  // ortak api eklentilerimizi tanımlıyoruz
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.instance.baseUrl,
  ));

  Future<dynamic> getRequest({String? endPoint, String? params = ''}) async {
    try {
      var response = await _dio.get((endPoint ?? '') + params!);
      if (response.statusCode == 200) {
        return (response.data);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
