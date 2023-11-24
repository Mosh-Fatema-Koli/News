import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news_apps/helper/routes.dart';
import 'package:news_apps/utils/icons.dart';
import 'package:news_apps/widget/icon_widget.dart';

import '../Controller/theme_controller.dart';
import '../utils/colors.dart';
import '../utils/constent.dart';
import '../utils/styles.dart';
import 'sized_pad.dart';

class LargeCoverageCard extends StatelessWidget {
   LargeCoverageCard({
    super.key,
    required this.isCoverageIcon,
    this.isFullCoverage = false,
    this.isSuggestion=false,
  });
  final bool isCoverageIcon;
  final bool isFullCoverage;
  final bool isSuggestion;
  

  final iconList=[
    ReactionText.like,
    ReactionText.love,
   
    
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          Get.toNamed(Routes.webviewScreen,arguments:"https://www.france24.com/en/");
        },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //<-------------- Image --------->
          Padding(
           padding:  EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    height: 170.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    imageUrl:
                        "https://www.tigercricket.com.bd/public/images/2022/03/RMP_0980.jpg",
                  ),
                ),
          
                const SizedPad(),
                //<-------------- Logo Name --------->
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
                        "Cricinfo",
                        style: CustomTextStyle.h3(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const SizedPad(
                  height: 6,
                ),
                //<-------------- title --------->
                Text(
                  "Bangladesh reaping rewards of a more open - minded approach in T20Is",
                  textAlign: TextAlign.start,
                  style: CustomTextStyle.h2(fontWeight: FontWeight.w500),
                ),
                const SizedPad(),
          
                //<-------------- time --------->
                Row(
                  children: [
                    Text(
                      "3h",
                      style: CustomTextStyle.h5(color: AppColors.subtitleColor),
                    ),
                    const Spacer(),
                      for(int i=0;i<iconList.length;i++)
                    Align(
                      widthFactor: 0.6,
                      child: CircleAvatar(
                          radius: 13.r,
                          backgroundColor:Get.isDarkMode? AppColors.headingColor:AppColors.white,
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: Colors.transparent,
                            backgroundImage:AssetImage(
                                iconList[i]==ReactionText.like?AppIcons.likeIcon:
                                 iconList[i]==ReactionText.love?AppIcons.loveIcon:
                                  iconList[i]==ReactionText.sed?AppIcons.sedIcon:
                                  AppIcons.hahaIcon

                            ),
                          ),
                        
                        ),


                    ),
                     SizedBox(width:5.w,),
                    Text("1k"),
                    if(isCoverageIcon)
                    SizedBox(width: 15.w,),


                    if(isCoverageIcon)
                         InkWell(
                            onTap: () {},
                            child:IconsWidget(image:AppIcons.fullCoverage,color:Colors.amber.withOpacity(0.7), size:35.h,),
                          ),
                        
                    SizedBox(
                      width: 25.w,
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
    
          //<-------------- suggestion this Story --------->
          if(isSuggestion||isFullCoverage)
          const SizedPad(),
        isSuggestion?  SizedBox(
            height: 120.h,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _suggestionCard(context,index);
              },
            ),
          ):const SizedBox(),
    
          //<-------------- FullCoverage ths Story --------->
         if(isFullCoverage)
           const SizedPad(),
    
          isFullCoverage ? _fullCoverageStoryButton() : const SizedBox()
        ],
      ),
    );
  }

 _suggestionCard(BuildContext context,int index) {
    return Obx(()=>
       InkWell(
        onTap: (){
        
        },
         child: Container(
                  margin: EdgeInsets.only(right: 10.w,left: index==0?15.w:0),
                  padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  decoration: BoxDecoration(
                    color:Get.find<ThemeController>().isDarkTheme.value?AppColors.cardDarkColor:AppColors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      border:Get.find<ThemeController>().isDarkTheme.value?Border.all(width: 0,color:Colors.transparent) : Border.all(color: AppColors.borderColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //<-------------- Logo Name --------->
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
                              "Cricinfo",
                              style:
                                  CustomTextStyle.h3(fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "Bangladesh reaping rewards of a more open - minded approach in T20Is",
                        textAlign: TextAlign.start,
                        style: CustomTextStyle.h4(fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                       Spacer(),
           
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3 hours ago",
                            style: CustomTextStyle.h5(
                                color: AppColors.subtitleColor),
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
       ),
    );
  }

  _fullCoverageStoryButton() {
    return Obx(()=>
       Padding(
       padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: OutlinedButton(
          onPressed: () {
            Get.toNamed(Routes.fullCoverage);
          },
          style: OutlinedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor:
                  Get.find<ThemeController>().isDarkTheme.value? AppColors.cardDarkColor : AppColors.white,
              side: BorderSide(
                  color:Get.find<ThemeController>().isDarkTheme.value?AppColors.cardDarkColor
                      : AppColors.borderColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconsWidget(image:AppIcons.fullCoverage,color:Colors.amber.withOpacity(0.7),size: 35.h,),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Full coverage of this story",
                style: CustomTextStyle.h4(
                    fontWeight: FontWeight.w500,
                    color: Get.find<ThemeController>().isDarkTheme.value? Colors.white : Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
