import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/screens/components/actionButton.dart';
import '../components/text_field.dart';
import 'package:budgetmate_2/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void registerUser() {
    authController.registerUser(
      name: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                SizedBox(height: 140.h),
                Text(
                  'Sign in or \ncreate an account',
                  style: TextStyle(
                    color: AppColors.fontWhite,
                    fontFamily: 'Montserrat',
                    fontSize: 36.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.h),
                Center(
                  child: SizedBox(
                    width: 320.w,
                    child: CustomTextfield(
                      label: 'username',
                      icon: Icons.person,
                      controller: usernameController,
                    ),
                  ),
                ),
                SizedBox(height: 23.h),
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
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: 23.h),
                Center(
                  child: SizedBox(
                    width: 320.w,
                    child: CustomTextfield(
                      label: 'confirm password',
                      icon: Icons.lock,
                      controller: confirmPasswordController,
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                ActionButton(title: 'Register', onPressed: registerUser),
                SizedBox(height: 30.h),
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
                        Get.to(() => const LoginScreen());
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
