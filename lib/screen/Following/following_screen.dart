import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:news_apps/widget/short_coverage.dart';
import 'package:news_apps/widget/sized_pad.dart';

import '../../Controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../../widget/app_bar.dart';
import '../../widget/profile_dialog.dart';
import '../../widget/large_coverage_card.dart';

class FollowingScreen extends StatelessWidget {
  FollowingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _followingCard(
                      title: "Topics",
                      des:
                          "Follow topics to see more stories about your intersts in for you",
                      image:
                          "https://learningcontent.cisco.com/images/HashTag_icon_v2.png"),
                  _desh(),
                  _followingCard(
                      title: "Sources",
                      des:
                          "Follow topics to see more stories about your intersts in for you",
                      image:
                          "https://learningcontent.cisco.com/images/HashTag_icon_v2.png"),
                  _desh(),
                  _followingCard(
                      title: "Local",
                      des:
                          "Follow topics to see more stories about your intersts in for you",
                      image:
                          "https://learningcontent.cisco.com/images/HashTag_icon_v2.png"),
                  _desh(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedPad(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          "Saved stories",
                          style: CustomTextStyle.h3(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedPad(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: const Divider(),
                      ),
                      const SizedPad(),
                      orientation == Orientation.portrait
                          ? _portrait()
                          : _landScape(),
                      const SizedPad(),
                      const Divider(),
                      const SizedPad(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "View all and manage",
                          style: CustomTextStyle.h4(
                              color:
                                  Get.find<ThemeController>().isDarkTheme.value
                                      ? AppColors.flyBlue
                                      : AppColors.flickrBlue),
                        ),
                      ),
                      const SizedPad(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  _portrait() {
    return ListView.separated(
      itemCount: 1,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10.h),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const ShortCoverageCard(
          isCoverageIcon: false,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
          child: Divider(
            color: AppColors.borderColor,
          ),
        );
      },
    );
  }

  _landScape() {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 10.w,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return LargeCoverageCard(
            isCoverageIcon: false, isFullCoverage: false);
      },
    );
  }

  _desh() {
    return Obx(
      () => Container(
        height: 10.h,
        color: Get.find<ThemeController>().isDarkTheme.value
            ? AppColors.jaguarColor
            : const Color(0xFFF0F1F3),
      ),
    );
  }

  _followingCard({String? title, des, image}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedPad(
            height: 20,
          ),
          Text(
            title!,
            style: CustomTextStyle.h3(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedPad(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    des!,
                  ),
                  const SizedPad(
                    height: 30,
                  ),
                  Text(
                    "Follow ${title.toLowerCase()}",
                    style: CustomTextStyle.h4(
                        color: Get.find<ThemeController>().isDarkTheme.value
                            ? AppColors.flyBlue
                            : AppColors.flickrBlue),
                  )
                ],
              )),
              SizedBox(
                width: 15.w,
              ),
              CircleAvatar(
                key: UniqueKey(),
                radius: 50.r,
                backgroundColor: Colors.grey,
                backgroundImage: CachedNetworkImageProvider(image!),
              ),
              SizedBox(
                width: 15.w,
              ),
            ],
          ),
          const SizedPad(
            height: 20,
          ),
        ],
      ),
    );
  }

  
  }

