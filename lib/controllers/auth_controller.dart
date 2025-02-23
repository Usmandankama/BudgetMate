import 'package:budgetmate_2/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage();

  var isLoggedIn = false.obs;
  var email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  // Register a new user
  void register(String email, String password, String confirmPassword, String username) {
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match!");
      return;
    }

    if (box.hasData(email)) {
      Get.snackbar("Error", "User already exists!");
      return;
    }

    box.write(email, password);
    box.write('username', username);
    Get.snackbar("Success", "User registered successfully!");
    Get.toNamed('/login');
  }

  // Login user
  void login(String email, String password) {
    String? storedPassword = box.read(email);

    if (storedPassword == null) {
      Get.snackbar("Error", "User not found!");
    } else if (storedPassword == password) {
      box.write('logged_in_user', email);
      isLoggedIn.value = true;
      this.email.value = email;
      Get.snackbar("Success", "Login successful!");
    } else {
      Get.snackbar("Error", "Incorrect password!");
    }
  }



  // Logout user
  void logout() {
    box.remove('logged_in_user');
    isLoggedIn.value = false;
    email.value = '';
    Get.snackbar("Success", "Logged out!");
  }

  // Check if user is logged in
  void checkLoginStatus() {
    String? storedUser = box.read('logged_in_user');
    if (storedUser != null) {
      isLoggedIn.value = true;
      email.value = storedUser;
    }
  }
}
