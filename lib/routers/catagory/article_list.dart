import 'package:flutter/material.dart';

class ArticleCardModel {
  String title;
  String origin;
  String star;
  String url;
  ArticleCardModel({this.title, this.origin, this.star, this.url});
}

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  List<ArticleCardModel> data = [];
  List<Widget> list = [];
  @override
  void initState() {
    // TODO: implement initState
    data
      ..add(ArticleCardModel(
          title: "齐木楠雄的灾难",
          origin: "《齐木楠雄的灾难》",
          star: "23",
          url: 'assets/image/type.png'))
      ..add(ArticleCardModel(
          title: "我愿意成为那个最爱你的陌生人",
          origin: "《恋爱50次》",
          star: "23",
          url: 'assets/image/type.png'))
      ..add(ArticleCardModel(
          title: "如果爱上一个永远不可能的人",
          origin: "《对他说》",
          star: "23",
          url: 'assets/image/type.png'))
      ..add(ArticleCardModel(
          title: "世人皆叹红颜祸水",
          origin: "《天渔》",
          star: "23",
          url: 'assets/image/type.png'))
      ..add(ArticleCardModel(
          title: "一个人可以轻易的学会不在乎",
          origin: "《天浴》",
          star: "23",
          url: 'assets/image/type.png'))
      ..add(ArticleCardModel(
          title: "如果爱上一个永远不可能的人",
          origin: "《对他说》",
          star: "23",
          url: 'assets/image/type.png'))
      ..add(ArticleCardModel(
          title: "世人皆叹红颜祸水",
          origin: "《天渔》",
          star: "23",
          url: 'assets/image/type.png'))
      ..add(ArticleCardModel(
          title: "一个人可以轻易的学会不在乎",
          origin: "《天浴》",
          star: "23",
          url: 'assets/image/type.png'));

    for (var i = 0; i < data.length; i++) {
      list.add(ListItemCard(
        mode: data[i],
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("文章分类标题"),
        centerTitle: true,
      ),
      body: ListView(
        children: list,
      ),
    );
  }
}

class ListItemCard extends StatelessWidget {
  ArticleCardModel mode;
  ListItemCard({this.mode});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: Image.asset(mode.url, fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(mode.title,
                        style: TextStyle(
                          fontSize: 20.0,
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "来源 :${mode.origin}",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey[400]),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          mode.star,
                          style: TextStyle(
                              fontSize: 13.0, color: Colors.grey[400]),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
