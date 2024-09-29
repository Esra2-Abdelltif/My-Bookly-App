import 'package:flutter/material.dart';

void main() {
  runApp(const MyBooklyApp());
}

class MyBooklyApp extends StatelessWidget {
  const MyBooklyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

    );
  }
}

