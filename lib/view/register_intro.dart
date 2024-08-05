import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/component/string_Manager.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/my_cats.dart';
import 'package:validators/validators.dart';

// ignore: must_be_immutable
class RegisterIntro extends StatelessWidget {
  RegisterIntro({super.key});

  RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //tchBot
            SvgPicture.asset(
              Assets.images.tcbot.path,
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.welcom,
                      style: TextStyleManager.registerIntroStyle)),
            ),
            //elevated Button
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: ElevatedButton(
                onPressed: () {
                  _showEmailBottomSheet(context, size);
                },
                child: const Text(
                  "بزن بریم",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  // bottom sheet Email
  Future<dynamic> _showEmailBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(32), topStart: Radius.circular(32)),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.insertYourEmail,
                    style: TextStyleManager.bottomshitTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 36, 24, 16),
                    child: TextField(
                      controller: registerController.emailTexteditingcontroller,
                      onChanged: (value) {
                        if (kDebugMode) {
                          print("${value}is Email =${isEmail(value)}");
                        }
                      },
                      style: TextStyleManager.tFieldTextStyle,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "techblog@gmail.com",
                        hintStyle: TextStyleManager.hintTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        registerController.register();
                        Navigator.pop(context);
                        _activateCodeBottomSheet(context, size);
                      },
                      child: const Text(
                        "ادامه ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // bottom sheet Activation code
  Future<dynamic> _activateCodeBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height / 2.5,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(32), topStart: Radius.circular(32)),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.activateCode,
                    style: TextStyleManager.bottomshitTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 36, 24, 16),
                    child: TextField(
                      controller:
                          registerController.activationTexteditingcontroller,
                      onChanged: (value) {},
                      style: TextStyleManager.tFieldTextStyle,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "******",
                          hintStyle: TextStyleManager.hintTextStyle,
                          alignLabelWithHint: true),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        registerController.verify();
                        // Navigator.pushReplacement(
                        //     context,
                        //     CupertinoPageRoute(
                        //       builder: (context) => const MyCats(),
                        //     ));
                      },
                      child: const Text(
                        "ادامه ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
