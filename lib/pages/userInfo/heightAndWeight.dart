import 'package:flutter/material.dart';
import 'package:flutter_app/data/userInfo.dart';
import 'package:flutter_app/pages/userInfo/lifeHabit.dart';
import 'package:numberpicker/numberpicker.dart';

class HeightAndWeight extends StatefulWidget {
  final UserInfo user;
  const HeightAndWeight({Key key, this.user}) : super(key: key);
  @override
  _HeightAndWeightState createState() => _HeightAndWeightState();
}

class _HeightAndWeightState extends State<HeightAndWeight> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  //String _hVal = '',_wVal = '70kg';

  @override
  void initState() {
    super.initState();
    widget.user.height = '168cm';
    widget.user.weight = '70kg';
  }

  @override
  Widget build(BuildContext context) {
    //UserInfo a = widget.user;
    return Scaffold(
        appBar: AppBar(
          leading: buildBackButton(context),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Material(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 62.0,
                    ),
                    buildTitleText('你的生活习惯？'),
                    SizedBox(
                      height: 30.0,
                    ),
                    buildPickerIntger(0, widget.user.height),
                    SizedBox(
                      height: 80.0,
                    ),
                    buildTitleText('你的体重'),
                    SizedBox(
                      height: 30.0,
                    ),
                    buildPickerIntger(1, widget.user.weight),
                  ],
                ),
                buildNextButton(),
              ],
              //padding: EdgeInsets.symmetric(horizontal: 45.0),
            ),
          ),
        ));
  }

  Widget buildBackButton(context) {
    return Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          icon: Icon(Icons.chevron_left),
          iconSize: 28,
          color: Color(0xFF524D55),
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }

  buildTitleText(value) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333)),
      ),
    );
  }

  List pickers = [
    {'title': '选择身高', 'init': 168, 'max': 380, 'min': 70, 'unit': 'cm'},
    {'title': '选择体重', 'init': 70, 'max': 800, 'min': 20, 'unit': 'kg'}
  ];
  void _showDialog(type) {
    var item = pickers[type];
    showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return new NumberPickerDialog.integer(
            title: Container(
                alignment: Alignment.center,
                child: Text(
                  item['title'],
                  style: TextStyle(color: Color(0xFF333333), fontSize: 17.0),
                )),
            initialIntegerValue: item['init'],
            maxValue: item['max'],
            minValue: item['min'],
            confirmWidget: Container(
              height: 48.0,
              width: 259.0,
              alignment: Alignment.center,
              child: Text(
                '确定',
                style: TextStyle(color: Colors.white, fontSize: 17.0),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                color: Color(0xFF24C789),
              ),
            ),
            cancelWidget: Container(
              height: 48.0,
              width: 259.0,
              alignment: Alignment.center,
              child: Text(
                '取消',
                style: TextStyle(color: Color(0xFF333333), fontSize: 17.0),
              ),
            ),
            lastStr: item['unit'],
          );
        }).then((value) {
      type == 0
          ? widget.user.height = '$value${item['unit']}'
          : widget.user.weight = '$value${item['unit']}';
      setState(() {});
    });
  }

  buildPickerIntger(type, val) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        width: 156.0,
        padding: EdgeInsets.only(bottom: 8.0),
        alignment: Alignment.center,
        child: InkWell(
            child: Text(val,
                style: TextStyle(fontSize: 20.0, color: Color(0xFF333333))),
            onTap: () {
              _showDialog(type);
            }),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Color(0xFFCCCCCC)),
        )),
      ),
    ]);
  }

  buildNextButton() {
    return Positioned(
        bottom: 77.0,
        left: 40.0,
        right: 40.0,
        child: Container(
          height: 54.0,
          child: RaisedButton(
            child: Text('继续',
                style: TextStyle(
                    color: Colors.white,
                    fontSize:
                        16.0) //Theme.of(context).primaryTextTheme.headline,
                ),
            color: Color.fromARGB(255, 36, 199, 137),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new LifeHabit(user: widget.user)));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0)),
          ),
        ));
  }
}
