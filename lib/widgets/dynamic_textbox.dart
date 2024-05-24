import 'package:flutter/material.dart';

class DynamicTextbox extends StatefulWidget {
  final int index;
  final int? initialValue;
  final bool? isSelected;

  DynamicTextbox({required this.index, this.initialValue, this.isSelected});

  @override
  _DynamicTextboxState createState() => _DynamicTextboxState();

  TextEditingController get controller => _DynamicTextboxState().controller;
}

class _DynamicTextboxState extends State<DynamicTextbox> {
  late TextEditingController controller;
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue?.toString());
    isSelected = widget.isSelected ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration:
                InputDecoration(labelText: 'Textbox ${widget.index + 1}'),
            keyboardType: TextInputType.number,
          ),
        ),
        Checkbox(
          value: isSelected,
          onChanged: (bool? value) {
            setState(() {
              isSelected = value!;
            });
          },
        ),
      ],
    );
  }
}
