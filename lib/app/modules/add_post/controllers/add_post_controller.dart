import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/utils/app_utils.dart';
import 'package:flutter_fb_insta_clone/app/core/utils/task_extension.dart';
import 'package:flutter_fb_insta_clone/app/data/models/user.dart' as model;
import 'package:flutter_fb_insta_clone/app/services/auth_service.dart';
import 'package:flutter_fb_insta_clone/app/services/firestore_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostController extends GetxController {
  RxBool isLoading = false.obs;
  final file = Rxn<Uint8List>();
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  selectFromCamera() async {
    Get.back();
    file.value = await AppUtils.pickImage(ImageSource.camera);
  }

  selectFromGallery() async {
    Get.back();
    file.value = await AppUtils.pickImage(ImageSource.gallery);
  }

  postImage() async {
    model.User? user = AuthService.to.user.value;
    if (file.value == null ||
        user == null ||
        isLoading.value ||
        !formKey.currentState!.validate()) return;
    formKey.currentState?.save();

    isLoading(true);

    await Task(() => FireStoreService().uploadPost(
            description: formKey.currentState?.value['description'],
            file: file.value!,
            uid: user.uid,
            username: user.username,
            profImage: user.photoUrl))
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((value) {
      value.fold(
        (failure) => AppUtils.showSnackBar(Get.context!, failure.toString()),
        (result) {
          AppUtils.showSnackBar(
            Get.context!,
            'Posted!',
          );
          clearImage();
        },
      );
    });

    isLoading(false);
  }

  clearImage() {
    file.value = null;
  }
}
