import 'package:arham_labs_assignment/controllers/condition/condition_controller.dart';
import 'package:arham_labs_assignment/utilities/resources/assets_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/color_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/font_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/strings_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/styles_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../model/condition/condition_model.dart';

class ConditionView extends StatelessWidget {
  const ConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an instance of ConditionController and put it in GetX dependency injection system
    final ConditionController conditionController =
        Get.put(ConditionController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.cardColor1,
      ),
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Column(
            children: [
              const SizedBox(height: AppSize.s20),
              // Title Text
              Text(
                AppStrings.whatAreYourConditions,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s24),
              ),
              const SizedBox(height: AppSize.s40),
              // Search Field
              buildSearchField(conditionController),
              const SizedBox(height: AppSize.s20),
              // List of conditions
              buildConditionList(),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: buildBottomNavBar(conditionController),
    );
  }

  // Widget to build the search field
  TextField buildSearchField(ConditionController conditionController) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: SvgPicture.asset(
            ImageAssets.searchIcon,
          ),
        ),
        filled: true,
        fillColor: ColorManager.cardColor1,
        hintText: AppStrings.searchHealthConditions,
        hintStyle: getRegularStyle(
            color: ColorManager.textColor1, fontSize: FontSize.s16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
      // Call searchItems method of ConditionController on text change
      onChanged: conditionController.searchItems,
    );
  }

  // Widget to build the list of conditions
  GetBuilder<ConditionController> buildConditionList() {
    return GetBuilder<ConditionController>(
      builder: (conditionController) {
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // Get the Datapoint at the current index
            Datapoint datapoint =
                conditionController.filteredDataPoints.elementAt(index);
            // Check if the Datapoint is selected
            final isSelected =
                conditionController.selectedDataPoints.contains(datapoint);
            return ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () => conditionController.toggleSelection(datapoint),
              selected: isSelected,
              trailing: isSelected ? SvgPicture.asset(ImageAssets.check) : null,
              title: Text(
                datapoint.name,
                style: isSelected
                    ? getMediumStyle(
                        color: ColorManager.secondary, fontSize: FontSize.s16)
                    : getRegularStyle(
                        color: ColorManager.textColor1, fontSize: FontSize.s16),
              ),
            );
          },
          itemCount: conditionController.filteredDataPoints.length,
        );
      },
    );
  }

  // Widget to build the bottom navigation bar
  Obx buildBottomNavBar(ConditionController conditionController) {
    return Obx(
      () => conditionController.selectedDataPoints.isNotEmpty
          ? Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20, vertical: AppPadding.p8),
              width: double.infinity,
              height: AppSize.s60,
              child: ElevatedButton(
                onPressed: () => conditionController.goNext(),
                child: Text(
                  AppStrings.next,
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: AppSize.s16),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
