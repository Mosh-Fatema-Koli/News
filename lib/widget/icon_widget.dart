import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/utils/colors.dart';

class IconsWidget extends StatelessWidget {
    const IconsWidget({super.key, required this.image, this.size,this.color});
  final String image;
  final  double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image,height:size??20.sp,width: size??20.sp,fit:BoxFit.fill,color:color ?? (Get.isDarkMode?AppColors.white:AppColors.headingColor),);
  }
}