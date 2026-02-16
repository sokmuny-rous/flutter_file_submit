import 'package:flutter/material.dart';

class EditAssignmentForm extends StatefulWidget {
  const EditAssignmentForm({super.key});

  @override
  State<EditAssignmentForm> createState() => _EditAssignmentFormState();
}

class _EditAssignmentFormState extends State<EditAssignmentForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _instructionController = TextEditingController();
  final TextEditingController _fileController = TextEditingController();

  String? _selectedPoints;
  DateTime? _selectedDueDate;

  final List<String> _pointsOptions = ['10', '20', '30', '40', '50', '100'];

  @override
  void dispose() {
    _titleController.dispose();
    _instructionController.dispose();
    _fileController.dispose();
    super.dispose();
  }

  // Pick due date
  Future<void> _selectDueDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDueDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() => _selectedDueDate = picked);
    }
  }

  // File picker
  void _pickFile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('File picker coming soon')),
    );
  }

  // Submit assignment
  void _assignTask() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Assignment created successfully')),
      );
      // TODO: Save to database / API / Firebase
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _assignTask,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              const Text('Title'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleController,
                validator: (value) =>
                value!.isEmpty ? 'Title is required' : null,
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 20),

              // Instruction
              const Text('Instruction'),
              const SizedBox(height: 8),
              TextFormField(
                controller: _instructionController,
                maxLines: 5,
                decoration: _inputDecoration(),
              ),
              const SizedBox(height: 20),

              // File upload
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _fileController,
                      enabled: false,
                      decoration: _inputDecoration(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: _pickFile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2196F3),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      elevation: 0,
                    ),
                    child: const Text('Add file', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Points
              const Text('Points'),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedPoints,
                decoration: _inputDecoration(),
                items: _pointsOptions
                    .map(
                      (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                    .toList(),
                validator: (value) =>
                value == null ? 'Please select points' : null,
                onChanged: (value) =>
                    setState(() => _selectedPoints = value),
              ),
              const SizedBox(height: 20),

              // Due date
              const Text('Due date'),
              const SizedBox(height: 8),
              InkWell(
                onTap: _selectDueDate,
                child: InputDecorator(
                  decoration: _inputDecoration().copyWith(
                    suffixIcon: const Icon(Icons.arrow_drop_down),
                  ),
                  child: Text(
                    _selectedDueDate == null
                        ? ''
                        : '${_selectedDueDate!.day}/${_selectedDueDate!.month}/${_selectedDueDate!.year}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable input decoration
  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black54),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black54),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF2196F3)),
      ),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}

