import 'package:flutter/material.dart';
import 'screen2.dart';

class Raisebutton extends StatefulWidget {
  const Raisebutton({Key? key}) : super(key: key);

  @override
  _RaisebuttonState createState() => _RaisebuttonState();
}

class _RaisebuttonState extends State<Raisebutton> {
  @override
  void initState() {
    super.initState();
    print('initstate method get callde');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate method get calleed');
  }

  @override
  Widget build(BuildContext context) {
    print('build method get called');
    return Scaffold(
      body: Center(
          child: RaisedButton(
              child: Text('Screen 1'),
              onPressed: () {
                Navigator.pop(context);
              })),
    );
  }
}
