import 'package:flutter/material.dart';

import '../../../utilities/resources/color_manager.dart';
import '../../../utilities/resources/font_manager.dart';
import '../../../utilities/resources/strings_manager.dart';
import '../../../utilities/resources/styles_manager.dart';
import '../../../utilities/resources/values_manager.dart';

class RecommendCard extends StatelessWidget {
  const RecommendCard({
    super.key,
    required this.location,
    required this.title,
    required this.desc,
    required this.callback,
  }); // Pass the key to the super constructor

  final String location;
  final String title;
  final String desc;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(AppPadding.p12), // Padding for the container
      decoration: BoxDecoration(
        color: ColorManager.cardColor1, // Card background color
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s16), // Border radius of the card
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment
            .start, // Align items to the start of the cross axis
        children: [
          // Location row
          Row(
            children: [
              Icon(
                Icons.location_on, // Location icon
                color: ColorManager.textColor1, // Icon color
              ),
              Text(
                location, // Location text
                style: getRegularStyle(
                  color: ColorManager.textColor1,
                  fontSize: FontSize.s14,
                ), // Text style
              ),
            ],
          ),
          const SizedBox(height: AppSize.s8), // Spacer
          // Title text
          Text(
            title,
            style: getMediumStyle(
              color: ColorManager.black,
              fontSize: FontSize.s16,
            ), // Title text style
          ),
          // Description text
          Text(
            desc,
            style: getRegularStyle(
              color: ColorManager.textColor1,
              fontSize: FontSize.s16,
            ), // Description text style
          ),
          const SizedBox(height: AppSize.s8), // Spacer
          // Recommend button
          SizedBox(
            width: double.infinity,
            height: AppSize.s44, // Button height
            child: ElevatedButton(
              onPressed: callback, // Callback function
              child: Text(
                AppStrings.recommend, // Button text
                style: getMediumStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s14,
                ), // Button text style
              ),
            ),
          ),
        ],
      ),
    );
  }
}
