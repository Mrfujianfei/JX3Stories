import 'package:flutter/material.dart';
import 'package:his_hers_their/components/input_field.dart';
import 'package:his_hers_their/theme/color.dart';
import 'package:his_hers_their/theme/fontsize.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool ableSee = false;
  final username = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Ink(
        color: Colors.orange,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 180.0),
              child: InputField(
                  icon: Icon(Icons.person),
                  hintText: "用户名",
                  controller: username),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: InputField(
                  icon: Icon(Icons.phone_android),
                  hintText: "手机号",
                  controller: phone),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: InputField(
                  icon: Icon(Icons.lock),
                  hintText: "密码",
                  obscureText: ableSee ? false : true,
                  controller: password,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        ableSee = !ableSee;
                      });
                    },
                    child: Icon(Icons.remove_red_eye,
                        color: ableSee ? ThemeColor.primary : Colors.grey),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: FlatButton(
                onPressed: () {
                  print("数据：");
                  print(username.text);
                  print(password.text);
                },
                child: Text("注册"),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
