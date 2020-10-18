import 'package:flutter/material.dart';

class RateButton extends StatefulWidget {
  RateButton({Key key}) : super(key: key);

  @override
  _RateButtonState createState() => _RateButtonState();
}

class _RateButtonState extends State<RateButton> {

  Color buttonLikeColor = Colors.grey;
  Color buttonDisLikeColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => _getLikes(),
            child: Container(
              height: 40,
              width:  40,
              child: Icon(Icons.thumb_up_alt,
              color: Colors.white,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF1B5E20)
              ),
              foregroundDecoration: BoxDecoration(
                color: buttonLikeColor,
                backgroundBlendMode: BlendMode.saturation
              ),
            ),
          ),
          SizedBox(width: 10.0,),
          GestureDetector(
            onTap: () => _getDisLikes(),
            child: Container(child: Icon(Icons.thumb_down_alt,color: Colors.white,),
              width:  40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF621216)
              ),
              foregroundDecoration: BoxDecoration(
                color: buttonDisLikeColor,
                backgroundBlendMode: BlendMode.saturation
              ),
            ),
          )
        ],
      ),
    );
  }

  _getLikes() {
    if(buttonDisLikeColor == Colors.transparent) {
      setState(() {
        buttonDisLikeColor = Colors.grey;
        buttonLikeColor = Colors.transparent;
      });
    } else {
      setState(() {
        buttonLikeColor = Colors.transparent;
      });
    }
  }

  _getDisLikes() {
    if(buttonLikeColor == Colors.transparent) {
      setState(() {
        buttonLikeColor = Colors.grey;
        buttonDisLikeColor = Colors.transparent;
      });
    } else {
      setState(() {
        buttonDisLikeColor = Colors.transparent;
      });
    }
  }

}