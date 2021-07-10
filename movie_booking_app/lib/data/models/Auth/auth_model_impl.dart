import 'package:movie_booking_app/data/models/Auth/auth_model.dart';
import 'package:movie_booking_app/data/vos/user_vo.dart';
import 'package:movie_booking_app/network/Agent/Impl/auth_data_agent_impl.dart';
import 'package:movie_booking_app/network/api_constant.dart';
import 'package:movie_booking_app/persistence/daos/user_dao.dart';
import 'package:movie_booking_app/persistence/shared_preference_utils.dart';

class AuthModelImpl extends AuthModel {
  AuthDataAgentImpl authDataAgentImpl = AuthDataAgentImpl();
  UserDAO userDAO = UserDAO();

  static final AuthModelImpl _singleton = AuthModelImpl._internal();

  factory AuthModelImpl() {
    return _singleton;
  }

  AuthModelImpl._internal();

  @override
  Future<UserVO> loginWithEmail(String email, String password) {
    print('start to login');
    return authDataAgentImpl
        .loginWithEmail(email, password)
        .asStream()
        .map((event) => event)
        .first
        .then((value) async {
      await SharedPreferenceUtils().saveAccessToken(value.token);
      await userDAO.saveUserInfo(value.data);
      return Future.value(value.data);
    });
  }

  @override
  Future<UserVO> register(String name, String email, String phone,
      String password, String googleAccessToken, String facebookAccessToken) {
    return authDataAgentImpl
        .register(name, email, phone, password, googleAccessToken,
            facebookAccessToken)
        .asStream()
        .map((event) => event)
        .first
        .then((value) async {
      await SharedPreferenceUtils().saveAccessToken(value.token);
      await userDAO.saveUserInfo(value.data);
      return Future.value(value.data);
    });
  }

  @override
  Future<UserVO> loginWithFacebook(String accessToken) {
    return authDataAgentImpl
        .loginWithFacebook(accessToken)
        .asStream()
        .map((event) => event)
        .first
        .then((value) async {
      await SharedPreferenceUtils().saveAccessToken(value.token);
      await userDAO.saveUserInfo(value.data);
      return Future.value(value.data);
    });
  }

  @override
  Future<UserVO> loginWithGoogle(String accessToken) {
    return authDataAgentImpl
        .loginWithGoogle(accessToken)
        .asStream()
        .map((event) => event)
        .first
        .then((value) async {
      await SharedPreferenceUtils().saveAccessToken(value.token);
      await userDAO.saveUserInfo(value.data);
      return Future.value(value.data);
    });
  }

  @override
  Future logout() async {
    String token = await SharedPreferenceUtils().getAccessToken();
    return authDataAgentImpl
        .logout(PREFIX_BEARER_TOKEN + token)
        .then((value) async {
      await SharedPreferenceUtils().clearAccessToken();
      await userDAO.clearUserInfo();
      return Future.value(value);
    });
  }
}
