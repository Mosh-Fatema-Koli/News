import 'package:get/get.dart';
import 'package:news_apps/local/local_data.dart';


class ThemeController extends GetxController{

  var isDarkTheme=false.obs;
    


  @override
  void onInit() {
    getCurrentAppTheme();
   
    super.onInit();
  }
    
    getCurrentAppTheme()async{
      isDarkTheme.value=await MyPrefarance.getTheme();
    }


    setDarkTheme(bool value)async{
      isDarkTheme.value=value;
      await MyPrefarance.setThemeData(value);

    }

}