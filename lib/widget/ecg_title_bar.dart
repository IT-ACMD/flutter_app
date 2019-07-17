import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/searchView.dart';

//kToolbarHeight  状态栏的高度 包括刘海
class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout();
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: kToolbarHeight);
  }
  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, kToolbarHeight);
  }
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }
  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => false;
}
class WAppBar extends StatefulWidget implements PreferredSizeWidget {
  WAppBar({
    Key key,
    this.child, //自定义 widget  删除其他多余的wigdet
    this.bottom,
    this.elevation,
    this.shape,
    this.backgroundColor,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
  }) : assert(elevation == null || elevation >= 0.0),
        assert(primary != null),
        assert(titleSpacing != null),
        assert(toolbarOpacity != null),
        assert(bottomOpacity != null),
        preferredSize = Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0)),
        super(key: key);

  final Widget child;

  final PreferredSizeWidget bottom;

  final double elevation;

  final ShapeBorder shape;

  final Color backgroundColor;

  final Brightness brightness;

  final IconThemeData iconTheme;

  final IconThemeData actionsIconTheme;

  final TextTheme textTheme;

  final bool primary;

  final bool centerTitle;

  final double titleSpacing;

  final double toolbarOpacity;

  final double bottomOpacity;

  @override
  final Size preferredSize;

  @override
  _WAppBarState createState() => _WAppBarState();
}

class _WAppBarState extends State<WAppBar> {
  static const double _defaultElevation = 0.0;
  @override
  Widget build(BuildContext context) {
    assert(!widget.primary || debugCheckHasMediaQuery(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final ThemeData themeData = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    //final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    //final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);

    IconThemeData overallIconTheme = widget.iconTheme
        ?? appBarTheme.iconTheme
        ?? themeData.primaryIconTheme;
    IconThemeData actionsIconTheme = widget.actionsIconTheme
        ?? appBarTheme.actionsIconTheme
        ?? overallIconTheme;
    TextStyle centerStyle = widget.textTheme?.title
        ?? appBarTheme.textTheme?.title
        ?? themeData.primaryTextTheme.title;
    TextStyle sideStyle = widget.textTheme?.body1
        ?? appBarTheme.textTheme?.body1
        ?? themeData.primaryTextTheme.body1;
    print(sideStyle);
    if (widget.toolbarOpacity != 1.0) {
      final double opacity = const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn).transform(widget.toolbarOpacity);
      if (centerStyle?.color != null)
        centerStyle = centerStyle.copyWith(color: centerStyle.color.withOpacity(opacity));
      if (sideStyle?.color != null)
        sideStyle = sideStyle.copyWith(color: sideStyle.color.withOpacity(opacity));
      overallIconTheme = overallIconTheme.copyWith(
          opacity: opacity * (overallIconTheme.opacity ?? 1.0)
      );
      actionsIconTheme = actionsIconTheme.copyWith(
          opacity: opacity * (actionsIconTheme.opacity ?? 1.0)
      );
    }

    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: const _ToolbarContainerLayout(),
        child: IconTheme.merge(
          data: overallIconTheme,
          child: DefaultTextStyle(
            style: sideStyle,
//            child: toolbar,
            child: widget.child,
          ),
        ),
      ),
    );
    if (widget.bottom != null) {
      appBar = Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: kToolbarHeight),
              child: appBar,
            ),
          ),
          widget.bottomOpacity == 1.0 ? widget.bottom : Opacity(
            opacity: const Interval(0.25, 1.0, curve: Curves.fastOutSlowIn).transform(widget.bottomOpacity),
            child: widget.bottom,
          ),
        ],
      );
    }

    // The padding applies to the toolbar and tabbar, not the flexible space.
    if (widget.primary) {
      appBar = SafeArea(
        top: true,
        child: appBar,
      );
    }

    appBar = Align(
      alignment: Alignment.topCenter,
      child: appBar,
    );

    final Brightness brightness = widget.brightness
        ?? appBarTheme.brightness
        ?? themeData.primaryColorBrightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return Semantics(
      container: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
          color: widget.backgroundColor
              ?? appBarTheme.color
              ?? themeData.primaryColor,
          elevation: widget.elevation
              ?? appBarTheme.elevation
              ?? _defaultElevation,
          shape: widget.shape,
          child: Semantics(
            explicitChildNodes: true,
            child: appBar,
          ),
        ),
      ),
    );
  }
}

/*
 * title 控件
 * Created by guoshuyu
 * on 2018/7/24.
 */
class ECGTitleBar extends StatelessWidget {
  final String title;

  final IconData iconData;

  final VoidCallback onPressed;

  final bool needRightLocalIcon;

  final Widget rightWidget;

  ECGTitleBar(this.title, {
    this.iconData,
    this.onPressed,
    this.needRightLocalIcon = false,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    Widget widget = rightWidget;
    if (rightWidget == null) {
      widget = (needRightLocalIcon)
          ? new IconButton(
        iconSize: 22,
        padding: EdgeInsets.all(0.0),
        icon: Icon(
          iconData,
          //color: Colors.green,
          size: 22.0,
        ),
        onPressed: onPressed)
        : Container();
    }
    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 13.0),
            width: 46,
            height: 32,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color : Colors.black, fontSize: 23.0),

            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0.0, 13.0, 0.0, 13.0),
            width: 220,
            height: 30,
            child: RaisedButton.icon(
              onPressed: (){
                showSearch(context: context, delegate: SearchBarDelegate(), );
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(22.0))),
              icon: Icon(Icons.search,),
              label: Text('寻找更多的心电知识')
            ),
          ),
          widget,
        ],
      ),
    );
  }
}