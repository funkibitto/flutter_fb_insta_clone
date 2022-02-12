import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/modules/add_post/views/add_post_view.dart';
import 'package:flutter_fb_insta_clone/app/modules/feed/views/feed_view.dart';
import 'package:flutter_fb_insta_clone/app/modules/profile/views/profile_view.dart';
import 'package:flutter_fb_insta_clone/app/modules/search/views/search_view.dart';

class AppConstants {
  static final List<RootViewItem> rootViewItems = [
    RootViewItem(widget: FeedView(), iconData: Icons.home),
    RootViewItem(widget: SearchView(), iconData: Icons.search),
    RootViewItem(widget: AddPostView(), iconData: Icons.add_circle),
    RootViewItem(widget: SizedBox.shrink(), iconData: Icons.favorite),
    RootViewItem(widget: ProfileView(), iconData: Icons.person),
  ];
}

class RootViewItem {
  final Widget widget;
  final IconData iconData;

  RootViewItem({required this.widget, required this.iconData});
}
