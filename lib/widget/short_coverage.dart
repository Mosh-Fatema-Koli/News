import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news_apps/utils/icons.dart';
import 'package:news_apps/widget/icon_widget.dart';

import '../helper/routes.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import 'sized_pad.dart';

class ShortCoverageCard extends StatelessWidget {
  const ShortCoverageCard({
    super.key, required this.isCoverageIcon,
  });
  final bool isCoverageIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: InkWell(
        onTap: (){
          Get.toNamed(Routes.webviewScreen,arguments:"https://www.aljazeera.com/");
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      // <------------- news logo and name ------------------->
          
                      Row(
                        children: [
                          CachedNetworkImage(
                            key: UniqueKey(),
                            width: 100.w,
                            height: 15.h,
                            fit: BoxFit.fill,
                            imageUrl:
                                "https://upload.wikimedia.org/wikipedia/commons/8/83/News_Channel_8_logo.png",
                          ),
                          Expanded(
                            child: Text(
                              " Bd news",
                              style: CustomTextStyle.h5(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
          
                      // <------------- News title ------------------->
          
                      Text(
                        "Bangladesh reaping rewards of a more open - minded approach in T20Is",
                        textAlign: TextAlign.start,
                        style: CustomTextStyle.h3(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                // <------------- News image ------------------->
                SizedBox(
                  width: 15.w,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    height: 80.h,
                    width: 80.h,
                    fit: BoxFit.fill,
                    imageUrl:
                        "https://www.tigercricket.com.bd/public/images/2022/03/RMP_0980.jpg",
                  ),
                ),
              ],
            ),
            SizedPad(),
            // <------------- End section  ------------------->
            Row(
              children: [
                Text(
                  "3h",
                  style: CustomTextStyle.h5(color: AppColors.subtitleColor),
                ),
                const Spacer(),
              isCoverageIcon?  InkWell(
                  onTap: () {},
                  child: IconsWidget(image:AppIcons.fullCoverage,color:Colors.amber.withOpacity(0.7),size:30.h,),
                ):const SizedBox(),
                SizedBox(
                  width: 20.w,
                ),
                InkWell(
                    onTap: () {},
                    child: FaIcon(
                      FontAwesomeIcons.ellipsisVertical,
                      color: AppColors.subtitleColor,
                      size: 20.sp,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
