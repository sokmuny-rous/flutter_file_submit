import 'package:flutter/material.dart';
import 'package:tracking_app/models/user_role.dart';
import 'package:tracking_app/view/screen/app_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserRole userRole = UserRole.teacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      drawer: const AppDrawer(),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/add_assignment');
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Subject Mobile App',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Class A2 - Year 4',
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade300,
        elevation: 2,
        onPressed: () {
          if (userRole == UserRole.teacher) {
            Navigator.pushNamed(context, '/create_class');
          } else {
            Navigator.pushNamed(context, '/join_class');
          }
        },
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
