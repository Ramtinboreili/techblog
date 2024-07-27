import 'package:flutter/material.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/string_Manager.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/text_style_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.bodyMargin,
  });

  final Size size;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox( height: size.height/9,),
            // profile pic
            Image.asset(
              Assets.images.pAvatar.path,
              height: 110,
            ),
            
            const SizedBox(
              height: 12,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  Assets.icons.seeMore.provider(),
                  color: SolidColors.seeMore,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  MyStrings.imageProfileEdit,
                  style: TextStyleManager.viewHotestBlog,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
             //name and Email 
            Center(
              child: Text(
                "رامتین یریلی ",
                style: TextStyleManager.profilename,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                "ramtinboreilidev@gmail.com",
                style: TextStyleManager.profilename,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            
            //Profile buttons 
            TechDivider(size: size),
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                  height: 50,
                  child: Center(
                      child: Text(
                    MyStrings.myFavBlog,
                    style: TextStyleManager.profileBotton,
                  ))),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                  height: 50,
                  child: Center(
                      child: Text(
                    MyStrings.myFavPodcast,
                    style: TextStyleManager.profileBotton,
                  ))),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: (() {}),
              splashColor: SolidColors.primaryColor,
              child: SizedBox(
                  height: 50,
                  child: Center(
                      child: Text(
                    MyStrings.logOut,
                    style: TextStyleManager.logOutButtonstyle,
                  ))),
            ),
            const SizedBox(
              height: 65,
            ),
          ],
        ));
  }
}
