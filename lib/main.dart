import 'package:budget_mate/screens/home/home_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home:  HomeShell()
        );
      },
    );
  }
}