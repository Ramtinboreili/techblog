import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/component/command.dart';
import 'package:techblog/component/storage_const.dart';
import 'package:techblog/controller/file_controller.dart';
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagList = RxList.empty();
  TextEditingController titleTextEditingController = TextEditingController();
  RxBool loading = false.obs;
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
          "عنوان اینجا قرار میگیرد ",
          '''    لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که 
''',
          '')
      .obs;

  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    loading.value = true;
    // var response = await DioService().getmethod(ApiConstant.publishedByMe+GetStorage().read(StorageConst.userId));
    var response =
        await DioService().getmethod("${ApiConstant.publishedByMe}406");
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      // articleList.clear();
      loading.value = false;
    }
  }

  updatetitle() {
    articleInfoModel.update(
      (val) {
        val!.title = titleTextEditingController.text;
      },
    );
  }

  storeArticle() async {
    var fileController = Get.find<FileController>();
    loading.value = true;
    Map<String, dynamic> map = {
      ApiKeyConstant.title: articleInfoModel.value.title,
      ApiKeyConstant.catId: articleInfoModel.value.catId,
      ApiKeyConstant.command: Commands.store,
      ApiKeyConstant.content: articleInfoModel.value.content,
      ApiKeyConstant.image:
          await dio.MultipartFile.fromFile(fileController.file.value.path!),
      ApiKeyConstant.userId: GetStorage().read(StorageConst.userId),
      ApiKeyConstant.tagList: '[ ]',
    };
    var response = await DioService().postmethod(map, ApiConstant.articlePost);
    log(response.data.toString());

    loading.value = false;
  }
}
