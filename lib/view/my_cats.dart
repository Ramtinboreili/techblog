import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/string_Manager.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/text_style_manager.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(bodyMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 28,
                ),
                //tchbot
                SvgPicture.asset(
                  Assets.images.tcbot.path,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                //text
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: MyStrings.successfulRegistration,
                        style: TextStyleManager.registerIntroStyle)),
                //text Field
                Padding(
                  padding: const EdgeInsets.fromLTRB(36, 16, 36, 32),
                  child: TextField(
                    onChanged: (value) {},
                    style: TextStyleManager.tFieldTextStyle,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "نام و نام خانوادگی",
                      hintStyle: TextStyleManager.hintTextStyle,
                    ),
                  ),
                ),
                Text(
                  MyStrings.chooseCats,
                  style: TextStyleManager.registerIntroStyle,
                ),
                //tag List
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: taglist.length,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.3),
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              if (selectedTags.contains(taglist[index])) {
                              } else {
                                setState(() {
                                  selectedTags.add(taglist[index]);
                                });
                              }
                            },
                            child: MainTag(index: index));
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Image.asset(
                  Assets.icons.downCatArrow.path,
                  scale: 2,
                ),
                //Selected Tags
                Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: selectedTags.length,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.3),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: SolidColors.surface,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 4, 6, 4),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedTags.removeAt(index);
                                    });
                                  },
                                  child: const Icon(
                                    CupertinoIcons.delete,
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Center(
                                  child: Text(
                                    selectedTags[index].title,
                                    style: TextStyleManager.tagTextStyle2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
