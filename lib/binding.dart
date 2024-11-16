import 'package:get/get.dart';
import 'package:techblog/controller/manage_article_controller.dart';
import 'package:techblog/controller/list_articel_controller.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/controller/single_articel_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(ListArticleController());
    Get.lazyPut(() => SingleArticelController());
  }
}

class ArticleManageBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    // Get.put(ManageArticleController());
    Get.lazyPut(() => ManageArticleController());

  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RegisterController());
  }
}
