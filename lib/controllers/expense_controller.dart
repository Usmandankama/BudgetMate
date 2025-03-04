import 'package:cloud_firestore/cloud_firestore.dart';
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
        return data;
      }).toList();

    } catch (e) {
      Get.snackbar("Error", "Failed to fetch expenses: $e");
    } finally {
      isLoading(false); // Stop loading
    }
  }
}
