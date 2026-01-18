import 'package:flutter/material.dart';
import 'package:wrwrwr/deltask.dart';
import 'package:wrwrwr/edittask.dart';
import 'home.dart';
import 'home2.dart';
import 'trying.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home2(),
    );
  }
}

