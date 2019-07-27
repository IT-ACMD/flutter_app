import 'package:flutter/material.dart';
import 'package:flutter_app/pages/UserInfo/askPage.dart';
import 'package:flutter_app/pages/loginCode.dart';
//引入自定义的其他页面文件
import 'layout/BottomMenu.dart';
import 'pages/loginView.dart';
import 'pages/loginCode.dart';
//import 'Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '项目标题',
      theme: ThemeData(primaryColor: Colors.white),//设置为黑色主题
      home: LoginView(),//BottomMenu(),//这个类在，bottom_menu.dart  中定义。
      routes: <String, WidgetBuilder>{
        'loginPage': (_) => LoginView(),
        'home': (_) =>BottomMenu(),
        'loginCode': (_) =>LoginCode(),
        'askPage':(_) =>AskPage(),
      },
    );
  }
}