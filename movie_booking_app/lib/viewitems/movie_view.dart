import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class MovieView extends StatelessWidget {
  final Function onTapMovie;

  const MovieView({Key key, this.onTapMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: MOVIE_LIST_ITEM_WIDTH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              onTapMovie();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: ASPECT_RATIO,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(DOUBLE_15),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGFrQd3ez_nmjQhnH7F3vyJUbDogMKNqoU6nCd-7rJ3ZzgprZo",
                        height: MOVIE_IMAGE_HEIGHT,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  Text(
                    "Detective Pikachu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  Text(
                    "Mystery/Adventure.1h 45m",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: TEXT_SAMLL,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
