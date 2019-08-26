import 'package:flutter/material.dart';
import 'package:flutter_app/widget/ecg_title_bar.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
                  buildUserPhone(),
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
      Text('账号',
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

  buildUserPhone() {
    return Container(
      height: 56.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '手机号',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
          )),
          Text('18937484929',
              style: TextStyle(color: greycolor, fontSize: 13.0))
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
    );
  }
}
