//这是底部菜单文件，注意命名方式是讲类名变成_连接的。
//引入ui库
import 'package:flutter/material.dart';
//引入自定义页面
import '../pages/homeView.dart';
import '../pages/rankView.dart';
import '../pages/coachView.dart';
import '../pages/userView.dart';

//创建类，继承动态StatefulWidget
class BottomMenu extends StatefulWidget {
  // final Widget child;

  // BottomMenu({Key key, this.child}) : super(key: key);

  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {

  //创建内部属性值
  //创建一个数组，这个数组元素是引入页面中的方法。
  // List<Widget> page_view_list = List();如果使用这里的属性，就要在initState中初始化
  List<Widget> pageViewList2 = [HomeView(),RankView(),CoachView(),UserView()];
  //创建一个整型index，用来获取当前菜单按钮的index,初始值是0，，这个初始值就代表app展示的第一个页面，也就是数组中的索引。
  int _nowindex = 0;

  //重写继承的initState方法
  @override
  void initState() {
    //以下的代码，现在不理解。所以使用了另外一种形式，在设置属性的时候就设置其元素值page_view_list2
    // page_view_list
    //   ..add(HomeView())
    //   ..add(NewView())
    //   ..add(StudyView())
    //   ..add(TeacherView())
    //   ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: pageViewList2[_nowindex],//注意这行，千万不要少了。这是页面主体
        bottomNavigationBar: BottomNavigationBar(
          //设置内部的元素
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(//具体的菜单按钮元素
              icon: Icon(Icons.home),//设置图标,和颜色
              title: Text("主页"),//设置文字和颜色
            ),
            BottomNavigationBarItem(//具体的菜单按钮元素
              icon: Icon(Icons.bookmark),//设置图标,和颜色
              title: Text("排行",),//设置文字和颜色
            ),
            BottomNavigationBarItem(//具体的菜单按钮元素
              icon: Icon(Icons.library_books),//设置图标,和颜色
              title: Text("教练"),//设置文字和颜色
            ),
            BottomNavigationBarItem(//具体的菜单按钮元素
              icon: Icon(Icons.person),//设置图标,和颜色
              title: Text("我的"),//设置文字和颜色
            ),
          ],
          //关键点
          currentIndex: _nowindex,//设置当前显示的页面索引，使用已设定的属性。

          type: BottomNavigationBarType.fixed,//设置类型

          //设置点击响应
          onTap: (int index){//参数设置为默认的index，这个index就是点击的按钮的index
            //setState  这个也是内置方法，只需要将index参数赋值给已设定的属性 _now_index;
            setState(() {
              _nowindex =index;
            });
          },

        ),
      ),
    );
  }
}





/**
 * 底部导航继承的是动态StatefulWidget，注意。
 *
 *
 * Scaffold()组件的
    body ：主体显示组件
    bottomNavigationBar：BottomNavigationBar() 底部菜单导航属性，
 * BottomNavigationBar() 底部导航组件
 * items：设置按钮图标，文字
 * type: BottomNavigationBarType.fixed,//设置按钮类型，固定的
 * currentIndex: _nowindex,//设置当前显示的页面索引
 * onTap:(int index){}   点击响应，一般使用以下语法
    onTap: (int index){//参数设置为默认的index，这个index就是点击的按钮的index
    //setState  这个也是内置方法，只需要将index参数赋值给已设定的属性 _now_index;
    setState(() {
    _nowindex =index;
    });
    },
 *
 * 新建文件，命名方式 是讲类名全部小写，用_连接。例如home_view.dart,其中的主要类就是HomeView
 *
 */