import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/widget/ecg_title_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class ECGSignal extends StatefulWidget {
  @override
  _ECGSignalState createState() => _ECGSignalState();
}

class _ECGSignalState extends State<ECGSignal>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  double _scale = 0;
  
  int _userRate = 0;
  
  int _maxRate = 150;

  DateTime secondDate = DateTime.now();
  
  DateTime firstDate;

  @override
  void initState() {
    super.initState();
    //获取用户数据
    _userRate = 89;
    _scale = _userRate / _maxRate * pi * 2;
    firstDate = secondDate.subtract(new Duration(days: 6));
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
          backgroundColor: Color.fromARGB(255, 82, 77, 85),
          elevation: 0.0,
        ),
        body: Material(
          color: Color.fromARGB(255, 82, 77, 85),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                buildDatePicker(),
                buildGraphwithDay(),
                buildSignalText(),
                Container(
                  color: Color(0xFFF4F4F4),
                  child: SizedBox(
                    height: 8.0,
                  ),
                ),
                buildParams(),
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
      Text('心电信号',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          )),
    ]);
  }

  buildDatePicker() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0.0),
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 28,
            color: Colors.white,
            onPressed: () {
              setState(() {
                firstDate = firstDate.subtract(Duration(days: 7));
                secondDate = secondDate.subtract(Duration(days: 7));
              });
            },
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                      color: Color(0xff908c92),
                      fontWeight: FontWeight.bold),
                  text:
                      '${firstDate.year}年${firstDate.month}月${firstDate.day}日 - ${secondDate.year}年${secondDate.month}月${secondDate.day}日\n',
                  children: <TextSpan>[
                    TextSpan(text: '7天 - 心率',)
                  ])),
          IconButton(
            padding: EdgeInsets.all(0.0),
            icon: Icon(Icons.arrow_forward_ios),
            iconSize: 28,
            color: Colors.white,
            onPressed: () {
              setState(() {
                firstDate = firstDate.add(Duration(days: 7));
                secondDate = secondDate.add(Duration(days: 7));
              });
            },
          ),
        ],
      ),
    );
  }

  buildGraphwithDay() {
    return Container(
      height: 214.0,
      //margin: EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 70.0),
      child: LineChartSample2(),
    );
  }

  buildSignalText() {
    return Container(
      height: 106.0,
      color: Color(0xffffffff),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              width: 1.0, color: Color(0xffdddddd)))),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '56',
                      style: TextStyle(
                          fontSize: 34.0,
                          color: Color(0xff333333),
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n静止心率(BPM)',
                          style: TextStyle(
                              fontSize: 13.0, color: Color(0xff908c92)),
                        ),
                      ],
                    ),
                  ))),
          Expanded(
              child: Container(
                  child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '110',
              style: TextStyle(
                  fontSize: 34.0,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: '\n静止心率(BPM)',
                  style: TextStyle(fontSize: 13.0, color: Color(0xff908c92)),
                ),
              ],
            ),
          ))),
        ],
      ),
    );
  }

  var params = [
    {'name': '能量消耗', 'val': '59.4', 'unit': 'EE'},
    {'name': '氧消耗量', 'val': '59.4', 'unit': 'VO2'},
    {'name': '最大氧消耗', 'val': '59.4', 'unit': 'VO2max'},
    {'name': '运动过后氧消耗', 'val': '59.4', 'unit': 'EPOC'},
    {'name': '训练效果', 'val': '59.4', 'unit': 'TE'}
  ];

  buildParams() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: List.generate(params.length, (i) {
          return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 1.0, color: Color(0xfff4f4f4)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    params[i]['name'],
                    style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color(0xff524d55),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          text: '${params[i]['val']} ',
                          children: <TextSpan>[
                        TextSpan(
                            text: params[i]['unit'],
                            style: TextStyle(fontSize: 12.0,color: Color(0xff666666)))
                      ]))
                ],
              ));
        }),
      ),
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

      final String text = '${(touchedSpot.spot.y * 23).toInt()}bpm';

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
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 40.0),
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
              gridData: FlGridData(
                show: false,
                drawHorizontalGrid: true,
                horizontalInterval: 0.5,
                verticalInterval: 0.5,
                getDrawingVerticalGridLine: (value) {
                  if (value == 0) return FlLine(color: Color(0x00ff0000));
                  return const FlLine(
                    color: Color(0xfff4f4f4),
                    strokeWidth: 1,
                  );
                },
                getDrawingHorizontalGridLine: (value) {
                  if (value == 0) return FlLine(color: Color(0x00ff0000));
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
                  textStyle: TextStyle(
                    color: const Color(0xff999999),
                  ),
                  getTitles: (value) {
                    if (value == 0.0) {
                      return '●';
                    } else if (value == 2.0) {
                      return '●';
                    } else if (value == 4.0) {
                      return '●';
                    } else if (value == 6.0) {
                      return '●';
                    } else if (value == 8.0) {
                      return '●';
                    } else if (value == 10.0) {
                      return '●';
                    } else if (value == 12.0) {
                      return '●';
                    } else {
                      return '';
                    }
                  },
                  margin: 7,
                  reservedSize: 0,
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                    color: const Color(0xff8e8891),
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                  getTitles: (value) {
                    if (value == 0) {
                      return '0';
                    } else if (value == 2) {
                      return '50';
                    } else if (value == 4) {
                      return '100';
                    } else if (value == 6) {
                      return '150';
                    }
                    return '';
                  },
                  reservedSize: 22,
                  margin: 17,
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
                    FlSpot(0, 4.8),

                    FlSpot(2, 4.5),

                    FlSpot(4, 5.0),

                    FlSpot(6, 4.8),

                    FlSpot(8, 4.3),

                    FlSpot(10, 5.2),

                    FlSpot(12, 4),
                  ],
                  //isCurved: true, //曲线
                  colors: [Color(0xff22c487), Color(0xff22c487)], //线头到线尾
                  barWidth: 3, //线粗
                  dotData: FlDotData(
                    //是否显示一些点 及点样式
                    show: true,
                    dotColor: Color(0xff24C789),
                    dotSize: 3.0,
                    checkToShowDot: (val) {
                      //数据多了有可能要计算峰值
                      return true;
                    },
                  ),
                  belowBarData: BelowBarData(
                    //线下方背景
                    show: false,
                    colors: gradientColors.map((color) => color).toList(),
                    gradientFrom: Offset(0.5, 0),
                    gradientTo: Offset(0.5, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
