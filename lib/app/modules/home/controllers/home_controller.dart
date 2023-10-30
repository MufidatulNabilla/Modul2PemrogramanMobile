import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final getStorage = GetStorage();
  var name = "".obs;
  var email = "".obs;

  @override
  void onInit() {
    super.onInit();
    name.value = getStorage.read("name") ?? "";
    email.value = getStorage.read("email") ?? "";
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  logout(){
    getStorage.erase();
    Get.offAllNamed(Routes.LOGIN);
  }

  // void increment() => count.value++;
}
