import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:his_hers_their/components/comment_item.dart';
import 'package:his_hers_their/components/loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommentList extends StatefulWidget {
  String id;
  CommentList({this.id});

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList>
    with TickerProviderStateMixin {
  bool hasMore = true;
  int inputLength = 0;
  List<String> data = [];

  AnimationController _scaleController;

  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      data.add("Item $i");
    }
    _scaleController =
        AnimationController(value: 0.0, vsync: this, upperBound: 1.0);
    super.initState();
  }

  Widget buildList() {
    return ListView.builder(
      padding: EdgeInsets.only(left: 5, right: 5),
      itemBuilder: (c, i) => CommentItem(
            title: i.toString(),
          ),
      itemCount: data.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("评论列表"),
          elevation: 2,
          actions: <Widget>[Text("评论")],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: SmartRefresher(
                  controller: _refreshController,
                  onOffsetChange: _onOffsetChange,
                  enablePullUp: hasMore,
                  onRefresh: () async {
                    await Future.delayed(Duration(milliseconds: 1000));
                    _refreshController.refreshCompleted();
                  },
                  onLoading: () async {
                    await Future.delayed(Duration(milliseconds: 4000));
                    print("000000000000000000");
                    if (mounted) setState(() {});

                    for (int i = 0; i < 10; i++) {
                      data.add("Item$i $i");
                    }

                    setState(() {
                      hasMore = false;
                    });

                    _refreshController.loadComplete();
                  },
                  child: buildList(),
                  header: CustomHeader(
                    refreshStyle: RefreshStyle.Behind,
                    builder: (c, m) {
                      return Container(
                        child: ScaleTransition(
                          child: Loading(
                            size: 25.0,
                          ),
                          scale: _scaleController,
                        ),
                        alignment: Alignment.topCenter,
                        color: Colors.grey[300],
                      );
                    },
                  ),
                  footer: CustomFooter(
                      height: 60.0,
                      builder: (c, m) {
                        return Container(
                          child: SpinKitCubeGrid(
                            color: Colors.blue,
                          ),
                        );
                      }),
                ),
              ),
            ),
            Container(
                decoration:
                    BoxDecoration(border: Border(top: BorderSide(width: 0.1))),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 150.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            TextField(
                              maxLines: null,
                              maxLength: 100,
                              style: TextStyle(fontSize: 13.0),
                              // scrollPadding: EdgeInsets.symmetric(vertical: 10.0),
                              decoration: InputDecoration(
                                counterText: "",
                                contentPadding: EdgeInsets.only(
                                    top: 10.0, bottom: 15.0, left: 10.0),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "有感而发",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  inputLength = val.length;
                                });
                              },
                            ),
                            Positioned(
                              right: 10.0,
                              bottom: inputLength > 0 ? 0.0 : 14.0,
                              child: Text(
                                "${inputLength}/100",
                                style: TextStyle(fontSize: 12.0,color: Colors.grey[400]),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60.0,
                        child: FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          child: Text("发送", style: TextStyle(fontSize: 12.0)),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }

  void _onOffsetChange(bool up, double offset) {
    if (up &&
        (_refreshController.headerStatus == RefreshStatus.idle ||
            _refreshController.headerStatus == RefreshStatus.canRefresh)) {
      // 80.0 is headerTriggerDistance default value
      _scaleController.value = offset / 80.0;
    }
  }
}
