import 'package:bookia_app/core/services/remote/endpoints.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: AppEndpoints.baseUrl,
    ));
  }

  static Future<Response> get(
      {required String endpoint, Map<String, dynamic>? data}) async {
    return await _dio.get(endpoint, data: data);
  }

  static Future<Response> post(
      {required String endpoint, Map<String, dynamic>? data}) async {
    return await _dio.post(endpoint, data: data);
  }

  static Future<Response> put(
      {required String endpoint, Map<String, dynamic>? data}) async {
    return await _dio.put(endpoint, data: data);
  }

  static Future<Response> delete(
      {required String endpoint, Map<String, dynamic>? data}) async {
    return await _dio.delete(endpoint, data: data);
  }
}
