import 'dart:math';

import 'package:flutter/material.dart';

class TipsTabView extends StatefulWidget {
  _TipsTabState createState() => _TipsTabState();
}

class _TipsTabState extends State<TipsTabView> {
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0XFFF5F5F5),
      padding: EdgeInsets.fromLTRB(16.0, 14.0, 16.0, 0.0),
      child: Container(
          color: Colors.white,
          child: ListView(children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildLeftVideo(),
                buildRightVideo(),
              ],
            ),
          ])),
    );
  }

  List leftMsgs = [
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()}
  ];

  List rightMsgs = [
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()},
    {'isLike': false, 'likeTimes': Random().nextInt(1000).toString()}
  ];

  buildLeftVideo() {
    return Expanded(
        child: Column(
      children: List.generate(5, (i) {
        return Container(
            padding: EdgeInsets.only(right: 3.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.network(
                    'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng08f015449fe71d759b137dbacc7a2cd8',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 41.0,
                  margin: EdgeInsets.fromLTRB(10.0, 9.0, 8.0, 0.0),
                  child: Text(
                    '暴饮暴食，曾经的撑杆跳运动员摆脱肥胖',
                    style: TextStyle(fontSize: 10.0, color: Color(0xFF333333)),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                            child: Image.asset(
                          'images/ecg_user1.png',
                          width: 26.0,
                          height: 26.0,
                        )),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '小熊Libra',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromARGB(255, 51, 51, 51)),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          key: GlobalKey(),
                          icon: Image.asset(
                            'images/coach_up.png',
                            color: leftMsgs[i]['isLike'] ? Colors.green : null,
                          ),
                          onPressed: () {
                            if (!leftMsgs[i]['isLike']) {
                              leftMsgs[i]['isLike'] = true;
                              leftMsgs[i]['likeTimes'] =
                                  (int.parse(leftMsgs[i]['likeTimes']) + 1)
                                      .toString();
                            }
                            setState(() {
                              //todo 改变图标颜色
                            });
                          },
                          tooltip: '点赞',
                        ),
                        Text(
                          leftMsgs[i]['likeTimes'],
                          style: TextStyle(
                              fontSize: 10.0, color: Color(0xFF333333)),
                        ),
                      ],
                    ))
              ],
            ));
      }).toList(),
    ));
  }

  buildRightVideo() {
    return Expanded(
        child: Column(
      children: List.generate(5, (i) {
        return Container(
            padding: EdgeInsets.only(left: 3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.network(
                    'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePngddea328364abf55ed756769e354fd0b9',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 41.0,
                  margin: EdgeInsets.fromLTRB(10.0, 9.0, 8.0, 0.0),
                  child: Text(
                    '暴饮暴食，备孕妈妈减肥战斗史',
                    style: TextStyle(fontSize: 10.0, color: Color(0xFF333333)),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                            child: Image.asset(
                          'images/ecg_user1.png',
                          width: 26.0,
                          height: 26.0,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '小熊Libra',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromARGB(255, 51, 51, 51)),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          key: GlobalKey(),
                          icon: Image.asset(
                            'images/coach_up.png',
                            color: rightMsgs[i]['isLike'] ? Colors.green : null,
                          ),
                          onPressed: () {
                            if (!rightMsgs[i]['isLike']) {
                              rightMsgs[i]['isLike'] = true;
                              rightMsgs[i]['likeTimes'] =
                                  (int.parse(rightMsgs[i]['likeTimes']) + 1)
                                      .toString();
                            }
                            setState(() {
                              //todo 改变图标颜色
                            });
                          },
                          tooltip: '点赞',
                        ),
                        Text(
                          rightMsgs[i]['likeTimes'],
                          style: TextStyle(
                              fontSize: 10.0, color: Color(0xFF333333)),
                        ),
                      ],
                    ))
              ],
            ));
      }).toList(),
    ));
  }

  /*buildLeftVideo() {
    return Expanded(
      child: ListView(
          controller: _controller,
          children: List.generate(5, (i) {
            return Container(
                padding: EdgeInsets.only(right: 6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.network(
                        'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng08f015449fe71d759b137dbacc7a2cd8',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          children: <Widget>[
                            ClipOval(
                                child: Image.asset(
                              'images/ecg_user1.png',
                              width: 36.0,
                              height: 36.0,
                            )),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '小熊Libra',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Color.fromARGB(255, 51, 51, 51)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ));
          }).toList()),
    );
  }

  buildRightVideo() {
    return Expanded(
      child: ListView(
          controller: _controller,
          children: List.generate(5, (i) {
            return Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Image.network(
                    'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePngddea328364abf55ed756769e354fd0b9',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: <Widget>[
                        ClipOval(
                            child: Image.asset(
                          'images/ecg_user1.png',
                          width: 36.0,
                          height: 36.0,
                        )),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '小熊Libra',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Color.fromARGB(255, 51, 51, 51)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ));
          }).toList()),
    );
  }*/
}
