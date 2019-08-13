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
  // ModeType mode;
  CoolBottomNavigation(
      {this.children,
      this.initIndex = 0,
      this.activeColor = Colors.blueAccent,
      this.inActiveColor = Colors.blueGrey,
      this.change});

  @override
  _CoolBottomNavigationState createState() => _CoolBottomNavigationState();
}

class _CoolBottomNavigationState extends State<CoolBottomNavigation> {
  Widget body;
  int activeIndex;
  List<MenuModel> menus = [];

  @override
  void initState() {
    activeIndex = widget.initIndex;
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
                  initIndex: activeIndex,
                  activeColor: widget.activeColor,
                  inActiveColor: widget.inActiveColor,
                  change: (index) {
                    print(index);
                    _change(index);
                  },
                )
              ],
            ),
          )),
          Container(
            // color: Colors.red,
            padding: EdgeInsets.only(bottom: 65.0),
            child: body,
          ),
        ],
      ),
    );
  }

  _change(index) {
    setState(() {
      activeIndex = index;
      body = widget.children[index].child;
    });
    if (widget.change == null) {
      return;
    }
    widget.change(index);
  }
}

enum ModeType { gradient, normal }

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
      List<Widget> columnWidgets = [
        Icon(
          initData[i].icon,
          color: i == initIndex ? activeColor : inActiveColor,
          size: initData[i].label != null ? 30.0 : 35.0,
        ),
      ];
      if (initData[i].label != null) {
        columnWidgets.add(Text(initData[i].label));
      }
      var menu = GestureDetector(
          onTap: () {
            change(i); // ;
          },
          child: Padding(
            // color: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: columnWidgets,
            ),
          ));
      menus.add(menu);
    }

    return Container(
      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: menus,
      ),
    );
  }
}
