class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  PodcastModel({
    required this.id,
    required this.author,
    required this.catName,
    required this.createdAt,
    required this.poster,
    required this.status,
    required this.title,
    required this.view,
  });

  PodcastModel.fromjason(Map<String, dynamic> element) {
     id = element["id"];
     title= element["title"];
     poster= element["poster"];
     catName= element["cat_name"];
     author= element["author"];
     view= element["view"];
     status= element["status"];
     createdAt= element["created_at"];
  }
}


// "id": "127",
//             "title": "تست هستم",
//             "poster": "''",
//             "cat_name": "اخبار و مقالات",
//             "author": "بهرام امینی",
//             "view": "4",
//             "status": "0",
//             "created_at": "۱۴۰۳/۴/۱۳"

