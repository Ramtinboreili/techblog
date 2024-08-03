import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  getArticleList() async {
    // articleList.clear();
    loading.value = true;
    var response = await DioService().getmethod(ApiConstant.getArticelList);
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }

  getArticleListWithTagId(String id) async {
    articleList.clear();
    loading.value = true;
    var response = await DioService().getmethod(
        "${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=1");
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      loading.value = false;
    }
  }
}



  // getArticleWithTag(String id) async {
  //   articleList.clear();
  //   loading.value=true;
  //   var response = await DioService().getmethod('${ApiConstant.baseUrl}article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');
  //   if (response.statusCode == 200) {
  //     response.data.forEach((element) {
  //       articleList.add(ArticleModel.fromJson(element));
  //     });
  //     loading.value=false;
  //   }
  // }
