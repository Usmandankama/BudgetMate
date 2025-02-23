import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constatnts/colors.dart';

class CustomTxtfield2 extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  const CustomTxtfield2({super.key, required this.name, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.fontWhite,
      style: TextStyle(color: AppColors.fontWhite, fontFamily: 'Montserrat'),
      decoration: InputDecoration(
        labelText: name,
        focusColor: AppColors.fontWhite,
        labelStyle: TextStyle(
          color: AppColors.fontWhite,
          fontFamily: 'Montserrat',
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.fontLight),
          borderRadius: BorderRadius.circular(16.0.r),
        ),
      ),
    );
  }
}
