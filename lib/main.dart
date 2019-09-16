import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/tools/Filehelper.dart';
//引入自定义的其他页面文件
import 'config.dart';
import 'data/dataCenter.dart';
import 'pages/home_page/Index.dart';
import 'pages/login_register/loginView.dart';
import 'pages/login_register/registerView.dart';

main() async {
  //是否近期成功登录过 呢
  String url = await Filehelper.getAppdataUrl();
  File token = new File('$url/$accessTokenName');
  bool isNeedLogin = true;
  bool isExists = await token.exists();
  if(isExists)
  {
    token.readAsString().then((content){
      eAccountData.accessToken = content;
      toLoginByToken().then((res){
        if(res){
          isNeedLogin = false;
        }
        else{
          eAccountData.accessToken = null;
        };
        runApp(MyApp(isNeedLogin));
      });
    });
  }
  else
  {
    runApp(MyApp(isNeedLogin));
  }
}


class MyApp extends StatelessWidget {
  bool _login = true;
  MyApp(bool isNeedLogin){ _login = isNeedLogin;}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '项目标题',
      theme: ThemeData(primaryColor: Colors.white,accentColor: Colors.white),//设置为黑色主题
      home: _login ? RegisterView() : Index(),//,//BottomMenu(),//这个类在，bottom_menu.dart  中定义。LoginView()
      routes: <String, WidgetBuilder>{
        'loginPage': (_) => LoginView(),
        'home': (_) =>Index(),
      },
    );
  }
}