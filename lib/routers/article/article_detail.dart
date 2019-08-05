import 'package:flutter/material.dart';
import 'package:his_hers_their/components/loading.dart';

class ArticleDetail extends StatefulWidget {
  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  TextStyle titleStyle = TextStyle(fontSize: 20.0, letterSpacing: 1.0);

  TextStyle contentStyle =
      TextStyle(fontSize: 15.0, letterSpacing: 2.0, height: 1.2);

  List<Widget> contentList = [];
  bool isloading = true;
  bool isloadmore = false;
  bool hasmore = true;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 1000)).then((any) {
      contentList
        ..add(
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              "Title",
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
          ),
        )
        ..add(_contentWidget(
          "这段为正史】隋文帝开皇十七年（公元598年），太宗李世民降世在他们回太原的路上。刚到太原，便有一道人拜访，说这婴儿将来必救世济民，遂取名“世民”。尔后，道人又赠予李渊一书：《开元典论》。【这段为野史】李渊一看这是仙人相助啊！大喜。后来李世民从书中逐渐悟出了开国之道，便是这一书，给予李世民打江山很大的帮助。可惜的是，《开元典论》大部分内容讲的是如何打江山，治国方面却谈之甚少。但照那道人所说，这世间必还有一部讲治国之道的宝典，道长留诗曰这部宝典必出“纯阳”。于是太宗登基后派人四处寻找叫纯阳的地方或人，终无果。这件事很玄奇也很蹊跷。如果我们把这个故事当神话，那么李世民就有天助。如果我们把这个故事当阴谋，那说不准就是九天暗中在行动了。至于这个神秘的道人是谁呢？其实，他就是八仙之一，道家北五祖之一的正阳子钟离权。民间俗称“汉钟离”。",
        ));
      if(!mounted){
        return;
      }
      setState(() {
        isloading = false;
      });
    });
    super.initState();
  }

  Widget _contentWidget(String content) {
    return Text(
      content,
      style: contentStyle,
      textAlign: TextAlign.justify,
    );
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverAppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () {},
        ),
        elevation: 3.0,
        centerTitle: true, //标题居中
        expandedHeight: 180.0, //展开高度200
        floating: true, //不随着滑动隐藏标题
        pinned: true, //固定在顶部
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 20.0,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.star_border),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
          // PopupMenuButton(
          //   icon: Icon(Icons.more_horiz),
          //   itemBuilder: (BuildContext context) {
          //       return choices.skip(2).map((Choice choice) {
          //         return new PopupMenuItem<Choice>(
          //           value: choice,
          //           child: new Text(choice.title),
          //         );
          //       }).toList();
          //     },
          // )
        ],
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Image.asset('assets/image/test.jpg', fit: BoxFit.cover),
        ),
      )
    ];
  }

  void _loadingMore() {
    if (!mounted) {
      return;
    }
    setState(() {
      isloadmore = true;
    });

    print("加载");
    isloadmore = true;

    Future.delayed(Duration(milliseconds: 2000)).then((any) {
      print('------结束加载------');
      contentList
        ..add(_contentWidget(
          "汉钟离给了书之后飘然而去。不过他并没有从此消失。接下来，他去做了一件更重要的事：他去点化了一个悟性很高的风流才子为徒，教他修道。大家都知道了，这个徒弟就是大名鼎鼎，八仙之一，道家北五祖之一，中国民间三大神仙之一的纯阳子吕洞宾。至于吕洞宾如何经历十大考验最终悟道，如何留下三戏白牡丹的风流韵事……以及如何被狗咬了等等一大堆的传说我们就不提了，和剑网3没啥关系，请自己去百度吧。我们要说的是，吕祖在剑网3中的风流韵事（汗……）吕洞宾还没入山修道之前，是个风流潇洒的少年，而且琴棋书画无所不通。剑网3中的文武全才可不只是后来的“天下第一奇男子”方乾。初唐四杰中的吕洞宾和子虚先生都是才华横溢的大才子。若是方乾生在那时，谁是天下第一奇男子还真不好说。这样一个惊才绝艳的男儿，肯定有很多女子倾慕。那时，吕洞宾至少有一个红颜知己，叫做何潮音。何潮音就是很多玩家津津乐道的何仙姑。不过何潮音到底是不是何仙姑呢？可以说是，也可以说不是。孙慕云称呼她为仙姑，那她就是何仙姑。不过这个何仙姑是不是人们所指的那个“何仙姑”呢？要知道那个“何仙姑”可是宋朝时候的人……（何潮音的名字和事迹，显然是借鉴了王重阳和林潮音的故事）不管这么多了！总之，吕何二人有那么一段情缘。可是，后来小吕顿悟之后修道去了，也不告诉小何姑娘一声就失踪了。何潮音十分着急，找了他很久。数年之后才发现，心上人修道去了！一时间她心灰意冷，也走上了修道之路。不过直到多年以后，她对此事仍然耿耿于怀。追求爱情重要还是追求真理重要？这对错，还真不好说。",
        ));
      setState(() {
        isloadmore = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: NestedScrollView(
                headerSliverBuilder: _sliverBuilder,
                body: Center(
                  child: isloading
                      ? Loading()
                      : NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification notification) {
                            if (isloadmore) {
                              // 正在加载就退出
                              return;
                            }

                            double progress = notification.metrics.pixels /
                                notification.metrics.maxScrollExtent;

                            int srcPercent = (progress * 100).toInt();

                            if (srcPercent >= 60) {
                              print("--------------加载更多--------------");
                              _loadingMore();
                            }
                          },
                          child: ListView(
                            padding: EdgeInsets.all(40.0),
                            children: <Widget>[
                              Column(
                                children: contentList,
                              ),
                              isloadmore && hasmore
                                  ? Padding(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: SizedBox(
                                        child: Loading(
                                          size: 30.0,
                                        ),
                                      ),
                                    )
                                  : Text("")
                            ],
                          ),
                        ),
                )),
          ),
          Container(
            height: 40.0,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey[600],
                offset: Offset(0, 3),
                blurRadius: 4.0,
              ),
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.only(left: 20.0),
                  onPressed: _to,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Icon(Icons.comment),
                      ),
                      Text("2342")
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Row(
                    children: <Widget>[Text("阅读量:"), Text("9K")],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _to() {
    Navigator.of(context).pushNamed("/commentList", arguments: 123234);
  }
}
