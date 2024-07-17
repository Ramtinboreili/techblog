import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techblog/color_Manager.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/main_Screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((onValue) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Homescreen();
        },
      ));
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
              Container(
                child: Assets.images.logo.image(),
                height: 64,
              ),
              SizedBox(
                height: 18,
              ),
              SpinKitFadingCube(
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
