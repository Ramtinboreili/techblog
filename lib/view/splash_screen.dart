import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((onValue) {
      Get.offAndToNamed(RouteName.routeMainScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.images.logo.path , scale: 3,),
              const SizedBox(
                height: 18,
              ),
               const SpinKitFadingCube(
                color: SolidColors.primaryColor,
                size: 32.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
