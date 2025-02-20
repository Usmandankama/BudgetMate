import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/screens/components/actionButton.dart';
import 'package:budgetmate_2/screens/home/home_shell.dart';
import 'package:budgetmate_2/screens/login/forgot_password_screen.dart';
import 'package:budgetmate_2/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void signIn() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeShell(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: [
                      Text(
                        "Forgot password? ",
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const forgotPasswordScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 13.sp,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                ActionButton(title: 'Sign in', onPressed: signIn),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.fontWhite, // Line color
                        thickness: 1, // Line thickness
                      ),
                    ),
                    SizedBox(
                        width: 10.w), // Add spacing between text and divider
                    Text(
                      'or login with',
                      style: TextStyle(
                        color: AppColors.fontWhite,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    const Expanded(
                      child: Divider(
                        color: AppColors.fontWhite, // Line color
                        thickness: 1, // Line thickness
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: 300.w,
                  height: 50.h,
                  child: Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 40.h)),
                        shape: WidgetStatePropertyAll(
                          ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16.r),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/google.png',
                            height: 21.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'login with google',
                            style: TextStyle(
                              color: AppColors.fontDark,
                              fontSize: 16.sp,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
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
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
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
