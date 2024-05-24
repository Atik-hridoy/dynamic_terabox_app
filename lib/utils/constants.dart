import 'package:flutter/material.dart';

// Define a class to hold constant values
class Constants {
  // Application title
  static const String appTitle = 'Dynamic Terabox App';

  // Textbox labels and other text
  static const String textboxLabelPrefix = 'Textbox ';
  static const String numberOfTextboxesLabel = 'Number of Textboxes';
  static const String addButtonLabel = 'Add Textboxes';
  static const String saveButtonLabel = 'Save Data';
  static const String loadButtonLabel = 'Load Data';
  static const String updateButtonLabel = 'Update Data';
  static const String snackBarMessage = 'Total: ';

  // Database
  static const String databaseName = 'input_data.db';
  static const String tableName = 'inputs';
  static const String columnId = 'id';
  static const String columnValues = 'values';
  static const String columnSelections = 'selections';

  // Colors
  static const Color primaryColor = Colors.blue;
  static const Color accentColor = Colors.amber;
  static const Color backgroundColor = Colors.white;
}
