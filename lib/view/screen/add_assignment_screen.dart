import 'package:flutter/material.dart';
import 'package:tracking_app/models/user_role.dart';

class AddAssignmentScreen extends StatelessWidget {
  const AddAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,20,0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create_class');
              },
              child: Text(
                'Edit class',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_assignment_form');
                  },
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text(
                    'Add Assignment',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 2,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/class_detail');
                  },
                  child: Text(
                    'Class Detail',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                AssignmentTile(title: 'Homework 1', dueDate: 'Due 1, jan'),
                Divider(height: 1, thickness: 1),
                AssignmentTile(title: 'Homework 2', dueDate: 'Due 1, jan'),
                Divider(height: 1, thickness: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AssignmentTile extends StatelessWidget {
  final String title;
  final String dueDate;

  const AssignmentTile({
    super.key,
    required this.title,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.assignment_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: Text(
          dueDate,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/manage_assignment',
            arguments: UserRole.student, // or UserRole.student
          );
        },
      ),
    );
  }
}

