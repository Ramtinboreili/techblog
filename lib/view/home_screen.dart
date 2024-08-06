import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/single_articel_controller.dart';
import 'package:techblog/view/articel_list_screen.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/string_Manager.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/text_style_manager.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticelController singleArticelController =
      Get.put(SingleArticelController());

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: homeScreenController.loading.value == false
                ? Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      //poster
                      poster(),
                      const SizedBox(
                        height: 28,
                      ),
                      //tag list
                      tags(),
                      //see More
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 24, bodyMargin, 12),
                        child: GestureDetector(
                          onTap: () => Get.to(ArticleListScreen()),
                          child: Row(
                            children: [
                              ImageIcon(
                                Assets.icons.seeMore.provider(),
                                color: SolidColors.seeMore,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                MyStrings.viewHotestBlog,
                                style: TextStyleManager.viewHotestBlog,
                              )
                            ],
                          ),
                        ),
                      ),
                      //Blog List
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: topVisited(size: size, bodyMargin: bodyMargin),
                      ),
                      //see More2
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 24, bodyMargin, 12),
                        child: Row(
                          children: [
                            ImageIcon(
                              Assets.icons.seeMore.provider(),
                              color: SolidColors.seeMore,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              MyStrings.viewHotestPodCasts,
                              style: TextStyleManager.viewHotestBlog,
                            )
                          ],
                        ),
                      ),
                      //Podcast List
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: topPodcast(size: size, bodyMargin: bodyMargin),
                      ),
                      SizedBox(
                        height: size.height / 8,
                      )
                    ],
                  )
                : const SpinKitFadingCircle(
                    size: 50,
                    color: SolidColors.primaryColor,
                  )),
      ),
    );
  }

//top visited
  Widget topVisited({required Size size, required double bodyMargin}) {
    return Obx(
      () => SizedBox(
        height: size.height / 4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                singleArticelController.getArticleInfo(
                    homeScreenController.topVisitedList[index].id);
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
                            imageUrl: homeScreenController
                                .topVisitedList[index].image!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      homeScreenController
                                          .topVisitedList[index].author!,
                                      style: TextStyleManager.posterSubTitle),
                                  Row(
                                    children: [
                                      Text(
                                          homeScreenController
                                              .topVisitedList[index].view!,
                                          style:
                                              TextStyleManager.posterSubTitle),
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
                          homeScreenController.topVisitedList[index].title!,
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
      ),
    );
  }

// top Podcast
  Widget topPodcast({required Size size, required double bodyMargin}) {
    return Obx(
      () => SizedBox(
        height: size.height / 4,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topPodcastlist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Column(
                children: [
                  SizedBox(
                      height: size.height / 5.2,
                      width: size.width / 2.4,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastlist[index].poster!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          );
                        },
                        placeholder: (context, url) =>
                            const SpinKitFadingCircle(
                          color: SolidColors.primaryColor,
                          size: 22,
                        ),
                        errorWidget: (context, url, error) {
                          return Image.asset(
                            Assets.images.placeholder.path,
                            fit: BoxFit.cover,
                          );
                        },
                      )),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                      width: size.width / 2.4,
                      child: Text(
                        homeScreenController.topPodcastlist[index].title!,
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

//Poster
  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.2,
          height: size.height / 4.2,
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              );
            },
            placeholder: (context, url) => const SpinKitFadingCircle(
              color: SolidColors.primaryColor,
              size: 22,
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              size: 50,
              color: Colors.grey,
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 15,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        homepagePosterMap["writer"] +
                            " - " +
                            homepagePosterMap["date"],
                        style: TextStyleManager.posterSubTitle),
                    Row(
                      children: [
                        Text(homepagePosterMap['view'],
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
              Text(homepagePosterMap["title"],
                  style: TextStyleManager.posterTitle)
            ],
          ),
        )
      ],
    );
  }

//Tags
  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: taglist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(4, 8, index == 0 ? bodyMargin : 12, 8),
            child: MainTag(
              index: index,
            ),
          );
        },
      ),
    );
  }
}
