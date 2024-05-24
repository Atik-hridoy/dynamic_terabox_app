import 'package:dynamic_terabox_app/models/input_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/input_service.dart';
import '../widgets/dynamic_textbox.dart';
import '../utils/constants.dart'; // Import the constants

class UpdateScreen extends StatefulWidget {
  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  List<DynamicTextbox> _textboxes = [];

  @override
  void initState() {
    super.initState();
    Provider.of<InputService>(context, listen: false).loadInputs();
  }

  void _loadData() {
    var inputs = Provider.of<InputService>(context, listen: false).inputs;
    if (inputs.isNotEmpty) {
      var latestInput = inputs.last;
      setState(() {
        _textboxes = List.generate(
          latestInput.values.length,
          (index) => DynamicTextbox(
            index: index,
            initialValue: latestInput.values[index],
            isSelected: latestInput.selections[index],
          ),
        );
      });
    }
  }

  void _updateData() {
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
      body: Consumer<InputService>(
        builder: (context, inputService, child) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: _loadData,
                  child: Text(Constants.loadButtonLabel),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _textboxes.length,
                    itemBuilder: (context, index) => _textboxes[index],
                  ),
                ),
                ElevatedButton(
                  onPressed: _updateData,
                  child: Text(Constants.updateButtonLabel),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
