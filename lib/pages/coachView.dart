//这是HomeView类的控制页
import 'package:flutter/material.dart';
import '../widget/ecg_title_bar.dart';
import '../layout/coach_tab_tips.dart';
import '../layout/coach_tab_course.dart';

class CoachView extends StatefulWidget {
  const CoachView({Key key}) : super(key: key);
  @override
  _CoachViewState createState() => new _CoachViewState();
}

class _CoachViewState extends State<CoachView>
    with SingleTickerProviderStateMixin {
  // final Widget child;
  // HomeView({Key key, this.child}) : super(key: key);

  List tabNames = ['心得', '课程'];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabNames.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        child: buildmytopbar(),
        bottom: TabBar(
          onTap: (index) {
            setState(() {});
          },
          controller: _tabController,
          //labelPadding: EdgeInsets.symmetric(horizontal: 80.0),
          labelStyle: TextStyle(
              fontSize: 16.0,
              color: Color.fromARGB(255, 51, 51, 51),
              fontWeight: FontWeight.bold),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Color(0xFF524D55),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 2.0,
            ),
          ),
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
        controller: _tabController,
        children: <Widget>[
          TipsTabView(),
          CourseTabView(),
        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton(
              child: Icon(Icons.photo_camera),
              backgroundColor: Color(0xFF24C789),
              onPressed: () {
                //todo 照相
              },
            )
          : null,
    );
  }

  //头部导航栏
  Widget buildmytopbar() {
    return Container(
        padding: EdgeInsets.fromLTRB(16.0, 13.0, 17.0, 13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '教练',
              style: TextStyle(fontSize: 23.0, color: Colors.black),
            ),
            Icon(
              Icons.list,
              color: Colors.black,
            )
          ],
        ));
  }
}
