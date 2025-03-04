import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetmate_2/constatnts/colors.dart';

class CustomDropdown extends StatelessWidget {
  final Function(String) onCategorySelected; // Callback function

  const CustomDropdown({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Food & Groceries",
      "Transport",
      "Rent",
      "Utilities",
      "Entertainment",
      "Healthcare",
      "Shopping",
      "Education",
      "Savings",
      "Miscellaneous",
    ];

    var selectedCategory = "Food & Groceries".obs;

    IconData _getCategoryIcon(String category) {
      switch (category) {
        case "Food & Groceries":
          return Icons.fastfood;
        case "Transport":
          return Icons.directions_car;
        case "Rent":
          return Icons.home;
        case "Utilities":
          return Icons.electric_bolt;
        case "Entertainment":
          return Icons.movie;
        case "Healthcare":
          return Icons.local_hospital;
        case "Shopping":
          return Icons.shopping_bag;
        case "Education":
          return Icons.school;
        case "Savings":
          return Icons.savings;
        case "Miscellaneous":
        default:
          return Icons.more_horiz;
      }
    }

    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade500, width: 1),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedCategory.value,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.secondaryColor,
            ),
            isExpanded: true,
            dropdownColor: AppColors.accentColor,
            borderRadius: BorderRadius.circular(12),
            style: TextStyle(color: AppColors.fontWhite, fontSize: 16),
            onChanged: (value) {
              selectedCategory.value = value!;
              onCategorySelected(value); // Call the callback function
            },
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Row(
                  children: [
                    Icon(
                      _getCategoryIcon(category),
                      color: AppColors.secondaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(category),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
