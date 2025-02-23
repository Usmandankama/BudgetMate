import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GetStorage _storage = GetStorage();

  RxMap userData = {}.obs;

  @override
  void onReady() {
    super.onReady();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
        userData.value = userDoc.data() as Map<String, dynamic>;

        // Store in local storage
        _storage.write("userData", userData);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user data");
    }
  }

  void clearUserData() {
    userData.value = {};
    _storage.remove("userData");
  }
}
