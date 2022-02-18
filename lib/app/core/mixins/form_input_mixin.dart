import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

mixin FormInputMixin {
  void _onChanged(dynamic val) => debugPrint(val.toString());

  Widget buildUsernameField() {
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

  Widget buildEmailField() {
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

  Widget buildPasswordField() {
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

  Widget buildConfirmPasswordField({formKey}) {
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
            if (val != formKey.currentState?.fields['password']?.value) {
              return 'Passwords do not match';
            }
            return null;
          }
        ]),
      );
    });
  }

  Widget buildBioField() {
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

  Widget buildDescriptionField() {
    return Builder(builder: (context) {
      return FormBuilderTextField(
        name: 'description',
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
            hintText: "Write a caption...", border: InputBorder.none),
        maxLines: 3,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            context,
            errorText: 'description required',
          ),
        ]),
      );
    });
  }
}
