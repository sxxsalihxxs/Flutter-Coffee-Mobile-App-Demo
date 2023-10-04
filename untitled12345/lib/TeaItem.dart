import 'package:flutter/material.dart';

class TeaItem extends StatefulWidget {
  final String name;

  TeaItem(this.name);

  @override
  _TeaItemState createState() => _TeaItemState();
}

class _TeaItemState extends State<TeaItem> {
  bool _isChecked = false;

  get _selectedTeas => null;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.name,
        style: TextStyle(color: Colors.white),
      ),
      leading: Checkbox(
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value!;
            _onTeaSelected(value!, widget.name);
          });
        },
      ),
    );
  }

  void _onTeaSelected(bool selected, String tea) {
    if (selected) {
      setState(() {
        _selectedTeas.add(tea);
      });
    } else {
      setState(() {
        _selectedTeas.remove(tea);
      });
    }
  }
}
