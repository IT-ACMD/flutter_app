import 'package:flutter/material.dart';

class LearnRadioButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LearnRadioButton();
  }
}

class _LearnRadioButton extends State<LearnRadioButton> {
  String _rateLimit = '关闭';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x00000000),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Container(color: Color(0x00FFFFFF))),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 40.0),
              padding: EdgeInsets.fromLTRB(18.0, 20.0, 18.0, 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                  border: Border.all(color: Colors.white)),
              child: Text(
                '心率升高提醒',
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              )),
          buildRateRadio(),
          Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 40.0),
              padding: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10.0)),
                  border: Border.all(color: Colors.white)),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                '取消',
                                style: TextStyle(
                                    color: Color(0xff999999), fontSize: 18.0),
                              )),
                          onTap: () {
                            Navigator.pop(context);
                          })),
                  Expanded(
                      child: InkWell(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                '确定',
                                style: TextStyle(
                                    color: Color(0xff2ac88c), fontSize: 18.0),
                              )),
                          onTap: () {
                            Navigator.pop(context, _rateLimit);
                          })),
                ],
              )),
          Expanded(child: Container(color: Color(0x00FFFFFF))),
        ],
      ),
    );
  }

  var radioData = [
    '关闭',
    '100次/分钟',
    '110次/分钟',
    '120次/分钟',
    '130次/分钟',
    '140次/分钟',
    '150次/分钟'
  ];

  buildRateRadio() {
    return Container(
      height: 400.0,
      margin: const EdgeInsets.symmetric(horizontal: 40.0),
      color: Colors.white,
      child: Column(
        children: List.generate(radioData.length, (i) {
          return InkWell(
            child: Container(
                margin: EdgeInsets.only(left: 18.0, right: 6.0),
                padding: EdgeInsets.symmetric(vertical: 3.0),
                decoration: BoxDecoration(
                    border: i < radioData.length - 1
                        ? Border(
                            bottom: BorderSide(
                                color: Color(0xfff4f4f4), width: 1.0))
                        : null),
                child: Row(children: [
                  Expanded(
                      child: Text(radioData[i],
                          style: TextStyle(
                              color: Color(0xff333333), fontSize: 15.0))),
                  Radio(
                      value: radioData[i],
                      groupValue: _rateLimit,
                      activeColor: Color(0xff2ac88c),
                      onChanged: updateGroupValue),
                ])),
            onTap: () {
              setState(() {
                _rateLimit = radioData[i];
              });
            },
          );
        }),
      ),
    );
  }

  void updateGroupValue(val) {
    setState(() {
      _rateLimit = val.toString();
    });
  }
}
