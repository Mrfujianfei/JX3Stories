import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  String title;
  CommentItem({this.title = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: ClipOval(
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: Image.asset('assets/image/avatar.jpg'),
                ),
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "昵称 ${title}",
                      style: TextStyle(fontSize: 13.0),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.thumb_up,
                          size: 12.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: Text("13", style: TextStyle(fontSize: 10)),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    "2019-7-13 17:36",
                    style: TextStyle(fontSize: 10.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "ad科技发生的开发商的会计法那是的罚款水电费纳斯达克你发了数据库DNF拉伸DNF",
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    height: 0.5,
                    color: Colors.grey[400])
              ],
            ),
          )
        ],
      ),
    );
  }
}
