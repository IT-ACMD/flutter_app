import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/ecg_title_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class ECGPage extends StatefulWidget {
  @override
  _ECGPageState createState() => _ECGPageState();
}

class _ECGPageState extends State<ECGPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  Animation<int> animation;
  AnimationController _controller;
  double _scale = 0;
  int _userRate = 0;
  @override
  void initState() {
    super.initState();
    //获取用户数据
    _userRate = 89;
    int maxRate = 150;
    _scale = _userRate / maxRate * pi * 2;

    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    animation = new IntTween(begin: 0, end: _userRate).animate(_controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WAppBar(
          child: buildBackButton(context),
          backgroundColor: Color.fromARGB(255, 82, 77, 85),
          elevation: 0.0,
        ),
        body: Material(
          color: Color.fromARGB(255, 82, 77, 85),
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 35.0),
              children: <Widget>[
                buildIndicator(),
                buildGraphwithDay(),
              ],
            ),
          ),
        ));
  }

  Widget buildBackButton(context) {
    return Row(children: <Widget>[
      IconButton(
        padding: EdgeInsets.all(0.0),
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 28,
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      Text('心电图',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          )),
    ]);
  }

  List indicators = [
    {'image': 'images/home_ecg_image1.png', 'title': '呼吸速率Resp'},
    {
      'image': 'images/home_ecg_image2.png',
      'title': '心电监测',
      'data': [
        {'name': '静息心率(bpm)', 'val': '83'},
        {'name': '最大心率(bpm)', 'val': '150'},
        {'name': '平均心率(bpm)', 'val': '85'}
      ]
    },
    {'image': 'images/home_ecg_image3.png', 'title': '医疗方面'}
  ];

  buildIndicatorTop() {
    return Container(
        margin: EdgeInsets.fromLTRB(19.0, 23.0, 19.0, 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(3, (i) {
            return Column(
              children: <Widget>[
                Image.asset(
                  indicators[i]['image'],
                  height: 24.0,
                  width: 20.0,
                ),
                Text(
                  indicators[i]['title'],
                  style: TextStyle(fontSize: 12.0),
                ),
                Container(
                  height: 2.0,
                  color: Color(0xFF333333),
                  width: 16.0,
                  margin: EdgeInsets.only(top: 9.0),
                )
              ],
            );
          }),
        ));
  }

  buildIndicator() {
    return Container(
      height: 410.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          buildIndicatorTop(),
          Container(
            child: CustomPaint(
              painter: DemoPainter(pi * 3 / 4, _controller.value * _scale),
              child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: '${animation.value}',
                        style: TextStyle(
                            fontSize: 48.0,
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' BPM\n当前心率',
                            style: TextStyle(
                                fontSize: 13.0, color: Color(0xFF999999)),
                          )
                        ]),
                  )),
            ),
            height: 234.0,
            width: 234.0,
            padding: EdgeInsets.all(30.0),
          ),
          buildIndicatorBottom(),
        ],
      ),
    );
  }

  buildIndicatorBottom() {
    var item = indicators[1]['data'];
    return Container(
        margin: EdgeInsets.fromLTRB(0.0, 14.0, 0.0, 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (i) {
            return Column(
              children: <Widget>[
                Text(
                  item[i]['val'],
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Color(0xFF212121),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  item[i]['name'],
                  style: TextStyle(fontSize: 10.0, color: Color(0xFFBDBDBD)),
                )
              ],
            );
          }),
        ));
  }

  buildGraphwithDay() {
    return Container(
      height: 214.0,
      margin: EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 70.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: LineChartSample2(),
    );
  }
}

//重绘环形
class DemoPainter extends CustomPainter {
  final double _arcStart;
  final double _arcSweep;

  DemoPainter(this._arcStart, this._arcSweep);

  @override
  void paint(Canvas canvas, Size size) {
    double side = min(size.width, size.height);
    Paint paint = Paint()
      ..color = Color(0xFFF7F7F7)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;
    canvas.drawArc(Offset.zero & Size(side, side), 0.0, pi * 2, false, paint);
    paint.color = Color(0xFF22C487);
    canvas.drawArc(
        Offset.zero & Size(side, side), _arcStart, _arcSweep, false, paint);
  }

  @override
  bool shouldRepaint(DemoPainter other) {
    return _arcStart != other._arcStart || _arcSweep != other._arcSweep;
  }
}

class LineChartSample2 extends StatelessWidget {
  List<TooltipItem> defaultTitlesStyle<T extends TouchedSpot>(
      List<T> touchedSpots) {
    if (touchedSpots == null) {
      return null;
    }
    return touchedSpots.map((T touchedSpot) {
      if (touchedSpots == null || touchedSpot.spot == null) {
        return null;
      }

      final String text = '${(touchedSpot.spot.y * 20).toInt()}bpm';

      final TextStyle textStyle = TextStyle(
        color: touchedSpot.getColor(),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
      return TooltipItem(text, textStyle);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    StreamController<LineTouchResponse> controller = StreamController();
    controller.stream.distinct().listen((LineTouchResponse response) {
      print('response: ${response.touchInput}');
    });

    List<Color> gradientColors = [Color(0x6622C487), Color(0x00ffffff)];
    return AspectRatio(
      aspectRatio: 1.70,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xffffffff)),
        child: Padding(
          padding: const EdgeInsets.only(
              right: 0.0, left: 0.0, top: 0.0, bottom: 0.0),
          child: FlChart(
            chart: LineChart(
              LineChartData(
                //触摸事件显示
                lineTouchData: LineTouchData(
                    touchResponseSink: controller.sink,
                    touchTooltipData: TouchTooltipData(
                      tooltipBgColor: Color(0x00ffffff),
                      getTooltipItems: defaultTitlesStyle,
                    )),
                backgroundColor: Color(0x00000000),
                clipToBorder: true,
                gridData: FlGridData(
                  show: true,
                  drawHorizontalGrid: true,
                  horizontalInterval: 1,
                  verticalInterval: 1,
                  getDrawingVerticalGridLine: (value) {
                    if(value == 0) return FlLine(color: Color(0x00ff0000));
                    return const FlLine(
                      color: Color(0xfff4f4f4),
                      strokeWidth: 1,
                    );
                  },
                  getDrawingHorizontalGridLine: (value) {
                    if(value == 0) return FlLine(color: Color(0x00ff0000));
                    return const FlLine(
                      color: Color(0xfff4f4f4),
                      strokeWidth: 1,
                    );
                  },
                ),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    textStyle: TextStyle(
                      color: const Color(0xff999999),
                    ),
                    getTitles: (value) {
                      if(value == 1.0){return '8:00'; }
                      else if(value == 3.0){return '9:00';}
                      else if(value == 5.0){return '10:00';}
                      else if(value == 7.0){return '11:00';}
                      else if(value == 9.0){return '12:00';}
                      else if(value == 11.0){return '13:00';}
                      else{ return '';}
                    },
                    margin: -22.0,
                  ),
                  leftTitles: SideTitles(
                    showTitles: false,
                    textStyle: TextStyle(
                      color: const Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                    getTitles: (value) {
                      if(value == 1.0){return '40'; }
                      else if(value == 3.0){return '80';}
                      else if(value == 5.0){return '120';}
                      return '';
                    },
                    reservedSize: 28,
                    margin: -28,
                  ),
                ),
                borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Color(0x0037434d), width: 1)),
                minX: 0,
                maxX: 12,
                minY: 0,
                maxY: 7,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      //所有的点
                      FlSpot(0, 2.5),
                      FlSpot(1, 4.5),

                      FlSpot(2, 3.0),
                      FlSpot(3, 5.0),

                      FlSpot(4, 3.0),
                      FlSpot(5, 4.8),

                      FlSpot(6, 3.0),
                      FlSpot(7, 4.3),

                      FlSpot(8, 3.0),
                      FlSpot(9.5, 5.2),

                      FlSpot(12, 4),
                    ],
                    isCurved: true, //曲线
                    colors: [Color(0xff22c487), Color(0xff22c487)], //线头到线尾
                    barWidth: 3, //线粗
                    //isStrokeCapRound: true,
                    dotData: FlDotData(
                      //是否显示一些点 及点样式
                      show: true,
                      dotColor: Color(0xffffffff),
                      dotSize: 6.0,
                      checkToShowDot: (val) {
                        //数据多了有可能要计算峰值
                        return val.y > 4 ? true : false;
                      },
                    ),
                    belowBarData: BelowBarData(
                      //线下方背景
                      show: true,
                      colors: gradientColors
                          .map((color) => color)
                          .toList(),
                      gradientFrom: Offset(0.5, 0),
                      gradientTo: Offset(0.5, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
