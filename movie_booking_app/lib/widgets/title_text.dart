import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: TEXT_REGULAR_3X,

        fontWeight: FontWeight.w800,
        letterSpacing: LETTER_SPC2,
      ),
    );
  }
}
