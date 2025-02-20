import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/screens/components/actionButton.dart';
import '../expenses/text_field.dart';

import 'package:budgetmate_2/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
                    color: AppColors.fontWhite,
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
                        color: AppColors.fontWhite,
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
