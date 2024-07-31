import 'package:get/state_manager.dart';
import 'package:techblog/component/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> taglist = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastlist = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;

    var response = await DioService().getmethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcastlist.add(PodcastModel.fromJson(element));
      });
      response.data['tags'].forEach((element) {
        taglist.add(TagsModel.fromJson(element));
      });

      poster.value = PosterModel.fromjason(response.data['poster']);

      loading.value = false;
    }
  }
}
