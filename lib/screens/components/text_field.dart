import 'package:flutter/material.dart';
import 'package:budget_mate/constatnts/colors.dart' ;
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomTextfield extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextfield({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.obscureText = false, MaterialColor? borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.fontLight),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.fontLight,
          )
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.fontLight,
          ),
          borderRadius: BorderRadius.circular(12.0.r),
        ),
      ),
    );
  }
}
