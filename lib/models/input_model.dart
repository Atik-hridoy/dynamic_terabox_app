class InputModel {
  int id;
  List<int> values;
  List<bool> selections;

  InputModel(
      {required this.id, required this.values, required this.selections});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'values': values.join(','),
      'selections': selections.map((s) => s ? 1 : 0).join(','),
    };
  }

  static InputModel fromMap(Map<String, dynamic> map) {
    return InputModel(
      id: map['id'],
      values: (map['values'] as String)
          .split(',')
          .map((e) => int.parse(e))
          .toList(),
      selections: (map['selections'] as String)
          .split(',')
          .map((e) => e == '1')
          .toList(),
    );
  }
}
