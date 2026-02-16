import 'package:flutter/material.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({super.key});

  @override
  State<CreateClass> createState() => _CreateClassPageState();
}

class _CreateClassPageState extends State<CreateClass> {
  final _formKey = GlobalKey<FormState>();

  final _classNameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _classController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedYear;
  int _numberOfGroups = 1;

  final List<String> years = [
    'Year 1',
    'Year 2',
    'Year 3',
    'Year 4',
  ];

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
        borderSide: const BorderSide(color: Colors.black, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 5),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Create Class',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 20),
              // Form
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label('Class Name'),
                        TextFormField(
                          controller: _classNameController,
                          decoration: _inputDecoration(),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter class name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),

                        _label('Subject'),
                        TextFormField(
                          controller: _subjectController,
                          decoration: _inputDecoration(),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter subject';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),

                        _label('Class'),
                        TextFormField(
                          controller: _classController,
                          decoration: _inputDecoration(),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter class';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),

                        _label('Year'),
                        DropdownButtonFormField<String>(
                          decoration: _inputDecoration(),
                          value: _selectedYear,
                          items: years
                              .map(
                                (year) => DropdownMenuItem(
                              value: year,
                              child: Text(year),
                            ),
                          )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedYear = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a year';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),

                        // Number of Group field
                        _label('Number of Group'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _numberOfGroups.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _numberOfGroups++;
                                      });
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_up,
                                      size: 20,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (_numberOfGroups > 1) {
                                          _numberOfGroups--;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 20,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        _label('Description'),
                        TextFormField(
                          controller: _descriptionController,
                          maxLines: 3,
                          decoration: _inputDecoration(),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter description';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // All validations passed
                      print('Class Name: ${_classNameController.text}');
                      print('Subject: ${_subjectController.text}');
                      print('Class: ${_classController.text}');
                      print('Year: $_selectedYear');
                      print('Number of Groups: $_numberOfGroups');
                      print('Description: ${_descriptionController.text}');

                      // Navigate or perform action
                      // Navigator.pushNamed(context, '/');
                    }
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}