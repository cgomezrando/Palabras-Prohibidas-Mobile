// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/ff_builtin_enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getWinnerName(
  String player1Name,
  String player2Name,
  String player3Name,
  String player4Name,
  int player1Score,
  int player2Score,
  int player3Score,
  int player4Score,
  int teamCount,
) async {
  final teams = <Map<String, dynamic>>[
    {'name': player1Name, 'score': player1Score},
    {'name': player2Name, 'score': player2Score},
    {'name': player3Name, 'score': player3Score},
    {'name': player4Name, 'score': player4Score},
  ].take(teamCount).toList();

  final maxScore =
      teams.map((team) => team['score'] as int).reduce((a, b) => a > b ? a : b);

  final winners = teams.where((team) => team['score'] == maxScore).toList();

  if (winners.length > 1) {
    return 'EMPATE';
  }

  return winners.first['name'] as String;
}
