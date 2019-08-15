import 'package:flutter/material.dart';
import 'package:flutter_app/widget/ecg_title_bar.dart';
import 'dart:math';

class LWCourse extends StatefulWidget {
  @override
  _LWCourseState createState() => _LWCourseState();
}

class _LWCourseState extends State<LWCourse> {
  final _formKey = GlobalKey<FormState>();

  //课程数据
  List _courses = [
    {
      'image':
          'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng623fa3b102da5abdd92436f32b73d00f',
      'population': Random().nextInt(100000).toString()
    },
    {
      'image':
          'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePngad58f922d57bc5df3b5643a975b91f69',
      'population': Random().nextInt(100000).toString()
    },
    {
      'image':
          'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng3dd3c71632ebe950233aa5234c89fc2d',
      'population': Random().nextInt(100000).toString()
    },
    {
      'image':
          'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng623fa3b102da5abdd92436f32b73d00f',
      'population': Random().nextInt(100000).toString()
    },
    {
      'image':
          'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng3dd3c71632ebe950233aa5234c89fc2d',
      'population': Random().nextInt(100000).toString()
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WAppBar(
          child: buildBackButton(context),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Material(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: buildLossCourses()
          ),
        ));
  }

  Widget buildBackButton(context) {
    return Row(children: <Widget>[
      IconButton(
        padding: EdgeInsets.all(0.0),
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 28,
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      Text('减肥课程',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xff333333),
          )),
      Expanded(
          child: Container(
              padding: EdgeInsets.only(right: 15.0),
              child: Image.network(
                'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng86dde1bff23b3753b849634480f8150a',
                height: 20.0,
                width: 20.0,
                alignment: Alignment.centerRight,
              ))),
    ]);
  }

  buildLossCourses() {
    return Container(
      color: Color(0xFFF4F4F4),
      child: ListView(
          children: List.generate(5, (i) {
        return buildCourseItem(i);
      }).toList()),
    );
  }

  Widget buildCourseItem(i) {
    return Container(
        margin: EdgeInsets.only(bottom: 8.0),
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 0.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                _courses[i]['image'],
                fit: BoxFit.fill,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(0.0, 7.0, 0.0, 9.0),
              child: RichText(
                text: TextSpan(
                    text: '一节视频课程',
                    style: TextStyle(
                        fontSize: 10.0,
                        color: Color(0xFF666666),
                        wordSpacing: 30.0),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ${_courses[i]['population']}',
                          children: <TextSpan>[TextSpan(text: '人已学习')])
                    ]),
              ),
            )
          ],
        ));
  }
}
