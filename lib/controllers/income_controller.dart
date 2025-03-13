import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var incomeList = <Map<String, dynamic>>[].obs; // Observable list of incomes
  var isLoading = false.obs; // Loading state

  @override
  void onInit() {
    super.onInit();
    fetchIncome(); // Fetch income when controller is initialized
  }

  /// Add Income Function
  Future<void> addIncome({
    required String name,
    required double amount,
    required String date,
    required String description,
    required String category,
    required IconData? iconPath, // Icon support
  }) async {
    try {
      await _firestore.collection('income').add({
        'name': name,
        'amount': amount,
        'date': date,
        'description': description,
        'category': category,
        'iconPath': iconPath?.codePoint.toString(),
        'createdAt': FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Income added successfully");
      fetchIncome(); // Refresh list after adding income
    } catch (e) {
      Get.snackbar("Error", "Failed to add income: $e");
    }
  }

  /// Fetch Income Function
  Future<void> fetchIncome() async {
    try {
      isLoading(true); // Start loading
      var snapshot = await _firestore
          .collection('income')
          .orderBy('createdAt', descending: true)
          .get();

      incomeList.value = snapshot.docs.map((doc) {
        var data = doc.data();
        data['id'] = doc.id; // Add document ID

        if (data['iconPath'] != null) {
          data['icon'] = IconData(
            int.parse(data['iconPath']),
            fontFamily: 'MaterialIcons',
          );
        } else {
          data['icon'] = Icons.monetization_on; // Default icon
        }
        return data;
      }).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch income: $e");
    } finally {
      isLoading(false); // Stop loading
    }
  }

  /// Get Total Income
  double get totalIncome {
    return incomeList.fold(0.0, (total, income) => total + (income['amount'] ?? 0.0));
  }
}
