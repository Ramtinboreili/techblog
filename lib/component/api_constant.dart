class ApiConstant {
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const hosttDlUrl = "https://techblog.sasansafari.com";
  static const getHomeItems = "${baseUrl}home/?command=index";
  static const getArticelList = "${baseUrl}article/get.php?command=info&id=1&user_id=";
  static const publishedByMe = "${baseUrl}article/get.php?command=published_by_me&user_id=";
  static const postregisters = "${baseUrl}register/action.php";
  static const articlePost = "${baseUrl}article/post.php";
  static const podcastFiles = "${baseUrl}podcast/get.php?command=get_files&podcats_id=";

}
class ApiKeyConstant {
  static const String title = "title";
  static const String content = "content";
  static const String catId = "cat_id";
  static const String tagList = "tag_list";
  static const String userId = "user_id";
  static const String image = "image";
  static const String command = "command";


}


