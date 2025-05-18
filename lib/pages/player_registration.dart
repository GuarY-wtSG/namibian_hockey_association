import 'package:flutter/material.dart';
import 'package:nho_app/pages/widgets/custom_textfield.dart';

class PlayerRegistration extends StatefulWidget {
  const PlayerRegistration({super.key});

  @override
  State<PlayerRegistration> createState() => _PlayerRegistrationState();
}

class _PlayerRegistrationState extends State<PlayerRegistration> {
  int _selectedIndex = 1; // Ensure this page is highlighted

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController teamController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  List<Map<String, String>> registeredPlayers = [];

  void _registerPlayer() {
    String name = nameController.text;
    String age = ageController.text;
    String position = positionController.text;
    String team = teamController.text;
    String contact = contactController.text;

    if (name.isEmpty ||
        age.isEmpty ||
        position.isEmpty ||
        team.isEmpty ||
        contact.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields must be filled!")),
      );
      return;
    }

    setState(() {
      registeredPlayers.add({
        'name': name,
        'age': age,
        'position': position,
        'team': team,
        'contact': contact,
      });

      nameController.clear();
      ageController.clear();
      positionController.clear();
      teamController.clear();
      contactController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Player Registered Successfully!")),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/landing'); // Navigate to Events Page
        break;
      case 1:
        break; // Already on this page, do nothing
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Player Registration"),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextfield(
              controller: nameController,
              hintText: "Player Name",
              icon: Icons.person,
              obscureText: false,
            ),
            CustomTextfield(
              controller: ageController,
              hintText: "Age",
              icon: Icons.calendar_today,
              obscureText: false,
            ),
            CustomTextfield(
              controller: positionController,
              hintText: "Position",
              icon: Icons.sports_hockey,
              obscureText: false,
            ),
            CustomTextfield(
              controller: teamController,
              hintText: "Team",
              icon: Icons.group,
              obscureText: false,
            ),
            CustomTextfield(
              controller: contactController,
              hintText: "Contact Info",
              icon: Icons.phone,
              obscureText: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerPlayer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[900],
              ),
              child: const Text(
                "Register Player",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child:
                  registeredPlayers.isEmpty
                      ? const Center(child: Text("No players registered yet"))
                      : ListView.builder(
                        itemCount: registeredPlayers.length,
                        itemBuilder: (context, index) {
                          final player = registeredPlayers[index];
                          return ListTile(
                            title: Text(
                              player['name']!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Age: ${player['age']} | Position: ${player['position']} | Team: ${player['team']} | Contact: ${player['contact']}",
                            ),
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'Player'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green[900],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
