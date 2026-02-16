import 'package:flutter/material.dart';

class TeacherRegister extends StatefulWidget {
  const TeacherRegister({super.key});

  @override
  State<TeacherRegister> createState() => _TeacherRegisterState();
}

class _TeacherRegisterState extends State<TeacherRegister> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _selectedDepartment;
  bool _isObscure = true;

  final List<String> _departments = [
    'Computer Science',
    'Information Technology',
    'Electronics',
    'Electrical',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //InputDecoration
  InputDecoration _inputDecoration({Widget? suffix}) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[300],
      suffixIcon: suffix,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 8),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 28,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Teacher Register',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 48),

                // Full Name
                _label('Full Name'),
                TextFormField(
                  controller: _fullNameController,
                  decoration: _inputDecoration(),
                  validator: (v) =>
                  v == null || v.isEmpty ? 'Full name is required' : null,
                ),
                const SizedBox(height: 24),

                // Department
                _label('Department'),
                DropdownButtonFormField<String>(
                  value: _selectedDepartment,
                  decoration: _inputDecoration(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: _departments
                      .map(
                        (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                      .toList(),
                  onChanged: (v) => setState(() => _selectedDepartment = v),
                  validator: (v) =>
                  v == null ? 'Please select a department' : null,
                ),
                const SizedBox(height: 24),

                // Email
                _label('Email'),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(),
                  validator: (v) =>
                  v == null || v.isEmpty ? 'Email is required' : null,
                ),
                const SizedBox(height: 24),

                // Password
                _label('Password'),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObscure,
                  decoration: _inputDecoration(
                    suffix: IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () =>
                          setState(() => _isObscure = !_isObscure),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Password is required';
                    }
                    if (v.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 70),

                // Confirm Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // if (!_formKey.currentState!.validate()) return;
                      Navigator.pushNamed(context, '/verifyScreen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Confirm',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
