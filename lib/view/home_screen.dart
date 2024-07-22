import 'package:flutter/material.dart';
import 'package:techblog/color_manager.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:techblog/my_component.dart';
import 'package:techblog/string_manager.dart';
import 'package:techblog/text_style_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
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
        children: [
          const SizedBox(
            height: 12,
          ),
          //poster
          homePagePoster(size: size),
          const SizedBox(
            height: 28,
          ),
          //tag list
          TagList(bodyMargin: bodyMargin),
          //see More
          Padding(
            padding: EdgeInsets.fromLTRB(0, 24, bodyMargin, 12),
            child: Row(
              children: [
                ImageIcon(
                    Assets.icons.seeMore.provider(),
                    color: SolidColors.seeMore,
                  ),
                  const SizedBox(width: 6,),
                Text(
                  MyStrings.viewHotestBlog,
                  style: TextStyleManager.viewHotestBlog,
                )
              ],
            ),
          ),
          //Blog List
          Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              height: size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogList.getRange(0, 8).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height / 5.2,
                          width: size.width / 2.4,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            blogList[index].imageUrl),
                                        fit: BoxFit.cover)),
                                foregroundDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    gradient: const LinearGradient(
                                        colors: GradientColors.blogPost,
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                              ),
                              Positioned(
                                right: 0,
                                left: 0,
                                bottom: 8,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(blogList[index].writer,
                                          style:
                                              TextStyleManager.posterSubTitle),
                                      Row(
                                        children: [
                                          Text(blogList[index].views,
                                              style: TextStyleManager
                                                  .posterSubTitle),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const Icon(
                                            Icons.remove_red_eye_outlined,
                                            size: 20,
                                            color: SolidColors.posterSubTitle,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                            width: size.width / 2.4,
                            child: Text(
                              blogList[index].title,
                              style: TextStyleManager.blogListtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          //see More2
          Padding(
            padding: EdgeInsets.fromLTRB(0, 24, bodyMargin, 12),
            child: Row(
              children: [
                ImageIcon(
                    Assets.icons.seeMore.provider(),
                    color: SolidColors.seeMore,
                  ),
                  const SizedBox(width: 6,),
                Text(
                  MyStrings.viewHotestPodCasts,
                  style: TextStyleManager.viewHotestBlog,
                )
              ],
            ),
          ),
          //Podcast List
          Padding(
            padding: const EdgeInsets.all(4),
            child: SizedBox(
              height: size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogList.getRange(0, 8).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height / 5.2,
                          width: size.width / 2.4,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(blogList[index].imageUrl),
                                    fit: BoxFit.cover)),
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: const LinearGradient(
                                    colors: GradientColors.blogPost,
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter)),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                            width: size.width / 2.4,
                            child: Text(
                              blogList[index].title,
                              style: TextStyleManager.blogListtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: size.height / 8,
          )
        ],
      ),
    );
  }
}
// Tag Listview
class TagList extends StatelessWidget {
  const TagList({
    super.key,
    required this.bodyMargin,
  });

  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: taglist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                4, 8, index == 0 ? bodyMargin : 12, 8),
            child: MainTag(index: index,),
          );
        },
      ),
    );
  }
}

// Poster
class homePagePoster extends StatelessWidget {
  const homePagePoster({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.2,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(homepagePosterMap["imageAsset"]),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(16),
          ),
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                  colors: GradientColors.homePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 15,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        homepagePosterMap["writer"] +
                            " - " +
                            homepagePosterMap["date"],
                        style: TextStyleManager.posterSubTitle),
                    Row(
                      children: [
                        Text(homepagePosterMap['view'],
                            style: TextStyleManager.posterSubTitle),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 20,
                          color: SolidColors.posterSubTitle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Text(homepagePosterMap["title"],
                  style: TextStyleManager.posterTitle)
            ],
          ),
        )
      ],
    );
  }
}
