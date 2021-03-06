
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:templeteproject/core/base/model/base_error.dart';
import 'package:templeteproject/core/base/model/base_model.dart';

class NetworkManager {
  static NetworkManager _instance;

  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();

    return _instance;
  }

  NetworkManager._init() {
    final baseOptions =
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/");
    _dio = Dio(baseOptions);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options) {
          options.path += "veli";
        },
        onError: (e) {
          return BaseError(e.message);
        },
//          onResponse: (e) {
//        return BaseError(e.data);
//      }
      ),
    );
  }

  Dio _dio;

  Future dioGet<T extends BaseModel>(String path, T model) async {
    final response = await _dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        if (responseBody is List) {
          return responseBody.map((e) => model.fromJson(e)).toList();
        } else if (responseBody is Map) {
          return model.fromJson(responseBody);
        } else {
          return responseBody;
        }
    }
  }
}
