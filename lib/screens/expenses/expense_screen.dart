import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/screens/components/actionButton.dart';
import 'package:budgetmate_2/screens/expenses/components/custom_datepicker.dart';
import 'package:budgetmate_2/screens/expenses/components/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add expense',
          style: TextStyle(
            color: AppColors.fontWhite,
            fontSize: 20.sp,
            fontFamily: 'Montserrat',
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.fontWhite,
      ),
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            CustomDropdown(),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                fillColor: AppColors.fontWhite,
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: AppColors.fontWhite,
                  fontFamily: 'Montserrat',
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.fontLight),
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                fillColor: AppColors.fontWhite,
                labelText: '\$ Amount',
                labelStyle: TextStyle(
                  color: AppColors.fontWhite,
                  fontFamily: 'Montserrat',
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.fontLight),
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomDatepicker(),
            SizedBox(height: 20.h),
            TextField(
              decoration: InputDecoration(
                fillColor: AppColors.fontWhite,
                labelText: 'Description',
                labelStyle: TextStyle(
                  color: AppColors.fontWhite,
                  fontFamily: 'Montserrat',
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.fontLight),
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
              ),
            ),
            SizedBox(height: 100.h),

            ActionButton(title: 'Add expense', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
