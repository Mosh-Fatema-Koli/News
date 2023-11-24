import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/utils/constent.dart';
import 'package:news_apps/widget/icon_widget.dart';

import '../../Controller/web_view_controller.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({super.key});

  final _webScreenController = Get.put(WebViewScreenController());
  final url = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool isBack = await _webScreenController.webViewController!.canGoBack();
        if (isBack) {
          _webScreenController.webViewController!.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: _bottomBar(),
        
        body:SafeArea(
          child: Obx(()=>
             Stack(
              children: [
                InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(url)),
            onLoadStart:(controller, url) {

            },
            onLoadStop:(controller, url) {

            },
            onWebViewCreated: (controller) {
              _webScreenController.webViewController = controller;
            },
            onProgressChanged: (controller, progress) {

                   _webScreenController.progress.value = progress / 100;

                },
                  ),

                  _webScreenController.progress.value < 1.0
                  ? LinearProgressIndicator(value: _webScreenController.progress.value)
                  : Container(),

              ],
            ),
          ),
        ),
      ),
    );
  }

   _bottomBar() {
    return Container(
        height: 50.h,
        decoration: BoxDecoration(
           color: Get.isDarkMode ? AppColors.jaguarColor : AppColors.ghostWhite,
           boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
            blurRadius: 10,
            spreadRadius:10
            )
           ]

        ),
       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconsWidget(
              image: AppIcons.fullCoverage,
              size: 40.sp,
              color: Colors.amber.withOpacity(0.7),
            ),
            IconsWidget(image: AppIcons.comment),
            ReactionButton(
              initialReaction: Reaction(
                  icon:  Icon(Icons.thumb_up_outlined,size:20.sp,color:Get.isDarkMode?AppColors.white:AppColors.headingColor,), value: ReactionText.none),
              onReactionChanged: (value) {},
              reactions: [
                Reaction(
                    icon:Padding(
                      padding: EdgeInsets.only(left:15.w,right:5.w,top: 5.h,bottom: 5.h ),
                  child: Image.asset(AppIcons.likeIcon,height: 30.h,width: 30.h,),
                    ), value: ReactionText.like),
                Reaction(
                    icon:Padding(
                      padding:  EdgeInsets.symmetric(horizontal:5.w,vertical:5.h ),
                     child: Image.asset(AppIcons.loveIcon,height: 30.h,width: 30.h,),
                    ), value: ReactionText.love),
                Reaction(
                    icon:Padding(
                      padding:  EdgeInsets.symmetric(horizontal:5.w,vertical:5.h ),
                      child: Image.asset(AppIcons.sedIcon,height: 30.h,width: 30.h,),
                    ), value: ReactionText.haha),
                Reaction(
                    icon:Padding(
                      padding:    EdgeInsets.only(left:5.w,right:15.w,top: 5.h,bottom: 5.h  ),
                      child: Image.asset(AppIcons.hahaIcon,height: 30.h,width: 30.h,),
                    ), value: ReactionText.sed),
              
              ],
            ),
            IconsWidget(image: AppIcons.save)
          ],
        ),
      );
  }
}
