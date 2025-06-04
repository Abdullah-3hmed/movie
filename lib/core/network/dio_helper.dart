import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/network/custom_interceptors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static late Dio _dio;

  static void init() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      queryParameters: {
        "api_key": dotenv.env["API_KEY"]!,
        "contentType": 'Application/json',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    _dio = Dio(options);
    _dio.interceptors.addAll([
      CustomInterceptors(),
      PrettyDioLogger(requestHeader: true, requestBody: true),
    ]);
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    //_dio.options.headers = headers;
    return await _dio.post(
      url,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  Future<Response> put({
    required String url,
    dynamic data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    _dio.options.headers = headers;
    return await _dio.put(
      url,
      data: data,
      queryParameters: query,
      // options: Options(headers: headers),
    );
  }

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.delete(
      url,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }
}
