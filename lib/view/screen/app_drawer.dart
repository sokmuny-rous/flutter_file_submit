import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 20),
            drawerItem(
              context,
              Icons.home,
              'Classes',
                  () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, '/');
              },
            ),
            drawerItem(
              context,
              Icons.notifications_none,
              'Notification',
                  () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/notification_screen');
              },
            ),
            drawerItem(
              context,
              Icons.insert_drive_file_outlined,
              'Files',
                  () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/files_screen');
              },
            ),
            drawerItem(
              context,
              Icons.folder_open,
              'Classes Folders',
                  () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/folder_screen');
              },
            ),
            drawerItem(
              context,
              Icons.settings,
              'Settings',
                  () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/');
              },
            ),

            const Spacer(),

            drawerItem(
              context,
              Icons.logout,
              'Sign Out',
                  () => _handleSignOut(context),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(
      BuildContext context,
      IconData icon,
      String title,
      VoidCallback onTap,
      ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
      onTap: onTap,
    );
  }

  void _handleSignOut(BuildContext context) {
    Navigator.pop(context); // Close drawer

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login_screen');
              },
              child: const Text('Sign Out'),
            ),
          ],
        );
      },
    );
  }
}
