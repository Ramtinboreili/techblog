import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class ManageArticleController extends GetxController {

  RxList<ArticleModel> articleList = RxList.empty();
  RxBool loading = false.obs;

  @override
  onInit(){
    super.onInit();
    getManageArticle();
  }

  getManageArticle()async{
    loading.value = true ;
    // var response = await DioService().getmethod(ApiConstant.publishedByMe+GetStorage().read(StorageConst.userId));
    var response = await DioService().getmethod("${ApiConstant.publishedByMe}1");
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      // articleList.clear();
      loading.value = false ; 
    }
  }

}