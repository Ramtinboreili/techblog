import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/view/singel.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar("مقالات جدید"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
        child: Obx(
          () => SizedBox(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: homeScreenController.topVisitedList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to( Singel()),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fitHeight)),
                            );
                          },
                          imageUrl:
                              homeScreenController.topVisitedList[index].image!,
                          placeholder: (context, url) {
                            return const Loading();
                          },
                          errorWidget: (context, url, error) {
                            return const Icon(Icons.image_not_supported_outlined,
                                color: Colors.grey);
                          },
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        SizedBox(
                          width: 260,
                          child: Column(
                            children: [
                              SizedBox(
                                  child: Text(
                                homeScreenController.topVisitedList[index].title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyleManager.articlelistText,
                              )),
                              const SizedBox(height: 16,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      homeScreenController
                                          .topVisitedList[index].author!,
                                      style: TextStyleManager.tagTextStyle2),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    "${homeScreenController.topVisitedList[index].view!} بازدید",
                                    style: TextStyleManager.tagTextStyle2,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ));
  }
}
