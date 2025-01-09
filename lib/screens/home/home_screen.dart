import 'package:budget_mate/constatnts/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpeg'),
            )
          ],
        ),
      ),
    );
  }
}
