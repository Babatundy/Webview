import 'package:flutter/material.dart';

void main() {
  runApp(Home());
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
    /*void go_new_route() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Second_screen();
          },
        ),
      );
    }*/

    return Scaffold(
        backgroundColor: Colors.teal,
        body: Container()
    );
  }
}