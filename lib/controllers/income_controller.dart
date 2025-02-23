import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class IncomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addIncome({
    required String name,
    required double amount,
    required String date,
    required String description,
    required String category,
  }) async {
    try {
      await _firestore.collection('income').add({
        'name': name,
        'amount': amount,
        'date': date,
        'description': description,
        'category': category,
        'createdAt': FieldValue.serverTimestamp(), // Adds timestamp
      });

      Get.snackbar("Success", "Income added successfully");
    } catch (e) {
      Get.snackbar("Error", "Failed to add income: $e");
    }
  }
}
