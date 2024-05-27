import 'package:arham_labs_assignment/utilities/resources/routes_manager.dart';
import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../../data/dio_client.dart';
import '../../model/condition/condition_model.dart';

class ConditionController extends GetxController {
  // Instances of DioClient and AppPreferences obtained from GetIt
  final DioClient dioClient = instance<DioClient>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  // Observable lists to hold Datapoint objects
  RxList<Datapoint> dataPointsList = <Datapoint>[].obs;
  RxList<Datapoint> filteredDataPoints = <Datapoint>[].obs;
  RxList<Datapoint> selectedDataPoints = <Datapoint>[].obs;

  @override
  void onInit() {
    // Make an API call to fetch the list of conditions
    apiCall();
    super.onInit();
  }

  // Method to make an API call and get the list of conditions
  apiCall() async {
    dataPointsList.value = await dioClient.getConditionList();

    filteredDataPoints.value = dataPointsList;
    // Notify listeners to update the UI
    update();
  }

  // Method to filter the list based on a search query
  void searchItems(String query) {
    if (query.isEmpty) {
      // If the query is empty, show the full list
      filteredDataPoints.value = dataPointsList;
    } else {
      // Filter the list based on the query
      filteredDataPoints.value = dataPointsList
          .where((item) =>
              item.name.toLowerCase().contains(query.toLowerCase()) ||
              item.categoryTitle.toLowerCase().contains(query.toLowerCase()) ||
              item.dptypeTitle.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    // Notify listeners to update the UI
    update();
  }

  // Method to toggle the selection of a Datapoint
  void toggleSelection(Datapoint item) {
    if (selectedDataPoints.contains(item)) {
      // If the item is already selected, remove it from the selected list
      selectedDataPoints.remove(item);
    } else {
      // If the item is not selected, add it to the selected list
      selectedDataPoints.add(item);
    }
    // Notify listeners to update the UI
    update();
  }

  // Method to proceed to the next step
  Future<void> goNext() async {
    await _appPreferences.setConditions(selectedDataPoints);

    Get.offAllNamed(Routes.home);
  }
}
