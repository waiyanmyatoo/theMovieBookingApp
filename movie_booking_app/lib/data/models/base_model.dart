import 'package:dio/dio.dart';
import 'package:movie_booking_app/network/the_movie_booking_api.dart';

abstract class BaseModel {
  TheMovieBookingApi theMovieBookingApi;

  BaseModel() {
    final dio = Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status < 300;
        },
      ),
    );

    // dio.interceptors.add(GlobalAlice.alice.getDioInterceptor());
    theMovieBookingApi = TheMovieBookingApi(dio);
  }
}
