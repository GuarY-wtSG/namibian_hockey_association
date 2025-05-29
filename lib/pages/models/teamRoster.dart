import 'package:flutter/material.dart';
import 'player.dart';

class TeamRoster with ChangeNotifier {
  final List<Player> _players = [];

  List<Player> get players => _players;

  // Returns a list of players matching the given position.
  List<Player> playersByPosition(String position) {
    return _players.where((player) => player.position == position).toList();
  }

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
  }
}
