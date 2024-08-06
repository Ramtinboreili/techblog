
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: const Color.fromARGB(193, 112, 112, 112),
      indent: size.width/5,
      endIndent: size.width/5,
      );
  }
}

// ignore: must_be_immutable
class MainTag extends StatelessWidget {
    MainTag({
    required this.index ,
    super.key,
  });
  // ignore: prefer_typing_uninitialized_variables
  var index ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 6, 4),
        child: Row(
          children: [
            const Icon(
              Icons.tag,
              color: Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            Center(
              child: Text(
                Get.find<HomeScreenController>().taglist[index].title!,
                style: TextStyleManager.tagTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


myLaunchUrl(String url)async{


  var uri = Uri.parse(url) ;
  
  if (await canLaunchUrl(uri)) {

    await launchUrl(uri);


  }else{
    log("coud Not lunch $url");
  }
}

//appBar
  PreferredSize appBar(String title) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Center(child: Text(title,style: TextStyleManager.appBarTextStyle,)),
          )],
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: SolidColors.primaryColor.withAlpha(100),
                shape: BoxShape.circle),
                child: const Icon(CupertinoIcons.arrow_right , color: Colors.white,size: 32
                ,),
          ),
        ),
      ),
    );
  }


  class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 32.0,
    );
  }
}