import 'package:flutter/material.dart';
import 'package:his_hers_their/routers/article/article_detail.dart';
import 'package:his_hers_their/routers/home/home.dart';
import 'package:his_hers_their/routers/mine/mine.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  List<Widget> pageList = [];

  @override
  void initState() {
    pageList..add(Home())..add(ArticleDetail())..add(Mine());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.local_airport), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.orange,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      // floatingActionButton: FloatingActionButton(
      //     //悬浮按钮
      //     child: Icon(Icons.add),
      //     onPressed: _onAdd),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
