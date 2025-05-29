import 'package:flutter/material.dart';
import '../models/player.dart';

class PlayerTile extends StatelessWidget {
  final Player player;
  const PlayerTile({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 40, color: Colors.green[700]),
          const SizedBox(height: 8),
          Text(
            player.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Age: ${player.age}'),
          Text(player.gender),
        ],
      ),
    );
  }
}
