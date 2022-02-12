import 'package:get/get.dart';

import '../modules/add_post/bindings/add_post_binding.dart';
import '../modules/add_post/views/add_post_view.dart';
import '../modules/feed/bindings/feed_binding.dart';
import '../modules/feed/views/feed_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      binding: RootBinding(),
    ),
  ];
}
