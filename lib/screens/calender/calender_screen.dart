import 'package:budget_mate/constatnts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();

  // Dummy expenses mapped by date
  final Map<DateTime, List<Map<String, dynamic>>> _expenses = {
    DateTime(2025, 2, 10): [
      {"name": "Groceries", "amount": 20.00, "icon": Icons.shopping_cart},
      {"name": "Transport", "amount": 5.50, "icon": Icons.directions_bus},
    ],
    DateTime(2025, 2, 11): [
      {"name": "Gym", "amount": 15.00, "icon": Icons.fitness_center},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(title: const Text("Budget Calendar")),
      body: Column(
        children: [
          // Horizontal Calendar
          TableCalendar(
            focusedDay: _selectedDate,
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: CalendarFormat.week, // Keeps it horizontal
            headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.horizontalSwipe,
            selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;
              });
            },
          ),

          const SizedBox(height: 10),

          // Expenses List
          Expanded(
            child: ListView(
              children: (_expenses[_selectedDate] ?? []).map((expense) {
                return HistoryCard(
                  name: expense["name"],
                  amount: expense["amount"],
                  icon: expense["icon"],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Expense History Card Component with Dummy Data
class HistoryCard extends StatelessWidget {
  final String name;
  final double amount;
  final IconData icon;

  const HistoryCard({super.key, required this.name, required this.amount, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
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
                    style: const TextStyle(fontSize: 16, fontFamily: 'Poppins', color: AppColors.fontWhite),
                  ),
                ],
              ),
              Text(
                '\$${amount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w700, color: AppColors.fontWhite),
              )
            ],
          ),
        ),
      ),
    );
  }
}
