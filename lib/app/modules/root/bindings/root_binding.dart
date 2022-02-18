import 'package:flutter_fb_insta_clone/app/modules/add_post/controllers/add_post_controller.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.lazyPut<AddPostController>(
      () => AddPostController(),
    );
  }
}
