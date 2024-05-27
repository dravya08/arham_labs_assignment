import 'package:arham_labs_assignment/utilities/resources/routes_manager.dart';
import 'package:get/get.dart';

import '../../app/app_prefs.dart';
import '../../app/di.dart';
import '../../data/dio_client.dart';
import '../../model/condition/condition_model.dart';

class ConditionController extends GetxController {
  final DioClient dioClient = instance<DioClient>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  RxList<Datapoint> dataPointsList = <Datapoint>[].obs;
  RxList<Datapoint> filteredDataPoints = <Datapoint>[].obs;
  RxList<Datapoint> selectedDataPoints = <Datapoint>[].obs;

  @override
  void onInit() {
    apiCall();

    super.onInit();
  }

  apiCall() async {
    dataPointsList.value = await dioClient.getConditionList();
    filteredDataPoints.value = dataPointsList;
    update();
  }

  void searchItems(String query) {
    if (query.isEmpty) {
      filteredDataPoints.value = dataPointsList;
      update();
    } else {
      filteredDataPoints.value = dataPointsList
          .where((item) =>
              item.name.toLowerCase().contains(query.toLowerCase()) ||
              item.categoryTitle.toLowerCase().contains(query.toLowerCase()) ||
              item.dptypeTitle.toLowerCase().contains(query.toLowerCase()))
          .toList();
      update();
    }
  }

  void toggleSelection(Datapoint item) {
    if (selectedDataPoints.contains(item)) {
      selectedDataPoints.remove(item);
      update();
    } else {
      selectedDataPoints.add(item);
      update();
    }
  }

  Future<void> goNext() async {
    _appPreferences.setConditions(selectedDataPoints);

    Get.offAllNamed(Routes.home);
  }
}
