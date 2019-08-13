import 'package:flutter/material.dart';

class Catagory extends StatefulWidget {
  @override
  _CatagoryState createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {
  List types;

  @override
  void initState() {
    // TODO: implement initState
    types = ['态度', '生活', '古风', '江湖', '年轻', '活力'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //SliverGridDelegateWithFixedCrossAxisCount可以直接指定每行（列）显示多少个Item   SliverGridDelegateWithMaxCrossAxisExtent会根据GridView的宽度和你设置的每个的宽度来自动计算没行显示多少个Item
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        itemCount: types.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50.0,
            child: CatagoryCard(
              label: types[index],
            ),
          );
        },
      ),
    );
  }
}

class CatagoryCard extends StatelessWidget {
  String label;
  CatagoryCard({this.label});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          // width: 100.0,
          // height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5.0)
            ],
            image: DecorationImage(
                image: AssetImage('assets/image/type.png'), fit: BoxFit.fill),
          ),
          child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.5),
                      Color.fromRGBO(0, 0, 0, 0)
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: ClipOval(
                      child: Container(
                        width: 15.0,
                        height: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "#${label}",
                    style: TextStyle(
                        fontSize: 24.0, color: Colors.white, wordSpacing: 0.5),
                  )
                ],
              )),
          // Container(
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //           begin: Alignment.bottomCenter,
          //           end: Alignment.topCenter,
          //           colors: [
          //         Color.fromRGBO(0, 0, 0, 0.5),
          //         Color.fromRGBO(0, 0, 0, 0)
          //       ])),
          // )
        )
      ],
    );
  }
}
