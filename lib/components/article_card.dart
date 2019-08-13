import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  String title;
  String star;
  String sketch;
  String url;
  ArticleCard({this.title, this.star, this.sketch, this.url});
  @override
  Widget build(BuildContext context) {
    List<Widget> titles = [];
    var titleString = title.split(" ");
    for (var i = 0; i < titleString.length; i++) {
      titles.add(SizedBox(
        width: 200.0,
        child: Text(
          titleString[i],
          style: TextStyle(fontSize: 24.0),
        ),
      ));
    }
    return Stack(
      children: <Widget>[
        Container(
            width: double.infinity,
            // height: 300.0,
            child: Column(
              children: <Widget>[
                Image.asset(
                  url,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                )
              ],
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 30.0),
            // padding: EdgeInsets.all(0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: titles,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.favorite),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(star)
                  ],
                )
              ],
            ))
      ],
    );
  }
}
