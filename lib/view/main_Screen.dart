import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/color_Manager.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/string_Manager.dart';
import 'package:techblog/text_style_manager.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: SolidColors.scaffoldBg,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.menu),
              SizedBox(
                height: size.height / 13.6,
                child: Assets.images.logo.image(),
              ),
              const Icon(Icons.search)
            ],
          ),
        ),
        body: Stack(children: [
          //Home Screen
          Center(child: Positioned.fill(child: ProfileScreen(size: size, bodyMargin: bodyMargin))),
          //Bottom Nav Bar
          bottemNavBar(size: size, bodyMargin: bodyMargin),
        ]),
      ),
    );
  }
}

class bottemNavBar extends StatelessWidget {
  const bottemNavBar({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomNavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(bodyMargin, 4, bodyMargin, 8),
          child: Container(
            height: size.height / 14,
            width: size.width / 15,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                gradient: LinearGradient(
                    colors: GradientColors.bottomNav,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  CupertinoIcons.house_fill,
                  color: Colors.white,
                ),
                Icon(
                  CupertinoIcons.pencil_outline,
                  color: Colors.white,
                ),
                Icon(
                  CupertinoIcons.person_fill,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

