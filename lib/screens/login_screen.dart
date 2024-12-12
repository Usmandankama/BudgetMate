import 'package:budget_mate/constatnts/colors.dart' as colors;
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colors.AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text('Sign in or \ncreate an account',style: TextStyle(
              color: colors.AppColors.fontLight, 
              fontFamily: 'Montserrat',
              fontSize: 36,
            ),)
          ],
        ),
      ),
    );
  }
}
