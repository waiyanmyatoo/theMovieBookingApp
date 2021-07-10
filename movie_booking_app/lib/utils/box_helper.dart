import 'package:hive/hive.dart';
import 'package:movie_booking_app/data/vos/user_vo.dart';
import 'package:movie_booking_app/persistence/constants/hive_constant.dart';

class BoxHelper {
  BoxHelper() {
    _registerBox();
  }

  _registerBox() {
    Hive..registerAdapter(UserVOAdapter());
  }

  Future openBoxed() async {
    await Future.wait([
      Hive.openBox<UserVO>(BOX_NAME_USER_VO),
    ]);
  }
}
