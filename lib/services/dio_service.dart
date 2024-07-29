import 'dart:developer';

import 'package:dio/dio.dart';

class DioService {


    Future<dynamic> getmethod(String url)async{

      Dio dio = Dio() ;
      dio.options.headers["content-type"] = 'application/json';

      return await dio.get(url,
      options: Options(responseType: ResponseType.json , method: "GET")
      ).then((response) {
        log(response.toString());
        return response ;
      },);

    } 




}