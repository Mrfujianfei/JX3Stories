import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  double size;
  Loading({this.size = 80.0});
  @override
  Widget build(BuildContext context) {
    return SpinKitChasingDots(
      color: Colors.red,
      size: size,
    );
  }
}
