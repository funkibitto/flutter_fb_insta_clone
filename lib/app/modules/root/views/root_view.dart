import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/widgets/layout/mobile_layout.dart';
import 'package:flutter_fb_insta_clone/app/widgets/layout/web_layout.dart';
import 'package:get/get.dart';
import 'package:flutter_fb_insta_clone/app/modules/root/controllers/root_controller.dart';

class RootView extends GetResponsiveView<RootController> {
  RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screen.context = context;
    return LayoutBuilder(builder: (context, constraints) {
      if (!screen.isPhone) {
        // 600 can be changed to 900 if you want to display tablet screen with mobile screen layout
        return WebLayout();
      }
      return MobileLayout();
    });
  }
}
