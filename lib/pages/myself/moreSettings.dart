import 'package:flutter/material.dart';
import 'package:flutter_app/pages/myself/account.dart';
import 'package:flutter_app/pages/myself/backUp.dart';
import 'package:flutter_app/widget/ecg_title_bar.dart';

class MoreSetting extends StatefulWidget {
  @override
  _MoreSettingState createState() => _MoreSettingState();
}

class _MoreSettingState extends State<MoreSetting> {
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
                  buildHeadImage(),
                  buildUserSex(),
                  Container(
                    color: Color(0xfff4f4f4),
                    height: 8.0,
                  ),
                  buildAboutUs(),
                ],
              ),
            ),
            buildLogoutButton()
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
      Text('更多设置',
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

  buildHeadImage() {
    return InkWell(
      child: Container(
        height: 56.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              '账户',
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
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return Account();
        }));
      },
    );
  }

  buildUserSex() {
    return InkWell(
      child: Container(
        color: Colors.white,
        height: 54.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              '数据备份/恢复',
              style: TextStyle(color: blackcolor, fontSize: 15.0),
            )),
            Container(
                margin: EdgeInsets.only(right: 14.0),
                child: Text(
                  '备份到本地',
                  style: TextStyle(color: greycolor, fontSize: 13.0),
                )),
            Image.asset('images/forward.png')
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return BackUp();
        }));
      },
    );
  }

  buildAboutUs() {
    return Container(
      color: Colors.white,
      height: 54.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '关于我们',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
          )),
          Image.asset('images/forward.png')
        ],
      ),
    );
  }

  buildLogoutButton() {
    return Container(
        margin: EdgeInsets.only(top: 42.0),
        width: 177.0,
        height: 52.0,
        alignment: Alignment.center,
        child: OutlineButton(
          padding: EdgeInsets.fromLTRB(50.0, 13.0, 50.0, 13.0),
          child: Text(
            '退出登录',
            style: TextStyle(color: Color(0xff24c789), fontSize: 19.0),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(27.0)),
          ),
          borderSide: BorderSide(color: Color(0xff24c789), width: 2.0),
          onPressed: () {},
        ));
  }
}
