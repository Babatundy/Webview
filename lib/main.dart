import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
void main() {
  runApp(MaterialApp(home: Home(),));
}

Widget tag = Icon(Icons.account_circle);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  {
  AnimationController animation;
  var number = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: WebView(
          initialUrl: "https://www.google.com",
          javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}
