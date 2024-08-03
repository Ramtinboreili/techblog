
import 'package:techblog/component/api_constant.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;

  ArticleInfoModel();

  ArticleInfoModel.fromJson(Map<String , dynamic> element){

   id = element['info']['id'];
   title= element['info']['title'];
   content= element['info']['content'];
   image=ApiConstant.hosttDlUrl+element['info']['image'];
   catId= element['info']['cat_id'];
   catName= element['info']['cat_name'];
   author= element['info']['author'];
   view= element['info']['view'];
   status= element['info']['1'];
   createdAt= element['info']['created_at'];
   isFavorite= element['created_at'];

  }

}

// {
//     "info": {
//         "id": "1",
//         "title": "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
//         "content": "آخرین بازی از فرنچایز اساسینز کرید یعنی بازی اساسینز کرید والهالا، یکی از آن بازی‌های گسترده و جهان بازی است که داستان وایکینگ‌ها را روایت می‌کند و جنبه‌های اکشن ادونچر (ماجراجویی) آن با تکیه بر المان‌های نقش‌آفرینی گیمرهای زیادی را به تحسین وا داشته است. در این بین باید اشاره کنیم که بسته الحاقی Dawn of Ragnarok هم مدتی است که عرضه شده و اگر طرفدار این بازی باشید به احتمال زیاد تا به الآن باید آن را تجربه کرده و چشم‌انتظار قسمت بعدی نشسته‌اید. پس با ویجیاتو و معرفی ۵ بازی مشابه Assassin’s Creed Valhalla همراه باشید.\r\n\r\nاز داستان‌سرایی مثال‌زدنی تا شخصیت پردازی‌ و طراحی و موسیقی‌های به کار رفته در Assassin’s Creed Valhalla همگی باعث می‌شوند تا این قسمت از مجموعه حرف‌های زیادی برای گفتن داشته باشد و هویت شکل گرفته تازه در میان این فرنچایز را به درجه بالایی برساند. یوبی‌سافت مونترال به واسطه طراحی و چینش درست مکانیزم‌های گیم‌پلی و سیستم کلی بازی سعی داشته تا این بار حس غوطه‌وری بیشتری را برای گیمر به ارمغان بیاورد و خوشبختانه اساسینز کرید والهالا حسابی به منبع ژانر خود وفادار است؛ مساله‌‎ای که بسیاری را ناخشنود و در عوض رضایت عده‌ای را به دست آورده است.",
//         "image": "/Techblog/assets/upload/images/article/valhalla.jpg",
//         "cat_id": "1",
//         "cat_name": "اخبار و مقالات",
//         "author": "بهرام امینی",
//         "view": "5191",
//         "status": "1",
//         "created_at": "۱۴۰۱/۲/۱۶"
//     },
//     "isFavorite": false,

// }