import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/input_service.dart';
import '../models/input_model.dart';
import '../widgets/dynamic_textbox.dart';
import '../utils/constants.dart'; // Import the constants

class SaveScreen extends StatefulWidget {
  @override
  _SaveScreenState createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  final _textboxCountController = TextEditingController();
  List<DynamicTextbox> _textboxes = [];

  void _addTextboxes() {
    setState(() {
      int count = int.parse(_textboxCountController.text);
      _textboxes =
          List.generate(count, (index) => DynamicTextbox(index: index));
    });
  }

  void _saveData() {
    List<int> values = _textboxes
        .map((textbox) => int.parse(textbox.controller.text))
        .toList();
    List<bool> selections =
        _textboxes.map((textbox) => textbox.isSelected).toList().cast<bool>();
    int total = values
        .asMap()
        .entries
        .where((entry) => selections[entry.key])
        .map((entry) => entry.value)
        .reduce((a, b) => a + b);

    InputModel input = InputModel(
        id: DateTime.now().millisecondsSinceEpoch,
        values: values,
        selections: selections);
    Provider.of<InputService>(context, listen: false).saveInput(input);

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${Constants.snackBarMessage}$total')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appTitle),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textboxCountController,
              decoration:
                  InputDecoration(labelText: Constants.numberOfTextboxesLabel),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _addTextboxes,
              child: Text(Constants.addButtonLabel),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _textboxes.length,
                itemBuilder: (context, index) => _textboxes[index],
              ),
            ),
            ElevatedButton(
              onPressed: _saveData,
              child: Text(Constants.saveButtonLabel),
            ),
          ],
        ),
      ),
    );
  }
}
