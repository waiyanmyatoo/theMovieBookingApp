import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class ReuseButtonView extends StatelessWidget {
  final Color borderColor;
  final Color btnColor;
  final Function fn;
  final String btnText;

  const ReuseButtonView({
    Key key,
    this.fn,
    this.borderColor,
    this.btnColor,
    this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DOUBLE_10),
        side: BorderSide(
          color: borderColor,
        ),
      ),
      minWidth: double.infinity,
      height: BUTTON_HEIGHT + 5,
      color: btnColor,
      onPressed: () {
        fn();
      },
      child: Text(
        btnText,
        style: TextStyle(
          color: Colors.white,
          fontSize: TEXT_REGULAR_2X,
        ),
      ),
    );
  }
}