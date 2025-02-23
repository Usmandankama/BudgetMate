import 'package:budgetmate_2/controllers/auth_controller.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  // Observable user data
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  // var profilePic = ''.obs;
  // var userId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData(); // Load data from GetStorage
  }

  // Load user data from GetStorage
  void loadUserData() {
    username.value = AuthController().box.read('username') ?? '';
    email.value = AuthController().box.read('email') ?? '';
    // profilePic.value = _storage.read('profilePic') ?? '';
    // userId.value = _storage.read('userId') ?? '';
  }

  // Update user data in GetStorage
  void updateUserData(String name, String mail, String pic) {
    username.value = name;
    email.value = mail;
    // profilePic.value = pic;

    AuthController().box.write('username', name);
    AuthController().box.write('email', mail);
    AuthController().box.write('profilePic', pic);
  }

  // Logout and clear stored data
  void logout() {
    AuthController().box.erase;
    username.value = '';
    email.value = '';
    // profilePic.value = '';
    // userId.value = '';
    Get.offAllNamed('/login'); // Redirect to login
  }
}
