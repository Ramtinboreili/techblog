
import 'package:get/get.dart';
import 'package:techblog/controller/list_articel_controller.dart';
import 'package:techblog/controller/single_articel_controller.dart';

class ArticleBinding implements Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(ListArticleController());
    Get.lazyPut(() => SingleArticelController());

  }
  
}
class RegisterBinding implements Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(ListArticleController());
    Get.lazyPut(() => SingleArticelController());

  }
  
}