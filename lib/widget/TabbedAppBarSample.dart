// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabbedAppBarSample extends StatelessWidget {

  static List<Choice> choices = const <Choice>[
    const Choice(title: '心电图'),
    const Choice(title: '当前心率'),
    const Choice(title: '今日步数'),
    const Choice(title: '设备电量'),
  ];

// 导航图标
  final List<BottomNavigationBarItem> bottomNavItems = [
    new BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Icon(Icons.home, color: Colors.green,),
        title: new Text('首页', style: TextStyle(color : Colors.green),)
    ),

    new BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Icon(Icons.message, color: Colors.grey,),
        title: new Text('排行', style: TextStyle(color : Colors.grey),)
    ),

    new BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Icon(Icons.shopping_cart, color: Colors.grey,),
        title: new Text('教练', style: TextStyle(color : Colors.grey),)
    ),

    new BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Icon(Icons.person, color: Colors.grey,),
        title: Text('我的', style: TextStyle(color : Colors.grey),)
    )
  ];

  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
        length: choices.length,
        child: new Scaffold(
          appBar: new AppBar(
            title: const Text('心电', style: TextStyle(color : Colors.black),),
            bottom: new TabBar(
              isScrollable: true,
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                  //icon: new Icon(choice.icon),
                );
              }).toList(),
              labelColor: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
          body: new TabBarView(
            children: choices.map((Choice choice) {
              return new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new ChoiceCard(choice: choice),
              );
            }).toList(),
          ),
          bottomNavigationBar: new BottomNavigationBar(
              items: bottomNavItems,
              backgroundColor: Colors.white,
              onTap: (index) {
                  _changePage(index);
              },
          ),
        ),
      ),
    );
  }

  /* 如果点击的导航页不是当前项，切换*/
  void _changePage(int index) {
    if(index != currentIndex){
        currentIndex = index;
        /*bottomNavItems.map((item){
          Widget a = item.icon;
        });*/
    }
  }
}

class Choice {
  const Choice({ this.title, this.icon });
  final String title;
  final IconData icon;
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({ Key key, this.choice }) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}