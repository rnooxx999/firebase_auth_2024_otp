
import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/firebase_auth_logic.dart';
import '../../../../domin/shared/components/constants.dart';
import '../../../../domin/shared/network/local/cache_helper.dart';
import 'user_state.dart';

class UserViewModel extends Cubit< UserPageState> {
  ServiceAuth? repo;

  UserViewModel() : super(UserPageINIL()) ;

    Future userCurrentStatus() async {
      repo?.getUser();

      /* *********  comment this if you Not need Test Sign in Any More   **************** */
      await CacheHelper.SaveData(key: 'uID',value: "");

      uID = CacheHelper.GetData(key: 'uID');
    //  bool? isDark = CacheHelper.GetData(key: 'isDark');
      print("uID : $uID");
      print(uID);
        if (uID == null || uID == '') {

          emit(ToAuthPage());

        } else {
          emit(ToHomePage());
        }
    }

}