import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utilities/resources/assets_manager.dart';
import '../../../utilities/resources/color_manager.dart';
import '../../../utilities/resources/font_manager.dart';
import '../../../utilities/resources/strings_manager.dart';
import '../../../utilities/resources/styles_manager.dart';
import '../../../utilities/resources/values_manager.dart';

class UserFeedCard extends StatelessWidget {
  const UserFeedCard({
    super.key,
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
    required this.isVerified,
  });

  final String profileImage; // Profile image asset path
  final bool isVerified; // Indicates if the user is verified
  final String userName; // User name
  final String age; // User age
  final String time; // Time of the feed
  final String? location; // Location string (optional)
  final String? category; // Category string (optional)
  final Widget contentWidget; // Widget for the feed content
  final String reaction; // Number of reactions
  final String? replies; // Number of replies (optional)
  final Widget?
      replaceLikeButton; // Widget to replace the like button (optional)

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: AppPadding.p20), // Vertical padding
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // User profile image
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(AppSize.s24),
                  child: Image.asset(profileImage, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: AppSize.s10), // Spacer
              // User information
              buildNameAgeLocationText(),
              const Spacer(), // Spacer
              PopupMenuButton(itemBuilder: (context) {
                return []; // Empty popup menu items for now
              }),
            ],
          ),
          const SizedBox(height: AppSize.s10), // Spacer
          // Category container
          if (category != null) buildCategoryContainer(),
          const SizedBox(height: AppSize.s10), // Spacer
          contentWidget, // Feed content
          const SizedBox(height: AppSize.s10), // Spacer
          // Reaction and replies section
          buildReactionRepliesText(),
          const SizedBox(height: AppSize.s20), // Spacer
          // Action buttons row
          buildTextButtonRow(),
          const SizedBox(height: AppSize.s10), // Spacer
          Divider(
            color: ColorManager.cardColor1, // Divider color
            thickness: AppSize.s6, // Divider thickness
          ),
        ],
      ),
    );
  }

  RichText buildNameAgeLocationText() {
    return RichText(
      text: TextSpan(
        text: "$userName ", // User name
        style: getMediumStyle(
          color: Colors.black,
          fontSize: FontSize.s14,
        ), // Text style
        children: [
          if (isVerified) // Verified badge
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                Icons.verified,
                color: ColorManager.secondary,
                size: AppSize.s20,
              ),
            ),
          const TextSpan(text: "\n"), // New line
          TextSpan(
            text: age, // User age
            style: getRegularStyle(
              color: ColorManager.textColor1,
              fontSize: FontSize.s14,
            ), // Text style
          ),
          if (location != null) ...[
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                child: Icon(
                  Icons.circle,
                  size: AppSize.s6,
                  color: ColorManager.cardColor2,
                ),
              ),
            ),
            TextSpan(
              text: location, // Location
              style: getRegularStyle(
                color: ColorManager.textColor1,
                fontSize: FontSize.s14,
              ), // Text style
            ),
          ],
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: Icon(
                Icons.circle,
                size: AppSize.s6,
                color: ColorManager.cardColor2,
              ),
            ),
          ),
          TextSpan(
            text: time, // Time
            style: getRegularStyle(
              color: ColorManager.textColor1,
              fontSize: FontSize.s14,
            ), // Text style
          ),
        ],
      ),
    );
  }

  Container buildCategoryContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p12,
        vertical: AppPadding.p8,
      ),
      decoration: BoxDecoration(
        color: ColorManager.cardColor1,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSize.s16),
        ),
      ),
      child: Text(category ?? ""), // Category text
    );
  }

  RichText buildReactionRepliesText() {
    return RichText(
      text: TextSpan(
        text: "$reaction Reactions", // Reactions count
        style: getRegularStyle(
          color: ColorManager.textColor1,
          fontSize: FontSize.s14,
        ), // Text style
        children: replies != null
            ? [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    child: Icon(
                      Icons.circle,
                      size: AppSize.s6,
                      color: ColorManager.cardColor2,
                    ),
                  ),
                ),
                TextSpan(
                  text: "$replies Replies", // Replies count
                  style: getRegularStyle(
                    color: ColorManager.textColor1,
                    fontSize: FontSize.s14,
                  ), // Text style
                ),
              ]
            : [],
      ),
    );
  }

  Row buildTextButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Like button or custom replace button
        replaceLikeButton == null
            ? TextButton.icon(
                icon: SvgPicture.asset(ImageAssets.likeIcon),
                onPressed: () {},
                label: Text(
                  AppStrings.like,
                  style: getMediumStyle(
                    color: ColorManager.black,
                    fontSize: FontSize.s14,
                  ), // Text style
                ),
              )
            : replaceLikeButton!,
        // Reply button
        if (replies != null)
          TextButton.icon(
            icon: SvgPicture.asset(ImageAssets.replyIcon),
            onPressed: () {},
            label: Text(
              AppStrings.reply,
              style: getMediumStyle(
                color: ColorManager.black,
                fontSize: FontSize.s14,
              ), // Text style
            ),
          ),
        // Share button
        TextButton.icon(
          icon: SvgPicture.asset(ImageAssets.shareIcon),
          onPressed: () {},
          label: Text(
            AppStrings.share,
            style: getMediumStyle(
              color: ColorManager.black,
              fontSize: FontSize.s14,
            ), // Text style
          ),
        ),
      ],
    );
  }
}
