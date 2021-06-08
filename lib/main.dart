import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  WebViewController controller;
  String url = "https://www.google.com";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5821F),
      body: SafeArea(
        child: WebView(
          onWebResourceError: (WebResourceError webResourceError) {//this method is called when error accures
            setState(() {
              sleep(Duration(milliseconds: 500),);//dertha bah mayhbelch 3liya be boucle infini
              controller.reload();//we reload the URL when as long as we have the error
            });
          },
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,//enable JS cause it's disabled by default
          onWebViewCreated: (WebViewController wc) {
            controller = wc;//when web view is created we inislize the controller
          },
        ),
      ),
    );
  }
}
