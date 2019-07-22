//这是HomeView类的控制页
import 'package:flutter/material.dart';
import '../widget/ecg_title_bar.dart';
import '../layout/rank_tab_area.dart';
import '../layout/rank_tab_friend.dart';

class RankView extends StatefulWidget {
  _RankViewState createState() => _RankViewState();
}

class _RankViewState extends State<RankView> {
  // final Widget child;
  // HomeView({Key key, this.child}) : super(key: key);

  List tabNames = ['好友', '地区'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      child: Scaffold(
        appBar: WAppBar(
          child: buildmytopbar(),
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 88.0),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            tabs: tabNames.map((e) {
              return Tab(
                text: e,
              );
            }).toList(),
            labelColor: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
        body: new TabBarView(
          children: <Widget>[
            FriendTabView(),
            AreaTabView(),
          ],
        ),
      ),
      length: tabNames.length,
    ));
  }

  Widget buildmytopbar() {
    return Container(
        padding: EdgeInsets.all(13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '排行',
              style: TextStyle(fontSize: 23.0, color: Colors.black),
            ),
            Icon(Icons.share)
          ],
        ));
  }
}
