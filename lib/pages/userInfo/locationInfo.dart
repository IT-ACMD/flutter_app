import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_app/data/userInfo.dart';

class LocationInfo extends StatefulWidget {
  final UserInfo user;
  const LocationInfo({Key key, this.user}) : super(key: key);
  @override
  _LocationInfoState createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    //UserInfo a = widget.user;
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
              //padding: EdgeInsets.symmetric(horizontal: 45.0),
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    buildTitleText('你所在的城市？'),
                    buildLocationIcon(),
                    buildGetlocation(),
                  ],
                ),
                buildNextButton(),
              ],
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
      margin: EdgeInsets.fromLTRB(0.0, 62.0, 0.0, 90.0),
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

  buildLocationIcon() {
    return Icon(
      Icons.location_on,
      size: 60,
    );
  }

  List selectColors = [
    {
      'back': Color(0xFFE4F8F1),
      'border': Color(0xFF24C789),
      'text': Color(0xFF24C789),
      'val': '上海市 闵行区',
    },
    {
      'back': Color(0xFFFFFFFF),
      'border': Color(0xFFCCCCCC),
      'text': Color(0xFF333333),
      'val': '获取当前城市',
    }
  ];

  buildGetlocation() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      GestureDetector(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          height: 44.0,
          width: 173.0,
          alignment: Alignment.center,
          child: Text(
            selectColors[1]['val'],
            style: TextStyle(color: selectColors[1]['text'], fontSize: 16.0),
          ),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(22.0)),
            color: selectColors[1]['back'],
            border:
                new Border.all(color: selectColors[1]['border'], width: 1.0),
          ),
        ),
        onTap: () {
          setState(() {
            var a = selectColors[0];
            selectColors[0] = selectColors[1];
            selectColors[1] = a;
          });
        },
      )
    ]);
  }

  buildNextButton() {
    return Positioned(
        bottom: 77.0,
        left: 40.0,
        right: 40.0,
        child: Container(
          height: 54.0,
          width: 300.0,
          child: RaisedButton(
            child: Text('继续',
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        16.0) //Theme.of(context).primaryTextTheme.headline,
                ),
            color: Color.fromARGB(255, 36, 199, 137),
            onPressed: () {
              Navigator.pushNamed(context, "askPage");
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    28.0)), //StadiumBorder(side: BorderSide()),
          ),
        ));
  }
}
