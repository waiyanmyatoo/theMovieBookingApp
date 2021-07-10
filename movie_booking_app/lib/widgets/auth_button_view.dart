import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class AuthButtonView extends StatelessWidget {
  final String icon;
  final String btnText;

  const AuthButtonView({
    Key key,
    this.icon,
    this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DOUBLE_10),
        side: BorderSide(
          color: Colors.grey[400],
        ),
      ),
      minWidth: double.infinity,
      height: BUTTON_HEIGHT + 5,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              width: DOUBLE_24,
              height: BUTTON_HEIGHT + 5,
              child: Image.asset(
                icon,
                width: DOUBLE_24,
                height: DOUBLE_24,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: MARGIN_MEDIUM_3,
            ),
            Container(
              // color: Colors.red,
              width: HEIGHT_200,
              child: Text(
                btnText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w500,
                  // letterSpacing: BORDER_WIDTH,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}