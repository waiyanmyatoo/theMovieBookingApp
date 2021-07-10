import 'package:flutter/material.dart';
import '../data/vos/movie_seat_vo.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class MovieSeatItemView extends StatelessWidget {

  final MovieSeatVO mMovieSeatVO;

  const MovieSeatItemView({Key key, this.mMovieSeatVO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
      decoration: BoxDecoration(
        color: _getSeatColor(mMovieSeatVO),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(MARGIN_MEDIUM),
          topRight: Radius.circular(MARGIN_MEDIUM),
        )
        
      ),
      child: Center(
        child: Text(mMovieSeatVO.title),
      ),
    );
  }


  Color _getSeatColor(MovieSeatVO movieSeat){
    if(movieSeat.isMovieSeatTaken()){
      return MOVIE_SEAT_TAKEN_COLOR;
    }
    else if(movieSeat.isMovieSeatAvailable()){
      return MOVIE_SEAT_AVAILABLE_COLOR;
    }
    else{
      return Colors.white;
    }
  }
}