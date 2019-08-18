import 'package:flutter/material.dart';

class CustomeSlideUpRoute extends PageRouteBuilder {
  final Widget widget;
  CustomeSlideUpRoute(this.widget)
      : super(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return SlideTransition(
                  position:
                      Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                          .animate(CurvedAnimation(
                              parent: animation1, curve: Curves.easeOut)),
                  child: widget);
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              return SlideTransition(
                  position:
                      Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
                          .animate(CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                  child: child);
            });
}
