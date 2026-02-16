import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tracking_app/controller/login_controller.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  InputDecoration _inputStyle(String hint, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[700], fontSize: 14),
      filled: true,
      fillColor: Colors.grey[300],
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.black, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.red),
      ),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      suffixIcon: suffix,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Text(
                        'Assignment Tracking',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'App',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 90),

                  // Email
                  TextFormField(
                    controller: controller.emailController,
                    decoration: _inputStyle('Email'),
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  // Password
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.isObscure,
                    decoration: _inputStyle(
                      'Password',
                      suffix: IconButton(
                        icon: Icon(
                          controller.isObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 18,
                          color: Colors.grey[700],
                        ),
                        onPressed: controller.togglePassword,
                      ),
                    ),
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Password is required';
                      }
                      if (text.length < 8) {
                        return 'Minimum 8 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 50),

                  // Login Button
                  SizedBox(
                    width: 120,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () => controller.login(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Login',
                        style:
                        TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 100),

                  // Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/forgot_pwd'),
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/register'),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
