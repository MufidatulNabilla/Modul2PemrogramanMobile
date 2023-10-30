import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  //final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    //print('OnReady SplashController');
    if(getStorage.read("status") != null){
      Future.delayed(const Duration(milliseconds: 3000), (){
        Get.offAllNamed(Routes.HOME);
      });
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  //void increment() => count.value++;
}
