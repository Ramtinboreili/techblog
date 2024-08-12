import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/controller/manage_article_controller.dart';
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
      indent: size.width / 5,
      endIndent: size.width / 5,
    );
  }
}

// ignore: must_be_immutable
class MainTag extends StatelessWidget {
  MainTag({
    required this.index,
    super.key,
  });
  // ignore: prefer_typing_uninitialized_variables
  var index;

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

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Center(
                child: Text(
              title,
              style: TextStyleManager.appBarTextStyle,
            )),
          )
        ],
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: SolidColors.primaryColor.withAlpha(100),
                shape: BoxShape.circle),
            child: const Icon(
              CupertinoIcons.arrow_right,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
    ),
  );
}

//loading
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

class cats extends StatelessWidget {
  const cats(
      {super.key,
      required this.homeScreenController,
      required this.manageArticleController,
      });

  final HomeScreenController homeScreenController;
  final ManageArticleController manageArticleController;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 1.7,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: homeScreenController.taglist.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () async {
              manageArticleController.articleInfoModel.update((val) {
                val?.catName = homeScreenController.taglist[index].title!;
                val?.catId = homeScreenController.taglist[index].id!;
              });
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                height: 40,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: SolidColors.primaryColor),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        4, 12, 4
                        , 12),
                    child: Center(
                      child: Text(
                        homeScreenController.taglist[index].title!,
                        style: TextStyleManager.elevBtextStyle2,
                      ),
                    )),
              ),
            ),
          );
        }),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }
}
