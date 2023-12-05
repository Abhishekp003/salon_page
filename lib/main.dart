import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salon_page/screens/theme.dart';
import 'package:salon_page/screens/theme_constant.dart';

import 'list_screen.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,

      home:
      Scaffold(
        appBar: AppBar(
          actions: [
            Switch(value: _themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  _themeManager.toggleTheme(newValue);
                })
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 5)),
                Image.asset(
                  "image/scissors.jpeg",
                  width: 100,
                  height: 100,
                )
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 12.0)),
                Text(
                  "Scissor's",
                  style: GoogleFonts.robotoMono(
                    textStyle: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 250.0)),
                Text(
                  "Services",
                  style: GoogleFonts.courierPrime(
                    textStyle: TextStyle(
                      color: Colors.indigo[100],
                      fontWeight: FontWeight.w900,
                      fontSize: 35,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListScreen(),
            ),
          ],
        ),
      )
      ,
    );
  }
}