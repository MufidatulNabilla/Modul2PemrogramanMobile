import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final getStorage = GetStorage();
  var name = "".obs;
  var email = "".obs;
  var isNameValid = true.obs;
  var isEmailValid = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  kliklogin() {
    isNameValid.value = name.isNotEmpty;
    isEmailValid.value = email.endsWith('@gmail.com');

    if (isNameValid.value && isEmailValid.value) {
      getStorage.write("status", 1);
      getStorage.write("name", name.value);
      getStorage.write("email", email.value);
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
