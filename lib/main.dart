import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  AnimationController animation;
  var number = 0;
  var text_controller = new TextEditingController();
  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          elevation: 60,
          flexibleSpace: SafeArea(
            child: Container(
              child: TextField(
                textAlign: TextAlign.center,
                controller: text_controller,
                onSubmitted: (text) {
                  setState(() {
                    url = text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return web(url);
                        },
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ),
        body: Container());
  }
}

Widget web(String url) {
  return Scaffold(
    appBar: AppBar(
      title: Text(url),
    ),
    body: WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
    ),
  );
}
