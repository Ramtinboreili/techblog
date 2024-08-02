import 'package:get/get.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_info_model.dart';
import 'package:techblog/services/dio_service.dart';

class SingleArticelController extends GetxController{

  RxBool loading=false.obs;
  RxInt id =RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;



  getArticleInfo() async {
    loading.value=true;
    //https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=1&user_id=1
    //TODO: User Ro dorost kon Null ferestadi
    var userId = '';
    var response = await DioService().getmethod("${ApiConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId");
    if (response.statusCode == 200) {
      
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);

      loading.value=false;
    }
  }



}



