import 'package:flutter/material.dart';
import 'screen1.dart';

class Raisebuttonn extends StatefulWidget {
  const Raisebuttonn({Key? key}) : super(key: key);

  @override
  _RaisebuttonnState createState() => _RaisebuttonnState();
}

class _RaisebuttonnState extends State<Raisebuttonn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
              child: Text('Screen 2'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Raisebutton();
                    },
                  ),
                );
              })),
    );
  }
}
