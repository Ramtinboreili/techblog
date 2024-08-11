import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/string_Manager.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/controller/register_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Image.asset(
                  Assets.images.logo.path,
                  scale: 3,
                )),
                ListTile(
                  onTap: () {
                    
                  },
                  title: Text(
                    "پروفایل کاربری",
                    style: TextStyleManager.registerIntroStyle,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    "درباره تک بلاگ ",
                    style: TextStyleManager.registerIntroStyle,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () async {
                    await Share.share(MyStrings.shareText);
                  },
                  title: Text(
                    "اشتراک گذاری تک بلاگ ",
                    style: TextStyleManager.registerIntroStyle,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {
                    myLaunchUrl(MyStrings.techBlogGithubUrl);
                  },
                  title: Text(
                    " تگ بلاگ در گیت هاب",
                    style: TextStyleManager.registerIntroStyle,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          backgroundColor: SolidColors.scaffoldBg,
          title: Padding(
            padding: const EdgeInsets.only(right: 12, left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: const Icon(Icons.menu)),
                SizedBox(
                  height: size.height / 13.6,
                  child: Assets.images.logo.image(),
                ),
                const Icon(Icons.search)
              ],
            ),
          ),
        ),
        body: Stack(children: [
          //Home Screen
          Positioned.fill(
              child: Obx(
            () => IndexedStack(
              index: selectedPageIndex.value,
              children: [
                HomeScreen(size: size, bodyMargin: bodyMargin),
                ProfileScreen(size: size, bodyMargin: bodyMargin),
              ],
            ),
          )),
          //Bottom Nav Bar
          BottomNavBar(
            size: size,
            bodyMargin: bodyMargin,
            changeScreen: (int value) {
              selectedPageIndex.value = value;
            },
          ),
        ]),
      ),
    );
  }
}

// bottom NavBar
// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomNavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(bodyMargin, 4, bodyMargin, 8),
          child: Container(
            height: size.height / 14,
            width: size.width / 15,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                gradient: LinearGradient(
                    colors: GradientColors.bottomNav,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (() => changeScreen(0)),
                  icon: const Icon(
                    CupertinoIcons.house_fill,
                    size: 32,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    Get.find<RegisterController>().toggleLogin();
                  },
                  icon: const Icon(
                    CupertinoIcons.pencil_outline,
                    size: 32,
                  ),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: const Icon(CupertinoIcons.person_fill, size: 32),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
