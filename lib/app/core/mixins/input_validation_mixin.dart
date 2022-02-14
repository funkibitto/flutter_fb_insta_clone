import 'package:get/get.dart';

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String email) {
    return GetUtils.isEmail(email);
  }
}
