import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nho_app/pages/widgets/custom_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // Controllers for capturing user input
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> _handleSignup() async {
    String teamName = teamNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Passwords do not match!")));
      return;
    }

    try {
      // Create a new user account with Firebase Auth
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Optionally, you can store additional info – for example, the team name
      // in Firestore. See step 5 below.

      // Navigate to the landing page on success
      Navigator.pushNamed(context, '/landing');
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Signup failed: ${e.toString()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
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
              "Sign Up",
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),

            // Added Name Field
            CustomTextfield(
              obscureText: false,
              hintText: 'Enter Team Name',
              icon: Icons.person,
              controller: teamNameController,
            ),
            CustomTextfield(
              obscureText: false,
              hintText: 'Enter Email',
              icon: Icons.alternate_email,
              controller: emailController,
            ),
            CustomTextfield(
              icon: Icons.lock,
              obscureText: true,
              hintText: 'Enter Password',
              controller: passwordController,
            ),
            // Added Confirm Password Field
            CustomTextfield(
              icon: Icons.lock,
              obscureText: true,
              hintText: 'Confirm Password',
              controller: confirmPasswordController,
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
                _handleSignup();
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Color.fromARGB(255, 11, 93, 13)),
              ),
            ),

            const SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login'); // Navigate to Login
                },
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? Log in",
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

            const SizedBox(height: 20),
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
                    child: Image.asset('lib/images/google.png'),
                  ),
                  Text(
                    'Sign Up with Google',
                    style: TextStyle(color: Colors.green[900], fontSize: 18.0),
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
