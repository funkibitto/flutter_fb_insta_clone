import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/theme/app_colors.dart';
import 'package:flutter_fb_insta_clone/app/core/values/app_constants.dart';
import 'package:flutter_fb_insta_clone/app/modules/root/controllers/root_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WebLayout extends GetResponsiveView<RootController> {
  WebLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mobileBackgroundColor,
          centerTitle: false,
          title: SvgPicture.asset(
            'assets/svg/ic_instagram.svg',
            color: AppColors.primaryColor,
            height: 32,
          ),
          actions: List<Widget>.generate(
            AppConstants.rootViewItems.length,
            (index) => IconButton(
              icon: Icon(
                AppConstants.rootViewItems[index].iconData,
                color: controller.currentIndex.value == index
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
              ),
              onPressed: () => controller.onChangedTab(index),
            ),
          ),
        ),
        body: AppConstants.rootViewItems[controller.currentIndex.value].widget,
      );
    });
  }
}
