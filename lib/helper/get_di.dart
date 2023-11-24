
import 'package:get/get.dart';

import '../Controller/home_controller.dart';
import '../Controller/theme_controller.dart';
import '../Controller/web_view_controller.dart';


Future<void> init()async{
  //    final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences);

    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => WebViewScreenController());





}