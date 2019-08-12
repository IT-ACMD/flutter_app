import 'package:flutter/material.dart';
import 'package:flutter_app/data/userInfo.dart';
import 'package:flutter_app/widget/BirthdayPage.dart';

import 'locationInfo.dart';

class SexBirth extends StatefulWidget {
  final UserInfo user;
  const SexBirth({Key key, this.user}) : super(key: key);
  @override
  _SexBirthState createState() => _SexBirthState();
}

class _SexBirthState extends State<SexBirth> {
  List sexs = [
    {
      'back': Color(0xFFE4F8F1),
      'border': Color(0xFF24C789),
      'text': Color(0xFF24C789),
      'val': '男'
    },
    {
      'back': Color(0xFFFFFFFF),
      'border': Color(0xFFCCCCCC),
      'text': Color(0xFF333333),
      'val': '女'
    }
  ];
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  void initState() { 
    super.initState();
    widget.user.birthDate = '1999年12月12日';
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
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              children: <Widget>[
                SizedBox(
                  height: 62.0,
                ),
                buildTitleText('你的性别？'),
                SizedBox(
                  height: 30.0,
                ),
                buildSexRidio(context),
                SizedBox(
                  height: 80.0,
                ),
                buildTitleText('你的出生年月？'),
                SizedBox(
                  height: 30.0,
                ),
                buildBirthDate(),
                SizedBox(
                  height: 100.0,
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

  buildSexRidio(context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 40.0),
            height: 80.0,
            width: 80.0,
            alignment: Alignment.center,
            child: Text(
              '男',
              style: TextStyle(color: sexs[0]['text'], fontSize: 22.0),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: sexs[0]['back'],
              border: new Border.all(color: sexs[0]['border'], width: 1.0),
            ),
          ),
          Container(
            height: 80.0,
            width: 80.0,
            alignment: Alignment.center,
            child: Text(
              '女',
              style: TextStyle(color: sexs[1]['text'], fontSize: 22.0),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: sexs[1]['back'],
              border: new Border.all(color: sexs[1]['border'], width: 1.0),
            ),
          ),
        ],
      ),
      onTapDown: (details) {
        var tran = sexs[0];
        sexs[0] = sexs[1];
        sexs[1] = tran;
        setState(() {
          widget.user.sex = sexs[0]['val'];
          print(widget.user.sex);
        });
      },
    );
  }

  void _showDialog() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return BirthdayPage();
        }).then((value) {
      if (value != null) {
        setState(() => widget.user.birthDate = value);
      }
    });
  }

  buildBirthDate() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        width: 156.0,
        padding: EdgeInsets.only(bottom: 8.0),
        alignment: Alignment.center,
        child: InkWell(
            child: Text(widget.user.birthDate,
                style: TextStyle(fontSize: 20.0, color: Color(0xFF333333))),
            onTap: _showDialog),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Color(0xFFCCCCCC)),
        )),
      ),
    ]);
  }

  buildNextButton() {
    return Container(
      height: 54.0,
      child: RaisedButton(
        child: Text('继续',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0) //Theme.of(context).primaryTextTheme.headline,
            ),
        color: Color.fromARGB(255, 36, 199, 137),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new LocationInfo(user: widget.user)));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                28.0)), //StadiumBorder(side: BorderSide()),
      ),
    );
  }
}
