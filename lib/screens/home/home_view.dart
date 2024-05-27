import 'package:any_link_preview/any_link_preview.dart';
import 'package:arham_labs_assignment/controllers/home/home_controller.dart';
import 'package:arham_labs_assignment/screens/home/widget/recommend_card.dart';
import 'package:arham_labs_assignment/utilities/resources/assets_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/color_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/font_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/strings_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/styles_manager.dart';
import 'package:arham_labs_assignment/utilities/resources/values_manager.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../model/home/get_chip_data_model.dart';
import 'widget/user_feed_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Text(
          AppStrings.starApp,
          style: getMediumStyle(color: Colors.black, fontSize: FontSize.s24),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ImageAssets.searchIcon),
          ),
          const SizedBox(width: AppSize.s10),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ImageAssets.notificationIcon),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p20, vertical: AppPadding.p8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSize.s10),
              Text(
                AppStrings.askForHelp,
                style: getRegularStyle(
                    color: ColorManager.textColor1, fontSize: AppSize.s16),
              ),
              const SizedBox(height: AppSize.s20),
              SizedBox(
                width: double.infinity,
                height: AppSize.s44,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.splashColor,
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(ImageAssets.penIcon),
                  label: Text(
                    AppStrings.createPost,
                    style: getMediumStyle(color: ColorManager.secondary),
                  ),
                ),
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.peopleLike,
                    style: getMediumStyle(
                        color: Colors.black, fontSize: AppSize.s16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.seeALl,
                      style: getMediumStyle(
                          color: ColorManager.secondary, fontSize: AppSize.s14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s10),
              SizedBox(
                height: AppSize.s140,
                child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: AppSize.s140,
                      width: AppSize.s140,
                      decoration: BoxDecoration(
                        color: ColorManager.cardColor1,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppSize.s16),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(
                                  AppSize.s32), // Image radius
                              child: Image.asset(ImageAssets.profile,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Text(
                            "Dravya Gohil",
                            style: getMediumStyle(
                              color: Colors.black,
                              fontSize: FontSize.s14,
                            ),
                          ),
                          Text(
                            "28 M",
                            style: getRegularStyle(
                                color: ColorManager.textColor1,
                                fontSize: FontSize.s14),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: AppSize.s20);
                  },
                ),
              ),
              const SizedBox(height: AppSize.s20),
              Divider(
                height: AppSize.s1,
                color: ColorManager.borderColor1,
              ),
              const SizedBox(height: AppSize.s20),
              Obx(
                () => homeController.communityGroupList.isEmpty
                    ? const SizedBox()
                    : ChipsChoice.single(
                        padding: EdgeInsets.zero,
                        value: homeController.selectedCommunityIndex.value,
                        onChanged: (val) =>
                            homeController.selectedCommunityIndex.value = val,
                        choiceItems: C2Choice.listFrom<int, CommunityGroup>(
                          source: homeController.communityGroupList,
                          value: (i, v) => i,
                          label: (i, v) => v.name,
                        ),
                        choiceCheckmark: true,
                        choiceStyle: C2ChipStyle.filled(
                          color: ColorManager.cardColor1,
                          disabledStyle: const C2ChipStyle(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.s10),
                            ),
                          ),
                          selectedStyle: const C2ChipStyle(
                            backgroundColor: Colors.black,
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSize.s10),
                            ),
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: AppSize.s20),
              UserFeedCard(
                profileImage: ImageAssets.profile2,
                userName: "Alex Keen",
                age: '30 M',
                time: "16h",
                category: "Abc",
                reaction: "15",
                replies: "02",
                contentWidget: Text(
                  'After I was prescribed a new medicine - Glycambi I became constipated. Anyone else experience this? What helps with the constipation?',
                  style: getRegularStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                isVerified: false,
              ),
              UserFeedCard(
                isVerified: false,
                profileImage: ImageAssets.profile1,
                userName: "Jessica Walsh",
                age: '29 F',
                location: "Mumbai,India",
                time: "16h",
                reaction: "15",
                contentWidget: Column(
                  children: [
                    Text(
                      'Lately, I\'ve been dealing with Irritable Bowel Syndrome (IBS), and it\'s been quite a rollercoaster. Know any specialist who can help?',
                      style: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s14),
                    ),
                    const SizedBox(height: AppSize.s20),
                    RecommendCard(
                      location: "Mumbai, India",
                      title: "Irritable bowel syndrome (IBS)",
                      desc: "Symptoms: abdominal pain, bloating, diarrhoea",
                      callback: () {},
                    )
                  ],
                ),
              ),
              UserFeedCard(
                isVerified: false,
                profileImage: ImageAssets.profile,
                category: "Health tip",
                userName: "Wilma Stewart",
                age: '50 M',
                time: "16h",
                reaction: "15",
                replies: "02",
                contentWidget: Column(
                  children: [
                    ReadMoreText(
                      '''If you want to boost your health and wellbeing, there are plenty of natural and home remedies to choose from, ranging from avoiding charred meats and added sugars to practicing meditation.
  
  1.Limit sugary drinks
  2.Eat nuts and seeds
  3.Avoid ultra-processed foods''',
                      trimMode: TrimMode.Length,
                      trimLength: 230,
                      preDataTextStyle:
                          const TextStyle(fontWeight: FontWeight.w500),
                      style: const TextStyle(color: Colors.black),
                      colorClickableText: ColorManager.secondary,
                      trimCollapsedText: '...Show more',
                      trimExpandedText: ' show less',
                    ),
                  ],
                ),
              ),
              UserFeedCard(
                isVerified: true,
                profileImage: ImageAssets.profile,
                category: "Long Term Recovery",
                userName: "Star App",
                age: '50 M',
                time: "16h",
                reaction: "15",
                replies: "02",
                contentWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Check out this article ",
                      style: getRegularStyle(
                          color: ColorManager.black, fontSize: FontSize.s14),
                    ),
                    Text(
                      "https://indianexpress.com/article/cities/pune/pune-porsche-crash-minors-blood-sample-thrown-dna-mismatch-foul-play-9354465/",
                      maxLines: 1,
                      style: getMediumStyle(
                          color: ColorManager.secondary,
                          fontSize: FontSize.s14),
                    ),
                    const SizedBox(height: AppSize.s10),
                    AnyLinkPreview(
                      link:
                          "https://indianexpress.com/article/cities/pune/pune-porsche-crash-minors-blood-sample-thrown-dna-mismatch-foul-play-9354465/",
                      displayDirection: UIDirection.uiDirectionVertical,
                      cache: const Duration(hours: 1),
                      backgroundColor: ColorManager.cardColor1,
                      bodyStyle: getRegularStyle(
                          color: ColorManager.textColor1,
                          fontSize: FontSize.s14),
                      titleStyle: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s16),
                      errorWidget: Container(
                        color: Colors.grey[300],
                        child: const Text('Oops!'),
                      ),
                      errorImage:
                          "https://i.ytimg.com/vi/z8wrRRR7_qU/maxresdefault.jpg",
                    ),
                  ],
                ),
                replaceLikeButton: TextButton.icon(
                  icon: SvgPicture.asset(ImageAssets.heartsIcon),
                  onPressed: () {},
                  label: Text(
                    AppStrings.support,
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                ),
              ),
              UserFeedCard(
                isVerified: false,
                profileImage: ImageAssets.profile,
                category: "General",
                userName: "Ali ",
                age: '21 M',
                time: "16h",
                reaction: "15",
                replies: "02",
                contentWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReadMoreText(
                      '''I did a 30 day challenge to improve my gut health. Here’s a video on what I learnt:  youtube.com/watch?v=E3QpXj_QOqQ&ab_cha...
Let me know what you think about this. I’d suggest each of you to try this sime''',
                      trimMode: TrimMode.Length,
                      trimLength: 100,
                      preDataTextStyle:
                          const TextStyle(fontWeight: FontWeight.w500),
                      style: const TextStyle(color: Colors.black),
                      colorClickableText: ColorManager.secondary,
                      trimCollapsedText: '...Show more',
                      trimExpandedText: ' show less',
                    ),
                    const SizedBox(height: AppSize.s10),
                    AnyLinkPreview(
                      link:
                          "https://www.cbsnews.com/texas/video/victims-of-north-texas-tornado-share-their-stories-of-survival/",
                      displayDirection: UIDirection.uiDirectionVertical,
                      cache: const Duration(hours: 1),
                      backgroundColor: ColorManager.cardColor1,
                      bodyStyle: getRegularStyle(
                          color: ColorManager.textColor1,
                          fontSize: FontSize.s14),
                      titleStyle: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s16),
                      errorWidget: Container(
                        color: Colors.grey[300],
                        child: const Text('Oops!'),
                      ),
                      errorImage:
                          "https://i.ytimg.com/vi/z8wrRRR7_qU/maxresdefault.jpg",
                    ),
                  ],
                ),
                replaceLikeButton: TextButton.icon(
                  icon: SvgPicture.asset(ImageAssets.helpfulIcon),
                  onPressed: () {},
                  label: Text(
                    AppStrings.helpful,
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.s14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.secondary,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: ColorManager.white,
        ),
      ),
    );
  }
}
