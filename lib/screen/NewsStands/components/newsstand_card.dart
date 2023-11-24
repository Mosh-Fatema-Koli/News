import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/styles.dart';
import '../../../widget/sized_pad.dart';

class NewsstandCardWidget extends StatelessWidget {
  const NewsstandCardWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedPad(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Text(
            title,
            style: CustomTextStyle.h2(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedPad(height: 15,),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(left: index == 0 ? 15.w : 0.w, right: 5.w),
                child: SizedBox(
                  width: 100.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //<------------- image ---------->
                      SizedBox(
                        height: 120.h,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: CachedNetworkImage(
                                key: UniqueKey(),
                                height: 100.h,
                                width: 100.h,
                                fit: BoxFit.fill,
                                imageUrl:
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ2dT8qryKzhZ5GfzYAUBZcdB2LoPHOYIHorz7zX3zJ5XL8sRlFEigS-YO_Y13hwmxsiA&usqp=CAU"
                                    )
                            ),
                            Positioned(
                                bottom: 0,
                                child: PhysicalModel(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                  elevation: 10,
                                  child: CircleAvatar(
                                    radius: 20.r,
                                    backgroundColor: Get.isDarkMode
                                        ? AppColors.cardDarkColor
                                        : Colors.white,
                                    child: Center(
                                      child: Icon(
                                        Icons.star_border_sharp,
                                        size: 20.r,
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),

                      //<------------- Title ---------->
                      Text(
                        index == 0 ? "British Film Institute" : "Ok! magazine",
                        style: CustomTextStyle.h4(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedPad(),
                      //<------------- Subtitle ---------->
                      Text(
                        "Free of charge",
                        style: CustomTextStyle.h6(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedPad(),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: const Divider(),
        ),
        const SizedPad(),
        Align(
            alignment: Alignment.center,
            child: Text(
              "More ${title.toLowerCase()}",
              textAlign: TextAlign.center,
              style: CustomTextStyle.h4(
                  fontWeight: FontWeight.w600,
                  color: Get.isDarkMode
                      ? AppColors.flyBlue
                      : AppColors.flickrBlue),
            )),
        const SizedPad(height: 20,),
      ],
    );
  }
}
