class ArticleModel {
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
    required this.id,
    required this.author,
    required this.catId,
    required this.catName,
    required this.createdAt,
    required this.image,
    required this.status,
    required this.title,
    required this.view,
  });

  ArticleModel.fromjason(Map<String, dynamic> element) {
     id = element["id"];
     title= element["title"];
     image= element["image"];
     catId= element["cat_id"];
     catName= element["cat_name"];
     author= element["author"];
     view= element["view"];
     status= element["status"];
     createdAt= element["created_at"];
  }
}


