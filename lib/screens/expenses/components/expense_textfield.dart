import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpenseTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  const ExpenseTextfield({
    super.key,
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.only(left: 10.0, top: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.fontLight, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        style: TextStyle(color: AppColors.fontWhite),
        controller: controller,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: AppColors.fontLight),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
