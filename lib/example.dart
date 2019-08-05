import 'package:flutter/material.dart';

class ExampleOne extends StatefulWidget {
  @override
  _ExampleOneState createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> with TickerProviderStateMixin {
  List columnData = [
    'assets/image/login/pic1.jpg',
    'assets/image/login/pic2.jpg',
    'assets/image/login/pic3.jpg',
    'assets/image/login/pic4.jpg',
    'assets/image/login/pic1.jpg',
    'assets/image/login/pic2.jpg',
    'assets/image/login/pic3.jpg',
    'assets/image/login/pic4.jpg',
    'assets/image/login/pic1.jpg',
  ];

  List<Widget> columnOne = [];
  List<Widget> columnTwo = [];
  List<Widget> columnThree = [];

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 0)).then((value) {
      for (var i = 0; i < columnData.length; i++) {
        AnimationController slideControl = AnimationController(
            vsync: this, duration: Duration(milliseconds: 1000));
        CurvedAnimation curve =
            CurvedAnimation(parent: slideControl, curve: Curves.easeOutSine);
        Animation<Offset> sildeAnimation =
            Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                .animate(curve);

        AnimationController opacityControl = AnimationController(
            vsync: this, duration: Duration(milliseconds: 500));
        Animation<double> opacityAnimation =
            Tween(begin: 0.0, end: 1.0).animate(opacityControl);
        Widget itemWidget = SlideTransition(
          position: sildeAnimation,
          child: FadeTransition(
            opacity: opacityAnimation,
            child: Image.asset(columnData[i], fit: BoxFit.fitWidth),
          ),
        );
        if ((i + 1) % 3 == 0 && i != 0) {
          columnThree.add(itemWidget);
        } else if ((i + 1) % 3 == 2) {
          columnTwo.add(itemWidget);
        } else {
          columnOne.add(itemWidget);
        }

        Future.delayed(Duration(milliseconds: i * 200)).then((value) {
          slideControl.forward();
          opacityControl.forward();
        });

        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Column(
                  children: columnOne,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: columnTwo,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: columnThree,
                ),
              ),
            ],
          ),
          Positioned.fill(
            bottom: 0.0,
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Color.fromRGBO(255, 255, 255, 1),
                    Color.fromRGBO(255, 255, 255, 0.9),
                    Color.fromRGBO(255, 255, 255, 0)
                  ])),
            ),
          )
        ],
      ),
    );
  }
}
