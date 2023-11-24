import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/Controller/theme_controller.dart';

import '../../../utils/colors.dart';
import '../../../utils/styles.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("Your briefing",style: CustomTextStyle.customSize(size:24.sp,fontWeight: FontWeight.bold),),
                Text("Monday,July 17",style:CustomTextStyle.h5(color:AppColors.subtitleColor),)
                        
              ],
            ),
          ),
          Obx(()=>
             Container(
              padding: EdgeInsets.symmetric(horizontal:15.w,vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                border:Get.find<ThemeController>().isDarkTheme.value?null :Border.all(color: AppColors.borderColor),
                color:Get.find<ThemeController>().isDarkTheme.value? const Color(0xFF303135):AppColors.white
                
              ),
              child: Row(
                children: [
                  Text("35°C",style: CustomTextStyle.h1(),),
                  SizedBox(width: 5.w,),
                  const Icon(Icons.cloud_sharp)
                ],
              ),
            ),
          )
           
    
    
        ],
      ),
    );
  }
}


