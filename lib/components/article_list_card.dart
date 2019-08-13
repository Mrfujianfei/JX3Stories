import 'package:flutter/material.dart';

class ArticleListCard extends StatelessWidget {
  String title;
  String readNum;
  String publishTime;
  ArticleListCard({this.title, this.readNum, this.publishTime});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                    fontSize: 20.0,
                    wordSpacing: 0.5,
                  )),
              Row(
                children: <Widget>[],
              )
            ],
          ),
        ));
  }
}
