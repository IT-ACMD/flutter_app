import 'package:flutter/material.dart';

class FriendTabView extends StatefulWidget {
  _FriendTabState createState() => _FriendTabState();
}

class _FriendTabState extends State<FriendTabView> {
  List dates = ['本周', '本月', '本年'];
  List users = [
    {
      'name': '神行太保',
      'minute': '87',
      'image':
          'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1582567427,765715948&fm=179&app=42&f=JPEG?w=121&h=140',
    },
    {
      'name': '博尔特',
      'minute': '58',
      'image':
          'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2497386865,2360559258&fm=58&bpow=358&bpoh=450',
    },
    {
      'name': '苏炳添',
      'minute': '46',
      'image':
          'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1954946576,1620274344&fm=58&bpow=479&bpoh=720',
    },
    {
      'name': '谢震业',
      'minute': '43',
      'image':
          'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=4467560,4219194185&fm=58&bpow=911&bpoh=1118',
    }
  ];
  var value;
  @override
  void initState() {
    super.initState();
    if (dates.length > 0) value = dates[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          buildFriendtitle(),
          buildFriendList(),
        ],
      ),
    );
  }

  buildFriendtitle() {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFF4F4F4), width: 0.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              '每周一重新计算排名',
              style: TextStyle(
                  fontSize: 10.0, color: Color.fromARGB(255, 153, 153, 153)),
            ),
          ),
          DropdownButton(
            items: List.generate(dates.length, (i) {
              return DropdownMenuItem(
                child: Text(dates[i]),
                value: dates[i],
              );
            }),
            value: value,
            onChanged: (T) {
              //下拉菜单item点击之后的回调
              setState(() {
                value = T;
              });
            },
            underline: Container(
              height: 1.0,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.white, width: 0.0))),
            ),
            iconEnabledColor: Colors.white,
          )
        ],
      ),
    );
  }

  buildFriendList() {
    return Expanded(
        child: ListView(
      children: List.generate(users.length, (i) {
        return Container(
            margin: EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 26.0,
                  decoration: i<3 ? BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePng733217c03ea7411956fa35062f87dbdc'),
                      fit: BoxFit.contain,
                    ),
                  ) : null,
                  padding: EdgeInsets.symmetric(horizontal: 26.0),
                  child: Text('${i + 1}',
                      style: TextStyle(color: i < 3 ? Color(0xFFFFFFFF) : Color(0xFF6C6B70),fontWeight: FontWeight.bold)),
                ),
                ClipOval(
                    child: Image.network(
                  users[i]['image'],
                  width: 44.0,
                  height: 44.0,
                )),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Container(
                      padding: EdgeInsets.only(left: 21.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            users[i]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333333)),
                          ),
                          RichText(
                              text: TextSpan(
                            text: users[i]['minute'],
                            style: TextStyle(
                                fontSize: 18.0,
                                color: i == 0
                                    ? Color(0xFF24C789)
                                    : Color(0xFF6C6B70),
                                wordSpacing: 3.0),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' 分钟',
                                  style: TextStyle(
                                      fontSize: 9.0, color: Color(0xFF666666)))
                            ],
                          )),
                        ],
                      )),
                ),
                Expanded(
                  child: Container(child: Text('PK'),),
                ),
              ],
            ));
      }),
    ));
  }
}
