import 'package:flutter/material.dart';
import 'package:flutter_app/data/userInfo.dart';

class SexBirth extends StatefulWidget {
  final UserInfo user;
  const SexBirth({Key key, this.user}) : super(key: key);
  @override
  _SexBirthState createState() => _SexBirthState();
}

class _SexBirthState extends State<SexBirth> {
  List sexs = [
    {
      'back': Color(0xFFE4F8F1),
      'border': Color(0xFF24C789),
      'text': Color(0xFF24C789),
      'val': '男'
    },
    {
      'back': Color(0xFFFFFFFF),
      'border': Color(0xFFCCCCCC),
      'text': Color(0xFF333333),
      'val': '女'
    }
  ];
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
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
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 45.0),
              children: <Widget>[
                SizedBox(
                  height: 72.0,
                ),
                buildTitleText('你的性别？'),
                SizedBox(
                  height: 30.0,
                ),
                buildSexRidio(context),
                SizedBox(
                  height: 80.0,
                ),
                buildTitleText('你的出生年月？'),
                buildBirthDate(context),

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
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 40.0),
            height: 80.0,
            width: 80.0,
            alignment: Alignment.center,
            child: Text(
              '男',
              style: TextStyle(color: sexs[0]['text'], fontSize: 22.0),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: sexs[0]['back'],
              border: new Border.all(color: sexs[0]['border'], width: 1.0),
            ),
          ),
          Container(
            height: 80.0,
            width: 80.0,
            alignment: Alignment.center,
            child: Text(
              '女',
              style: TextStyle(color: sexs[1]['text'], fontSize: 22.0),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: sexs[1]['back'],
              border: new Border.all(color: sexs[1]['border'], width: 1.0),
            ),
          ),
        ],
      ),
      onTapDown: (details) {
        var tran = sexs[0];
        sexs[0] = sexs[1];
        sexs[1] = tran;
        setState(() {
          widget.user.sex = sexs[0]['val'];
          print(widget.user.sex);
        });
      },
    );
  }

  buildBirthDate(context){
    return GestureDetector(
      child: Text('23131323'),
      onTap: (){
        showDatePicker(context: context,initialDate: DateTime(1990), firstDate: DateTime(1990), lastDate: DateTime(2019));
      },
    );

    
    
    //return .showDialog(context: context);
    //return showDatePicker();
    //_DatePickerDialog();
    
    
  }

  buildNextButton() {
    return Container(
      height: 55.0,
      child: RaisedButton(
        child: Text('下一步',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0) //Theme.of(context).primaryTextTheme.headline,
            ),
        color: Color.fromARGB(255, 36, 199, 137),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            ///只有输入的内容符合要求通过才会到达此处
            _formKey.currentState.save();
            Navigator.pushNamed(context, "askPage");
          }
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                28.0)), //StadiumBorder(side: BorderSide()),
      ),
    );
  }
}
