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
  });

  final String location;
  final String title;
  final String desc;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        AppPadding.p12,
      ),
      decoration: BoxDecoration(
        color: ColorManager.cardColor1,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: ColorManager.textColor1,
              ),
              Text(
                location,
                style: getRegularStyle(
                    color: ColorManager.textColor1, fontSize: FontSize.s14),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s8),
          Text(
            title,
            style: getMediumStyle(
                color: ColorManager.black, fontSize: FontSize.s16),
          ),
          Text(
            desc,
            style: getRegularStyle(
                color: ColorManager.textColor1, fontSize: FontSize.s16),
          ),
          const SizedBox(height: AppSize.s8),
          SizedBox(
            width: double.infinity,
            height: AppSize.s44,
            child: ElevatedButton(
                onPressed: callback,
                child: Text(
                  AppStrings.recommend,
                  style: getMediumStyle(
                      color: ColorManager.white, fontSize: FontSize.s14),
                )),
          )
        ],
      ),
    );
  }
}
