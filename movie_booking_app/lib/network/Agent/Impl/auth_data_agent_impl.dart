import '../../../data/models/base_model.dart';
import 'package:movie_booking_app/network/Agent/auth_data_agent.dart';
import 'package:movie_booking_app/network/Response/user_response.dart';

class AuthDataAgentImpl extends BaseModel implements AuthDataAgent {
  static final AuthDataAgentImpl _singleton = AuthDataAgentImpl._internal();

  factory AuthDataAgentImpl() {
    return _singleton;
  }

  AuthDataAgentImpl._internal();

  @override
  Future<UserResponse> loginWithEmail(String email, String password) {
    print('login with email');
    return theMovieBookingApi
        .loginWithEmail(email, password)
        .then((userRes) async {
      return Future.value(userRes);
    });
  }

  @override
  Future<UserResponse> register(String name, String email, String phone,
      String password, String googleAccessToken, String facebookAccessToken) {
    return theMovieBookingApi
        .register(name, email, phone, password)
        .then((userRes) async {
      return Future.value(userRes);
    });
  }

  @override
  Future<UserResponse> loginWithFacebook(String accessToken) {
    return theMovieBookingApi
        .loginWithFacebook(accessToken)
        .then((value) async {
      return Future.value(value);
    });
  }

  @override
  Future<UserResponse> loginWithGoogle(String accessToken) {
    return theMovieBookingApi.loginWithGoogle(accessToken).then((value) async {
      return Future.value(value);
    });
  }

  @override
  Future logout(String token) {
    return theMovieBookingApi.logout(token).then((value) async {
      return Future.value(value);
    });
  }
}
