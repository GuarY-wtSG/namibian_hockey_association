import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.sports_hockey, size: 250, color: Colors.green[800]),
            const Text(
              "Login",
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      /* Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/landing');
          },
          child: Text("Login"),
        ),
      ), */
    );
  }
}
