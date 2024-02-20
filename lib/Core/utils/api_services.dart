import 'package:dio/dio.dart';

import '../constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> get({required String endPoint,Map<String,dynamic>? query}) async {
    var response = await _dio.get('${Constants.baseUrl}$endPoint',queryParameters: query);
    return response;
  }
}
