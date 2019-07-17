import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class LoginCode extends StatefulWidget {
  @override
  _LoginCodeState createState() => _LoginCodeState();
}

class _LoginCodeState extends State<LoginCode> {

  final _formKey = GlobalKey<FormState>();
  String _email, _password, _phone;
  bool isObscure = true;
  Color _eyeColor;
  @override
  Widget build(BuildContext context) {
    //默认设置宽度1080px, 高度1920px
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    //设置宽750 高1334，根据系统字体进行缩放
    //ScreenUtil.instance = ScreenUtil(width: 750, height: 13340, allowFontScaling: true)..init(context);
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context), 
        backgroundColor: Color.fromARGB(255, 82, 77, 85), 
        elevation: 0.0,
        ),
      body: Material(
        color: Color.fromARGB(255, 82, 77, 85),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            children: <Widget>[
              buildTitle(),
              SizedBox(height: 60.0),
              buildTextFieldTitle(),
              SizedBox(height: 30.0),
              buildPhoneTextField(),
              SizedBox(height: 30.0),
              buildLoginButton(context),
              SizedBox(height: 10.0),
              buildUserProtocolText(),
            ],
          ),
        ),
      )
    );
  }

  Widget buildBackButton(context)
  {
    return Align(
      alignment: Alignment.topLeft,
      child : IconButton(
        icon: Icon(Icons.arrow_back_ios), 
        iconSize: 28,
        color: Colors.white,
        onPressed: () {
           //Navigator.pushNamed(context, "loginPage");
           Navigator.pop(context);
        },
      )
    );
  }

  DefaultTextStyle buildUserProtocolText() {
    return DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontSize: 11.0
        ),
        textAlign: TextAlign.center,
        child: Text.rich(TextSpan(
          children: <TextSpan> [
            TextSpan(
              text: '重发短信验证码',
            ),
            TextSpan(
              text: ' 丨 ',
            ),
            TextSpan(
              text: '使用语音验证码',
            )
          ]
        )
          //'    ',
          //style: TextStyle(color: Colors.white, fontSize: 11.0),
        )
      );
  }

  DefaultTextStyle buildTextFieldTitle() {
    return DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0
        ),
        textAlign: TextAlign.start,
        child: Text.rich(TextSpan(
          children: <TextSpan> [
            TextSpan(
              text: '已发送 4 位验证码至 +86 ',
            ),
            TextSpan(
              text: '17521024021',
            ),
          ]
        )
          //'    ',
          //style: TextStyle(color: Colors.white, fontSize: 11.0),
        )
      );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: ScreenUtil().setHeight(140.0), //45 * 420/160
        width: ScreenUtil().setWidth(870.0),  //270 * 420/160
        child: RaisedButton(
          child: Text(
            '确定',
            style: TextStyle(color: Colors.white, fontSize: 16.0)//Theme.of(context).primaryTextTheme.headline,
          ),
          color: Color.fromARGB(255, 36, 199, 137),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              _formKey.currentState.save();
              //= 执行登录方法
              Navigator.pushNamed(context, "home");
              //print('email:$_email , assword:$_password');
            }
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),//StadiumBorder(side: BorderSide()),
        ),
      ),
    );
  }

  Padding buildForgetPasswordText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: FlatButton(
          child: Text(
            '忘记密码？',
            style: TextStyle(fontSize: 14.0, color: Colors.grey),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => _password = value,
      obscureText: isObscure,
      validator: (String value) {
        if (value.isEmpty) {
          return '请输入密码';
        }
      },
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: _eyeColor,
              ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                  _eyeColor = isObscure
                      ? Colors.grey
                      : Theme.of(context).iconTheme.color;
                });
              })),
    );
  }

  //邮箱登录文本框
  TextFormField buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Emall Address',
      ),
      validator: (String value) {
        var emailReg = RegExp(
            r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        if (!emailReg.hasMatch(value)) {
          return '请输入正确的邮箱地址';
        }
      },
      onSaved: (String value) => _email = value,
    );
  }

  //手机号登录文本框
  Container buildPhoneTextField() {
    return Container(
      child: PinInputTextField(
        pinLength: 4,
        autoFocus: true,
        textInputAction: TextInputAction.go,
        enabled: true,
        pinEditingController: PinEditingController(pinLength: 4, autoDispose: false),
        decoration: BoxLooseDecoration(
          textStyle: TextStyle(color: Colors.black,fontSize: 24.0),
          //strokeColor: Colors.transparent,
          solidColor: Colors.purpleAccent,
          enteredColor: Colors.deepOrange,
          obscureStyle: ObscureStyle(
              //isTextObscure: false,
              obscureText: '☺️',
            ),
        ),
        onSubmit: (String value) {
          print(value);
          //TODO 验证码输入是否正确
          //Navigator.pushNamed(context,'home');
        },
      )
    );
    
    /*return Container(
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        validator: (String value) {
          var emailReg = RegExp(
              r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
          if (!emailReg.hasMatch(value)) {
            return '请输入正确的手机号';
          }
        },
        onSaved: (String value) => _phone = value,
      ),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white30))
      ),

    );*/
  }

  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.only(left: 12.0, top: 4.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 40.0,
          height: 2.0,
        ),
      ),
    );
  }

  Padding buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        '输入验证码',
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }


}


