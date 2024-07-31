import 'package:techblog/component/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
     this.id,
     this.image,
     this.title,
  });

  PosterModel.fromjason(Map<String,dynamic> element){
   id=element["id"];
   title=element["title"];
   image=ApiConstant.hosttDlUrl+element["image"];


  }


}



  // "poster": {
  //       "id": "16",
  //       "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
  //       "image": "/Techblog/assets/upload/images/article/20220904181457.jpg"

  //   },