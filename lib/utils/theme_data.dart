import 'package:flutter/material.dart';
import 'package:news_apps/utils/colors.dart';
import 'package:news_apps/utils/styles.dart';

class Style {

static ThemeData themeData( bool isDarkTheme,BuildContext context){
  return ThemeData(
    scaffoldBackgroundColor:isDarkTheme?AppColors.headingColor:AppColors.white,
    colorScheme: ThemeData().colorScheme.copyWith(
      secondary: isDarkTheme?const Color(0xFF1a1f3c):const Color(0xFFE8FDFD),
      brightness: isDarkTheme?Brightness.dark:Brightness.light,
    ),
    cardColor: isDarkTheme?const Color(0xFF0a0d2c):const Color(0xFFF2FDFD),
    canvasColor: isDarkTheme?Colors.black:Colors.grey[50],
    buttonTheme: Theme.of(context).buttonTheme.copyWith(
      colorScheme: isDarkTheme?const ColorScheme.dark():const ColorScheme.light()
    ),
    iconTheme: IconThemeData(
      color:isDarkTheme? AppColors.subtitleColor :AppColors.iconColor
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: isDarkTheme?AppColors.headingColor:AppColors.white,
      elevation: 0,
      titleTextStyle: CustomTextStyle.h2(fontWeight: FontWeight.bold,color:isDarkTheme?AppColors.white:AppColors.headingColor)
    )
  );
}


}