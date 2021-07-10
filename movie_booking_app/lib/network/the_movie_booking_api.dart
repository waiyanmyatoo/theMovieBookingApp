import 'package:dio/dio.dart';
import 'package:movie_booking_app/network/Response/user_response.dart';
import 'package:movie_booking_app/network/api_constant.dart';
import 'package:retrofit/retrofit.dart';

part 'the_movie_booking_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class TheMovieBookingApi {
  factory TheMovieBookingApi(Dio dio, {String baseUrl}) = _TheMovieBookingApi;

  @POST(REGISTER)
  @FormUrlEncoded()
  Future<UserResponse> register(
    @Field(NAME) String name,
    @Field(EMAIL) String email,
    @Field(PHONE) String phone,
    @Field(PASSWORD) String password, [
    @Field(GOOGLE_ACCESS_TOKEN) String googleAccessToken,
    @Field(FACEBOOK_ACCESS_TOKEN) String facebookAccessToken,
  ]);

  @POST(LOGIN_WITH_EMAIL)
  @FormUrlEncoded()
  Future<UserResponse> loginWithEmail(
    @Field(EMAIL) String email,
    @Field(PASSWORD) String password,
  );

  @POST(LOGIN_WITH_FACEBOOK)
  @FormUrlEncoded()
  Future<UserResponse> loginWithFacebook(
    @Field(ACCESS_TOKEN) String accessToken,
  );

  @POST(LOGIN_WITH_FACEBOOK)
  @FormUrlEncoded()
  Future<UserResponse> loginWithGoogle(
    @Field(ACCESS_TOKEN) String accessToken,
  );

  @POST(LOGOUT)
  Future<UserResponse> logout(
    @Header(AUTHORIZATION_KEY) String token,
  );
}
