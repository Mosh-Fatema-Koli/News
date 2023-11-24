import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/utils/app_texts.dart';
import 'package:news_apps/utils/colors.dart';
import 'package:news_apps/widget/icon_widget.dart';

import '../../Controller/main_controller.dart';
import '../../Controller/theme_controller.dart';
import '../../utils/icons.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _mainController = Get.put(MainController());
  final _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Obx(() => _mainController.page[_mainController.isSelectIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: _mainController.isSelectIndex.value,
            onTap: (value) => _mainController.onSelect(value),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: _themeController.isDarkTheme.value
                ? AppColors.white
                : AppColors.headingColor,
            unselectedItemColor: _themeController.isDarkTheme.value
                ? const Color(0xFFC6C8C7)
                : AppColors.grayColor,
            backgroundColor: _themeController.isDarkTheme.value
                ? AppColors.jaguarColor
                : AppColors.ghostWhite,
            type: BottomNavigationBarType.fixed,
            items: [
              ///  for you

              _bottomBarItem(
                  icon: AppIcons.forYouIcon,
                  isSelect: _mainController.isSelectIndex.value == 0,
                  label: AppTexts.forYou),
                  
              _bottomBarItem(
                  icon:  AppIcons.internet,
                  isSelect: _mainController.isSelectIndex.value == 1,
                  label: AppTexts.headlines),
              _bottomBarItem(
                  icon:  AppIcons.star,
                  isSelect: _mainController.isSelectIndex.value == 2,
                  label: AppTexts.following),
              _bottomBarItem(
                  icon: AppIcons.newsStand,
                  isSelect: _mainController.isSelectIndex.value == 3,
                  label: AppTexts.newsstand),
            ]),
      ),
    );
  }

  _bottomBarItem(
      {required bool isSelect, required String icon, required String label}) {
    return BottomNavigationBarItem(
        icon: isSelect
            ? AnimatedContainer(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: _themeController.isDarkTheme.value
                        ? AppColors.blueMeridian
                        : AppColors.icyLandscape),
                duration: const Duration(seconds: 2),
                child: IconsWidget(image:icon,
                size: 22.sp,
                color: _themeController.isDarkTheme.value
                ? AppColors.white
                : AppColors.headingColor,),
              )
            : IconsWidget(image: icon,
            size: 22.sp,
            color: _themeController.isDarkTheme.value
                ? const Color(0xFFC6C8C7)
                : AppColors.grayColor,),
        label: label);
  }
}
