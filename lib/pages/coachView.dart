//这是HomeView类的控制页
import 'package:flutter/material.dart';
import '../widget/ecg_title_bar.dart';
import '../layout/coach_tab_tips.dart';
import '../layout/coach_tab_course.dart';

class CoachView extends StatefulWidget {
  _CoachViewState createState() => _CoachViewState();
}

class _CoachViewState extends State<CoachView> {
  // final Widget child;
  // HomeView({Key key, this.child}) : super(key: key);

  List tabNames = ['心得', '课程'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      child: Scaffold(
        appBar: WAppBar(
          child: buildmytopbar(),
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 80.0),
            labelStyle: TextStyle(fontSize: 16.0,color: Color.fromARGB(255, 51, 51, 51),fontWeight: FontWeight.bold),
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            tabs: tabNames.map((e) {
              return Tab(
                text: e,
              );
            }).toList(),
            unselectedLabelColor: Color(0xFF999999),
            labelColor: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0.5,
        ),
        body: new TabBarView(
          children: <Widget>[
            TipsTabView(),
            CourseTabView(),
          ],
        ),
      ),
      length: tabNames.length,
    ));
  }

  //头部导航栏
  Widget buildmytopbar() {
    return Container(
        padding: EdgeInsets.all(13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '教练',
              style: TextStyle(fontSize: 23.0, color: Colors.black),
            ),
            Icon(Icons.list,color: Colors.black,)
          ],
        ));
  }
}
