import 'package:flutter/material.dart';
import 'package:flutter_app/data/dataCenter.dart';
import 'package:flutter_app/widget/BirthdayPage.dart';
import 'package:flutter_app/widget/ecg_title_bar.dart';

class PersonalData extends StatefulWidget {
  @override
  _PersonalState createState() => _PersonalState();
}

class _PersonalState extends State<PersonalData> {
  String _modifyName, _modifySex, _modifyBirth, _modifyCity;

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
                  buildHeadImage(),
                  buildUserName(),
                  buildUserSex(),
                  Container(
                    color: Color(0xfff4f4f4),
                    height: 8.0,
                  ),
                  buildUserbirth(),
                  buildUserCity()
                ],
              ),
            )
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
      Align(
          alignment: Alignment.center,
          child: Text('个人资料',
              style: TextStyle(
                fontSize: 20.0,
                color: Color(0xff333333),
              ))),
      Expanded(
          child: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16.0),
        child: InkWell(
          child: Text(
            '保存',
            style: TextStyle(color: Color(0xff333333)),
          ),
          onTap: () {
            //发送post请求修改用户数据
            onSaveModifyData();
          },
        ),
      )),
    ]);
  }

  static const blackcolor = Color(0xff333333);
  static const greycolor = Color(0xff999999);

  buildHeadImage() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '更换头像',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
          )),
          ClipOval(
            child: Image.asset(
              'images/user_head.png',
              width: 74.0,
              height: 74.0,
            ),
          ),
          Image.asset('images/forward.png')
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
    );
  }

  buildUserName() {
    return Container(
      height: 54.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '昵称',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
          )),
          Text(
            eUserInfo.name,
            style: TextStyle(color: Color(0xff999999), fontSize: 13.0),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
    );
  }

  buildUserSex() {
    return Container(
      color: Colors.white,
      height: 54.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '性别',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
          )),
          Container(
              margin: EdgeInsets.only(right: 14.0),
              child: Text(
                eUserInfo.sex,
                style: TextStyle(color: Color(0xff999999), fontSize: 13.0),
              )),
          Image.asset('images/forward.png')
        ],
      ),
    );
  }

  buildUserbirth() {
    return InkWell(
      child: Container(
        height: 54.0,
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(
              '生日',
              style: TextStyle(color: blackcolor, fontSize: 15.0),
            )),
            Container(
                margin: EdgeInsets.only(right: 14.0),
                child: Text(
                  eUserInfo.birthDate,
                  style: TextStyle(color: Color(0xff999999), fontSize: 13.0),
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

  buildUserCity() {
    return Container(
      color: Colors.white,
      height: 54.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            '所在城市',
            style: TextStyle(color: blackcolor, fontSize: 15.0),
          )),
          Container(
              margin: EdgeInsets.only(right: 14.0),
              child: Text(
                eUserInfo.city,
                style: TextStyle(color: Color(0xff999999), fontSize: 13.0),
              )),
          Image.asset('images/forward.png')
        ],
      ),
    );
  }

  onSaveModifyData() {
    if (_modifyName != null) eUserInfo.name = _modifyName;
    if (_modifySex != null) eUserInfo.sex = _modifySex;
    if (_modifyBirth != null) eUserInfo.birthDate = _modifyBirth;
    if (_modifyCity != null) eUserInfo.city = _modifyCity;
    Navigator.pop(context);
  }

  void _showDialog() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return BirthdayPage();
        }).then((value) {
      if (value != null) {
        setState(() => _modifyBirth = value);
      }
    });
  }
}
