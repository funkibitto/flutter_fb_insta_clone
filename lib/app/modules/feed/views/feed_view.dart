import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feed_controller.dart';

class FeedView extends GetView<FeedController> {
  FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FeedView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        key: const PageStorageKey('bottom_navigation_hide'),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return _items[index];
        },
      ),
    );
  }

  final List<Widget> _items = List<Widget>.generate(
      30,
      (index) => Container(
            color: Color(Random().nextInt(0xffffffff)),
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.all(8),
            child: Text(
              index.toString(),
              style: const TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
          ));
}
