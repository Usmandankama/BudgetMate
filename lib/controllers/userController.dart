import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/userModel.dart';

class UserController extends GetxController {
  final box = GetStorage();
  Rx<UserModel?> user = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadUserData(); // Load user data on app start
  }

  // Save user to local storage
  void saveUser(UserModel userModel) {
    box.write('user', userModel.toJson()); // Save as JSON
    user.value = userModel;
  }

  // Load user from local storage
  void loadUserData() {
    var userData = box.read('user');
    if (userData != null) {
      user.value = UserModel.fromJson(userData);
    }
  }

  // Update user budget
  void updateBudgetLimit(double newLimit) {
    if (user.value != null) {
      user.value!.budgetLimit = newLimit;
      saveUser(user.value!);
    }
  }

  // Clear user data
  void logout() {
    box.remove('user');
    user.value = null;
  }
}
