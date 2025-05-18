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

  void _handleSignup() {
    String name = teamNameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    // Simple validation: Check if passwords match
    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match!")));
      return; // Stop execution if passwords don't match
    } else {
      Navigator.pushNamed(context, '/landing');
    }

    // Print values (Replace with actual sign-up logic)
    print("Team Name: $name");
    print("Email: $email");
    print("Password: $password");

    // Show a dialog or Snackbar with the values
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Team Name: $name\nEmail: $email\nPassword: $password"),
      ),
    );
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
