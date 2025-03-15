import 'package:budgetmate_2/constatnts/colors.dart';
import 'package:budgetmate_2/controllers/expense_controller.dart';
import 'package:budgetmate_2/controllers/income_controller.dart'; // Import Income Controller
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
  final IncomeController incomeController = Get.put(IncomeController()); // Initialize Income Controller

  DateTime _selectedDate = DateTime.now();

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  void initState() {
    super.initState();
    expenseController.fetchExpenses();
    incomeController.fetchIncome(); // Fetch incomes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 20.h)),
          TableCalendar(
            currentDay: DateTime.now(),
            focusedDay: _selectedDate,
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: CalendarFormat.week,
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(color: AppColors.fontWhite, fontSize: 20.sp),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Transactions on ${_formatDate(_selectedDate)}",
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
Expanded(
  child: Obx(() {
    if (expenseController.isLoading.value || incomeController.isLoading.value) {
      return const Center(child: CircularProgressIndicator());
    }

    // Filter expenses and incomes for the selected date
    List<Map<String, dynamic>> expensesForDay = expenseController.expenses
        .where((expense) => expense['date'] == _formatDate(_selectedDate))
        .toList();

    List<Map<String, dynamic>> incomesForDay = incomeController.incomeList
        .where((income) => income['date'] == _formatDate(_selectedDate))
        .toList();

    // Calculate totals
    double totalExpenses = expensesForDay.fold(0, (sum, expense) => sum + (expense['amount'] as num));
    double totalIncome = incomesForDay.fold(0, (sum, income) => sum + (income['amount'] as num));

    double totalBalance = totalIncome - totalExpenses;

    if (expensesForDay.isEmpty && incomesForDay.isEmpty) {
      return const Center(
        child: Text(
          "No transactions recorded for this day.",
          style: TextStyle(color: Colors.white70, fontSize: 16),
        ),
      );
    }

    return Column(
      children: [
        // Total transactions summary
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Income:", style: TextStyle(color: Colors.green, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Text("+\$${totalIncome.toStringAsFixed(2)}", style: TextStyle(color: Colors.green, fontSize: 16.sp)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Expenses:", style: TextStyle(color: Colors.red, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Text("-\$${totalExpenses.toStringAsFixed(2)}", style: TextStyle(color: Colors.red, fontSize: 16.sp)),
                  ],
                ),
                Divider(color: Colors.white54),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Net Balance:", style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold)),
                    Text(
                      "\$${totalBalance.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: totalBalance >= 0 ? Colors.green : Colors.red,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              ...expensesForDay.map((expense) => HistoryCard(
                    name: expense["name"],
                    amount: expense["amount"],
                    icon: expense["icon"],
                    isExpense: true, // Mark as expense
                  )),
              ...incomesForDay.map((income) => HistoryCard(
                    name: income["name"],
                    amount: income["amount"],
                    icon: income["icon"],
                    isExpense: false, // Mark as income
                  )),
            ],
          ),
        ),
      ],
    );
  }),
), 
        ],
      ),
    );
  }
}

// Expense & Income History Card
class HistoryCard extends StatelessWidget {
  final String name;
  final double amount;
  final IconData icon;
  final bool isExpense; // Identify if it's an expense or income

  const HistoryCard({
    super.key,
    required this.name,
    required this.amount,
    required this.icon,
    required this.isExpense,
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
                '${isExpense ? '-' : '+'} \$${amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: isExpense ? Colors.red : Colors.green, // Red for expenses, green for incomes
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
