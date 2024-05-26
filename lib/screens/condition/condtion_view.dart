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
          padding: EdgeInsets.symmetric(horizontal: AppSize.s20),
          child: Column(
            children: [
              Text(
                AppStrings.whatAreYourConditions,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s24),
              ),
              TextField(
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
                onChanged: conditionController.searchItems,
              ),
              GetBuilder(builder: (ConditionController conditionController) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Datapoint datapoint =
                        conditionController.filteredDataPoints.elementAt(index);
                    final isSelected = conditionController.selectedDataPoints
                        .contains(datapoint);
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () =>
                          conditionController.toggleSelection(datapoint),
                      selected: isSelected,
                      trailing: isSelected
                          ? SvgPicture.asset(ImageAssets.check)
                          : null,
                      title: Text(
                        datapoint.name,
                        style: isSelected
                            ? getMediumStyle(
                                color: ColorManager.secondary,
                                fontSize: FontSize.s16)
                            : getRegularStyle(
                                color: ColorManager.textColor1,
                                fontSize: FontSize.s16),
                      ),
                    );
                  },
                  itemCount: conditionController.filteredDataPoints.length,
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
        width: double.infinity,
        height: AppSize.s48,
        child: ElevatedButton(
          onPressed: () => conditionController.goNext(),
          child: Text(
            AppStrings.next,
            style: getRegularStyle(
                color: ColorManager.white, fontSize: AppSize.s16),
          ),
        ),
      ),
    );
  }
}
