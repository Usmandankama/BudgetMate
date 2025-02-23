import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeDropdown extends StatelessWidget {
  const IncomeDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Salary",
      "Investment",
      "Rewards",
      "Gifts",
      "Business",
      "Miscellaneous",
    ];

    var selectedCategory = "Salary".obs;

    IconData getCategoryIcon(String category) {
      switch (category) {
        case "Salary":
          return Icons.paid;
        case "Investment":
          return Icons.trending_up;
        case "Rewards":
          return Icons.leaderboard;
        case "Gifts":
          return Icons.card_giftcard_rounded;
        case "Business":
          return Icons.incomplete_circle;
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
            },
            items:
                categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Row(
                      children: [
                        Icon(
                          getCategoryIcon(category),
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
