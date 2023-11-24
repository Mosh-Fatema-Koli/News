import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/Controller/theme_controller.dart';
import 'package:news_apps/screen/Home/component/pick_story.dart';
import 'package:news_apps/utils/colors.dart';
import 'package:news_apps/utils/styles.dart';
import 'package:news_apps/widget/profile_dialog.dart';
import 'package:news_apps/widget/sized_pad.dart';

import '../../widget/app_bar.dart';
import 'component/all_storys_widget.dart';
import 'component/header_widget.dart';
import 'component/local_story.dart';
import 'component/top_stories_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder:(context, orientation) => 
         CustomScrollView(
          slivers: [
            const CustomSliverAppBar(),
            _body(orientation),
          ],
        ),
      ),
    );
  }

  _body(Orientation orientation) {
    return  SliverToBoxAdapter(
        child: Column(
      children: [
        const SizedPad(),
        const HeaderWidget(),
        const SizedPad(
          height: 20,
        ),
        TopStoriesWidget(orientation:orientation),
        SizedPad(),
        _desh(),
        LocalStoryWidget(orientation: orientation,),
          const SizedPad(),
          _desh(),
          PicksForYouWidget(orientation: orientation),
          const SizedPad(height: 30,),

          AllStoriesWidget(orientation: orientation,),
          const SizedPad(height: 30,),



      ],
    ));
  }

   _desh() {
    return Obx(()=>
         Container(
          height: 10.h,
          color:Get.find<ThemeController>().isDarkTheme.value? AppColors.jaguarColor:const Color(0xFFF0F1F3),
        ),
      );
  }

  
}


