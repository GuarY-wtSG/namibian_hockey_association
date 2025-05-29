import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nho_app/pages/login.dart';
import 'package:nho_app/pages/landing.dart';
import 'package:nho_app/pages/models/upcoming_list.dart';
import 'package:nho_app/pages/models/team_roster.dart';
import 'package:nho_app/pages/signup.dart';
import 'package:nho_app/pages/player_registration.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyB_V9gBFzFB_srRrV2EyzWltf0oBxZG4qs",
        authDomain: "nho-85f86.firebaseapp.com",
        projectId: "nho-85f86",
        storageBucket: "nho-85f86.firebasestorage.app",
        messagingSenderId: "1022543168990",
        appId: "1:1022543168990:web:a52f7f1e7d39fd6c73494f",
        measurementId: "G-KH3TH6SX78",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

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
