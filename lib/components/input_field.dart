import 'package:flutter/material.dart';
import 'package:his_hers_their/theme/color.dart';

class InputField extends StatelessWidget {
  Icon icon;
  String hintText;
  Widget suffixIcon = null;
  bool obscureText = false;
  TextEditingController controller;
  InputField(
      {this.icon,
      this.hintText,
      this.suffixIcon = null,
      this.obscureText = false,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 20.0, right: suffixIcon == null ? 30.0 : 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
                color: ThemeColor.boxShadow,
                blurRadius: 5.0,
                offset: Offset(0.0, 1.0))
          ]),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            icon: icon,
            border: InputBorder.none,
            hintText: hintText),
      ),
    );
  }
}
