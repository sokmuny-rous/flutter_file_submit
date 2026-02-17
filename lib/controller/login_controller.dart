import 'package:flutter/material.dart';
import '../models/user_role.dart';

class LoginController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  // 🔑 Test emails
  final emailController = TextEditingController(text: 'student@gmail.com');
  final passwordController = TextEditingController(text: 'user12345');

  bool isObscure = true;
  bool isLoading = false;

  UserRole? userRole;

  void togglePassword() {
    isObscure = !isObscure;
    notifyListeners();
  }

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  UserRole detectRoleByEmail(String email) {
    if (email.contains('teacher')) {
      return UserRole.teacher;
    } else {
      return UserRole.student;
    }
  }

  Future<void> login(BuildContext context) async {
    if (!validateForm()) return;

    isLoading = true;
    notifyListeners();

    userRole = detectRoleByEmail(emailController.text);

    isLoading = false;
    notifyListeners();

    if (!context.mounted) return;

    Navigator.pushReplacementNamed(
      context,
      '/',
      arguments: userRole,
    );
    debugPrint('LOGIN ROLE: $userRole');
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
