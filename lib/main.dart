import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fb_insta_clone/app/core/theme/app_colors.dart';
import 'package:flutter_fb_insta_clone/app/services/auth_service.dart';
import 'package:flutter_fb_insta_clone/app/services/storage_service.dart';
import 'package:flutter_fb_insta_clone/firebase_options.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.mobileBackgroundColor,
      ),
      home: const Center(
        child: SpinKitWave(color: Colors.white, size: 20.0),
      ),
      initialBinding: BindingsBuilder(
        () {
          Get.put(AuthService());
          Get.put(StorageService());
          // Get.put(SplashService());
        },
      ),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      getPages: AppPages.routes,
    );
  }
}
