import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/controller/file_controller.dart';
import 'package:techblog/controller/manage_article_controller.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/my_component.dart';

import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/pick_file.dart';

// ignore: must_be_immutable
class SingelManageArticle extends StatelessWidget {
  var manageArticleController = Get.find<ManageArticleController>();
  FileController fileController = Get.put(FileController());
  SingelManageArticle({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              //Article Poster
              Stack(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: Get.height / 3,
                    child: fileController.file.value.name == "nothing"
                        ? CachedNetworkImage(
                            imageBuilder: (context, imageProvider) {
                              return Image(image: imageProvider);
                            },
                            imageUrl: manageArticleController
                                .articleInfoModel.value.image!,
                            placeholder: (context, url) {
                              return const Loading();
                            },
                            errorWidget: (context, url, error) {
                              return Image.asset(
                                  Assets.images.placeholder.path);
                            },
                          )
                        : Image.file(
                            File(fileController.file.value.path!),
                            fit: BoxFit.cover,
                          ),
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
                                colors: GradientColors.singleAppbarGradiant,
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            IconButton(
                                onPressed: () => Get.back(),
                                icon: const Icon(
                                  CupertinoIcons.back,
                                  color: Colors.white,
                                  size: 30,
                                )),
                            const Expanded(child: SizedBox()),
                          ],
                        ),
                      )),
                  //picture button
                  Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            //pick file
                            pickFiles();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    topLeft: Radius.circular(16)),
                                color: SolidColors.primaryColor),
                            height: 40,
                            width: Get.width / 2.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "انتخاب تصویر",
                                  style: TextStyleManager.elevBtextStyle2,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Icon(
                                  CupertinoIcons.add,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              // edit blog title
              Padding(
                padding: EdgeInsets.fromLTRB(0, 24, bodyMargin, 0),
                child: GestureDetector(
                  onTap: () {
                    getTitle();
                  },
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
                        "ویرایش عنوان مقاله",
                        style: TextStyleManager.viewHotestBlog,
                      )
                    ],
                  ),
                ),
              ),
              //article title
              Padding(
                padding: EdgeInsets.fromLTRB(bodyMargin, 16, bodyMargin, 16),
                child: Text(
                  manageArticleController.articleInfoModel.value.title!,
                  maxLines: 2,
                  style: TextStyleManager.singleArticlelistText,
                ),
              ),
              //edit article content
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, bodyMargin, 0),
                child: GestureDetector(
                  // onTap: () => Get.to(articleContentEditor()),
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
                        "ویرایش متن اصلی مقاله",
                        style: TextStyleManager.viewHotestBlog,
                      )
                    ],
                  ),
                ),
              ),
              //Article
              Padding(
                padding: EdgeInsets.all(bodyMargin),
                child: HtmlWidget(
                  manageArticleController.articleInfoModel.value.content!,
                  textStyle: TextStyleManager.hintTextStyle,
                  onLoadingBuilder: (context, element, loadingProgress) =>
                      const Loading(),
                  enableCaching: true,
                ),
              ),
              //ِedit tags
              Padding(
                padding: EdgeInsets.fromLTRB(0, 12, bodyMargin, 0),
                child: GestureDetector(
                  onTap: () {
                    chooseCatsBottomSheet();
                  },
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
                        "انتخاب دسته بندی",
                        style: TextStyleManager.viewHotestBlog,
                      )
                    ],
                  ),
                ),
              ),

              // SizedBox(
              //   height: 45,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: manageArticleController.tagList.length,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //         onTap: () async {
              //           var tagid =
              //               manageArticleController.tagList[index].id!;
              //           await Get.find<ListArticleController>()
              //               .getArticleListWithTagId(tagid);
              //           Get.to(ArticleListScreen());
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              //           child: Container(
              //             decoration: BoxDecoration(
              //               color:
              //                   const Color.fromARGB(255, 226, 226, 226),
              //               borderRadius: BorderRadius.circular(20),
              //             ),
              //             child: Padding(
              //               padding:
              //                   const EdgeInsets.fromLTRB(12, 4, 6, 4),
              //               child: Row(
              //                 children: [
              //                   const SizedBox(
              //                     width: 6,
              //                   ),
              //                   Center(
              //                     child: Text(
              //                       manageArticleController
              //                           .tagList[index].title!,
              //                       style: TextStyleManager.tagTextStyle2,
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              //SeeMore
            ],
          ),
        ),
      ),
    ));
  }

  getTitle() {
    Get.defaultDialog(
      title: "عنوان مقاله",
      titleStyle: TextStyleManager.posterTitle,
      content: TextField(
        controller: manageArticleController.titleTextEditingController,
        keyboardType: TextInputType.text,
        style: const TextStyle(color: SolidColors.colorTitle),
        decoration: InputDecoration(
          fillColor: SolidColors.scaffoldBg,
          hintText: "اینجا بنویس ",
          hintStyle: TextStyleManager.hintTextStyle,
        ),
      ),
      backgroundColor: SolidColors.primaryColor,
      radius: 16,
      confirm: ElevatedButton(
          onPressed: () {
            manageArticleController.updatetitle();
            Get.back();
          },
          child: const Text("ثبت")),
    );
  }

  chooseCatsBottomSheet() {
    Get.bottomSheet(Container(
      height: Get.height / 1.5,
      width: Get.width,
      decoration: const BoxDecoration(
          color: SolidColors.scaffoldBg,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [Text("Choose youre Category")],
        ),
      ),
    ));
  }
}
