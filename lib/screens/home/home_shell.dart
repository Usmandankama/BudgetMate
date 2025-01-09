import 'dart:async';

import 'package:budget_mate/constatnts/colors.dart';
import 'package:budget_mate/screens/login/login_screen.dart';
import 'package:budget_mate/screens/splash_screen/spalsh_screen.dart';
import 'package:flutter/material.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    // Create a timer for 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset('assets/images/icon.png'),
      ),
    );
  }
}
