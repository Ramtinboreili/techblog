
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:html_editor_enhanced/html_editor.dart';
// import 'package:techblog/component/my_component.dart';
// import 'package:techblog/component/string_Manager.dart';
// import 'package:techblog/controller/manage_article_controller.dart';

// // ignore: must_be_immutable
// class articleContentEditor extends StatelessWidget {
//   articleContentEditor({super.key});
  
//   final HtmlEditorController controller = HtmlEditorController();
//   var manageArticleController = Get.put(ManageArticleController());
//   @override
//   Widget build(BuildContext context) {
    
//     return GestureDetector(
//          onTap: () => controller.clearFocus(),
//          child: Scaffold(
//           appBar:appBar(MyStrings.titleAppBarArticleContentEditor),
//           body: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 HtmlEditor(
//                   controller: controller,
//                   htmlEditorOptions: HtmlEditorOptions(
//                     hint: MyStrings.hintArticleContentEditor,
//                     shouldEnsureVisible: true,
//                     initialText: manageArticleController.articleInfoModel.value.content!
//                   ),
//                   callbacks: Callbacks(
//                     onChangeContent: (p0) {
//                       manageArticleController.articleInfoModel.update((val) {
//                         val?.content =p0;
//                       },);
//                       log(manageArticleController.articleInfoModel.value.content.toString());
//                     },
//                   ),
                  
//                   )
//               ],

//           )), 
//          ),
//     );

//   }
// }