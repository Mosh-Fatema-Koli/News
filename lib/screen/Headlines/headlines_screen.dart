import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/Controller/headlines_controller.dart';
import 'package:news_apps/utils/app_texts.dart';
import 'package:news_apps/utils/icons.dart';
import 'package:news_apps/widget/icon_widget.dart';

import '../../utils/colors.dart';
import '../../utils/styles.dart';
import '../../widget/profile_dialog.dart';
import 'component/latest_headlines.dart';

class HeadLinesScreen extends StatelessWidget {
  const HeadLinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headLinesController = Get.put(HeadLinesController());
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          _appBar(headLinesController),
        ];
      },
      body: TabBarView(
        controller: headLinesController.tabController,
        children: const [
          LatestHeadLinesWidget(),
          // Add the content for Tab 2 here
          Center(child: Text('Tab 2 content')),
          Center(child: Text('Tab 1 content')),
          // Add the content for Tab 2 here
          Center(child: Text('Tab 2 content')),
        ],
      ),
    ));
  }

   _appBar(HeadLinesController headLinesController) {
    return SliverAppBar(
     leadingWidth:55.w,
      leading: InkWell(
        onTap: () {
          Get.dialog(const ProfileDialog());
        },
        child: Padding(
          padding:  EdgeInsets.only(left :15.w),
          child: CircleAvatar(
            key: UniqueKey(),
            radius:10.r,
            backgroundColor: Colors.grey,
            backgroundImage: const CachedNetworkImageProvider(
                "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg"),
          ),
        ),
      ),
      title: Text(
        AppTexts.headlines,
        style: CustomTextStyle.h2(),
      ),
      centerTitle: true,
      pinned:
          true, // Set to true if you want the app bar to be pinned while scrolling
      floating: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon:IconsWidget(image:AppIcons.search)),
       
        SizedBox(
          width: 10.w,
        )
      ],

      bottom: TabBar(
        indicatorColor: AppColors.flickrBlue,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: CustomTextStyle.h4(fontWeight: FontWeight.w500),
        unselectedLabelStyle: CustomTextStyle.h4(fontWeight: FontWeight.w500),
        labelColor: AppColors.flickrBlue,
        unselectedLabelColor:
            Get.isDarkMode ? AppColors.white : AppColors.headingColor,
        controller: headLinesController.tabController,
        tabs: headLinesController.myTabs,
      ),
    );
  }
}
