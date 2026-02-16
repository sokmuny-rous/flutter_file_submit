import 'package:flutter/material.dart';
import 'package:tracking_app/controller/register_controller.dart';
import 'package:tracking_app/models/user_role.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late RegisterController controller;
  late UserRole role;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    role = ModalRoute.of(context)!.settings.arguments as UserRole;
    controller = RegisterController(role);
  }

  @override
  Widget build(BuildContext context) {
    final bool isTeacher = role == UserRole.teacher;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),

                Text(
                  isTeacher ? 'Teacher Register' : 'Student Register',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 50),

                /// FULL NAME
                _label('Full Name'),
                _inputField(
                  controller: controller.nameController,
                  validator: controller.validateRequired,
                ),

                const SizedBox(height: 20),

                /// DEPARTMENT
                if (isTeacher) ...[
                  _label('Department'),
                  DropdownButtonFormField<String>(
                    value: controller.department,
                    decoration: _inputDecoration(),
                    items: controller.departments
                        .map(
                          (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        controller.department = v;
                      });
                    },
                    validator: (v) =>
                    v == null ? 'Please select department' : null,
                  ),
                ] else ...[
                  _label('Class'),
                  _inputField(
                    controller: controller.classController,
                    validator: controller.validateRequired,
                  ),
                ],

                const SizedBox(height: 20),

                /// EMAIL
                _label('Email'),
                _inputField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validateEmail,
                ),

                const SizedBox(height: 20),

                /// PASSWORD
                _label('Password'),
                _inputField(
                  controller: controller.passwordController,
                  obscureText: controller.obscurePassword,
                  suffix: IconButton(
                    icon: Icon(
                      controller.obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        controller.obscurePassword =
                        !controller.obscurePassword;
                      });
                    },
                  ),
                  validator: controller.validatePassword,
                ),

                const SizedBox(height: 50),

                /// CONFIRM BUTTON
                SizedBox(
                  width: 180,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      controller.submit(
                        context: context,
                        role: role,
                      );
                    },
                    child: const Text(
                      'Confirm',
                      style:
                      TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  );

  Widget _inputField({
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool obscureText = false,
    Widget? suffix,
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: _inputDecoration(suffix: suffix),
    );
  }

  InputDecoration _inputDecoration({Widget? suffix}) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[300],
      suffixIcon: suffix,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.black, width: 2),
      ),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
