//这是HomeView类的控制页
import 'package:flutter/material.dart';
import '../widget/ecg_title_bar.dart';

class UserView extends StatefulWidget {
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: WAppBar(
          child: buildmytopbar(),
          //bottom:
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Color(0xFFF8F8F8),
          height: 2200.0,
          child: ListView(children: <Widget>[
            Column(
              children: <Widget>[
                buildUserBack(), //用户背景
                builduserInfo(), //用户流量信息
                buildUserPlan(), //用户运动计划
                buildUserRecord(), //用户运动记录
                buildWarningSettings(), //用户预警设置
                buildUsergSettings() //用户设置
              ],
            )
          ]),
        ),
      ),
    );
  }

  //头部导航栏
  Widget buildmytopbar() {
    return Container(
        //alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(vertical: 19.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
                height: 20.0,
                width: 20.0,
                child: ImageIcon(
                  AssetImage('images/message.png'),
                  color: Colors.black,
                )),
            Container(
                height: 20.0,
                width: 20.0,
                margin: EdgeInsets.fromLTRB(21.0, 0.0, 17.0, 0.0),
                child: ImageIcon(
                  AssetImage('images/settings.png'),
                  color: Colors.black,
                )),
          ],
        ));
  }

  buildUserBack() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 11.0, 20.0, 30.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipOval(
              child: Image.network(
            'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng6a41f8d82ae206d2b9c30758d99ce8e9',
            width: 64.0,
            height: 64.0,
          )),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Container(
                padding: EdgeInsets.only(left: 21.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(bottom: 7.0),
                        child: Text(
                          '非常酷的爱吃蓝莓的凡',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333)),
                        )),
                    RichText(
                        text: TextSpan(
                      text: '女 | ',
                      style: TextStyle(
                          fontSize: 11.0,
                          color: Color(0xFF6C6B70),
                          wordSpacing: 3.0),
                      children: <TextSpan>[
                        TextSpan(
                            text: '20岁',
                            style: TextStyle(
                                fontSize: 11.0, color: Color(0xFF666666)))
                      ],
                    ))
                  ],
                )),
          ),
          Expanded(
              child: Align(
            //padding: EdgeInsets.only(right: 0.0),
            alignment: Alignment.centerRight,
            child: Image.network(
              'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng489e0346717505fbb500e123746fe63e',
              height: 14.0,
              width: 8.0,
            ),
          ))
        ],
      ),
    );
  }

  //用户的流量信息
  builduserInfo() {
    return Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  '0',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 23.0),
                    child: Text('关注'))
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '5',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 23.0),
                    child: Text('粉丝'))
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '2',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 23.0),
                    child: Text('心得'))
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '10',
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 23.0),
                  child: Text('分享'),
                )
              ],
            )
          ],
        ));
  }

  buildUserPlan() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(17.0, 16.0, 0.0, 23.0),
                child: Text('我的运动计划'),
              ),
              Container(
                padding: EdgeInsets.only(right: 22.0),
                child: Image.network(
                  'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng489e0346717505fbb500e123746fe63e',
                  height: 14.0,
                  width: 8.0,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(17.0, 0.0, 7.0, 11.0),
                child: Text(
                  '95.5',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF524d55)),
                ),
              ),
              Container(
                child: Text(
                  '计划体重Kg',
                  style: TextStyle(fontSize: 11.0, color: Color(0xFF999999)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  buildUserRecord() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(17.0, 16.0, 0.0, 23.0),
                child: Text('我的运动记录'),
              ),
              Container(
                padding: EdgeInsets.only(right: 22.0),
                child: Image.network(
                  'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng489e0346717505fbb500e123746fe63e',
                  height: 14.0,
                  width: 8.0,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(17.0, 0.0, 7.0, 11.0),
                child: Text(
                  '0',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF524d55)),
                ),
              ),
              Container(
                child: Text(
                  '总运动分钟',
                  style: TextStyle(fontSize: 11.0, color: Color(0xFF999999)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  buildWarningSettings() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0),
      color: Colors.white,
      child: Container(
          padding: EdgeInsets.fromLTRB(18.0, 15.0, 22.0, 14.0),
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/warning.png',
                width: 18.0,
                height: 20.0,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    '预警设置',
                    style: TextStyle(color: Color(0xFF524D55)),
                  )),
              Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Image.network(
                        'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng489e0346717505fbb500e123746fe63e',
                        height: 14.0,
                        width: 8.0,
                      )))
            ],
          )),
    );
  }

  buildUsergSettings() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 12.0),
      color: Colors.white,
      child: Container(
          padding: EdgeInsets.fromLTRB(18.0, 15.0, 22.0, 14.0),
          child: Row(
            children: <Widget>[
              Image.asset(
                'images/settings.png',
                width: 18.0,
                height: 20.0,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Text(
                    '设置',
                    style: TextStyle(color: Color(0xFF524D55)),
                  )),
              Expanded(
                  child: Container(
                      alignment: Alignment.centerRight,
                      child: Image.network(
                        'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng489e0346717505fbb500e123746fe63e',
                        height: 14.0,
                        width: 8.0,
                      )))
            ],
          )),
    );
  }
}
