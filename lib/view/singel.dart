import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/view/articel_list_screen.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/string_Manager.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/controller/list_articel_controller.dart';
import 'package:techblog/controller/single_articel_controller.dart';
import 'package:techblog/gen/assets.gen.dart';

class single extends StatelessWidget {
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  ListArticleController listArticleController =
      Get.put(ListArticleController());

  SingleArticelController singleArticelController =
      Get.put(SingleArticelController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => singleArticelController.articleInfoModel.value.image == null
              ? SizedBox(height: Get.height, child: const Loading())
              : Column(
                  children: [
                    //Article Poster
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageBuilder: (context, imageProvider) {
                            return Image(image: imageProvider);
                          },
                          imageUrl: singleArticelController
                              .articleInfoModel.value.image!,
                          placeholder: (context, url) {
                            return const Loading();
                          },
                          errorWidget: (context, url, error) {
                            return Image.asset(Assets.images.placeholder.path);
                          },
                        ),
                        //Single AppBar
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      colors:
                                          GradientColors.singleAppbarGradiant,
                                      end: Alignment.bottomCenter,
                                      begin: Alignment.topCenter)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  IconButton(
                                      onPressed: () => Navigator.pop(context),
                                      icon: const Icon(
                                        CupertinoIcons.back,
                                        color: Colors.white,
                                        size: 30,
                                      )),
                                  const Expanded(child: SizedBox()),
                                  const Icon(
                                    CupertinoIcons.share,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  const Icon(
                                    CupertinoIcons.bookmark,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                  const SizedBox(
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
                        singleArticelController.articleInfoModel.value.title!,
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
                            singleArticelController
                                .articleInfoModel.value.author!,
                            style: TextStyleManager.profilename,
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Text(
                            singleArticelController
                                .articleInfoModel.value.createdAt!,
                            style: TextStyleManager.bottomshitTextStyle,
                          ),
                        ],
                      ),
                    ),
                    //Article
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HtmlWidget(
                        singleArticelController.articleInfoModel.value.content!,
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
                        itemCount: singleArticelController.tagList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              var tagid =
                                  singleArticelController.tagList[index].id!;
                              await Get.find<ListArticleController>()
                                  .getArticleListWithTagId(tagid);
                              Get.to(ArticleListScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 226, 226, 226),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 4, 6, 4),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Center(
                                        child: Text(
                                          singleArticelController
                                              .tagList[index].title!,
                                          style: TextStyleManager.tagTextStyle2,
                                        ),
                                      ),
                                    ],
                                  ),
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
                    related(
                      size: size,
                      bodyMargin: bodyMargin,
                    ),
                  ],
                ),
        ),
      ),
    ));
  }

  Widget related({required Size size, required double bodyMargin}) {
    var relatedLen = Get.find<SingleArticelController>().relatedList.length;
    return SizedBox(
      height: size.height / 4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: relatedLen,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              singleArticelController.getArticleInfo(
                  singleArticelController.relatedList[index].id);
            },
            child: Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.2,
                    width: size.width / 2.4,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: Get.find<SingleArticelController>()
                              .relatedList[index]
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
                                    Get.find<SingleArticelController>()
                                            .relatedList[index]
                                            .author ??
                                        "تک بلاگ",
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
                        Get.find<SingleArticelController>()
                            .relatedList[index]
                            .title!,
                        style: TextStyleManager.blogListtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
