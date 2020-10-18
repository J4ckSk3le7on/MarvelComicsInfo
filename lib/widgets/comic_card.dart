import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:marvel_comics_info/comic_info_model.dart';
import 'package:marvel_comics_info/widgets/rate_button.dart';

class ComicCard extends StatelessWidget {
  final List<Result> comics;
  final int index;

  ComicCard({@required this.comics, @required this.index});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Color(0xFFF202020),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                comicThumbnail(),
                SizedBox(height: 06,),
                comicName(),
                comicDate(),
              ],
            ),
            Positioned(
              right: 1,
              bottom: 100,
              child: RateButton()
            )
          ],
        ),
      ),
    );
  }

  Widget comicThumbnail() {
    return CachedNetworkImage(
      imageUrl: comics[index].thumbnail.path + "/portrait_fantastic.jpg",
      placeholder: (context, url) => Container(height: 245, width: 168, child: Center(child: new CircularProgressIndicator())),
      errorWidget: (context, url, error) => new Icon(Icons.error),
    );
  }


  Widget comicName() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 40,
        child: Text("Tittle: " + comics[index].title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }

  Widget comicDate() {
    String dateDataComic = comics[index].dates[0].date;
    final parsedDate = DateTime.parse(dateDataComic);
    final dateOfRelease = DateFormat.yMd().format(parsedDate);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 40,
        child: Text("Release Date: " + dateOfRelease,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}