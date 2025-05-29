import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'player.dart';

class TeamRoster with ChangeNotifier {
  final List<Player> _players = [];

  List<Player> get players => _players;

  List<Player> playersByPosition(String position) {
    return _players.where((player) => player.position == position).toList();
  }

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
    _savePlayerToFirestore(player);
  }

  Future<void> _savePlayerToFirestore(Player player) async {
    try {
      await FirebaseFirestore.instance.collection('players').add({
        'name': player.name,
        'age': player.age,
        'position': player.position,
        'gender': player.gender,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error saving player: $e");
    }
  }
}
