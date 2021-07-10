

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:movie_booking_app/data/vos/user_vo.dart';
import 'package:movie_booking_app/persistence/constants/hive_constant.dart';
import 'package:flinq/flinq.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserDAO{
  static final UserDAO _singleton = UserDAO._internal();

  factory UserDAO(){
    return _singleton;
  }

  UserDAO._internal();

  Future saveUserInfo(UserVO userVO)async{
    await getUserBox().put('USER_KEY', userVO);
  }

  UserVO getUserInfo(){
    return getUserBox().values.firstOrNull;
  }

  ValueListenable<Box<UserVO>> listenToUserVO(){
    return getUserBox().listenable();
  }

  Future<void> clearUserInfo(){
    return getUserBox().clear();
  }

  Box<UserVO> getUserBox() {
    return Hive.box<UserVO>(BOX_NAME_USER_VO);
  }

}