import 'package:flutter/material.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_restart/flutter_restart.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

Widget tag = Icon(Icons.account_circle);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var connectivityResult = (Connectivity().checkConnectivity());
  AnimationController animation;
  WebViewController controller;
  //code -2  name net::ERR_INTERNET_DISCONNECTED
  var web_error=WebResourceError(errorCode: -2, description: "net::ERR_INTERNET_DISCONNECTED");
  var number = 0;
  var text_controller = new TextEditingController();
  String url = "https://www.google.com";
  bool failed_to_build = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: failed_to_build==false? WebView(
          onPageFinished: (s) {
            setState(() {
              failed_to_build = false;
            });
          },
          onWebResourceError: (WebResourceError webResourceError) {
            setState(() {

              failed_to_build = true;
            });
          },
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController wc) {
            controller = wc;
          },
        ):RaisedButton(onPressed: (){
          setState(() {
            controller.reload();
          });

        },child: Text("ZABIIIIIIIIIIIIIIIIIIIIIIIIIIIII"),)
      ),
    );
  }
}
