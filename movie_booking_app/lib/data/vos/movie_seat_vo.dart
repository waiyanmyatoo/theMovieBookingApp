
import 'package:movie_booking_app/resources/strings.dart';

class MovieSeatVO{

  String title;
  String type;

  MovieSeatVO(this.title,this.type);

  bool isMovieSeatAvailable(){
    return type == SEAT_TYPE_AVAILABLE;
  }

  bool isMovieSeatRowTitle(){
    return type == SEAT_TYPE_TEXT;
  }

  bool isMovieSeatTaken(){
    return type == SEAT_TYPE_TAKEN;
  }

}