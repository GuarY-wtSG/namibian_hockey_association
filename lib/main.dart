import 'package:flutter/material.dart';
import 'package:nho_app/pages/login.dart';
import 'package:nho_app/pages/landing.dart';
import 'package:nho_app/pages/models/upcoming_list.dart';
import 'package:nho_app/pages/models/team_roster.dart';
import 'package:nho_app/pages/signup.dart';
import 'package:nho_app/pages/player_registration.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UpcomingList()),
        ChangeNotifierProvider(create: (_) => TeamRoster()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        routes: {
          '/login': (context) => const Login(),
          '/landing': (context) => const Landing(),
          '/signup': (context) => const Signup(),
          '/player': (context) => const PlayerRegistration(),
        },
      ),
    );
  }
}
