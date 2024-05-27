import 'package:arham_labs_assignment/screens/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/di.dart';
import '../../data/dio_client.dart';
import '../../model/home/get_chip_data_model.dart';
import '../../model/home/get_home_feed.dart' as home;

class HomeController extends GetxController {
  final DioClient dioClient = instance<DioClient>();

  RxList<CommunityGroup> communityGroupList = <CommunityGroup>[].obs;
  RxList<home.UserFeed> userFeedList = <home.UserFeed>[].obs;

  RxInt selectedCommunityIndex = 0.obs;

  RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];

  @override
  void onInit() {
    apiCalled();
    super.onInit();
  }

  apiCalled() async {
    communityGroupList.value = await dioClient.getChipsData();
    userFeedList.value = await dioClient.getHomeFeed();
  }
}
