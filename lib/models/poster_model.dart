class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    required this.id,
    required this.image,
    required this.title,
  });

  PosterModel.fromjason(Map<String,dynamic> element){
   id=element["id"];
   title=element["title"];
   image=element["image"];


  }


}



  // "poster": {
  //       "id": "16",
  //       "title": "اطلاعات جدیدی از بازی Assassin's Creed Mirage فاش شد",
  //       "image": "/Techblog/assets/upload/images/article/20220904181457.jpg"

  //   },