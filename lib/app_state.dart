import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _currentCardIndex = 0;
  int get currentCardIndex => _currentCardIndex;
  set currentCardIndex(int value) {
    _currentCardIndex = value;
  }

  int _currentTeam = 1;
  int get currentTeam => _currentTeam;
  set currentTeam(int value) {
    _currentTeam = value;
  }

  int _TeamCount = 0;
  int get TeamCount => _TeamCount;
  set TeamCount(int value) {
    _TeamCount = value;
  }

  String _Team1Name = '';
  String get Team1Name => _Team1Name;
  set Team1Name(String value) {
    _Team1Name = value;
  }

  String _Team2Name = '';
  String get Team2Name => _Team2Name;
  set Team2Name(String value) {
    _Team2Name = value;
  }

  String _Team3Name = '';
  String get Team3Name => _Team3Name;
  set Team3Name(String value) {
    _Team3Name = value;
  }

  String _Team4Name = '';
  String get Team4Name => _Team4Name;
  set Team4Name(String value) {
    _Team4Name = value;
  }

  int _Team1Score = 0;
  int get Team1Score => _Team1Score;
  set Team1Score(int value) {
    _Team1Score = value;
  }

  int _Team2Score = 0;
  int get Team2Score => _Team2Score;
  set Team2Score(int value) {
    _Team2Score = value;
  }

  int _Team3Score = 0;
  int get Team3Score => _Team3Score;
  set Team3Score(int value) {
    _Team3Score = value;
  }

  int _Team4Score = 0;
  int get Team4Score => _Team4Score;
  set Team4Score(int value) {
    _Team4Score = value;
  }

  int _TotalTurns = 10;
  int get TotalTurns => _TotalTurns;
  set TotalTurns(int value) {
    _TotalTurns = value;
  }

  bool _timerExpired = false;
  bool get timerExpired => _timerExpired;
  set timerExpired(bool value) {
    _timerExpired = value;
  }

  String _winnerName = '';
  String get winnerName => _winnerName;
  set winnerName(String value) {
    _winnerName = value;
  }

  bool _GameFinished = false;
  bool get GameFinished => _GameFinished;
  set GameFinished(bool value) {
    _GameFinished = value;
  }

  bool _CardAnswered = false;
  bool get CardAnswered => _CardAnswered;
  set CardAnswered(bool value) {
    _CardAnswered = value;
  }

  int _PlayTime = 60;
  int get PlayTime => _PlayTime;
  set PlayTime(int value) {
    _PlayTime = value;
  }

  int _CurrentTurn = 0;
  int get CurrentTurn => _CurrentTurn;
  set CurrentTurn(int value) {
    _CurrentTurn = value;
  }

  List<QuestionStruct> _GameCards = [];
  List<QuestionStruct> get GameCards => _GameCards;
  set GameCards(List<QuestionStruct> value) {
    _GameCards = value;
  }

  void addToGameCards(QuestionStruct value) {
    GameCards.add(value);
  }

  void removeFromGameCards(QuestionStruct value) {
    GameCards.remove(value);
  }

  void removeAtIndexFromGameCards(int index) {
    GameCards.removeAt(index);
  }

  void updateGameCardsAtIndex(
    int index,
    QuestionStruct Function(QuestionStruct) updateFn,
  ) {
    GameCards[index] = updateFn(_GameCards[index]);
  }

  void insertAtIndexInGameCards(int index, QuestionStruct value) {
    GameCards.insert(index, value);
  }

  int _PreviewTime = 5;
  int get PreviewTime => _PreviewTime;
  set PreviewTime(int value) {
    _PreviewTime = value;
  }

  String _turnPhase = 'waiting';
  String get turnPhase => _turnPhase;
  set turnPhase(String value) {
    _turnPhase = value;
  }

  int _gameMode = 1;
  int get gameMode => _gameMode;
  set gameMode(int value) {
    _gameMode = value;
  }
}
