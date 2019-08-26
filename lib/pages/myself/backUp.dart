import 'package:flutter/material.dart';
import 'package:flutter_app/widget/ecg_title_bar.dart';

class BackUp extends StatefulWidget {
  @override
  _BackUpState createState() => _BackUpState();
}

class _BackUpState extends State<BackUp> {
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
                  buildLocalBackup(),
                  buildCloudBackup(),
                  buildLocalRecover(),
                  buildCloudRecover(),
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
      Text('备份',
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

  buildLocalBackup() {
    return InkWell(
      child: Container(
        height: 56.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              '备份到本地',
              style: TextStyle(color: blackcolor, fontSize: 15.0),
            )),
            Image.asset('images/forward.png')
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
      ),
      onTap: () {},
    );
  }

  buildCloudBackup() {
    return Container(
      height: 54.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '备份到云端',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
          )),
          Image.asset('images/forward.png')
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
    );
  }

  buildLocalRecover() {
    return Container(
      height: 54.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '从本地恢复',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
          )),
          Image.asset('images/forward.png')
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
    );
  }

  buildCloudRecover() {
    return Container(
      color: Colors.white,
      height: 54.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '从云端恢复',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
          )),
          Image.asset('images/forward.png')
        ],
      ),
    );
  }
}
