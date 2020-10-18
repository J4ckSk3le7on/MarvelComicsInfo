import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:marvel_comics_info/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent
    // ));
    return MaterialApp(
      title: 'Flutter Pokedex',
      theme: ThemeData(
        accentColor: Color(0xFFF9D152C)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "home_page",
      routes: {
        "home_page"     : (BuildContext context) => HomePage(),
      },
    );
  }
}