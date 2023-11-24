import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_apps/screen/Home/component/header_list_tile.dart';
import 'package:news_apps/widget/short_coverage.dart';
import 'package:news_apps/utils/app_texts.dart';
import 'package:news_apps/widget/sized_pad.dart';

import '../../../widget/large_coverage_card.dart';


class LocalStoryWidget extends StatelessWidget {
  const LocalStoryWidget({super.key, required this.orientation});

  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          const SizedPad(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: HeaderListTitle(title:AppTexts.localNews, 
            color: const Color(0xFF75B8B1),
            onTap:(){
          
            }),
          ),
          const SizedPad(),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: const Divider(),
          ),
         orientation==Orientation.portrait?_portrait():_landScape()







      ],
    );
  }

  _portrait() {
    return ListView.separated(
      itemCount:2,
      shrinkWrap: true,
      //padding: EdgeInsets.symmetric(horizontal: 15.w),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return  ShortCoverageCard(isCoverageIcon: index==0?false:true,);
      }, separatorBuilder: (BuildContext context, int index) { 
        return Padding(
          padding: EdgeInsets.symmetric(vertical:8.h,horizontal: 15.w),
          child:  const Divider(),
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
    return LargeCoverageCard(isCoverageIcon:index==0?false:true,);
  },
);
   
  }
}