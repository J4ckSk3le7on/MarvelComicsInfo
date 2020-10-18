import 'package:flutter/material.dart';

import 'package:marvel_comics_info/comic_info_model.dart';
import 'package:marvel_comics_info/comic_info_provider.dart';
import 'package:marvel_comics_info/widgets/comic_card.dart';

class ComicsGrid extends StatefulWidget {
  ComicsGrid({Key key}) : super(key: key);

  @override
  _ComicsGridState createState() => _ComicsGridState();
}

class _ComicsGridState extends State<ComicsGrid> {

  List<Result> comicsList = List();
  int offset = 40;
  bool isLoading = false;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    ComicsInfoProvider().getComics(40).then((comicsFromServer) {
      setState(() {
        comicsList = comicsFromServer;
      });
    });
    _scrollController = new ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    if (comicsList.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF9D152C)),
        ),
      );
    } else {
      return GridView.builder(
        padding: EdgeInsets.all(10),
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.45,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          crossAxisCount: 2
        ),
        itemCount: comicsList.length,
        itemBuilder: (context, index) {
          return ComicCard(
            comics: comicsList,
            index: index,
          );
        },
      );
    }
  }

  _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
      showInSnackBar("Wait a minute, loading more Comics ...");
      setState(() {
        isLoading = true;
        if (isLoading) {
          offset = offset + 20;
          ComicsInfoProvider().getComics(offset).then((comicsFromServer) {
            comicsList.addAll(comicsFromServer);
          });
        }
      });
    }
  }

  void showInSnackBar(String messaage) {
    Scaffold.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: new Text(messaage),
      backgroundColor: Color(0xFFF9D152C),
      width: 350.0,
      duration: Duration(seconds: 4, milliseconds: 500),
    ));
  }



}