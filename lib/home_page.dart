import 'package:flutter/material.dart';
import 'package:marvel_comics_info/widgets/comics_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Marvel Comics Database Info",
        ),
        backgroundColor: Color(0xFFF9D152C),
      ),
      backgroundColor: Color(0xFFF0A0A0A),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(child: ComicsGrid()),
        ],
      )
      
    );
  }

}