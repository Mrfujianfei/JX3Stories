import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:his_hers_their/router.dart';
import 'package:his_hers_their/routers/home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Router router;

  MyApp() {
    final _router = Router();
    Routes.ConfigureRoutes(_router);
    router = _router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generator,
    );
  }
}
