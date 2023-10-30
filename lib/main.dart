import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modul2/app/modules/splash/bindings/splash_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
    ),
  );
}