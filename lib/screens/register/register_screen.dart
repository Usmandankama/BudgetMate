import 'package:budget_mate/constatnts/colors.dart';
import 'package:budget_mate/screens/components/actionButton.dart';
import 'package:budget_mate/screens/components/text_field.dart';
import 'package:budget_mate/screens/login/login_screen.dart';
import 'package:budget_mate/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/forgot_password_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void signIn() {}

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Unfocus the text fields
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  'Sign in or \ncreate an account',
                  style: TextStyle(
                    color: AppColors.fontLight,
                    fontFamily: 'Montserrat',
                    fontSize: 36.sp,
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: SizedBox(
                    width: 320.w,
                    child: CustomTextfield(
                      label: 'email',
                      icon: Icons.email,
                      controller: emailController,
                    ),
                  ),
                ),
                SizedBox(height: 23.h),
                Center(
                  child: SizedBox(
                    width: 320.w,
                    child: CustomTextfield(
                      label: 'password',
                      icon: Icons.lock,
                      controller: passwordController,
                    ),
                  ),
                ),
                SizedBox(height: 23.h),
                Center(
                  child: SizedBox(
                    width: 320.w,
                    child: CustomTextfield(
                      label: ' confirm password',
                      icon: Icons.lock,
                      controller: confirmPasswordController,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(height: 30.h),
                ActionButton(title: 'Register', onPressed: signIn),
                SizedBox(height: 30.h),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13.sp,
                        color: AppColors.fontLight,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to registration screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13.sp,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
