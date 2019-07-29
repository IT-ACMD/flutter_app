import 'package:flutter/material.dart';
import 'package:flutter_app/data/userInfo.dart';
import 'package:flutter_app/pages/userInfo/sexbirth.dart';

class AskPage extends StatefulWidget {
  @override
  _AskPageState createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _phone;
  bool isObscure = true;
  Color _eyeColor;
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
                buildUserImage(),
                buildSayHello(),
                SizedBox(
                  height: 80.0,
                ),
                buildImageChar(),
                buildSayHelloContent(),
                SizedBox(
                  height: 180.0,
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
          icon: Icon(Icons.close),
          iconSize: 28,
          color: Color(0xFF524D55),
          onPressed: () {
            //Navigator.pushNamed(context, "loginPage");
            Navigator.pop(context);
          },
        ));
  }

  buildUserImage() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 12.0),
      child: Image.network(
        'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng612fec50d623c26d264c24f0f1a5c807',
        height: 50.0,
        width: 50.0,
      ),
    );
  }

  buildSayHello() {
    return Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Text(
          'Hi,',
          style: TextStyle(color: Color(0xFF333333), fontSize: 22.0),
        ));
  }

  buildImageChar() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 10.0),
      child: Image.network(
        'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng2f8745999601a6874ef20ff6422babc6',
        height: 20.0,
        width: 22.0,
      ),
    );
  }

  buildSayHelloContent() {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        '欢迎，\n回答几个问题心电将为你安排\n更合适的内容。',
        style: TextStyle(fontSize: 20.0, color: Color(0xFF333333)),
      ),
    );
  }

  buildNextButton() {
    return Container(
      height: 55.0,
      child: RaisedButton(
        child: Text('下一步',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0) //Theme.of(context).primaryTextTheme.headline,
            ),
        color: Color.fromARGB(255, 36, 199, 137),
        onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new SexBirth(user: UserInfo())));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                28.0)), //StadiumBorder(side: BorderSide()),
      ),
    );
  }
}
