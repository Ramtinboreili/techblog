import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart'as dio_service;
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/storage_const.dart';

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
    var token = GetStorage().read(StorageConst.token);
    if (token != null) {
      dio.options.headers["authorization"] =  '$token';
    }


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
