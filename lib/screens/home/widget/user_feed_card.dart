import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utilities/resources/assets_manager.dart';
import '../../../utilities/resources/color_manager.dart';
import '../../../utilities/resources/font_manager.dart';
import '../../../utilities/resources/strings_manager.dart';
import '../../../utilities/resources/styles_manager.dart';
import '../../../utilities/resources/values_manager.dart';

class UserFeedCard extends StatelessWidget {
  const UserFeedCard(
      {super.key,
      required this.userName,
      required this.age,
      required this.time,
      this.category,
      required this.contentWidget,
      required this.reaction,
      this.replies,
      this.replaceLikeButton,
      required this.profileImage,
      this.location,
      required this.isVerified});

  final String profileImage;
  final bool isVerified;
  final String userName;
  final String age;
  final String time;
  final String? location;
  final String? category;
  final Widget contentWidget;
  final String reaction;
  final String? replies;
  final Widget? replaceLikeButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(AppSize.s24),
                  child: Image.asset(profileImage, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: AppSize.s10),
              RichText(
                text: TextSpan(
                    text: "${userName} ",
                    style: getMediumStyle(
                      color: Colors.black,
                      fontSize: FontSize.s14,
                    ),
                    children: [
                      if (isVerified)
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.verified,
                            color: ColorManager.secondary,
                            size: AppSize.s20,
                          ),
                        ),
                      const TextSpan(text: "\n"),
                      TextSpan(
                          text: age,
                          style: getRegularStyle(
                              color: ColorManager.textColor1,
                              fontSize: FontSize.s14)),
                      if (location != null) ...[
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p8),
                            child: Icon(
                              Icons.circle,
                              size: AppSize.s6,
                              color: ColorManager.cardColor2,
                            ),
                          ),
                        ),
                        TextSpan(
                            text: location,
                            style: getRegularStyle(
                                color: ColorManager.textColor1,
                                fontSize: FontSize.s14))
                      ],
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8),
                          child: Icon(
                            Icons.circle,
                            size: AppSize.s6,
                            color: ColorManager.cardColor2,
                          ),
                        ),
                      ),
                      TextSpan(
                          text: time,
                          style: getRegularStyle(
                              color: ColorManager.textColor1,
                              fontSize: FontSize.s14)),
                    ]),
              ),
              const Spacer(),
              PopupMenuButton(itemBuilder: (context) {
                return [];
              })
            ],
          ),
          const SizedBox(height: AppSize.s10),
          if (category != null)
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p12, vertical: AppPadding.p8),
              decoration: BoxDecoration(
                  color: ColorManager.cardColor1,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSize.s16),
                  )),
              child: Text(category ?? ""),
            ),
          const SizedBox(height: AppSize.s10),
          contentWidget,
          const SizedBox(height: AppSize.s10),
          RichText(
            text: TextSpan(
              text: "$reaction Reactions",
              style: getRegularStyle(
                  color: ColorManager.textColor1, fontSize: FontSize.s14),
              children: replies != null
                  ? [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p8),
                          child: Icon(
                            Icons.circle,
                            size: AppSize.s6,
                            color: ColorManager.cardColor2,
                          ),
                        ),
                      ),
                      TextSpan(
                          text: "$replies Replies",
                          style: getRegularStyle(
                              color: ColorManager.textColor1,
                              fontSize: FontSize.s14))
                    ]
                  : [],
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              replaceLikeButton == null
                  ? TextButton.icon(
                      icon: SvgPicture.asset(ImageAssets.likeIcon),
                      onPressed: () {},
                      label: Text(
                        AppStrings.like,
                        style: getMediumStyle(
                            color: ColorManager.black, fontSize: FontSize.s14),
                      ),
                    )
                  : replaceLikeButton!,
              if (replies != null)
                TextButton.icon(
                  icon: SvgPicture.asset(ImageAssets.replyIcon),
                  onPressed: () {},
                  label: Text(
                    AppStrings.reply,
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                ),
              TextButton.icon(
                icon: SvgPicture.asset(ImageAssets.shareIcon),
                onPressed: () {},
                label: Text(
                  AppStrings.share,
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSize.s10),
          Divider(
            color: ColorManager.cardColor1,
            thickness: AppSize.s6,
          )
        ],
      ),
    );
  }
}
