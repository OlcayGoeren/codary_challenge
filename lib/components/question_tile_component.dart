import 'package:flutter/material.dart';

typedef ChangeAnswer = void Function(int, bool);

class QuestionTile extends StatefulWidget {
  final String text;
  final int index;
  final ChangeAnswer callback;

  QuestionTile(this.text, this.callback, this.index);

  @override
  State<QuestionTile> createState() => _QuestionTile();
}

class _QuestionTile extends State<QuestionTile> {
  var _active = false;
  var _color = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        color: _color,
        child: InkWell(
          onTap: () {
            setState(() {
              _active = !_active;
              widget.callback(widget.index, _active);
              if (_active) {
                _color = Colors.blue;
              } else {
                _color = Colors.grey;
              }
            });
          },
          child: Text(
            widget.text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }
}
