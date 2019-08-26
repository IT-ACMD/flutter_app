import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/data/dataCenter.dart';
import 'package:flutter_app/tools/ECHttp.dart';
import 'package:numberpicker/numberpicker.dart';

class HeightAndWeight extends StatefulWidget {
  const HeightAndWeight({Key key}) : super(key: key);
  @override
  _HeightAndWeightState createState() => _HeightAndWeightState();
}

class _HeightAndWeightState extends State<HeightAndWeight> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  //String _hVal = '',_wVal = '70kg';

  @override
  void initState() {
    super.initState();
    eUserInfo.height = '168cm';
    eUserInfo.weight = '70kg';
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
                    SizedBox(
                      height: 62.0,
                    ),
                    buildTitleText('你的身高'),
                    SizedBox(
                      height: 30.0,
                    ),
                    buildPickerIntger(0, eUserInfo.height),
                    SizedBox(
                      height: 80.0,
                    ),
                    buildTitleText('你的体重'),
                    SizedBox(
                      height: 30.0,
                    ),
                    buildPickerIntger(1, eUserInfo.weight),
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
          icon: Icon(Icons.chevron_left),
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
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333)),
      ),
    );
  }

  List pickers = [
    {'title': '选择身高', 'init': 168, 'max': 380, 'min': 70, 'unit': 'cm'},
    {'title': '选择体重', 'init': 70, 'max': 800, 'min': 20, 'unit': 'kg'}
  ];
  void _showDialog(type) {
    var item = pickers[type];
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            title: Container(
                alignment: Alignment.center,
                child: Text(
                  item['title'],
                  style: TextStyle(color: Color(0xFF333333), fontSize: 17.0),
                )),
            initialIntegerValue: item['init'],
            maxValue: item['max'],
            minValue: item['min'],
            confirmWidget: Container(
              height: 48.0,
              width: 259.0,
              alignment: Alignment.center,
              child: Text(
                '确定',
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: Color(0xFF24C789),
              ),
            ),
            cancelWidget: Container(
              height: 48.0,
              width: 259.0,
              alignment: Alignment.center,
              child: Text(
                '取消',
                style: TextStyle(color: Color(0xFF333333), fontSize: 17.0),
              ),
            ),
            lastStr: item['unit'],
          );
        }).then((value) {
      type == 0
          ? eUserInfo.height = '$value${item['unit']}'
          : eUserInfo.weight = '$value${item['unit']}';
      setState(() {});
    });
  }

  buildPickerIntger(type, val) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        width: 156.0,
        padding: EdgeInsets.only(bottom: 8.0),
        alignment: Alignment.center,
        child: InkWell(
            child: Text(val,
                style: TextStyle(fontSize: 20.0, color: Color(0xFF333333))),
            onTap: () {
              _showDialog(type);
            }),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Color(0xFFCCCCCC)),
        )),
      ),
    ]);
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
            onPressed: () async {
              String params = 'birthdateStr=${eUserInfo.birthDate}'
                              '&sex=${eUserInfo.sex}'
                              '&address=${eUserInfo.city}'
                              '&height=${eUserInfo.height}'
                              '&weight=${eUserInfo.weight}';
              Map map = {
                'birthdateStr': eUserInfo.birthDate,
                'sex':eUserInfo.sex == '男'? 0 : 1,
                'address':eUserInfo.city,
                'height':eUserInfo.height,
                'weight':eUserInfo.weight,
              };
              String result = await ECHttp.postDataJson('user/consumerDetails/save', map);
              if (result != null && result.length > 0) {
                var object1 = json.decode(result);
                if (object1['success']) {
                  Navigator.pushNamed(context, "home");
                }
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0)),
          ),
        ));
  }
}
