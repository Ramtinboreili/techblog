
import 'package:techblog/component/api_constant.dart';

class ArticleModel{
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;


  ArticleModel({

    this.id,
    this.title,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    this.createdAt,
});

  ArticleModel.fromJson(Map<String,dynamic> element){
    id=element["id"]??'';
    title=element["title"]??'';
    image=ApiConstant.hosttDlUrl+element["image"];
    catId=element["cat_id"]??'';
    catName=element["cat_name"]??'';
    author=element["author"];
    view=element["view"]??'';
    status=element["status"]??'';
    createdAt=element["created_at"]??'';
  }

}