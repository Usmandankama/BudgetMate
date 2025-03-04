import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/controllers/category_controller.dart';
import 'package:budgetmate_2/controllers/expense_controller.dart';
import 'package:budgetmate_2/screens/components/actionButton.dart';
import 'package:budgetmate_2/screens/components/custom_datepicker.dart';
import 'package:budgetmate_2/screens/components/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final ExpenseController expenseController = Get.find<ExpenseController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now(); // Store selected date
  String selectedCategory = ''; // Store selected category
  bool isLoading = false;

  void addExpense() async {
    setState(() {
      isLoading = true; // Start loading
    });

    await expenseController.addExpense(
      name: nameController.text.trim(),
      amount: double.tryParse(amountController.text.trim()) ?? 0.0,
      date: DateFormat('yyyy-MM-dd').format(selectedDate), // Format date
      description: descriptionController.text.trim(),
      category: selectedCategory,
    );

    // Clear text fields and reset state
    nameController.clear();
    amountController.clear();
    descriptionController.clear();
    setState(() {
      selectedCategory = '';
      selectedDate = DateTime.now();
      isLoading = false; // Stop loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          children: [
            SizedBox(height: 50.h),
            CustomDropdown(
              onCategorySelected: (String selectedCategory) {
                setState(() {
                  this.selectedCategory = selectedCategory;
                });
              },
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: nameController,
              cursorColor: AppColors.fontWhite,
              style: TextStyle(
                color: AppColors.fontWhite,
                fontFamily: 'Montserrat',
              ),
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: AppColors.fontWhite,
                  fontFamily: 'Montserrat',
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.fontLight),
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: AppColors.fontWhite,
                fontFamily: 'Montserrat',
              ),
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(
                  color: AppColors.fontWhite,
                  fontFamily: 'Montserrat',
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.fontLight),
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomDatepicker(
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date; // Update selected date
                });
              },
            ),
            SizedBox(height: 20.h),
            TextField(
              controller: descriptionController,
              style: TextStyle(
                color: AppColors.fontWhite,
                fontFamily: 'Montserrat',
              ),
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(
                  color: AppColors.fontWhite,
                  fontFamily: 'Montserrat',
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.fontLight),
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
              ),
            ),
            SizedBox(height: 100.h),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: isLoading ? null : addExpense, // Disable button if loading
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white) // Show loading spinner
                    : Text(
                        'Add expense',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'Montserrat',
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
