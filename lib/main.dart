import 'package:budgetmate_2/screens/expenses/expense_screen.dart';
import 'package:budgetmate_2/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/splash_screen/splash_timer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
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
            GetPage(name: "/expenses", page: () => ExpenseScreen()),
          ],
          debugShowCheckedModeBanner: false,
          home: SplashTimer(),
        );
      },
    );
  }
}
