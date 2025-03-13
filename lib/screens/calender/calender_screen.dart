import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/controllers/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final ExpenseController expenseController = Get.put(ExpenseController());

  DateTime _selectedDate = DateTime.now();

  // Function to format the DateTime into "yyyy-MM-dd"
  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();
    expenseController.fetchExpenses(); // Fetch expenses when screen loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 20.h)),
          // Horizontal Calendar
          TableCalendar(
            currentDay: DateTime.now(),
            focusedDay: _selectedDate,
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: CalendarFormat.week,
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                color: AppColors.fontWhite,
                fontSize: 20.sp,
              ),
              formatButtonVisible: false,
              titleCentered: true,
            ),
            availableGestures: AvailableGestures.horizontalSwipe,
            selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;
              });
            },
          ),
          const SizedBox(height: 10),
          // Expenses Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Expenses on ${_formatDate(_selectedDate)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Expenses List (Positioned at Bottom)
          Expanded(
            child: Obx(() {
              if (expenseController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              List<Map<String, dynamic>> expensesForDay =
                  expenseController.expenses
                      .where(
                        (expense) =>
                            expense['date'] == _formatDate(_selectedDate),
                      )
                      .toList();

              if (expensesForDay.isEmpty) {
                return const Center(
                  child: Text(
                    "No expenses recorded for this day.",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                );
              }

              return ListView.builder(
                itemCount: expensesForDay.length,
                itemBuilder: (context, index) {
                  final expense = expensesForDay[index];
                  return HistoryCard(
                    name: expense["name"],
                    amount: expense["amount"],
                    icon: expense["icon"], // Change to a dynamic icon if needed
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

// Expense History Card Component
class HistoryCard extends StatelessWidget {
  final String name;
  final double amount;
  final IconData icon;

  const HistoryCard({
    super.key,
    required this.name,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: AppColors.accentColor,
          borderRadius: BorderRadius.all(Radius.circular(20.r)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(icon, color: AppColors.primaryColor, size: 20),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      color: AppColors.fontWhite,
                    ),
                  ),
                ],
              ),
              Text(
                '\$${amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: AppColors.fontWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
