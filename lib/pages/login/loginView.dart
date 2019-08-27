import 'package:flutter/material.dart';
import 'package:flutter_app/data/dataCenter.dart';
import 'package:flutter_app/pages/login/loginCode.dart';
import 'package:flutter_app/tools/ECHttp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sharesdk/sharesdk.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _phone;
  bool isObscure = true;
  Color _eyeColor;
  List _loginMethod = [
    {
      'title': "微信",
      'icon':
          'images/3.0x/WX.png', //Image.asset('images/QQ.png'),//ImageIcon(AssetImage("assets/images/微信.png")),
    },
    {
      'title': "QQ",
      'icon': 'images/QQ.png', //ImageIcon(AssetImage("images/QQ.png"))
    }
  ];

  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ShareSDKRegister register = ShareSDKRegister();
    register.setupWechat(
        "wx617c77c82218ea2c", "c7253e5289986cf4c4c74d1ccc185fb1");
    register.setupQQ("100371282", "aed9b0303e3ed1e27bae87c33761161d");
    //注册
    ShareSDK.regist(register);
    _controller.addListener(onChange);
  }

  void onChange() {
    String text = _controller.text;
    _phone = text;
    eUserInfo.phone = text;
  }

  @override
  Widget build(BuildContext context) {
    //默认设置宽度1080px, 高度1920px
    ScreenUtil.instance.init(context);
    //设置宽750 高1334，根据系统字体进行缩放
    //ScreenUtil.instance = ScreenUtil(width: 1080, height: 1920, allowFontScaling: true)..init(context);
    return Scaffold(
        body: Material(
      color: Color.fromARGB(255, 82, 77, 85),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 35.0),
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            buildTitle(),
            //buildTitleLine(),
            SizedBox(height: 50.0),
            buildPhoneTextField(),
            SizedBox(height: 30.0),
            //buildPasswordTextField(context),
            //buildForgetPasswordText(context),
            //SizedBox(height: 60.0),
            buildLoginButton(context),
            SizedBox(height: 10.0),
            buildUserProtocolText(),
            SizedBox(
              height: 150.0,
            ),
            buildOtherText(context),
            buildOtherMethod(context),
            //buildRegisterText(context),
          ],
        ),
      ),
    ));
  }

  Widget buildOtherText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        '其他登陆方式',
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      ),
    );
  }

  Align buildRegisterText(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("没有账号？"),
              GestureDetector(
                child: Text(
                  "点击注册",
                  style: TextStyle(color: Colors.green),
                ),
                onTap: () {
                  //TODO跳转到注册页面
                  print("去注册");
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }

  ButtonBar buildOtherMethod(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: _loginMethod
          .map((item) => Builder(
                builder: (context) {
                  return Listener(
                    child: IconButton(
                        //icon: ImageIcon(AssetImage('images/QQ.png'),color: Color.fromARGB(0, 0, 0, 0)),//item['icon'],
                        //color: Theme.of(context).iconTheme.color),
                        icon: Image.asset(item[
                            'icon']), //ImageIcon(AssetImage('images/QQ.png')),
                        iconSize: 50.0,
                        onPressed: () {
                          //TODO : 第三方登录方法
                          Scaffold.of(context).showSnackBar(new SnackBar(
                            content: new Text("${item['title']}登录"),
                            action: new SnackBarAction(
                              label: "取消",
                              onPressed: () {},
                            ),
                          ));
                        }),
                    onPointerUp: (PointerUpEvent event) {
                      item['title'] == '微信'
                          ? authToWechat(context)
                          : authToQQ(context);
                    },
                  );
                },
              ))
          .toList(),
    );
  }

  DefaultTextStyle buildUserProtocolText() {
    return DefaultTextStyle(
        style: TextStyle(color: Colors.white, fontSize: 11.0),
        textAlign: TextAlign.left,
        child: Text.rich(TextSpan(children: <TextSpan>[
          TextSpan(
            text: '注册即同意 心电 ',
          ),
          TextSpan(
            text: '用户协议',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          ),
          TextSpan(
            text: ' 和 ',
          ),
          TextSpan(
            text: '隐私政策',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Colors.white,
            ),
          )
        ])
            //'    ',
            //style: TextStyle(color: Colors.white, fontSize: 11.0),
            ));
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: ScreenUtil().setHeight(140.0), //45 * 420/160
        width: ScreenUtil().setWidth(870.0), //270 * 420/160
        child: RaisedButton(
          child: Text('获取验证码',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0) //Theme.of(context).primaryTextTheme.headline,
              ),
          color: Color.fromARGB(255, 36, 199, 137),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              //_formKey.currentState.save();
              if (eIsTest) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return LoginCode(_phone);
                }));
              } else {
                var url = 'code/sms?mobile=$_phone';
                List hears = [
                  {'name': 'deviceId', 'value': '008'}
                ];
                String result = await ECHttp.getData(url, hears);
                //= 执行登录方法
                if (result != null)
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return LoginCode(_phone);
                  }));
              }
            }
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  24.0)), //StadiumBorder(side: BorderSide()),
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
      child: TextFormField(
        controller: _controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: '请输入手机号',
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
        validator: (String value) {
          /*var emailReg = RegExp(
              r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
          if (!emailReg.hasMatch(value)) {
            return '请输入正确的手机号';
          }*/
        },
      ),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(color: Colors.white30),
      )),
    );
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
      padding: EdgeInsets.only(top: 40.0),
      child: Text(
        '手机号登录',
        style: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  void authToWechat(BuildContext context) {
    ShareSDK.auth(ShareSDKPlatforms.wechatSession, null,
        (SSDKResponseState state, Map user, SSDKError error) {
      showAlert(state, user != null ? user : error.rawData, context);
    });
  }

  void getUserInfoToWechat(BuildContext context) {
    ShareSDK.getUserInfo(
        ShareSDKPlatforms.wechatSession, (SSDKResponseState state,
        Map user, SSDKError error) {
      showAlert(state, user != null ? user : error.rawData, context);
    });
  }

  void authToQQ(BuildContext context) {
    ShareSDK.getUserInfo(ShareSDKPlatforms.qq,
        (SSDKResponseState state, Map user, SSDKError error) {
      showAlert(state, user != null ? user : error.rawData, context);
    });
  }

  void showAlert(SSDKResponseState state, Map content, BuildContext context) {
    print("--------------------------> state:" + state.toString());
    String title = "失败";
    switch (state) {
      case SSDKResponseState.Success:
        title = "成功";
        break;
      case SSDKResponseState.Fail:
        title = "失败";
        break;
      case SSDKResponseState.Cancel:
        title = "取消";
        break;
      default:
        title = state.toString();
        break;
    }
  }
}
