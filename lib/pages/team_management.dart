import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/player.dart';
import 'models/team_roster.dart';
import 'widgets/player_tile.dart';

class TeamManage extends StatelessWidget {
  const TeamManage({super.key});

  final List<String> positions = const [
    'Goalkeeper',
    'Fullback',
    'Halfback',
    'Right Wing Forward',
    'Left Wing Forward',
    'Center Forward',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamRoster>(
      builder: (context, roster, child) {
        return ListView(
          children: [
            ...positions.map((position) {
              // Filter players for current category.
              List<Player> players = roster.playersByPosition(position);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 8,
                    ),
                    child: Text(
                      position,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  players.isEmpty
                      ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "No players registered.",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      )
                      : SizedBox(
                        height: 150, // Adjust height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: players.length,
                          itemBuilder: (context, index) {
                            return PlayerTile(player: players[index]);
                          },
                        ),
                      ),
                ],
              );
            }).toList(),
            // Optionally, a button to navigate to registration.
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[950],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/player');
                },
                child: const Text(
                  'Register New Player',
                  style: TextStyle(color: Color.fromARGB(255, 11, 93, 13)),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
