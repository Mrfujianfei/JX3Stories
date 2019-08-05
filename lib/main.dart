import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:his_hers_their/bottom_navigation.dart';
import 'package:his_hers_their/router.dart';
import 'package:his_hers_their/routers/article/article_detail.dart';
import 'package:his_hers_their/routers/article/comment_list.dart';
import 'package:his_hers_their/routers/passport/login.dart';
import 'package:oktoast/oktoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Router router;

  MyApp() {
    final _router = Router();
    Routes.configureRoutes(_router);
    router = _router;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generator,
    ));
  }
}
