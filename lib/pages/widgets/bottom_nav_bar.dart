import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class CustomBottomNav extends StatelessWidget {
  void Function(int)? onTabChange;
  CustomBottomNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 16,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          // navigate to the events that the team is signed up for
          GButton(icon: Icons.newspaper, text: 'News'),
          // navigate to team management
          GButton(icon: Icons.group, text: 'Manage Team'),
          // navigate to event where you can make entries or join
          GButton(icon: Icons.event, text: 'Events'),
        ],
      ),
    );
  }
}
