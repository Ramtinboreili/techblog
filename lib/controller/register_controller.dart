import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/component/storage_const.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/my_cats.dart';

class RegisterController extends GetxController {
  TextEditingController emailTexteditingcontroller = TextEditingController();
  TextEditingController activationTexteditingcontroller =
      TextEditingController();

  var email = '';
  var userId = '';

  register() async {
    Map<String, dynamic> map = {
      "email": emailTexteditingcontroller.text,
      'command': "register",
    };

    var response =
        await DioService().postmethod(map, ApiConstant.postregisters);

    email = emailTexteditingcontroller.text;
    userId = response.data["user_id"];
    print(response);
  }

  verify() async {
    Map<String, dynamic> map = {
      "email": email,
      'user_id': userId,
      'code': activationTexteditingcontroller.text,
      'command': "verify",
    };

    if (kDebugMode) {
      print(map);
    }
    var response =
        await DioService().postmethod(map, ApiConstant.postregisters);
    print(response.data);

    var box = GetStorage();
    
    if (response.data['response'] == 'verified') {
      var box = GetStorage();
      box.write(token, response.data['token']);
      box.write(userId, response.data['user_id']);

      print("read:::"+box.read(token));
      print("read:::"+box.read(userId));

      Get.to(MyCats());
    } else {
      log("error");
    }
  }
}
