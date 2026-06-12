import 'package:dio/dio.dart';
import 'package:news_app/core/constant/api_endpoints.dart';

class ApiClient {
  ApiClient._();
  static final ApiClient _instance = ApiClient._();
  static Dio get dio => _instance._dio;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    ),
  );
}
