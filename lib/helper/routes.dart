import 'package:get/get.dart';
import 'package:news_apps/screen/WebView/web_view_screen.dart';

import '../screen/FullCoverage/full_coverage.dart';
import '../screen/Main/main_screen.dart';
import '../screen/WebView/web_view_screen.dart';



class Routes{

static String mainScreen="/main_screen";
static String fullCoverage="/full_Coverage";
static String webviewScreen="/web_view_screen";


}

final routes=[
  GetPage(name:Routes.mainScreen, page:()=>MainScreen()),
  GetPage(name:Routes.fullCoverage, page:()=>const FullCoverage()),
  GetPage(name:Routes.webviewScreen, page:()=> WebViewScreen()),

];