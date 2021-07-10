
import 'package:movie_booking_app/data/vos/user_vo.dart';

abstract class AuthModel{

  /// for registration
  Future<UserVO> register(String name, String email, String phone, String password, String googleAccessToken, String facebookAccessToken);

  /// login with email
  Future<UserVO> loginWithEmail(String email, String password);

  /// login with facebook
  Future<UserVO> loginWithFacebook(String accessToken);

  /// login with google
  Future<UserVO> loginWithGoogle(String accessToken);

  /// logout
  Future logout();
}