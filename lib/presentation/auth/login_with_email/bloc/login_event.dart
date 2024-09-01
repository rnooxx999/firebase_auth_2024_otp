part of 'login_bloc.dart';

@immutable
 class LogInEvent extends Equatable {
 LogInEvent({
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
