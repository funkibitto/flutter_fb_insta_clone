import 'package:dio/native_imp.dart';

class HttpService extends DioForNative {
  HttpService() {
    options.connectTimeout = 5000;
  }
}
