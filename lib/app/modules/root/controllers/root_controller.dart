import 'package:flutter_fb_insta_clone/app/services/auth_service.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  RxInt currentIndex = 0.obs;

  void onChangedTab(int index) {
    currentIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
