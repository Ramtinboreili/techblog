import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/services/dio_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailTexteditingcontroller = TextEditingController();
  TextEditingController activationTexteditingcontroller =
      TextEditingController();


  register()async{

    Map<String,dynamic> map ={
      "email" : emailTexteditingcontroller.text ,
      'command' : "register",
    };

    var response = await DioService().postmethod(map, ApiConstant.postregisters);

  }


}
