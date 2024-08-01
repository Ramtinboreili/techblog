import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/string_Manager.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';

class Singel extends StatelessWidget {
  Singel({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Article Poster

            Stack(
              children: [
                CachedNetworkImage(
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.fitHeight)),
                    );
                  },
                  imageUrl: "imageurl",
                  placeholder: (context, url) {
                    return const Loading();
                  },
                  errorWidget: (context, url, error) {
                    return Image.asset(Assets.images.placeholder.path);
                  },
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: GradientColors.singleAppbarGradiant,
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                            size: 30,
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            CupertinoIcons.share,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Icon(
                            CupertinoIcons.bookmark,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(
                            width: 12,
                          )
                        ],
                      ),
                    ))
              ],
            ),
            //article title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "لودم دمد دمدمدم دمدمد یتخست سمیمیمی ییمی ",
                maxLines: 2,
                style: TextStyleManager.singleArticlelistText,
              ),
            ),
            //autor profile
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image(
                    image: Image.asset(
                      Assets.images.pAvatar.path,
                    ).image,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "رامتین بریلی",
                    style: TextStyleManager.profilename,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    "date",
                    style: TextStyleManager.bottomshitTextStyle,
                  ),
                ],
              ),
            ),
            //Article
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlWidget(
                '''
              <h2>Ramtin Boreili </h2>
              <h3>Ramtin Boreili </h3>
              <h4>Ramtin Boreili </h4>
              <h5>Ramtin Boreili </h5>
              ''',
                textStyle: TextStyleManager.singleArticlelistText,
                onLoadingBuilder: (context, element, loadingProgress) =>
                    const Loading(),
                enableCaching: true,
              ),
            ),
            //Tags
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 226, 226, 226),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 4, 6, 4),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 6,
                            ),
                            Center(
                              child: Text(
                                Get.find<HomeScreenController>()
                                    .taglist[index]
                                    .title!,
                                style: TextStyleManager.tagTextStyle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //SeeMore
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 14,
                ),
                Text(
                  MyStrings.relatedArticle,
                  style: TextStyleManager.viewHotestBlog,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            //SeeMore List
            const SizedBox(
              height: 16,
            ),
            topVisited(
              size: size,
              bodyMargin: bodyMargin,
            ),
          ],
        ),
      ),
    ));
  }

  Widget topVisited({required Size size, required double bodyMargin}) {
    return Obx(
      () => SizedBox(
        height: size.height / 4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Get.find<HomeScreenController>().topVisitedList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.2,
                    width: size.width / 2.4,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: Get.find<HomeScreenController>()
                              .topVisitedList[index]
                              .image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                              foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                      colors: GradientColors.blogPost,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter)),
                            );
                          },
                          placeholder: (context, url) =>
                              const SpinKitFadingCircle(
                            color: SolidColors.primaryColor,
                            size: 32,
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 8,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    Get.find<HomeScreenController>()
                                        .topVisitedList[index]
                                        .author!,
                                    style: TextStyleManager.posterSubTitle),
                                Row(
                                  children: [
                                    Text(
                                        Get.find<HomeScreenController>()
                                            .topVisitedList[index]
                                            .view!,
                                        style: TextStyleManager.posterSubTitle),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 20,
                                      color: SolidColors.posterSubTitle,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        Get.find<HomeScreenController>()
                            .topVisitedList[index]
                            .title!,
                        style: TextStyleManager.blogListtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
