import 'package:budget_mate/constatnts/colors.dart';
import 'package:budget_mate/screens/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 80),
            const Text(
              'Sign in or \ncreate an account',
              style: TextStyle(
                color: AppColors.fontLight,
                fontFamily: 'Montserrat',
                fontSize: 36,
              ),
            ),
            SizedBox(height: 100.h),
            Center(
              child: SizedBox(
                width: 320.w,
                child: CustomTextfield(
                  label: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
