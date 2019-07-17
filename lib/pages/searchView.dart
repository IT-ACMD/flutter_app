import 'package:flutter/material.dart';
//import 'package:flutter_app/pages/homeView.dart';

//搜索页面
class SearchBarDelegate extends SearchDelegate<String> {

  //右侧清除按钮
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
      ),
    ];
  }

  //左侧返回按钮 
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  //搜索区域结果内容
  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  //搜索区域建议内容
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList =query.isEmpty ? 
      recentSuggest
      : searchList.where((input)=> input.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length, 
      itemBuilder: (context, index) =>ListTile(
          title: RichText(
            text : TextSpan(
            text: suggestionList[index].substring(0, query.length), 
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )
            ]
            ),
          )
        )
    );
  }

  //搜索页面主题背景颜色
  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }
}
//showSearch(context: 'nihao', delegate: searchBarDelegate)

const recentSuggest = ["我的心率","中国人的平均寿命","特朗普年龄","心率下降"]; //最近搜索 或 推荐搜索
const searchList = ["教练","课程","活动","咨询"];  //查找词库