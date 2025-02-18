// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class AuthController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   Rx<User?> firebaseUser = Rx<User?>(null);

//   @override
//   void onInit() {
//     firebaseUser.bindStream(_auth.authStateChanges());
//     super.onInit();
//   }

//   Future<void> signIn(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }

//   void signOut() async {
//     await _auth.signOut();
//   }
// }
