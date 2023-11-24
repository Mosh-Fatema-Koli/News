import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/utils/app_texts.dart';
import 'package:news_apps/widget/icon_widget.dart';
import 'package:news_apps/widget/sized_pad.dart';

import '../../Controller/theme_controller.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/styles.dart';
import '../../widget/profile_dialog.dart';
import 'components/newsstand_card.dart';

class NewsStands extends StatelessWidget {
  NewsStands({super.key});
  final List list=[
    "Entertainment",
    "Food and drink",
    "Health and fitness",
    "Home and Garden",
    "News and politics"

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(),
          SliverToBoxAdapter(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder :(context, index) =>NewsstandCardWidget(title:list[index],) , 
                  separatorBuilder: (context,index){
                    return _desh();
                  },
                   itemCount: list.length),
                  
                  
                 

                ],
              )),
        ],
      ),
    );
  }
    _desh() {
    return Obx(()=>
         Container(
          height: 10.h,
          color:Get.find<ThemeController>().isDarkTheme.value? AppColors.jaguarColor:const Color(0xFFF0F1F3),
        ),
      );
  }

  _appBar() {
    return SliverAppBar(
      floating: true,
      pinned: true,
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
          icon:IconsWidget(image:AppIcons.search)),
        
        SizedBox(
          width: 10.w,
        )
      ],
      bottom: PreferredSize(
          preferredSize: Size(double.infinity, 30.h),
          child: Column(
            children: [
              Text(
                "Suggested Sources",
                style: CustomTextStyle.h5(),
              ),
              const SizedPad()
            ],
          )),
    );
  }
}


