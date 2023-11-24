import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_apps/helper/routes.dart';
import 'package:news_apps/utils/theme_data.dart';

import 'Controller/theme_controller.dart';
import 'helper/get_di.dart' as di;



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // This will make the status bar transparent
  ));
   
   await di.init();
   
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);

    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      await serviceWorkerController
          .setServiceWorkerClient(AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          if (kDebugMode) {
            print(request);
          }
          return null;
        },
      ));
    }
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
    final _themeController=Get.put(ThemeController());
  
  @override
  Widget build(BuildContext context) {
      final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

     _themeController.setDarkTheme(isDarkMode);
          
  
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return Obx(()=> GetMaterialApp(
        title: 'Grocery Apps',
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        
        
        theme: Style.themeData(_themeController.isDarkTheme.value, context),
        
        getPages: routes,
        initialRoute: Routes.mainScreen,
      
      ));
      }
    
      
    );
  }
}

