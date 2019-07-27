//这是HomeView类的控制页
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../widget/ecg_title_bar.dart';
import '../layout/home_tab_ecg.dart';
import '../layout/home_tab_ecp.dart';
import '../layout/home_tab_nhr.dart';
import '../layout/home_tab_nstep.dart';
import 'package:flutter_app/pages/searchView.dart';

class HomeView extends StatefulWidget {
  _SearchBarDemoState createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<HomeView> {
  // final Widget child;
  // HomeView({Key key, this.child}) : super(key: key);

  static List<Choice> choices = const <Choice>[
    const Choice(title: '心电图'),
    const Choice(title: '当前心率'),
    const Choice(title: '今日步数'),
    const Choice(title: '设备电量'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new DefaultTabController(
        initialIndex: 1,
        length: choices.length,
        child: new Scaffold(
          appBar: new WAppBar(
            child: buildSearchBar(),
            /*new ECGTitleBar(
              '心电',
              iconData: Icons.textsms,
              needRightLocalIcon: true,
            ),*/
            bottom: new TabBar(
              isScrollable: true,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                ),
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color(0xFF524D55),
              tabs: choices.map((Choice choice) {
                return new Tab(
                  text: choice.title,
                );
              }).toList(),
              labelColor: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
          body: new TabBarView(
            children: <Widget>[
              ECGTabView(),
              RateTabView(),
              StepTabView(),
              ECPTabView(),
            ],
          ),
        ),
      ),
    );
  }
  
  //InkWell,
  //GestureDetector

  buildSearchBar() {
    return Container(
        padding: EdgeInsets.fromLTRB(16.0, 13.0, 17.0, 13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '心电',
              style: TextStyle(fontSize: 23.0, color: Colors.black),
            ),
            Container(
              width: 239.0,
              child: RaisedButton.icon(
                color: Color(0xFFF4F4F4),
                icon: Image.network(
                  'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng0f05aac412d26b75fa6e2b0831c23b7f',
                  height: 14.0,
                  width: 14.0,
                ),
                label: Text(
                  '寻找更多的心电知识',
                  style: TextStyle(fontSize: 10.0, color: Color(0xFF999999)),
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchBarDelegate(),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.0))),
              ),
            ),
            Image.asset('images/message.png',height: 19.0,width: 20.0,)
          ],
        ));
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

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

//异步请求数据
/*getData() async{
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var httpClient = new HttpClient();

    var result;
    try{
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if(response.statusCode == HttpStatus.ok){
        var json = await response.transform(utf8.decoder).join();
        result = jsonDecode(json);
      }
      else
      {
        result = 'Error getting json data:\nHttp status ${response.statusCode}';
      }
    }
    catch (exception) {
      result = 'Faild getting json data';
    }

    if(!mounted)return;
    
    setState((){
      data = result;
    });

  }*/
