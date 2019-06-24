import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:his_hers_their/routers/home/home.dart';
import 'package:his_hers_their/routers/mine/mine.dart';

var homeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Home();
});

var mineHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Mine();
});
