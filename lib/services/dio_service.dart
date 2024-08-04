import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart'as dio_service;

class DioService {
  Dio dio = Dio();
  Future<dynamic> getmethod(String url) async {
    dio.options.headers["content-type"] = 'application/json';

    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: "GET"))
        .then(
      (response) {
        log(response.toString());
        return response;
      },
    );
  }

  Future<dynamic> postmethod(Map<String, dynamic> map, String url) async {
    dio.options.headers["content-type"] = 'application/json';
    //TODO: read token from storage
    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: "post"))
        .then((value) {
          log(value.headers.toString());
          log(value.statusCode.toString());
          log(value.data.toString());
          return value;
        });
  }
}
