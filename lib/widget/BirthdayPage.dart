import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/tools/ECdate.dart';
import 'package:numberpicker/numberpicker.dart';

class BirthdayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BirthdayPageState();
  }
}

/*区分年月日选择器*/
enum NUM_TYPE {
  NUM_TYPE_YEAR,
  NUM_TYPE_MONTH,
  NUM_TYPE_DAY,
}

class BirthdayPageState extends State<BirthdayPage> {
  /*最下年份*/
  int _minYear = 1960;

  /*最大年份*/
  int _maxYear = 2019;

  /*当前选中年份*/
  int _seleYear = 1999;

  /*最小月份*/
  int _minMonth = 1;

  /*最大月份*/
  int _maxMonth = 12;

  /*当前选中月份*/
  int _seleMonth = 12;

  /*最小日*/
  int _minDay = 1;

  /*最大日*/
  int _maxDay = 30;

  /*当前选中日*/
  int _seleDay = 12;

  /*当前年份*/
  int _currentYear = 0;

  /*当前月份*/
  int _currentMonth = 0;

  /*当前日*/
  int _currentDay = 0;

  @override
  void initState() {
    _getCurrentDate(); //获取当前时间
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            color: Color(0x00FFFFFF),
          )),
          buildDateSelector(),
          Expanded(child: Container(color: Color(0x00FFFFFF))),
        ],
      ),
    );
  }

  buildDateSelector() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      height: 380.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "请选择你的出生年月",
            style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 17.0,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 36.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new NumberPicker.integer(
                    initialValue: _seleYear,
                    minValue: _minYear,
                    maxValue: _maxYear,
                    lastStr: "年",
                    itemExtent: 50,
                    infiniteLoop: false,
                    onChanged: (n) {
                      _seleYear = n;
                      _numChanged(n, NUM_TYPE.NUM_TYPE_YEAR);
                    }),
                new NumberPicker.integer(
                    initialValue: _seleMonth,
                    minValue: _minMonth,
                    maxValue: _maxMonth,
                    lastStr: "月",
                    infiniteLoop: true,
                    onChanged: (n) {
                      _numChanged(n, NUM_TYPE.NUM_TYPE_MONTH);
                    }),
                new NumberPicker.integer(
                    initialValue: _seleDay,
                    minValue: _minDay,
                    maxValue: _maxDay,
                    lastStr: "日",
                    infiniteLoop: true,
                    onChanged: (n) {
                      _numChanged(n, NUM_TYPE.NUM_TYPE_DAY);
                    })
              ],
            ),
          ),
          Container(
            height: 48.0,
            width: 229.0,
            child: FlatButton(
                color: Color(0xFF24C789),
                onPressed: () {
                  Navigator.of(context).pop('$_seleYear年$_seleMonth月$_seleDay日');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Text(
                  "继续",
                  style: TextStyle(color: Colors.white, fontSize: 17.0),
                )),
          ),
          Container(
            height: 48.0,
            width: 229.0,
            child: FlatButton(
                color: Color(0xFFFFFFFF),
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Text(
                  "取消",
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                )),
          ),
        ],
      ),
    );
  }

  /*选择器变化时*/
  void _numChanged(int newNum, NUM_TYPE type) {
    setState(() {
      if (type == NUM_TYPE.NUM_TYPE_YEAR) {
        _seleYear = newNum;
        if (_seleYear == _currentYear) {
          //选到了今年
          _maxMonth = _currentMonth;
          if (_seleMonth >= _currentMonth) {
            //选中月份大于当前月份
            _seleMonth = _currentMonth;
            if (_seleDay > _currentDay) {
              //选中日大于当前日
              _seleDay = _currentDay;
              _maxDay = _currentDay;
            }
          }
        } else {
          //如果当前选择的不是当前年份
          _maxMonth = 12;
          //根据年点年份月份获取当前月天数
          _maxDay = ECdate.getDaysNum(_seleYear, _seleMonth);
          if (_seleDay > _maxDay) {
            //如果当前选中日大于当前日
            _seleDay = _maxDay;
          }
        }
      } else if (type == NUM_TYPE.NUM_TYPE_MONTH) {
        //选择月份
        _seleMonth = newNum;
        if (_seleMonth == _currentMonth && _seleYear == _currentYear) {
          _maxDay = _currentDay;
        } else {
          _maxDay = ECdate.getDaysNum(_seleYear, _seleMonth);
        }
        if (_seleDay > _maxDay) {
          //如果当前选中日大于当前日
          _seleDay = _maxDay;
        }
      } else if (type == NUM_TYPE.NUM_TYPE_DAY) {
        //选择日
        _seleDay = newNum;
      }
    });
  }

  /*获取当前时间*/
  void _getCurrentDate() {
    DateTime date = DateTime.now();
    _currentYear = int.parse(formatDate(date, [yyyy]));
    _maxYear = _currentYear;
    _currentMonth = int.parse(formatDate(date, [mm]));
    _currentDay = int.parse(formatDate(date, [dd]));

    setState(() {
    });
  }

  
}
