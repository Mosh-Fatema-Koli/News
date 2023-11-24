import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news_apps/utils/icons.dart';
import 'package:news_apps/utils/styles.dart';
import 'package:news_apps/widget/icon_widget.dart';
import 'package:news_apps/widget/sized_pad.dart';

import '../../utils/colors.dart';
import '../../widget/large_coverage_card.dart';
import '../../widget/short_coverage.dart';

class FullCoverage extends StatelessWidget {
  const FullCoverage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
   
    appBar: AppBar(
      iconTheme: IconThemeData(
          color: Get.isDarkMode
              ? AppColors.subtitleColor
              : AppColors.iconColor),
      actions: [
        IconButton(
            onPressed: () {},
            icon: IconsWidget(image:AppIcons.share, color: Get.isDarkMode
                  ? AppColors.subtitleColor
                  : AppColors.iconColor,)),
        IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.ellipsisVertical,
              color: Get.isDarkMode
                  ? AppColors.subtitleColor
                  : AppColors.iconColor,
              size: 20.sp,
            )),
      ],
    ),
    body: OrientationBuilder(
      builder: (context,orientation) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  children: [
                   IconsWidget(image:AppIcons.fullCoverage,color:Colors.amber.withOpacity(0.8),size:35.h,),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      "Full Coverage",
                      style: CustomTextStyle.h4(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedPad(),
              Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Text(
                  "Aamir Khan attends Wimbledon finals with daughter Ira",
                  style: CustomTextStyle.h2(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedPad(
                height: 20,
              ),
              orientation==Orientation.portrait?
              _portrait():_landScape()
            ],
          ),
        );
      }
    ));
  }

  _portrait() {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      //padding: EdgeInsets.symmetric(horizontal: 15.w),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const ShortCoverageCard(
          isCoverageIcon: false,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 15.w),
          child: const Divider(),
        );
      },
    );
  }

  _landScape() {
    return MasonryGridView.count(
      crossAxisCount: 2,
      // mainAxisSpacing: 10.h,
      // crossAxisSpacing: 10.w,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      padding: EdgeInsets.only(bottom: 10.h),
      itemBuilder: (context, index) {
        return  LargeCoverageCard(
          isCoverageIcon: false,
        );
      },
    );
  }
}
