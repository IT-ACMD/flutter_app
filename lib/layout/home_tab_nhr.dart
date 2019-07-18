import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//主页当前心率tab页面
class RateTabView extends StatefulWidget {
  RateTabState createState() => RateTabState();
}

class RateTabState extends State<RateTabView> {
  //蓝牙权限开关
  bool isVisible = true;

  //轮播图集
  final List<String> secondImageList = [
    'images/banner-1.png',
    'images/banner-1.png',
    'images/banner-1.png',
    'images/banner-1.png',
  ];

  //构造方法
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        isVisible ? buildBluetooth() : Container(), //权限title
        Container(
          height: 1200.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              buildUserInfo(), //蓝牙权限
              buildUserCard(), //用户心率卡片
              buildImageButtons(), //菜单栏
              buildImageCarousel(), //轮播
              buildUserInfoImage(), //用户健康信息
              buildKnowledgebutton(), //心电知识按钮
              buildKnowledgeDynamic(), //心电知识文章推送
            ],
          ),
        ),
      ],
    );
  }

  //蓝牙权限控件
  Widget buildBluetooth() {
    return Container(
        height: 50.0,
        margin: const EdgeInsets.only(top: 3.0),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Icon(Icons.bluetooth),
            ),
            Expanded(
              child: Text(
                '开启蓝牙精确记录心电指数',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
                height: 30.0,
                padding: const EdgeInsets.only(right: 18.0),
                alignment: Alignment(1.0, 0.5),
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.green),
                  //highlightColor: Colors.green,
                  textColor: Colors.green,
                  child: Text('开启权限'),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                  ),
                  onPressed: () {},
                ))
          ],
        ));
  }

  Widget buildUserInfo() {
    return Container(
        height: 62.0,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: <Widget>[
            ClipOval(
                child: Image.network(
              "https://profile.csdnimg.cn/9/2/0/1_qq_42181602",
              width: 55,
              height: 55,
            )),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('还未制定健康目标呦'),
                  SizedBox(
                    height: 25.0,
                    child: RaisedButton.icon(
                      icon: ImageIcon(
                        AssetImage('images/diamond.png'),
                        size: 12.0,
                        color: Color.fromARGB(255, 36, 199, 137),
                      ),
                      label: Text(
                        '普通会员',
                        style: TextStyle(fontSize: 10.0),
                      ),
                      color: Color.fromARGB(255, 241, 244, 243),
                      highlightColor: Colors.white, //按下颜色
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget buildUserCard() {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 50.0, minWidth: double.infinity),
      child: Container(
        height: 135.0,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.grey[300],
                    offset: new Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
            ),
            Positioned(
              child: Text(
                '当前心率',
                style: TextStyle(
                    fontSize: 12.0, color: Color.fromARGB(255, 153, 153, 153)),
              ),
              left: 20.0,
              top: 14.0,
            ),
            Positioned(
              child: RichText(
                text: TextSpan(
                    text: '90 ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 88, 78, 95),
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.0,
                      letterSpacing: -2.0,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'bpm',
                          style: TextStyle(
                              color: Color.fromARGB(255, 153, 153, 153),
                              fontSize: 15.0,
                              letterSpacing: 0.0))
                    ]),
              ),
              left: 20.0,
              bottom: 22.0,
            ),
            Positioned(
              child: RichText(
                text: TextSpan(
                    text: '3 ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 51, 51, 51),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: '天没有测试了哦～',
                          style: TextStyle(
                              color: Color.fromARGB(255, 153, 153, 153),
                              fontSize: 12.0))
                    ]),
              ),
              right: 15.0,
              bottom: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageButtons() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Image.asset(
                    'images/nhr_health_report.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Text('健康报告')
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Image.asset('images/nhr_weight_records.png'),
                ),
                Text('体重记录')
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Image.asset('images/nhr_lose_plan.png'),
                ),
                Text('减肥课程')
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Image.asset('images/nhr_share.png'),
                ),
                Text('分享记录')
              ],
            )
          ],
        ));
  }

  //轮播图
  Widget buildImageCarousel() {
    return new Container(
      height: 100.0,
      child: new Swiper(
        scrollDirection: Axis.horizontal,
        outer: false,
        itemBuilder: (c, index) {
          return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                secondImageList[index],
                fit: BoxFit.fill,
              ));
        },
        autoplay: true,
        pagination: SwiperPagination(
          //分页小圆点格式
          builder: RectSwiperPaginationBuilder(
            color: Colors.grey[400],
            size: Size(18.0, 8.0),
            activeColor: Colors.grey[100],
            activeSize: Size(18.0, 8.0),
          ),
        ),
        itemCount: secondImageList.length,
        onTap: (index) {
          print(" 点击 " + index.toString());
        },
        // 用户进行操作时停止自动翻页
        autoplayDisableOnInteraction: true,
        // 无线轮播
        loop: true,
      ),
    );
  }

  //用户信息图片
  Widget buildUserInfoImage() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        constraints: BoxConstraints(minWidth: double.infinity),
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 10,
                child: Stack(fit: StackFit.expand, children: <Widget>[
                  Image.asset('images/ecg_info.png', fit: BoxFit.fill),
                  Positioned(
                    left: 15.0,
                    top: 15.0,
                    child: Text('心电信号',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0)),
                  ),
                  Positioned(
                    left: 15.0,
                    bottom: 15.0,
                    child: Text('查看你的健康信息', style: TextStyle(fontSize: 12.0)),
                  ),
                ])),
            Container(
              width: 10,
            ),
            Expanded(
                flex: 10,
                child: Stack(fit: StackFit.expand, children: <Widget>[
                  Image.asset('images/warning_info.png', fit: BoxFit.fill),
                  Positioned(
                    left: 15.0,
                    top: 15.0,
                    child: Text('预警信息',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0)),
                  ),
                  Positioned(
                    left: 15.0,
                    bottom: 15.0,
                    child: Text('查看你的健康信息', style: TextStyle(fontSize: 12.0)),
                  ),
                ])),
          ],
        ));
  }

  buildKnowledgebutton() {
    return Container(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '心电知识',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.keyboard_arrow_right),
            iconSize: 30.0,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  buildKnowledgeDynamic() {
    return Container(
        height: 200.0,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  'images/nhr_ecg_big.png',
                  fit: BoxFit.fill,
                  width: 110.0,
                  height: 70.0,
                )),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '两小时掌握心电图阅读，了解自身健康信息',
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 25.0,
                    child: RaisedButton.icon(
                      icon: ImageIcon(
                        AssetImage('images/diamond.png'),
                        size: 12.0,
                        color: Color.fromARGB(255, 36, 199, 137),
                      ),
                      label: Text(
                        '普通会员',
                        style: TextStyle(fontSize: 10.0),
                      ),
                      color: Color.fromARGB(255, 241, 244, 243),
                      highlightColor: Colors.white, //按下颜色
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
