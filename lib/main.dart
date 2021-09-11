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
  String url = "http://192.168.43.145:5050/PFE2021_war_exploded/";
  bool show_error_page = false;
  String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5821F),
      body: SafeArea(
        child: Stack(
          children: [
            WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,

              //enable JS cause it's disabled by default

              onWebViewCreated: (WebViewController wc) {
                controller =
                    wc; //when web view is created we inislize the controller
                //  print(Errorrrr.description);
              },

              onWebResourceError: (WebResourceError webResourceError) {
                //this method is called when error accures
                /*sleep(
                  //dertha bah mayhbelch 3liya be boucle infini
                  Duration(milliseconds: 500),
                );*/
                //we reload the URL when as long as we have the error
                controller.reload();

                if (webResourceError.description ==
                    "net::ERR_INTERNET_DISCONNECTED") {
                  error = "net::ERR_INTERNET_DISCONNECTED";
                } else {
                  error = "bitch ass stupid shit";
                }
              },
              onPageStarted: (String s){
                setState(() {
                  error="net::ERR_INTERNET_DISCONNECTED";
                });

              },
              onPageFinished:(String s){
                setState(() {
                  error="pls work";
                });

              } ,
            ),
            error =="net::ERR_INTERNET_DISCONNECTED"
                ? Error_page()
                : Center(child: Text("Error"),)
          ],
        ),
      ),
    );
  }

  void show_error() {
    setState(() {
      show_error_page = true;
    });
  }

  void hide_error() {
    setState(() {
      show_error_page = false;
    });
  }
}

class Error_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("connect to the internet ya zbi , oula url te3k m9owd",style: TextStyle(fontSize: 40,),textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
