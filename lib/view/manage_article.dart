import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/string_Manager.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/controller/manage_article_controller.dart';
import 'package:techblog/gen/assets.gen.dart';

// ignore: must_be_immutable
class ManageArticle extends StatelessWidget {
  ManageArticle({super.key});

  var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar(" مدیریت مقالات"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
        child: Obx(() => manageArticleController.loading.value
            ? const Loading()
            : manageArticleController.articleList.isNotEmpty
                ? SizedBox(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: manageArticleController.articleList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            // Route to single manage '
                          },
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
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.fitHeight)),
                                    );
                                  },
                                  imageUrl: manageArticleController
                                      .articleList[index].image!,
                                  placeholder: (context, url) {
                                    return const Loading();
                                  },
                                  errorWidget: (context, url, error) {
                                    return const Icon(
                                        Icons.image_not_supported_outlined,
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
                                        manageArticleController
                                            .articleList[index].title!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyleManager.articlelistText,
                                      )),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              manageArticleController
                                                  .articleList[index].author!,
                                              style: TextStyleManager
                                                  .tagTextStyle2),
                                          const SizedBox(
                                            width: 18,
                                          ),
                                          Text(
                                            "${manageArticleController.articleList[index].view!} بازدید",
                                            style:
                                                TextStyleManager.tagTextStyle2,
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
                  )
                : articleEmptyState()),
      ),
      bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(20,4,20,20),
            child: ElevatedButton(
              style: ButtonStyle(fixedSize: WidgetStateProperty.all(Size(Get.width, 55))),
              onPressed: () {},
              child: const Text(
                " بریم برای نوشتن یه مقاله باحال",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
    
    ));
  }
// Empty State
  Center articleEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //tchBot
          Image.asset(
            Assets.images.emptyState.path,
            height: 130,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.articleEmpty,
                    style: TextStyleManager.registerIntroStyle)),
          ),
          //elevated Button
          
        ],
      ),
    );
  }
}
