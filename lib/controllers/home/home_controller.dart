import 'package:get/get.dart';

import '../../app/di.dart';
import '../../data/dio_client.dart';
import '../../model/home/get_chip_data_model.dart';
import '../../model/home/get_home_feed.dart' as home;

class HomeController extends GetxController {
  // Instance of DioClient obtained from GetIt
  final DioClient dioClient = instance<DioClient>();

  // Observable lists to hold CommunityGroup and UserFeed objects
  RxList<CommunityGroup> communityGroupList = <CommunityGroup>[].obs;
  RxList<home.UserFeed> userFeedList = <home.UserFeed>[].obs;

  // Observable integer to track the selected community index
  RxInt selectedCommunityIndex = 0.obs;

  @override
  void onInit() {
    // Make API calls to fetch data when the controller is initialized
    apiCalled();
    super.onInit();
  }

  // Method to make API calls and get data for community groups and user feeds
  apiCalled() async {
    // Fetch the community group data and update the observable list
    communityGroupList.value = await dioClient.getChipsData();
    // Fetch the user feed data and update the observable list
    userFeedList.value = await dioClient.getHomeFeed();
  }
}
