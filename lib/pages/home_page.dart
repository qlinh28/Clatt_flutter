import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Colors.deepPurple.shade300,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.deepPurple.shade400,
        gap: 8,
        padding: const EdgeInsets.all(16),
        tabMargin: const EdgeInsetsDirectional.all(8),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.perm_contact_calendar,
            text: 'History',
          ),
          GButton(
            icon: Icons.notifications,
            text: 'Notification',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
