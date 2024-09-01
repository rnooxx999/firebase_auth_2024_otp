part of 'sign_up_bloc.dart';

@immutable
 class SignUpEvent extends Equatable {
 SignUpEvent({
    this.username,
   this.context,
    this.email,
    this.password,
 });

   String? username;
  String? password;
  String? email;
 BuildContext? context;

  @override
  List<Object> get props => [username! ,email! , username! ,context!];
}
