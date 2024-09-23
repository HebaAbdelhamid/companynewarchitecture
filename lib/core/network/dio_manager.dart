import 'package:companynewarchitecture/core/network/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


const String applicationJson = "application/json;charset=utf-8";
const String contentType = "utf-8";
const String accept = "accept";
const String authorization = "authorization";

class DioManager {
  static DioManager? _instance;
  static DioManager get instance {
    if (_instance != null) return _instance!;
    _instance = DioManager._init();
    return _instance!;
  }

  late final Dio dio;

  DioManager._init() {
    dio = Dio();

    dio.options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      followRedirects: true,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401 ) {
            return handler.resolve(await dio.fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
  }
}