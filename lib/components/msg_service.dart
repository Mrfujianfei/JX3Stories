import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class MsgService {
  static Widget _message({String message}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Text(message, style: TextStyle(fontSize: 12.0)),
    );
  }

  static void show(String message, {Duration duration, BuildContext context}) {
    // final mySnackBar = SnackBar(
    //   content: new Text('我是SnackBar'),
    //   backgroundColor: Colors.red,
    //   duration: Duration(seconds: 1),
    //   action: new SnackBarAction(
    //       label: '我是scackbar按钮',
    //       onPressed: () {
    //         print('点击了snackbar按钮');
    //       }),
    // );
    // Scaffold.of(context).showSnackBar(mySnackBar);
    showToast(message,
        position: ToastPosition(offset: -400.0),
        textPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0));
    // showToastWidget(_message(message: message),
    //     duration: duration ?? Duration(seconds: 1),
    //     position: ToastPosition(offset: 0.0),
    //     context: context);
  }
}
