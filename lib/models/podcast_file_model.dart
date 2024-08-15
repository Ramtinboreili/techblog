import 'package:techblog/component/api_constant.dart';

class PodcastFileModel {
  String? id;
  String? podcastId;
  String? file;
  String? title;
  String? length;

  PodcastFileModel();

  PodcastFileModel.fromJson(Map<String, dynamic> element) {
    id = element['id'];
    podcastId = element['podcast_id'];
    file = ApiConstant.hosttDlUrl + element['file'];
    title = element['title'];
    length = element['length'];
  }
}

//  {
//             "id": "66",
//             "podcast_id": "125",
//             "file": "/Techblog/assets/upload/images/podcast/files/20240630171430.mp3",
//             "title": "clothes",
//             "length": "2"
//         }