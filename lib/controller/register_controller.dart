import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/storage_const.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/main_Screen.dart';
import 'package:techblog/view/register_intro.dart';

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
    if (kDebugMode) {
      print(response);
    }
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
    if (kDebugMode) {
      print(response.data);
    }

    var status = response.data['response'];
    if (response.data['response'] == 'verified') {
    } else {
      log("error");
    }

    switch (status) {
      case 'verified':
        var box = GetStorage();
        box.write(token, response.data['token']);
        box.write(userId, response.data['user_id']);

        if (kDebugMode) {
          // ignore: prefer_interpolation_to_compose_strings
          print("read:::" + box.read(token));
        }
        if (kDebugMode) {
          // ignore: prefer_interpolation_to_compose_strings
          print("read:::" + box.read(userId));
        }

        Get.offAll(MainScreen());
        break;
      case 'incorrect_code':
        Get.snackbar("Erorr", "Incorrect Activation code" , backgroundColor:SolidColors.erorColor );
        break;
      case 'expired':
        Get.snackbar("Erorr", "Expired Activation code" , backgroundColor: SolidColors.selectedPodCast);
        break;
    }
  }

  toggleLogin() {
    if (GetStorage().read(token) == null) {
      Get.to(RegisterIntro());
    } else {
      Get.snackbar("You Are Veryfied", "شما در حساب کاربری خود هستید ");
      if (kDebugMode) {
        print("Post Screen");
      }
    }
  }
}
