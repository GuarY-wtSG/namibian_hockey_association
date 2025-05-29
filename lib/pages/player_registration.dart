import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/player.dart';
import 'models/team_roster.dart';
import 'widgets/custom_textfield.dart';

class PlayerRegistration extends StatefulWidget {
  const PlayerRegistration({super.key});

  @override
  State<PlayerRegistration> createState() => _PlayerRegistrationState();
}

class _PlayerRegistrationState extends State<PlayerRegistration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  // Dropdown selections for allowed values.
  String? selectedPosition;
  String? selectedGender;

  final List<String> positions = [
    'Goalkeeper',
    'Fullback',
    'Halfback',
    'Right Wing Forward',
    'Left Wing Forward',
    'Center Forward',
  ];

  final List<String> genders = ['Male', 'Female', 'Other'];

  void _registerPlayer() {
    String name = nameController.text.trim();
    String age = ageController.text.trim();

    if (name.isEmpty ||
        age.isEmpty ||
        selectedPosition == null ||
        selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields must be filled!")),
      );
      return;
    }

    final player = Player(
      name: name,
      age: age,
      position: selectedPosition!,
      gender: selectedGender!,
    );

    // Add the player to the provider.
    Provider.of<TeamRoster>(context, listen: false).addPlayer(player);

    // Clear the form.
    nameController.clear();
    ageController.clear();
    setState(() {
      selectedPosition = null;
      selectedGender = null;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Player Registered Successfully!")),
    );
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
        child: SingleChildScrollView(
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
              const SizedBox(height: 12),
              // Dropdown for Position
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Position"),
                value: selectedPosition,
                items:
                    positions.map((position) {
                      return DropdownMenuItem(
                        value: position,
                        child: Text(position),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPosition = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              // Dropdown for Gender
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: "Gender"),
                value: selectedGender,
                items:
                    genders.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerPlayer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[900],
                ),
                child: const Text("Register Player"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
