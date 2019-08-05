import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  Widget _countLabel(String lable, String count) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(count,
            style: TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.w500,
            )),
        Text(
          lable,
          style: TextStyle(fontSize: 14.0, color: Colors.grey),
        )
      ],
    );
  }

  Widget _avator() {
    return Container(
      height: 90.0,
      width: 90.0,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              blurRadius: 10.0,
              offset: Offset(0, 8.0),
            )
          ],
          borderRadius: BorderRadius.circular(100.0)),
    );
  }

  Widget _menuLabel(
    String label, {
    Icon icon,
    String url,
  }) {
    return Container(
      height: 45.0,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: FlatButton(
        onPressed: () {},
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: <Widget>[
              ClipPath(
                clipper: TopCardClip(),
                child: Container(
                  color: Colors.blue,
                  height: 180.0,
                ),
              ),
              Positioned(
                top: 100,
                child: Container(
                  height: 70.0,
                  width: width,
                  color: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _countLabel("发布文章", "23"),
                      _countLabel("共鸣指数", "425232")
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10.0,
                top: 20.0,
                child: IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    print("123123");
                  },
                ),
              ),
              _avator(),
              Positioned(
                bottom: 15.0,
                child: Text(
                  "God know",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
          ClipPath(
            clipper: BottomClip(),
            child: Container(
              color: Colors.grey,
              height: 25.0,
            ),
          ),
          Expanded(
              child: Container(
                  width: width,
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0)),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0.0, 1.0),
                                blurRadius: 3.0,
                                spreadRadius: 2.0)
                          ]),
                      child: Column(
                        children: <Widget>[
                          _menuLabel("我的浏览"),
                          _menuLabel("我的发布"),
                          _menuLabel("我的留言"),
                        ],
                      ),
                    ),
                  )
                  // child: Container(
                  //   width: 300.0,
                  //   color: Colors.red,
                  // ),
                  ))
        ],
      ),
    );
  }
}

class TopCardClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 110);

    var controlPoint = Offset(size.width / 2, size.height - 60);
    var endPoint = Offset(size.width, size.height - 110);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}

class BottomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0, 25);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 25);
    var controlPoint = Offset(size.width / 2, -25);
    var endPoint = Offset(0, 25);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
