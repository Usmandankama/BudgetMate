import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetmate_2/controllers/expense_controller.dart';
import 'dart:math'; // Import for min function

class ExpenseListView extends StatelessWidget {
  const ExpenseListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ExpenseController expenseController = Get.find<ExpenseController>();

    return Obx(() {
      if (expenseController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        ); // Show loading indicator
      }

      if (expenseController.expenses.isEmpty) {
        return const Center(
          child: Text("No expenses found."),
        ); // Show message if no expenses
      }

      // Limit to first 8 items
      int itemCount = min(8, expenseController.expenses.length);

      return SizedBox(
        height: 400, // Give ListView a fixed height (Adjust as needed)
        child: ListView.builder(
          shrinkWrap: true, // Allow ListView to take only required space
          itemCount: itemCount,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final expense = expenseController.expenses[index];

            return Card(
              color: AppColors.accentColor,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: ListTile(
                leading: Icon(
                  expense['icon'] ?? Icons.category,
                  color: AppColors.secondaryColor,
                  size: 32,
                ),
                title: Text(
                  expense['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.fontWhite,
                  ),
                ),
                subtitle: Text(
                  "${expense['category']} - ${expense['date']}",
                  style: const TextStyle(color: AppColors.fontLight),
                ),
                trailing: Text(
                  "- \$${expense['amount'].toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
