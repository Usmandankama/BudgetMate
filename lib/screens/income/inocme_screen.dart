import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/controllers/income_controller.dart';
import 'package:budgetmate_2/screens/components/actionButton.dart';
import 'package:budgetmate_2/screens/components/custom_datepicker.dart';
import 'package:budgetmate_2/screens/components/custom_dropdown.dart'
    show CustomDropdown;
import 'package:budgetmate_2/screens/components/custom_txtfield_2.dart';
import 'package:budgetmate_2/screens/income/components/income_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  final IncomeController incomeController = Get.find<IncomeController>();

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController decriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now(); // Store selected date


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add income',
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
            IncomeDropdown(),
            SizedBox(height: 20.h),
            CustomTxtfield2(name: 'Name', controller: namecontroller),
            SizedBox(height: 20.h),
            CustomTxtfield2(name: 'Amount', controller: amountController),
            SizedBox(height: 20.h),
            CustomDatepicker(
              onDateSelected: (DateTime selectedDate) {
                setState(() {
                  this.selectedDate =
                      selectedDate; // Update the selected date in the parent widget
                });
              },
            ),

            SizedBox(height: 20.h),
            CustomTxtfield2(
              name: 'Description',
              controller: decriptionController,
            ),
            SizedBox(height: 100.h),
            ActionButton(
              title: 'Add Income',
              onPressed: () {
                // incomeController.addIncome(
                //   name: namecontroller.text.trim(),
                //   amount: double.parse(amountController.text.trim()),
                //   date: selectedDate., // Ensure this is formatted correctly
                //   description: descriptionController.text.trim(),
                //   category:
                //       selectedCategory, // Make sure this is coming from IncomeDropdown
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
