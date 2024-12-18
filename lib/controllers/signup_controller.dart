import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var selectedDate = DateTime(2000, 1, 1).obs;

  FirebaseAuth _auth = FirebaseAuth.instance;

  void updateMonth(int month) {
    selectedDate.value =
        DateTime(selectedDate.value.year, month, selectedDate.value.day);
  }

  void updateDay(int day) {
    selectedDate.value =
        DateTime(selectedDate.value.year, selectedDate.value.month, day);
  }

  void updateYear(int year) {
    selectedDate.value =
        DateTime(year, selectedDate.value.month, selectedDate.value.day);
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
