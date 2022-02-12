import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_post_controller.dart';

class AddPostView extends GetView<AddPostController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddPostView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddPostView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
