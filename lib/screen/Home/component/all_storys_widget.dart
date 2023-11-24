import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../utils/colors.dart';
import '../../../widget/large_coverage_card.dart';

class AllStoriesWidget extends StatelessWidget {
  const AllStoriesWidget({
    super.key,
    required this.orientation,
  });
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        orientation == Orientation.portrait ? _portrait() : _landScape()
      ],
    );
  }

  _portrait() {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10.h),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return LargeCoverageCard(
          isCoverageIcon: false,
          isFullCoverage: true,
          isSuggestion: index % 2 == 0 ? true : false,
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
      itemCount: 2,
      itemBuilder: (context, index) {
        return  LargeCoverageCard(
            isCoverageIcon: false, isFullCoverage: true);
      },
    );
  }
}
