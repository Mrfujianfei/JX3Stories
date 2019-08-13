import 'dart:math';

import 'package:flutter/material.dart';
import 'package:his_hers_their/components/article_card.dart';
import 'package:his_hers_their/components/slide_card.dart';
import 'package:his_hers_their/events/event_bus.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> data = [1, 2, 3, 4, 5, 6];
  var currentPage;
  PageController controller;

  @override
  void initState() {
    currentPage = data.length - 1;
    controller = PageController(initialPage: data.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 400.0,
        // color: Colors.red,
        // backgroundColor: Colors.blueGrey,
        // padding: EdgeInsets.only(bottom: 40.0),
        child: Center(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            DemoCarouse(currentPage),
            Positioned.fill(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class DemoCarouse extends StatelessWidget {
  List data = [1, 2, 3, 4, 5, 6];
  List colorList = [
    Colors.pink,
    Colors.grey,
    Colors.purple,
    Colors.red,
    Colors.blue,
    Colors.yellowAccent
  ];

  var PADDING_BASE = 40.0;
  var PASSING_INTER = 15.0;
  var RADIO = 0.67;
  var DOT_NUM = 4;

  var CARD_RADIO = 0.7;

  var _current;
  DemoCarouse(this._current);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: RADIO,
        child: LayoutBuilder(
          builder: (context, contraints) {
            var width = contraints.maxWidth;
            var height = contraints.maxHeight;

            var safeWidth = width - 2 * PADDING_BASE;
            var safeHeight = height - 2 * PADDING_BASE;

            var widthOfcard = safeWidth;
            var heightOfCard = widthOfcard / CARD_RADIO;

            var maxTop = safeHeight - heightOfCard;
            var interDur = maxTop / 3;
            List<Widget> cardList = [];
            for (var i = 0; i < data.length; i++) {
              var delt = i - _current;
              var isOnRight = delt > 0;
              var top = PADDING_BASE +
                  max(maxTop - interDur * -delt * (isOnRight ? 40 : 1.0), 0.0);
              var item = Positioned.directional(
                end: PADDING_BASE +
                    PASSING_INTER * max(isOnRight ? 0.0 : -delt, 0.0),
                start: PADDING_BASE +
                    PASSING_INTER * max(isOnRight ? 0.0 : -delt, 0.0),
                top: top,
                textDirection: TextDirection.rtl,
                child: AspectRatio(
                  aspectRatio: CARD_RADIO,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 8.0),
                          blurRadius: 10.0)
                    ]),
                    child: ArticleCard(
                      title: '你看, 我正通过失去你 而走向你 渐行渐远',
                      url: 'assets/image/article_pic.png',
                      star: '300',
                      sketch: "说好带你流浪，而我去半路返航，坠落自责的海洋...",
                    ),
                  ),
                ),
              );
              cardList.add(item);
            }

            return Container(
              height: height,
              width: width,
              child: Stack(
                children: cardList,
              ),
            );
          },
        ));
  }
}
