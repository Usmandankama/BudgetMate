import 'package:budget_mate/constatnts/colors.dart';
import 'package:budget_mate/screens/components/actionButton.dart';
import 'package:budget_mate/screens/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void signIn() {}

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
                SizedBox(height: 50.h),
                ActionButton(title: 'Sign in', onPressed: signIn),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColors.fontLight, // Line color
                        thickness: 1, // Line thickness
                      ),
                    ),
                    SizedBox(width: 10.w), // Add spacing between text and divider
                    Text(
                      'or login with',
                      style: TextStyle(
                        color: AppColors.fontLight,
                        fontSize: 16.sp,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(width: 10.w),
                    const Expanded(
                      child: Divider(
                        color: AppColors.fontLight, // Line color
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
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13.sp,
                        color: AppColors.fontLight,
                      ),
                    ),
                    Text(
                      'Register',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13.sp,
                        color: AppColors.secondaryColor,
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
