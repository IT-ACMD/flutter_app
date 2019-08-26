import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/ecg_title_bar.dart';
import 'package:flutter_app/widget/heart_rate_warning.dart';

class WarningSet extends StatefulWidget {
  @override
  _WarningSetState createState() => _WarningSetState();
}

class _WarningSetState extends State<WarningSet> {
  bool _check = false;
  String _rateLimit = '180次/分钟';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        child: buildBackButton(context),
        backgroundColor: Colors.white,
      ),
      body: Material(
        color: Color(0xfff4f4f4),
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Color(0xfff4f4f4),
                    height: 8.0,
                  ),
                  buildRateSwich(),
                  buildRateLimit(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBackButton(context) {
    return Row(children: <Widget>[
      Expanded(
        child: IconButton(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10.0),
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 28,
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      Text('预警设置',
          style: TextStyle(
            fontSize: 20.0,
            color: blackcolor,
          )),
      Expanded(
        child: Container(),
      ),
    ]);
  }

  static const blackcolor = Color(0xff333333);
  static const greycolor = Color(0xff999999);

  buildRateSwich() {
    return Container(
      height: 56.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: RichText(
                  text: TextSpan(
            text: '心率上限预警\n',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
            children: <TextSpan>[
              TextSpan(
                  text: '高于心率上限时预警',
                  style: TextStyle(color: Color(0xff999999), fontSize: 12.0))
            ],
          ))),
          CupertinoSwitch(
            value: _check,
            onChanged: (bool value) {
              setState(() {
                this._check = value;
              });
            },
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
    );
  }

  buildRateLimit() {
    return InkWell(
      child: Container(
        height: 56.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              '心率上限',
              style: TextStyle(color: blackcolor, fontSize: 15.0),
            )),
            Container(
                margin: EdgeInsets.only(right: 14.0),
                child: Text(
                  _rateLimit,
                  style: TextStyle(color: greycolor, fontSize: 13.0),
                )),
            Image.asset('images/forward.png')
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
      ),
      onTap: _showDialog,
    );
  }

  void _showDialog() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return LearnRadioButton();
        }).then((value) {
      if (value != null) {
        setState(() => _rateLimit = value);
      }
    });
  }
}
