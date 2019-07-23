import 'dart:math';

import 'package:flutter/material.dart';

class CourseTabView extends StatefulWidget {
  _CourseTabState createState() => _CourseTabState();
}

class _CourseTabState extends State<CourseTabView> {

  //课程数据
  List Courses = [
    {'image' : 'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng623fa3b102da5abdd92436f32b73d00f', 'population' : Random().nextInt(100000).toString()},
    {'image' : 'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePngad58f922d57bc5df3b5643a975b91f69', 'population' : Random().nextInt(100000).toString()},
    {'image' : 'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng3dd3c71632ebe950233aa5234c89fc2d', 'population' : Random().nextInt(100000).toString()},
    {'image' : 'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng623fa3b102da5abdd92436f32b73d00f', 'population' : Random().nextInt(100000).toString()},
    {'image' : 'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng3dd3c71632ebe950233aa5234c89fc2d', 'population' : Random().nextInt(100000).toString()},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF4F4F4),
      child: ListView(
        children: List.generate(5, (i){
          return buildCourseItem(i);
        }).toList()
      ),
    );
  }

  Widget buildCourseItem(i){
    return Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.network(
                      Courses[i]['image'],
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
                              fontSize: 10.0, color: Color(0xFF666666),
                              wordSpacing: 30.0),
                          children: <TextSpan>[TextSpan(text: ' ${Courses[i]['population']}',children: <TextSpan>[
                            TextSpan(text: '人已学习')
                          ])]),
                    ),
                  )
                ],
              ));
  }

}
