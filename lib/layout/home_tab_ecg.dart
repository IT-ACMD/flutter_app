import 'package:flutter/material.dart';

class ECGTabView extends StatefulWidget{

  _ECGTabState createState() => _ECGTabState();

}

class _ECGTabState extends State<ECGTabView> {
  
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        isVisible ? buildBluetooth() : Container(),
        Row(
          children: <Widget>[
            ClipOval(
              child: Image.network("https://profile.csdnimg.cn/9/2/0/1_qq_42181602",width: 42,height: 42,)
            ),
            Column(
              children: <Widget>[
                Text('还未制定健康目标呦'),
                RaisedButton.icon(icon: Icon(Icons.ac_unit), label: Text('普通会员'),color: Colors.white,disabledColor: Colors.white, onPressed: () {},)
              ],
            )
          ],
        ),
      ],
    );
  }
}

Widget buildBluetooth(){
  return Container(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 244, 244, 244)))),
          margin: const EdgeInsets.only(top: 3.0),
          color: Colors.white,
          child : Row(
          children: <Widget>[
            Container(margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0), child: Icon(Icons.bluetooth),),
            Text('开启蓝牙精确记录心电指数', style: TextStyle(color: Colors.grey),),
            Container(margin: const EdgeInsets.only(left: 30.0),child: OutlineButton(
              onPressed: (){},
              borderSide: BorderSide(color: Colors.green),
              //highlightColor: Colors.green,
              textColor: Colors.green,
              child: Text('开启'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22.0))),
            )
            )
          ],
        ));
}