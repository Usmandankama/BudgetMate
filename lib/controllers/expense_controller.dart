  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';

  class ExpenseController extends GetxController {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    var expenses = <Map<String, dynamic>>[].obs; // Observable list of expenses
    var isLoading = false.obs; // Loading state

    @override
    void onInit() {
      super.onInit();
      fetchExpenses(); // Fetch expenses when controller is initialized
    }

    /// Add Expense Function
    Future<void> addExpense({
      required String name,
      required double amount,
      required String date,
      required String description,
      required String category,
      required IconData? iconPath,
    }) async {
      try {
        await _firestore.collection('expenses').add({
          'name': name,
          'amount': amount,
          'date': date,
          'description': description,
          'category': category,
          'iconPath': iconPath?.codePoint.toString(),
          'createdAt': FieldValue.serverTimestamp(),
        });

        Get.snackbar("Success", "Expense added successfully");
        fetchExpenses(); // Refresh expenses list after adding
      } catch (e) {
        Get.snackbar("Error", "Failed to add expense: $e");
      }
    }

    /// Fetch Expenses Function
    Future<void> fetchExpenses() async {
      try {
        isLoading(true); // Start loading
        var snapshot = await _firestore
            .collection('expenses')
            .orderBy('createdAt', descending: true)
            .get();

        expenses.value = snapshot.docs.map((doc) {
          var data = doc.data();
          data['id'] = doc.id; // Add document ID

          if (data['iconPath'] != null) {
            data['icon'] = IconData(
              int.parse(data['iconPath']),
              fontFamily: 'MaterialIcons',
            );
          } else {
            data['icon'] = Icons.category; // Default icon
          }
          return data;
        }).toList();
      } catch (e) {
        Get.snackbar("Error", "Failed to fetch expenses: $e");
      } finally {
        isLoading(false); // Stop loading
      }
    }

    /// Get Total Amount Spent
    double get totalAmountSpent {
      return expenses.fold(0.0, (total, expense) => total + (expense['amount'] ?? 0.0));
    }
  }
