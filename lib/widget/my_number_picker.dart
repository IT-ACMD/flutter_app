import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

///Returns AlertDialog as a Widget so it is designed to be used in showDialog method
class MyNumberPickerDialog extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialIntegerValue;
  final double initialDoubleValue;
  final int decimalPlaces;
  final Widget title;
  final EdgeInsets titlePadding;
  final Widget confirmWidget;
  final Widget cancelWidget;
  final int step;
  final bool infiniteLoop;

  ///constructor for integer values
  MyNumberPickerDialog.integer({
    @required this.minValue,
    @required this.maxValue,
    @required this.initialIntegerValue,
    this.title,
    this.titlePadding,
    this.step = 1,
    this.infiniteLoop = false,
    Widget confirmWidget,
    Widget cancelWidget,
  })  : confirmWidget = confirmWidget ?? new Text("OK"),
        cancelWidget = cancelWidget ?? new Text("CANCEL"),
        decimalPlaces = 0,
        initialDoubleValue = -1.0;

  ///constructor for decimal values
  MyNumberPickerDialog.decimal({
    @required this.minValue,
    @required this.maxValue,
    @required this.initialDoubleValue,
    this.decimalPlaces = 1,
    this.title,
    this.titlePadding,
    Widget confirmWidget,
    Widget cancelWidget,
  })  : confirmWidget = confirmWidget ?? new Text("OK"),
        cancelWidget = cancelWidget ?? new Text("CANCEL"),
        initialIntegerValue = -1,
        step = 1,
        infiniteLoop = false;

  @override
  State<NumberPickerDialog> createState() =>
      new _NumberPickerDialogControllerState(
          initialIntegerValue, initialDoubleValue);
}

class _NumberPickerDialogControllerState extends State<NumberPickerDialog> {
  int selectedIntValue;
  double selectedDoubleValue;

  _NumberPickerDialogControllerState(
      this.selectedIntValue, this.selectedDoubleValue);

  _handleValueChanged(num value) {
    if (value is int) {
      setState(() => selectedIntValue = value);
    } else {
      setState(() => selectedDoubleValue = value);
    }
  }

  _buildNumberPicker() {
    if (widget.decimalPlaces > 0) {
      return new NumberPicker.decimal(
        initialValue: selectedDoubleValue,
        minValue: widget.minValue,
        maxValue: widget.maxValue,
        decimalPlaces: widget.decimalPlaces,
        onChanged: _handleValueChanged,
        lastStr: null,
      );
    } else {
      return Container(
        color: Colors.red,
        child: Text('asdaa'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: widget.title,
      titlePadding: widget.titlePadding,
      content: _buildNumberPicker(),
      actions: [
        new FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: widget.cancelWidget,
        ),
        new FlatButton(
            onPressed: () => Navigator.of(context).pop(widget.decimalPlaces > 0
                ? selectedDoubleValue
                : selectedIntValue),
            child: widget.confirmWidget),
      ],
    );
  }
}
