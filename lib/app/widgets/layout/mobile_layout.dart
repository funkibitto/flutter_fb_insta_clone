import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/theme/app_colors.dart';
import 'package:flutter_fb_insta_clone/app/core/values/app_constants.dart';
import 'package:flutter_fb_insta_clone/app/modules/root/controllers/root_controller.dart';
import 'package:get/get.dart';

class MobileLayout extends GetResponsiveView<RootController> {
  MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return WillPopScope(
        child: Scaffold(
          body:
              AppConstants.rootViewItems[controller.currentIndex.value].widget,
          bottomNavigationBar: CupertinoTabBar(
            height: 60.0,
            backgroundColor: AppColors.mobileBackgroundColor,
            items: List<BottomNavigationBarItem>.generate(
              AppConstants.rootViewItems.length,
              (index) => _buildBarItem(
                iconData: AppConstants.rootViewItems[index].iconData,
                isSelected: controller.currentIndex.value == index,
              ),
            ),
            onTap: controller.onChangedTab,
            currentIndex: controller.currentIndex.value,
          ),
        ),
        onWillPop: () async {
          return false;
        },
      );
    });
  }

  BottomNavigationBarItem _buildBarItem(
      {required IconData iconData, required bool isSelected}) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
      ),
      label: '',
      backgroundColor: AppColors.primaryColor,
    );
  }
}
