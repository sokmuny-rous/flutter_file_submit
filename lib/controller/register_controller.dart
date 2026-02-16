import 'package:flutter/material.dart';
import 'package:tracking_app/models/user_role.dart';

class RegisterController {
  RegisterController(UserRole role) {
    _setDefaultData(role);
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController classController = TextEditingController();

  String? department;
  bool obscurePassword = true;

  final List<String> departments = [
    'Computer Science',
    'Mathematics',
    'Physics',
    'Chemistry',
  ];

  void _setDefaultData(UserRole role) {
    if (role == UserRole.student) {
      nameController.text = 'Student Test';
      emailController.text = 'student@gmail.com';
      classController.text = 'SE-2026';
    } else {
      nameController.text = 'Teacher Test';
      emailController.text = 'teacher@gmail.com';
      department = 'Computer Science';
    }

    passwordController.text = '123456';
  }

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    if (!value.contains('@')) return 'Invalid email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    if (value.length < 6) return 'Min 6 characters';
    return null;
  }

  void submit({
    required BuildContext context,
    required UserRole role,
  }) {
    if (!formKey.currentState!.validate()) return;

    Navigator.pushNamed(
      context,
      '/verifyScreen',
      arguments: {
        'role': role.toString(),
        'name': nameController.text,
        'email': emailController.text,
        'department': department,
        'class': classController.text,
      },
    );
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    classController.dispose();
  }
}