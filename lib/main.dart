import 'package:budgetmate_2/controllers/auth_controller.dart';
import 'package:budgetmate_2/controllers/user_controller.dart';
import 'package:budgetmate_2/screens/expenses/expense_screen.dart';
import 'package:budgetmate_2/screens/home/home_screen.dart';
import 'package:budgetmate_2/screens/income/inocme_screen.dart';
import 'package:budgetmate_2/screens/login/login_screen.dart';
import 'package:budgetmate_2/screens/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controllers/expense_controller.dart';
import 'controllers/income_controller.dart';
import 'screens/splash_screen/splash_timer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put(UserController());
  Get.put(AuthController());
  Get.put(IncomeController());
  Get.put(ExpenseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (_, __) {
        return GetMaterialApp(
          initialRoute: "/",
          getPages: [
            GetPage(name: "/", page: () => HomeScreen()),
            GetPage(name: "/login", page: () => LoginScreen()),
            GetPage(name: "/register", page: () => RegisterScreen()),
            GetPage(name: "/expenses", page: () => ExpenseScreen()),
            GetPage(name: "/income", page: () => IncomeScreen()),
          ],
          debugShowCheckedModeBanner: false,
          home: SplashTimer(),
        );
      },
    );
  }
}
