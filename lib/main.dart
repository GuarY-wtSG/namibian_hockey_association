import 'package:flutter/material.dart';
import 'package:nho_app/pages/login.dart';
import 'package:nho_app/pages/landing.dart';
import 'package:nho_app/pages/models/upcoming_list.dart';
import 'package:nho_app/pages/signup.dart';
import 'package:nho_app/pages/player_registration.dart';
import 'package:provider/provider.dart';
import 'package:nho_app/pages/models/upcoming_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpcomingList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        routes: {
          '/login': (context) => Login(),
          '/landing': (context) => Landing(),
          '/signup': (context) => Signup(),
          '/player': (context) => PlayerRegistration(),
        },
      ),
    );
  }
}
