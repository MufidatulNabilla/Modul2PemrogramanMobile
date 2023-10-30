import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromRGBO(
              255, 190, 188, 1.0),Color.fromRGBO(255, 190, 188, 1.0)])
        ),
        child: Center(
          child: Image.asset(
            'assets/logo_splash.png',
            width: 400,
            height: 400,
          ),
        ),
      ),
    );
  }
}
