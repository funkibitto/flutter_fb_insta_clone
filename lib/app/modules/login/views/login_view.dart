import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/mixins/form_input_mixin.dart';
import 'package:flutter_fb_insta_clone/app/core/theme/app_colors.dart';
import 'package:flutter_fb_insta_clone/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginView extends GetResponsiveView<LoginController> with FormInputMixin {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screen.context = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: screen.isDesktop
              ? EdgeInsets.symmetric(horizontal: Get.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                SvgPicture.asset(
                  'assets/svg/ic_instagram.svg',
                  color: AppColors.primaryColor,
                  height: 64,
                ),
                const SizedBox(
                  height: 64,
                ),
                buildEmailField(),
                const SizedBox(
                  height: 64,
                ),
                buildPasswordField(),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  child: Obx(() => Container(
                        child: !controller.isLoading.value
                            ? const Text(
                                'Log in',
                              )
                            : const CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          color: AppColors.blueColor,
                        ),
                      )),
                  onTap: controller.submit,
                ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: const Text(
                        'Dont have an account?',
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAllNamed('/root'),
                      child: Container(
                        child: const Text(
                          ' Signup.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
