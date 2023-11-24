import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/utils/icons.dart';
import 'package:news_apps/widget/icon_widget.dart';
import 'package:news_apps/widget/profile_dialog.dart';

import '../utils/colors.dart';
import '../utils/styles.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        "Google News",
        style: CustomTextStyle.h2(),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: IconsWidget(image: AppIcons.search)),
        SizedBox(
          width: 10.w,
        )
      ],
      floating: true,
    );
  }
}
