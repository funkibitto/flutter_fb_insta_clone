import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/utils/app_utils.dart';
import 'package:flutter_fb_insta_clone/app/services/auth_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  submit() async {
    if (!isLoading.value &&
        (formKey.currentState?.saveAndValidate() ?? false)) {
      debugPrint(formKey.currentState?.value.toString());

      isLoading(true);
      String res = await AuthService.to.loginUser(
        email: formKey.currentState?.value['email'],
        password: formKey.currentState?.value['password'],
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
