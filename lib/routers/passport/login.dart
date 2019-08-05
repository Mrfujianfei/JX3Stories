import 'package:flutter/material.dart';
import 'package:his_hers_their/components/input_field.dart';
import 'package:his_hers_their/components/msg_service.dart';
import 'package:his_hers_their/theme/color.dart';
import 'package:his_hers_their/theme/fontsize.dart';
import 'package:oktoast/oktoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.red,
            child: Image.asset(
              'assets/image/login/bg.png',
              fit: BoxFit.contain,
            ),
          ),
          Center(
              child: SizedBox(
            width: 300.0,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: <
                Widget>[
              Container(
                width: 300.0,
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 40.0),
                        blurRadius: 80.0)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('登录',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text(
                        '账号',
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                      ),
                    ),
                    TextField(
                      controller: username,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                          hintText: "",
                          hintStyle: TextStyle(
                            fontSize: 12.0,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        '密码',
                        style:
                            TextStyle(fontSize: 14.0, color: Colors.grey[500]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0.0),
                      child: SizedBox(
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                            hintText: "",
                            hintStyle: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "忘记密码?",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 13.0),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(''),
                  Stack(
                    alignment: AlignmentDirectional(0.0, 0.7),
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          width: 110.0,
                          height: 40.0,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.lightBlue[200],
                                offset: Offset(0.0, 8.0),
                                blurRadius: 10.0)
                          ]),
                        ),
                      ),
                      Container(
                          width: 140.0,
                          height: 40.0,
                          margin: EdgeInsets.only(top: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              gradient: LinearGradient(colors: [
                                Colors.cyanAccent,
                                Colors.blueAccent,
                              ])),
                          child: FlatButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "GO",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 16.0,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "没账号?",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 0.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  shape: CircleBorder(),
                  onPressed: () {},
                  child: Icon(Icons.arrow_downward),
                ),
              )
            ]),
          ))
        ]));
  }
}
