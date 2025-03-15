import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user data");
    }
  }
}
