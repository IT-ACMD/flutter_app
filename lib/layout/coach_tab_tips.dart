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
        child: Row(
          children: <Widget>[
            buildLeftVideo(),
            buildRightVideo(),
          ],
        ),
      ),
    );
  }
/*<Widget>[
          Image.network(
            'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng08f015449fe71d759b137dbacc7a2cd8',
            fit: BoxFit.fill,
          ),
          Text('暴饮暴食，曾经的撑杆跳运动员摆脱肥胖')
],*/

  buildLeftVideo() {
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
  }
}
