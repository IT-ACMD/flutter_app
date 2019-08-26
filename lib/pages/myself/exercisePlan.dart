import 'package:flutter/material.dart';
import 'package:flutter_app/data/dataCenter.dart';
import 'package:numberpicker/numberpicker.dart';

class ExercisePlan extends StatefulWidget {
  @override
  _ExercisePlanState createState() => _ExercisePlanState();
}

class _ExercisePlanState extends State<ExercisePlan> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  String _weightPlan;

  @override
  void initState() {
    super.initState();
    _weightPlan ="70";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: buildBackButton(context),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Material(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    buildTitleText('我的计划体重'),
                    buildPickerIntger(eUserInfo.weightPlan),
                  ],
                ),
                buildNextButton(),
              ],
              //padding: EdgeInsets.symmetric(horizontal: 45.0),
            ),
          ),
        ));
  }

  Widget buildBackButton(context) {
    return Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 28,
          color: Color(0xFF524D55),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  buildTitleText(value) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF333333)),
      ),
    );
  }

  List pickers = [
    {'title': '选择体重', 'init': 70, 'max': 800, 'min': 20, 'unit': 'kg'}
  ];

  buildPickerIntger(val) {
    var item = pickers[0];
    return NumberPicker.integer(
      maxValue: item['max'],
      minValue: item['min'],
      lastStr: item['unit'],
      initialValue: item['init'],
      onChanged: (value) {
        _weightPlan = '$value';
      },
    );
  }

  buildNextButton() {
    return Positioned(
        bottom: 77.0,
        left: 40.0,
        right: 40.0,
        child: Container(
          height: 54.0,
          child: RaisedButton(
            child: Text('继续',
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        16.0) //Theme.of(context).primaryTextTheme.headline,
                ),
            color: Color.fromARGB(255, 36, 199, 137),
            onPressed: () {
              eUserInfo.weightPlan = _weightPlan;
              Navigator.pop(context);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0)),
          ),
        ));
  }
}
