import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:news_apps/widget/short_coverage.dart';

import '../../../utils/colors.dart';
import '../../../widget/sized_pad.dart';
import 'header_list_tile.dart';
import '../../../widget/large_coverage_card.dart';

class TopStoriesWidget extends StatelessWidget {
  const TopStoriesWidget({
    super.key, required this.orientation,
  });
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: HeaderListTitle(
            onTap: () {},
            title: 'Top stories',
            color:
                Get.isDarkMode ? AppColors.flyBlue : AppColors.flickrBlue,
          ),
        ),
        const SizedPad(),
        orientation==Orientation.portrait? _portrait():_landScape()
    
      
        
      ],
    );
  }

 _portrait() {
    return ListView.separated(
      itemCount:3,
      shrinkWrap: true,
      padding: EdgeInsets.only(top:10.h,),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return index==0? LargeCoverageCard(isCoverageIcon: true,):const ShortCoverageCard(isCoverageIcon: true,);
      }, separatorBuilder: (BuildContext context, int index) { 
        return Padding(
          padding: EdgeInsets.symmetric(vertical:8.h),
          child:  Divider(color:AppColors.borderColor,),
        );
       },);
  }

  _landScape() {

  return  MasonryGridView.count(
  crossAxisCount: 2,
  mainAxisSpacing: 10.h,
  crossAxisSpacing: 10.w,
  physics: const NeverScrollableScrollPhysics(),
  shrinkWrap: true,
  itemCount: 2,
  itemBuilder: (context, index) {
    return  LargeCoverageCard(isCoverageIcon: true,);
  },
);
   
  }
}


