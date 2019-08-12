import 'package:flutter/material.dart';

class MenuBarModel {
  IconData icon;
  String label;
  Widget child;
  MenuBarModel({
    this.icon,
    this.child,
    this.label,
  });
}

class CoolBottomNavigation extends StatefulWidget {
  List<MenuBarModel> children;
  int initIndex;
  Color activeColor;
  Color inActiveColor;
  Function change;
  CoolBottomNavigation({
    this.children,
    this.initIndex = 0,
    this.activeColor = Colors.blueAccent,
    this.inActiveColor = Colors.blueGrey,
    this.change,
  });

  @override
  _CoolBottomNavigationState createState() => _CoolBottomNavigationState();
}

class _CoolBottomNavigationState extends State<CoolBottomNavigation> {
  Widget body;
  List<MenuModel> menus = [];

  @override
  void initState() {
    body = widget.children[0].child;
    for (var i = 0; i < widget.children.length; i++) {
      menus.add(MenuModel(
          icon: widget.children[i].icon, label: widget.children[i].label));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.tealAccent, Colors.yellowAccent])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MenuBar(
                  initData: menus,
                  initIndex: widget.initIndex,
                  activeColor: widget.activeColor,
                  inActiveColor: widget.inActiveColor,
                  change: widget.change,
                )
              ],
            ),
          )),
          Container(),
        ],
      ),
    );
  }
}

class MenuModel {
  IconData icon;
  String label;
  MenuModel({this.icon, this.label});
}

class MenuBar extends StatelessWidget {
  List<MenuModel> initData;
  int initIndex;
  Color activeColor;
  Color inActiveColor;
  Function change;
  MenuBar(
      {this.initData,
      this.initIndex,
      this.activeColor = Colors.blue,
      this.inActiveColor = Colors.blueGrey,
      this.change});
  @override
  Widget build(BuildContext context) {
    List<Widget> menus = [];
    for (var i = 0; i < initData.length; i++) {
      var menu = GestureDetector(
        onTap: () {
          change();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              initData[i].icon,
              color: i == initIndex ? activeColor : inActiveColor,
            ),
            initData[i].label != null ? Text(initData[i].label) : Text("")
          ],
        ),
      );
      menus.add(menu);
    }

    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 50.0),
      height: 60.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: menus,
      ),
    );
  }
}
