import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/color_manager.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/text_style_manager.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';
import 'package:techblog/view/register_intro.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

final GlobalKey <ScaffoldState> _key = GlobalKey();

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

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
            padding:  EdgeInsets.only(right: bodyMargin , left: bodyMargin),
            child: ListView(
              children: [
                DrawerHeader(
                    child: Image.asset(
                  Assets.images.logo.path,
                  scale: 3,
                )),
                ListTile(
                  onTap: () {},
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
                  onTap: () {},
                  title: Text(
                    "اشتراک گذاری تک بلاگ ",
                    style: TextStyleManager.registerIntroStyle,
                  ),
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  onTap: () {},
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
            padding: const EdgeInsets.only(right: 12 , left: 12),
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
              child: IndexedStack(
            index: selectedPageIndex,
            children: [
              HomeScreen(size: size, bodyMargin: bodyMargin),
              ProfileScreen(size: size, bodyMargin: bodyMargin),
            ],
          )),
          //Bottom Nav Bar
          BottomNavBar(
            size: size,
            bodyMargin: bodyMargin,
            changeScreen: (int value) {
              setState(() {
                selectedPageIndex = value;
              });
            },
          ),
        ]),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
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
                  icon: const Icon(CupertinoIcons.house_fill),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const RegisterIntro();
                      },
                    ));
                  },
                  icon: const Icon(CupertinoIcons.pencil_outline),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: const Icon(CupertinoIcons.person_fill),
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
