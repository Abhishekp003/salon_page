import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'list_screen.dart';
import 'models/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("image/background2.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.8)),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "image/scissors2.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 25)),
                    Text(
                      ("Scissor's"),
                      style: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 20,),
                    Text(
                      "Services",
                      style: GoogleFonts.openSans(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Expanded(
                  child: ListScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
