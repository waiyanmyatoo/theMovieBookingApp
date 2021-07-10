import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class BackButtonView extends StatelessWidget {

  final IconData icon;
  final Function onTapBack;
  final Color btnColor;

  const BackButtonView({
    Key key,
    this.onTapBack, this.btnColor, this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTapBack();
      },
      child: Icon(
        icon ?? Icons.chevron_left,
        color: btnColor ?? Colors.white,
        size: MARGIN_XLARGE,
      ),
    );
  }
}