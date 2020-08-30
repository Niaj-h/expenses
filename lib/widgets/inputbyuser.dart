import 'package:expenses/screens/spends_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class InputByUser extends StatefulWidget {
  final Function _addsheet;

  InputByUser(this._addsheet);
  @override
  _InputByUserState createState() => _InputByUserState();
}

class _InputByUserState extends State<InputByUser> {
  ColorSwatch _tempMainColor = Colors.blue;

  ColorSwatch _mainColor = Colors.red;

  void _colorpicker() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          MaterialColorPicker(
            selectedColor: _mainColor,
            allowShades: false,
            onMainColorChange: (color) =>
                setState(() => _tempMainColor = color),
            colors: accentColors,
            shrinkWrap: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _mainColor = _tempMainColor;
                },
                child: Text('Done'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final _firstnode = FocusNode();

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _firstnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(_firstnode);
            },
          ),
          TextField(
            focusNode: _firstnode,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            controller: _amountController,
            onSubmitted: (val) {
              _colorpicker();
              widget._addsheet(
                _titleController.text,
                int.parse(_amountController.text),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                  onPressed: _colorpicker,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 25,
                      color: Colors.black,
                      child: Center(
                        child: Text(' choose colors',
                            style: TextStyle(color: _tempMainColor)),
                      ),
                    ),
                  )),
              FlatButton(
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  widget._addsheet(_titleController.text,
                      int.parse(_amountController.text), _tempMainColor);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
