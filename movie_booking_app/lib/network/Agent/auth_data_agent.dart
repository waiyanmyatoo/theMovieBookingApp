import 'package:movie_booking_app/network/Response/user_response.dart';

abstract class AuthDataAgent {
  /// for registration
  Future<UserResponse> register(String name, String email, String phone,
      String password, String googleAccessToken, String facebookAccessToken);

  /// login with email
  Future<UserResponse> loginWithEmail(String email, String password);

  /// login with facebook
  Future<UserResponse> loginWithFacebook(String accessToken);

  /// login with google
  Future<UserResponse> loginWithGoogle(String accessToken);

  /// logout
  Future logout(String token);
}
