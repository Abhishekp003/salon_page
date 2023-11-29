import 'package:flutter/material.dart';
import 'package:salon_page/list_screen.dart';
import 'package:salon_page/screens/service_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:ListScreen(),

        ),

    );
  }
}
