import 'package:flutter/material.dart';
import '../models/input_model.dart';
import 'database_service.dart';

class InputService with ChangeNotifier {
  final DatabaseService _dbService = DatabaseService();
  List<InputModel> _inputs = [];

  List<InputModel> get inputs => _inputs;

  Future<void> loadInputs() async {
    _inputs = await _dbService.retrieveInputs();
    notifyListeners();
  }

  Future<void> saveInput(InputModel input) async {
    await _dbService.insertInput(input);
    await loadInputs();
  }
}
