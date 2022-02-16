import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/utils/app_utils.dart';
import 'package:flutter_fb_insta_clone/app/services/auth_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupController extends GetxController {
  RxBool isLoading = false.obs;
  final image = Rxn<Uint8List>();

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  selectImage() async {
    Uint8List im = await AppUtils.pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    image.value = im;
  }

  submit() async {
    if (!isLoading.value &&
        (formKey.currentState?.saveAndValidate() ?? false)) {
      debugPrint(formKey.currentState?.value.toString());

      isLoading(true);
      String res = await AuthService.to.signUpUser(
        email: formKey.currentState?.value['email'],
        password: formKey.currentState?.value['password'],
        username: formKey.currentState?.value['username'],
        bio: formKey.currentState?.value['bio'],
        file: image.value,
      );
      if (res == "success") {
        Get.offAllNamed('/root');
      } else {
        // show the error
        AppUtils.showSnackBar(Get.context!, res);
      }
    }
    isLoading(false);
  }
}
