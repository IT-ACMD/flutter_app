//这是HomeView类的控制页
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  // final Widget child;
  // HomeView({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("我的", style: TextStyle(color : Colors.black, fontSize: 17.0),),backgroundColor: Colors.white,),
        body: Center(
          child: Text("这里是我的页面"),
        ),
      ),
    );
  }
}
