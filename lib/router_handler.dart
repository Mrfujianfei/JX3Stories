import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:his_hers_their/routers/article/article_detail.dart';
import 'package:his_hers_their/routers/article/comment_list.dart';
import 'package:his_hers_their/routers/home/home.dart';
import 'package:his_hers_their/routers/mine/mine.dart';
import 'package:his_hers_their/routers/passport/login.dart';
import 'package:his_hers_their/routers/passport/register.dart';

var homeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Home();
});

var articleDetailHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ArticleDetail();
});

var commentListHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print(params);
  return CommentList();
});

var mineHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Mine();
});

var registerHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print(params);
  return Register();
});

var loginHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Login();
});
