import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/Following/following_screen.dart';
import '../screen/Headlines/headlines_screen.dart';
import '../screen/Home/home_screen.dart';
import '../screen/NewsStands/news_stands.dart';


class MainController extends GetxController {

  var isSelectIndex=0.obs;


  var page = [const HomeScreen(),HeadLinesScreen(),FollowingScreen(),NewsStands()];


  onSelect(int select){

    isSelectIndex.value=select;
  }


}
