
//login & register
import 'package:equatable/equatable.dart';

class UserPageState extends Equatable {
  bool? heightIfItsProfile ;
  UserPageState({this.heightIfItsProfile = true});

  @override
  // TODO: implement props
  List<Object?> get props => [heightIfItsProfile];

  UserPageState copyWith({
    bool? heightIfItsProfile,

  }) {
    return UserPageState(
      heightIfItsProfile: heightIfItsProfile ?? this.heightIfItsProfile,
    );
  }
}

class UserPageINIL extends UserPageState {
}

class ToAuthPage extends UserPageState {
}
class ToHomePage extends UserPageState {
}
class UserGoToProfile extends UserPageState {
  String? name ;
  bool? firstTime ;

  UserGoToProfile({this.name , this.firstTime = false });
}

//profile:
class UserPageDataFromToken extends UserPageState {
  String token;
  UserPageDataFromToken(this.token);
}

class UserPageError extends UserPageState {
  String? error;
  UserPageError({error});
}

