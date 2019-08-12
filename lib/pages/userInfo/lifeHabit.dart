import 'package:flutter/material.dart';
import 'package:flutter_app/data/userInfo.dart';
import 'package:flutter_app/pages/userInfo/historyill.dart';

class LifeHabit extends StatefulWidget {
  final UserInfo user;
  const LifeHabit({Key key, this.user}) : super(key: key);
  @override
  _LifeHabitState createState() => _LifeHabitState();
}

class _LifeHabitState extends State<LifeHabit> {
  List habs = ['抽烟', '饮酒', '经常运动', '经常熬夜'];
  String _selectedVal = '抽烟';
  var selectedStyle = {
    'back': Color(0xFFE4F8F1),
    'border': Color(0xFF24C789),
    'text': Color(0xFF24C789),
  };
  var defaultStyle = {
    'back': Color(0xFFFFFFFF),
    'border': Color(0xFFCCCCCC),
    'text': Color(0xFF333333),
  };

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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
              //padding: EdgeInsets.symmetric(horizontal: 45.0),
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    buildTitleText('你的生活习惯？'),
                    buildSexRidio(context),
                  ],
                ),
                buildNextButton(),
              ],
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
      margin: EdgeInsets.fromLTRB(0.0, 62.0, 0.0, 25.0),
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

  buildSexRidio(context) {
    return Container(
        height: 306.0,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(4, (i) {
              var style = _selectedVal == habs[i] ? selectedStyle : defaultStyle;
              return InkWell(
                highlightColor: Color(0xFFFFFFFF),
                child: Container(
                  height: 54.0,
                  width: 229.0,
                  alignment: Alignment.center,
                  child: Text(
                    habs[i],
                    style: TextStyle(color: style['text'], fontSize: 22.0),
                  ),
                  decoration: BoxDecoration(
                      color: style['back'],
                      border:
                          new Border.all(color: style['border'], width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(28.0))),
                ),
                onTap: () {
                  setState(() {
                    _selectedVal = habs[i];
                    widget.user.lifeStyle = _selectedVal;
                  });
                },
              );
            })));
  }

  buildNextButton() {
    return Positioned(
        bottom: 77.0,
        left: 40.0,
        right: 40.0,
        child: Container(
          height: 54.0,
          width: 300.0,
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
                      builder: (context) =>
                          new Historyill(user: widget.user)));
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    28.0)), //StadiumBorder(side: BorderSide()),
          ),
        ));
  }
}
