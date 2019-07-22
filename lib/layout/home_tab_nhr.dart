import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sharesdk/sharesdk_map.dart';

//主页当前心率tab页面
class RateTabView extends StatefulWidget {
  RateTabState createState() => RateTabState();
}

class RateTabState extends State<RateTabView> {
  //蓝牙权限开关
  bool isVisible = true;
  //常用颜色
  var greyColor = Color.fromARGB(255, 153, 153, 153);
  var blackColor = Color.fromARGB(255, 51, 51, 51);

  //心电知识图集
  List _knowledges = [
    {
      'title': "两小时掌握心电图阅读，了解自身健康信息",
      'image': 'images/nhr_ecg_big.png',
      'url': 'www.baidu.com',
      'amount': '1.4万'
    },
    {
      'title': "心率对健康到底有多重要",
      'image': 'images/nhr_ecr_big.png',
      'url': 'www.baidu.com',
      'amount': '1.4万'
    }
  ];

  //轮播图集
  final List<String> secondImageList = [
    'images/banner-1.png',
    'images/banner-1.png',
    'images/banner-1.png',
    'images/banner-1.png',
  ];

  //心得分享大佬
  List _heartGetLearder = [
    {
      'name': '习大大',
      'population': '666',
      'performance': '2019',
      'image':
          'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3680604140,401532791&fm=179&app=42&f=JPEG?w=121&h=140',
      'link': 'as for'
    },
    {
      'name': '蔡小小',
      'population': '250',
      'performance': '2012',
      'image':
          'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2937227107,2706373355&fm=58&bpow=500&bpoh=600',
      'link': 'as for'
    }
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
              buildKnowledgebutton('心电知识', '心得知识页面'), //心电知识按钮
              buildKnowledgeDynamic(), //心电知识文章推送
              Container(height: 12.0),
              buildKnowledgebutton('心得分享', '心得分享页面'), //心得分享按钮
              buildHeartGet(), //心得分享
              buildFindCoach2you(),
              //buildEndHint(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 20.0),
          height: 180.0,
          alignment: Alignment.topCenter,
          color: Color.fromARGB(255, 244, 244, 244),
          child: Text(
            '一没有更多内容一',
            style: TextStyle(
                fontSize: 11.0, color: Color.fromARGB(255, 189, 189, 189)),
          ),
        )
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
                style: TextStyle(fontSize: 12.0, color: greyColor),
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
                              color: greyColor,
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
                        color: blackColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: '天没有测试了哦～',
                          style: TextStyle(color: greyColor, fontSize: 12.0))
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
                    child: Text('查看你的健康信息',
                        style: TextStyle(fontSize: 12.0, color: greyColor)),
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
                    child: Text('查看你的健康信息',
                        style: TextStyle(fontSize: 12.0, color: greyColor)),
                  ),
                ])),
          ],
        ));
  }

  buildKnowledgebutton(title, url) {
    return Container(
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
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
        height: 160.0,
        child: Column(
          children: _knowledges
              .map((item) => Builder(
                    builder: (context) {
                      return Expanded(
                          child: Row(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                item['image'],
                                fit: BoxFit.cover,
                              )),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.fromLTRB(15.0, 8.0, 0.0, 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  item['title'],
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal),
                                ),
                                Text.rich(TextSpan(
                                    text: '心电知识  ',
                                    style: TextStyle(
                                        fontSize: 9.0, color: greyColor),
                                    children: <TextSpan>[
                                      TextSpan(text: '${item['amount']}阅读量')
                                    ]))
                              ],
                            ),
                          ))
                        ],
                      ));
                    },
                  ))
              .toList(),
        ));
  }

  //心得滚动图
  buildHeartGet() {
    return Container(
        padding: EdgeInsets.only(top: 10.0),
        height: 240.0,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: _heartGetLearder
                .map((item) => Container(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 220.0,
                          height: 160.0,
                          child: Image.asset(
                            'images/nhr_thirst_girl.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 12.0),
                            child: Row(
                              children: <Widget>[
                                ClipOval(
                                    child: Image.network(
                                  item['image'],
                                  width: 36.0,
                                  height: 36.0,
                                )),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        item['name'],
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Color.fromARGB(
                                                255, 51, 51, 51)),
                                      ),
                                      Text(
                                          '帮助${item['population']}人 减脂${item['performance']}斤',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Color.fromARGB(
                                                  255, 153, 153, 153)))
                                    ],
                                  ),
                                )
                              ],
                            ))
                      ],
                    )))
                .toList()));
  }

  buildFindCoach2you() {
    return Container(
        height: 160.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 18.0,
              child: Text('您的专属教练',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: blackColor,
                      fontWeight: FontWeight.bold)),
            ),
            Positioned(
              bottom: 20.0,
              child: Image.asset(
                'images/nhr_lost_people.png',
                height: 76.0,
                width: 66.0,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 72.0,
              left: 95.0,
              child: Text('寻找适合你的健康教练',
                  style: TextStyle(fontSize: 12.0, color: blackColor)),
            ),
            Positioned(
              left: 95.0,
              bottom: 51.0,
              child: Text('专业 有效 权威',
                  style: TextStyle(fontSize: 10.0, color: greyColor)),
            ),
            Positioned(
              right: 20.0,
              bottom: 41.0,
              child: SizedBox(
                  height: 28.0,
                  width: 88.0,
                  child: RaisedButton(
                    child: Text('寻找教练',
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    color: Color.fromARGB(255, 36, 199, 137),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    onPressed: () {},
                  )),
            )
          ],
        ));
  }

  buildEndHint() {
    return Expanded(
        child: Container(
      color: Color.fromARGB(255, 244, 244, 244),
      child: Text(
        '-没有更多内容-',
        style: TextStyle(
            fontSize: 11.0, color: Color.fromARGB(255, 189, 189, 189)),
      ),
    ));
  }
}
