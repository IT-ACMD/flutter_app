import 'package:flutter/material.dart';
import 'package:flutter_app/data/dataCenter.dart';
import 'package:flutter_app/widget/ecg_title_bar.dart';

class SearchCoach extends StatefulWidget {
  @override
  _SearchCoachState createState() => _SearchCoachState();
}

class _SearchCoachState extends State<SearchCoach> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        child: buildBackbutton(),
        backgroundColor: Color(0xffffffff),
      ),
      body: Material(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(16.0, 7.0, 16.0, 0.0),
          child: ListView(
            children: <Widget>[
              Text(
                '教练',
                style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              buildCoachList(),
            ],
          ),
        ),
      ),
    );
  }

  buildBackbutton() {
    return Row(children: <Widget>[
      IconButton(
        padding: EdgeInsets.all(0.0),
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 28,
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      Text('全部教练', style: TextStyle(fontSize: 20.0, color: Color(0xff333333))),
    ]);
  }

  buildCoachList() {
    return Column(
        children: List.generate(
      eCoachList.length,
      (i) {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xfff4f4f4))),
            ),
            child: Row(
              children: <Widget>[
                ClipOval(
                    child: Image.network(
                  'https://lanhu.oss-cn-beijing.aliyuncs.com/SketchSlicePngfa42cd7dccb1c715b014bed5a61cdddd',
                  //eCoachList[i].image,
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.fill,
                )),
                Container(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 7.0),
                            child: Text(
                          eCoachList[i].name,
                          style: TextStyle(
                              fontSize: 17.0, color: Color(0xFF333333)),
                        )),
                        RichText(
                            text: TextSpan(
                          text: '心得 ${eCoachList[i].tips}  |  ',
                          style: TextStyle(
                              fontSize: 11.0,
                              color: Color(0xFF999999),
                              wordSpacing: 2.0),
                          children: <TextSpan>[
                            TextSpan(
                              text: '粉丝 ${eCoachList[i].fans}',
                            )
                          ],
                        )),
                      ],
                    )),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(right: 16.0),
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          i == 0
                              ? 'images/followed.png'
                              : 'images/unfollowed.png',
                          height: 40.0,
                          width: 40.0,
                        ))),
              ],
            ));
      },
    ));
  }
}
