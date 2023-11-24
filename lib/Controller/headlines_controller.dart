
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadLinesController extends GetxController with GetSingleTickerProviderStateMixin   {
  late TabController tabController;
   final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Latest'),
    const Tab(text: 'Bangladesh'),
    const Tab(text: 'World'),
    const Tab(text: 'Business'),
  ];

  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this); // Replace 2 with the number of tabs you want
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose(); // Dispose the TabController when the controller is closed
    super.onClose();
  }
}