import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ExpenseController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addExpense({
    required String name,
    required double amount,
    required String date,
    required String description,
    required String category,
  }) async {
    try {
      await _firestore.collection('expenses').add({
        'name': name,
        'amount': amount,
        'date': date,
        'description': description,
        'category': category,
        'createdAt': FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Expense added successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to add expense: $e");
    }
  }
}
