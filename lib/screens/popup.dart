
import 'package:flutter/material.dart';
import 'package:salon_page/screens/service_screen.dart';

class PopDetailScreen extends StatelessWidget {
  late Services service;

  PopDetailScreen(this.service);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(service.name),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(service.price),
          ),
        ],
      ),
    ));

  }
}
