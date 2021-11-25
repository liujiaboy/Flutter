import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/widgets.dart';

import 'network_error.dart';

typedef RequestCallback = void Function(Map response, bool isSuccess);

enum RequestType {
  Get,
  Post,
}

class HttpManager {

  late Dio _dio;
  // 创建单利
  static final HttpManager _instance = HttpManager._internal();
  static HttpManager get shared => _instance;
  HttpManager._internal() {
    _dio = Dio();
  }

  Future<Either<NetworkError, dynamic>> get(String path, {Map<String, dynamic>? queryParameters}) {
    return addRequest(RequestType.Get, path, queryParameters);
  }

  Future<Either<NetworkError, dynamic>> addRequest(RequestType? type, String path, Map<String, dynamic>? queryParameters) async {
    if (queryParameters != null && queryParameters is! Map) {
      return Left(NetworkError(message: "参数异常"));
    }
    RequestType requestType = type != null ? type : RequestType.Get;
    Response? response;
    switch (requestType) {
      case RequestType.Get:
        response = await _dio.get(path, queryParameters: queryParameters);
        break;
      case RequestType.Post:
        response = await _dio.post(path, queryParameters: queryParameters);
        break;
      default:
        break;
    }

    if (response == null) {
      return Left(NetworkError(errorCode: "-1", message: "网络错误"));
    }
    else if (response.statusCode != 200 || response.data is! Map) {
      return Left(NetworkError(errorCode: response.statusCode!.toString(), message: response.statusMessage!));
    }
    else {
      Map dataMap = response.data;
      if (dataMap["rtn_code"] != "0") {
        return Left(NetworkError(errorCode: dataMap["rtn_code"], message: dataMap["rtn_msg"]!));
      }
      return Right(dataMap);
    }
  }
}