import 'package:budgetmate_2/controllers/auth_controller.dart';
import 'package:budgetmate_2/controllers/user_controller.dart';
import 'package:budgetmate_2/screens/expenses/expense_screen.dart';
import 'package:budgetmate_2/screens/home/home_screen.dart';
import 'package:budgetmate_2/screens/home/home_shell.dart';
import 'package:budgetmate_2/screens/income/income_screen.dart';
import 'package:budgetmate_2/screens/login/login_screen.dart';
import 'package:budgetmate_2/screens/register/register_screen.dart';
import 'package:budgetmate_2/screens/splash_screen/splash_timer.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controllers/expense_controller.dart';
import 'controllers/income_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init(); // Initialize local storage

  Get.put(UserController());
  Get.put(AuthController());
  Get.put(IncomeController());
  Get.put(ExpenseController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, __) {
        return GetMaterialApp(
          initialRoute: "/",
          getPages: [
            GetPage(name: "/", page: () => const HomeScreen()),
            GetPage(name: "/login", page: () => const LoginScreen()),
            GetPage(name: "/register", page: () => const RegisterScreen()),
            GetPage(name: "/expenses", page: () => const ExpenseScreen()),
            GetPage(name: "/income", page: () => const IncomeScreen()),
          ],
          debugShowCheckedModeBanner: false,
          home: _decideStartingScreen(),
        );
      },
    );
  }

  Widget _decideStartingScreen() {
    final box = GetStorage();
    bool isFirstTime = box.read("isFirstTime") ?? true; // Default is true
    User? user = FirebaseAuth.instance.currentUser;

    if (isFirstTime) {
      // Set first-time flag to false after showing splash screen
      box.write("isFirstTime", false);
      return const SplashTimer();
    } else if (user == null) {
      return const LoginScreen();
    } else {
      return const HomeShell();
    }
  }
}
