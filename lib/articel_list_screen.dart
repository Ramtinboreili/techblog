import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/controller/articel_controller.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
   ArticleListScreen({super.key});

  final ListArticleController listArticleController = Get.put(ListArticleController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar("مقالات جدید"),
      body: Obx(
        ()=> SizedBox(
          child: ListView.builder(
            itemCount: listArticleController.articleList.length,
            itemBuilder: (context, index) {
            return  Text(listArticleController.articleList[index].title!);
          },),
        ),
      ),
    ));
  }


}
