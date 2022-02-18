import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/mixins/form_input_mixin.dart';
import 'package:flutter_fb_insta_clone/app/core/theme/app_colors.dart';
import 'package:flutter_fb_insta_clone/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignupView extends GetView<SignupController> with FormInputMixin {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: SingleChildScrollView(
            child: FormBuilder(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/ic_instagram.svg',
                    color: AppColors.primaryColor,
                    height: 64,
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  _buildProfileImage(),
                  const SizedBox(
                    height: 24,
                  ),
                  buildUsernameField(),
                  const SizedBox(
                    height: 24,
                  ),
                  buildEmailField(),
                  const SizedBox(
                    height: 24,
                  ),
                  buildPasswordField(),
                  const SizedBox(
                    height: 24,
                  ),
                  buildConfirmPasswordField(formKey: controller.formKey),
                  const SizedBox(
                    height: 24,
                  ),
                  buildBioField(),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    child: Obx(() => Container(
                          child: !controller.isLoading.value
                              ? const Text(
                                  'Sign up',
                                )
                              : const CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ),
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                            color: AppColors.blueColor,
                          ),
                        )),
                    onTap: controller.submit,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          'Already have an account?',
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                      GestureDetector(
                        onTap: () => Get.to('/login'),
                        child: Container(
                          child: const Text(
                            ' Login.',
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
      ),
    );
  }

  Widget _buildProfileImage() {
    return Stack(
      children: [
        Obx(
          () => controller.image.value != null
              ? CircleAvatar(
                  radius: 64,
                  backgroundImage: MemoryImage(controller.image.value!),
                  backgroundColor: Colors.white,
                )
              : const CircleAvatar(
                  radius: 64,
                  backgroundImage:
                      NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                  backgroundColor: Colors.white,
                ),
        ),
        Positioned(
          bottom: -10,
          left: 80,
          child: IconButton(
            onPressed: controller.selectImage,
            icon: const Icon(Icons.add_a_photo),
          ),
        )
      ],
    );
  }
}
