import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';
import 'screen2.dart';

void main() => (runApp(Myapp()));

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.red,
        primaryColor: Colors.teal,
      ),
      home: LoadingScreen(),
    );
  }
}
