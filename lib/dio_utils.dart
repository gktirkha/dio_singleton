import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

class DioUtils {
  DioUtils._privateConstructor();

  static DioUtils? _instance;

  static DioUtils get instance {
    _instance ??= DioUtils._privateConstructor();
    return _instance!;
  }

  static Dio? _dioClient;

  Dio get dioClient {
    _dioClient ??= _createInstance();
    return _dioClient!;
  }

  Dio _createInstance() {
    Dio dio = Dio();
    dio.interceptors.add(ChuckerDioInterceptor());
    return dio;
  }

  void close() {
    _dioClient?.close();
    _dioClient = null;
  }
}
