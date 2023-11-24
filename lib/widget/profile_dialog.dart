import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/utils/colors.dart';
import 'package:news_apps/utils/styles.dart';
import 'package:news_apps/widget/sized_pad.dart';

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Get.isDarkMode? AppColors.jaguarColor
                : AppColors.ghostWhite,
      titlePadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      contentPadding: EdgeInsets.symmetric(horizontal:8.w),
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15.r)),
        
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: (){
            Get.back();
          }, child:const Icon(Icons.close)),
          Text("Google",style: CustomTextStyle.h2(fontWeight: FontWeight.bold),),
          const SizedBox()
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedPad(),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r)
              
            ),
            elevation: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Get.isDarkMode?AppColors.headingColor:AppColors.white,
                borderRadius: BorderRadius.circular(15.r),
                
                
              ),
              padding: EdgeInsets.symmetric(horizontal: 13.w,vertical:10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                     _personalInfo(),
                    const SizedPad(),
                    _manageButton(),
                       const SizedPad(),
                    const Divider(),
                    _listTile(icon:Icons.notifications_on_outlined,title:"Notifications & shared"),
                    _listTile(icon:Icons.more_time_sharp,title:"My Activity"),
          
              
          
                ],
              ),
            ),
          ),
           _listTile(icon:Icons.settings_outlined,title:"News Settings"),
           _listTile(icon:Icons.help_outline,title:"Help and feedback"),

            const SizedPad(),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                Text("Privacy Policy",style:  CustomTextStyle.h5(color:Get.isDarkMode?AppColors.borderColor:AppColors.headingColor),),
                Text(".",style:  CustomTextStyle.h1( fontWeight: FontWeight.bold,color:Get.isDarkMode?AppColors.borderColor:AppColors.headingColor),),
                Text("Terms of service",style:  CustomTextStyle.h5(color:Get.isDarkMode?AppColors.borderColor:AppColors.headingColor),),
              
                

              ],
            ),
            const SizedPad()

        ],
      ),


    );
  }

   _listTile({required IconData icon,required String title}) {
    return ListTile(
                  dense: true,
                  //contentPadding: EdgeInsets.zero,
                  horizontalTitleGap:5.w,
                  minVerticalPadding: 0,
                  leading:  Icon(icon),
                  title: Text(title,style:  CustomTextStyle.h5(color:Get.isDarkMode?AppColors.borderColor:AppColors.headingColor),),
                );
  }

   _personalInfo() {
    return ListTile(
                  leading:  Container(
                    height: 40.h,
                    width: 40.h,
                    key: UniqueKey(),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.borderColor),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image:CachedNetworkImageProvider("https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg"),

                      
                      )
                    ),

                  ),
                  minVerticalPadding: 0,
                  dense: true,
                  horizontalTitleGap: 12.w,
                  contentPadding: EdgeInsets.zero,
                  title: const Text("Palsh chandra barman"),
                  subtitle: const Text("palash900202@gmail.com"),
                  trailing: Container(
                    height: 20.h,
                    width: 20.h,
                
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.borderColor),
                     
                    ),
                    child: Icon(Icons.arrow_drop_down,size:18.h,),

                  )
               ,
                );
  }

   _manageButton() {
    return Align(
                  alignment: Alignment.center,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color:AppColors.borderColor.withOpacity(0.6)
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)
                      )
                    ),
                    onPressed: (){}, child: Text("Manage your Google Account",style: CustomTextStyle.h6(color:Get.isDarkMode?AppColors.borderColor:AppColors.headingColor),)),
                );
  }
}