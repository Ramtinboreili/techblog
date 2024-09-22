import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/my_component.dart';
import 'package:techblog/component/my_drcoratins.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/controller/single_podcast_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/podcast_model.dart';

// ignore: must_be_immutable
class SinglePodcast extends StatelessWidget {
  late SinglePodcastController spController;
  late PodcastModel podcastModel;

  SinglePodcast({super.key}) {
    podcastModel = Get.arguments;
    spController = Get.put(SinglePodcastController(id: podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(podcastModel.id);
    }
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            left: 0,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //podcast  Poster
                  Stack(
                    children: [
                      SizedBox(
                        height: Get.height / 3,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageBuilder: (context, imageProvider) {
                            return Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            );
                          },
                          imageUrl: podcastModel.poster!,
                          placeholder: (context, url) {
                            return const Loading();
                          },
                          errorWidget: (context, url, error) {
                            return Image.asset(Assets.images.placeholder.path);
                          },
                        ),
                      ),
                      //Single AppBar
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: GradientColors.singleAppbarGradiant,
                                    end: Alignment.bottomCenter,
                                    begin: Alignment.topCenter)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  width: 12,
                                ),
                                IconButton(
                                    onPressed: () => Get.back(),
                                    icon: const Icon(
                                      CupertinoIcons.back,
                                      color: Colors.white,
                                      size: 30,
                                    )),
                                const Expanded(child: SizedBox()),
                                const Icon(
                                  CupertinoIcons.share,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                const Icon(
                                  CupertinoIcons.bookmark,
                                  color: Colors.white,
                                  size: 28,
                                ),
                                const SizedBox(
                                  width: 12,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  //podcast title
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        podcastModel.title!,
                        maxLines: 2,
                        style: TextStyleManager.singleArticlelistText,
                      ),
                    ),
                  ),
                  // profile
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Image(
                          image: Image.asset(
                            Assets.images.pAvatar.path,
                          ).image,
                          height: 50,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          podcastModel.author!,
                          style: TextStyleManager.profilename,
                        ),
                      ],
                    ),
                  ),
                  //podcast episods list
                  SizedBox(
                    height: Get.height / 3.5,
                    child: Obx(
                      () => ListView.builder(
                        itemCount: spController.podcastFileList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              await spController.player
                                  .seek(Duration.zero, index: index);
                              spController.player.play();
                              spController.startProgress();
                              spController.playState.value =
                                  spController.player.playing;
                              spController.currentFileIndex.value =
                                  spController.player.currentIndex!;
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 8, 16, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        CupertinoIcons.mic_fill,
                                        color: SolidColors.seeMore,
                                        size: 30,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: Get.width / 1.5,
                                        child: Obx(
                                          () => Text(
                                              spController
                                                  .podcastFileList[index]
                                                  .title!,
                                              style: spController
                                                          .currentFileIndex
                                                          .value ==
                                                      index
                                                  ? TextStyleManager
                                                      .selectedPOdcast
                                                  : TextStyleManager
                                                      .articlelistText),
                                        ),
                                      )
                                    ],
                                  ),

                                  //duration
                                  Text(
                                      "${spController.podcastFileList[index].length!}:00")
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 2.1,
                  )
                ],
              ),
            ),
          ),
          //player
          Positioned(
              bottom: 12,
              left: 16,
              right: 16,
              child: Container(
                height: Get.height / 8,
                decoration: MyDecorations.mainGradient,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Obx(
                        () => ProgressBar(
                          progress: spController.progressValue.value,
                          total: spController.player.duration ??
                              const Duration(seconds: 0),
                          buffered: spController.bufferedValue.value,
                          baseBarColor: Colors.white,
                          progressBarColor: SolidColors.seeMore,
                          thumbColor: Colors.lightBlueAccent,
                          timeLabelTextStyle: TextStyleManager.tagTextStyle,
                          onSeek: (position) async {
                            spController.player.seek(position);
                            if (spController.player.playing) {
                              spController.startProgress();
                            } else if (position <= const Duration(seconds: 0)) {
                              await spController.player.seekToNext();
                              spController.currentFileIndex.value =
                                  spController.player.currentIndex!;
                            }
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(CupertinoIcons.shuffle,
                              color: Colors.white, size: 35),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await spController.player.seekToNext();
                                  spController.currentFileIndex.value =
                                      spController.player.currentIndex!;
                                },
                                child: const Icon(
                                    CupertinoIcons.forward_end_fill,
                                    color: Colors.white,
                                    size: 40),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () {
                                  spController.player.playing
                                      ? spController.player.pause()
                                      : spController.player.play();

                                  spController.player.playing
                                      ? spController.timer?.cancel()
                                      : spController.startProgress();

                                  spController.playState.value =
                                      spController.player.playing;

                                  spController.currentFileIndex.value =
                                      spController.player.currentIndex!;
                                },
                                child: Obx(
                                  () => Icon(
                                      spController.playState.value
                                          ? CupertinoIcons.pause_circle_fill
                                          : CupertinoIcons.play_circle_fill,
                                      color: Colors.white,
                                      size: 56),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await spController.player.seekToPrevious();
                                  spController.currentFileIndex.value =
                                      spController.player.currentIndex!;
                                },
                                child: const Icon(
                                  CupertinoIcons.backward_end_fill,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                spController.setLoopMode();
                              },
                              child: Icon(CupertinoIcons.repeat,
                                  color: spController.isLoopAll.value
                                      ? SolidColors.seeMore
                                      : Colors.white,
                                  size: 35),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
