import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_booking_app/resources/dimens.dart';


class RatingView extends StatelessWidget {
  const RatingView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 5.0,
      itemBuilder: (BuildContext context, int index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemSize: MARGIN_MEDIUM_3,
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}