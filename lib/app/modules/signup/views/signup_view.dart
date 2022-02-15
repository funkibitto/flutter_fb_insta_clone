import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/theme/app_colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter_fb_insta_clone/app/modules/signup/controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  void _onChanged(dynamic val) => debugPrint(val.toString());

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
                  _buildUsernameField(),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildEmailField(),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildPasswordField(),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildConfirmPasswordField(),
                  const SizedBox(
                    height: 24,
                  ),
                  _buildBioField(),
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
        controller.image.value != null
            ? CircleAvatar(
                radius: 64,
                backgroundImage: MemoryImage(controller.image.value!),
                backgroundColor: Colors.red,
              )
            : const CircleAvatar(
                radius: 64,
                backgroundImage:
                    NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                backgroundColor: Colors.red,
              ),
        if (kReleaseMode == true)
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

  Widget _buildUsernameField() {
    return Builder(builder: (context) {
      return FormBuilderTextField(
        name: 'username',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          labelText: 'User name',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            context,
            errorText: 'User required',
          ),
        ]),
      );
    });
  }

  Widget _buildEmailField() {
    return Builder(builder: (context) {
      return FormBuilderTextField(
        name: 'email',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          labelText: 'Email',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            context,
            errorText: 'email required',
          ),
          FormBuilderValidators.email(
            context,
            errorText: 'not email',
          ),
        ]),
      );
    });
  }

  Widget _buildPasswordField() {
    return Builder(builder: (context) {
      return FormBuilderTextField(
        name: 'password',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            context,
            errorText: 'Password required',
          ),
          FormBuilderValidators.minLength(
            context,
            6,
            errorText: 'Password min length 6',
          ),
        ]),
      );
    });
  }

  Widget _buildConfirmPasswordField() {
    return Builder(builder: (context) {
      return FormBuilderTextField(
        name: 'confirm_password',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          labelText: 'Confirm Password',
        ),
        obscureText: true,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            context,
            errorText: 'Password required',
          ),
          (val) {
            if (val !=
                controller.formKey.currentState?.fields['password']?.value) {
              return 'Passwords do not match';
            }
            return null;
          }
        ]),
      );
    });
  }

  Widget _buildBioField() {
    return Builder(builder: (context) {
      return FormBuilderTextField(
        name: 'bio',
        decoration: const InputDecoration(
          labelText: 'Bio',
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            context,
            errorText: 'Bio required',
          ),
        ]),
      );
    });
  }
}
