import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_apps/widget/large_coverage_card.dart';
import 'package:news_apps/widget/orientation_widget.dart';

import '../../../utils/colors.dart';

class LatestHeadLinesWidget extends StatelessWidget {
  const LatestHeadLinesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
    body: OrientationWidget(portrait: _portrait(), landscape: _landScape()));
  }
  
  _portrait() {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10.h),
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return  LargeCoverageCard(
          isCoverageIcon: false,
          isFullCoverage: true,
          isSuggestion: true,
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
      // mainAxisSpacing: 10.h,
      // crossAxisSpacing: 10.w,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      padding: EdgeInsets.only(bottom: 10.h),
      itemBuilder: (context, index) {
        return  LargeCoverageCard(
          isCoverageIcon: false,
          isFullCoverage: true,
          isSuggestion: false,
        );
      
      },
    );
  }
}