import 'package:flutter/material.dart';
import 'package:nho_app/pages/widgets/custom_textfield.dart';

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
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.sports_hockey,
                size: 250,
                color: Colors.green[900],
              ),
            ),
            const Text(
              "Login",
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),

            CustomTextfield(
              obscureText: false,
              hintText: 'Enter Email',
              icon: Icons.alternate_email,
            ),
            CustomTextfield(
              icon: Icons.lock,
              obscureText: true,
              hintText: 'Enter Password',
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[950],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                minimumSize: Size(size.width, 0),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/landing');
              },
              child: const Text(
                'Login',
                style: TextStyle(color: Color.fromARGB(255, 11, 93, 13)),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Handle tap event
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text.rich(
                  TextSpan(
                    text: "Sign Up?",
                    style: TextStyle(color: Colors.black.withOpacity(.5)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 30,
                    child: Image.asset('assets/image/google.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
