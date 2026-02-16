import 'package:flutter/material.dart';
import 'package:tracking_app/models/user_role.dart';
import 'package:tracking_app/view/form/forgot_pwd.dart';
import 'package:tracking_app/view/form/login_screen.dart';
import 'package:tracking_app/view/form/register_form.dart';
import 'package:tracking_app/view/form/register_screen.dart';
import 'package:tracking_app/view/form/reset_new_pwd.dart';
import 'package:tracking_app/view/form/students_register.dart';
import 'package:tracking_app/view/form/teacher_register.dart';
import 'package:tracking_app/view/form/verify_pwd_email.dart';
import 'package:tracking_app/view/form/verify_screen.dart';
import 'package:tracking_app/view/home_view.dart';
import 'package:tracking_app/view/screen/add_assignment_form.dart';
import 'package:tracking_app/view/screen/add_assignment_screen.dart';
import 'package:tracking_app/view/screen/add_comment_screen.dart';
import 'package:tracking_app/view/screen/class_detail_screen.dart';
import 'package:tracking_app/view/screen/class_folders_screen.dart';
import 'package:tracking_app/view/screen/create_class.dart';
import 'package:tracking_app/view/screen/edit_assignment_form.dart';
import 'package:tracking_app/view/screen/files_screen.dart';
import 'package:tracking_app/view/screen/join_class_screen.dart';
import 'package:tracking_app/view/screen/manage_assignment_screen.dart';
import 'package:tracking_app/view/screen/notification_screen.dart';
import 'package:tracking_app/view/screen/s_add_work_screen.dart';
import 'package:tracking_app/view/screen/subject_list_screen.dart';
import 'package:tracking_app/view/screen/view_work_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment Tracking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
          surfaceTintColor: Colors.white,
          elevation: 0,
        ),
      ),
      routes: {
        '/': (context) => HomeView(),
        '/login_screen': (context) => LoginScreen(),
        '/forgot_pwd': (context) => ForgotPwd(),
        '/verifyScreen': (context) => VerifyScreen(),
        '/verify_pwd_email': (context) => VerifyPwdEmail(),
        '/reset_new_pwd': (context) => ResetNewPwd(),
        '/register': (context) => RegisterScreen(),
        '/register_form': (context) => RegisterForm(),
        '/teacher_register': (context) => TeacherRegister(),
        '/student_register': (context) => StudentsRegister(),
        '/create_class': (context) => CreateClass(),
        '/join_class': (context) => JoinClassScreen(),
        '/notification_screen': (context) => NotificationsScreen(),
        '/folder_screen': (context) => ClassFoldersScreen(),
        '/add_assignment': (context) => AddAssignmentScreen(),
        '/subject_list': (context) => SubjectListScreen(),
        '/files_screen': (context) => FilesScreen(),
        '/add_assignment_form': (context) => AddAssignmentForm(),
        '/class_detail': (context) => ClassDetailScreen(),

        '/manage_assignment': (context) {
          final role =
          ModalRoute.of(context)!.settings.arguments as UserRole;
          return ManageAssignmentScreen(role: role);
        },
        '/edit_assignment': (context) => EditAssignmentForm(),
        '/add_comment': (context) => AddCommentScreen(),
        '/view_work': (context) => ViewWorkDetail(),
        '/s_add_work': (context) => SAddWorkScreen(),
      },
    );
  }
}
