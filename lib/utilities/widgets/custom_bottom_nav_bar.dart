import 'package:arham_labs_assignment/screens/home/home_view.dart';
import 'package:arham_labs_assignment/utilities/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/values_manager.dart';

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar({super.key});

  ///int
  final RxInt selectedIndex = 0.obs;

  //list of screens
  final List<Widget> _screens = [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: _screens[selectedIndex.value],
          bottomNavigationBar: buildBottomNavigationBar(),
        ));
  }

  //bottom bar
  Container buildBottomNavigationBar() {
    return Container(
        height: AppSize.s60,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.white70,
                spreadRadius: -2,
                blurRadius: 8,
                offset: Offset(0, -4)),
          ],
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
              fontWeight: FontWeightManager.semiBold, fontSize: FontSize.s12),
          currentIndex: selectedIndex.value,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed, // Fixed
          backgroundColor: Colors.white,
          selectedItemColor: ColorManager.secondary,
          items: [
            buildNavItem(
              AppStrings.home,
              ImageAssets.homeIcon,
            ),
            buildNavItem(
              AppStrings.services,
              ImageAssets.serviceIcon,
            ),
            buildNavItem(
              AppStrings.chat,
              ImageAssets.chatIcon,
            ),
            buildNavItem(
              AppStrings.journal,
              ImageAssets.journalIcon,
            ),
            buildNavItem(
              AppStrings.profile,
              ImageAssets.profileIcon,
            ),
          ],
          onTap: (index) {
            selectedIndex.value = index;
          },
        ));
  }

  //nav items
  BottomNavigationBarItem buildNavItem(String label, String iconAsset) {
    return BottomNavigationBarItem(
        icon: Image.asset(iconAsset, width: AppSize.s24), label: label);
  }
}
