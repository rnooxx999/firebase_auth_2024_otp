part of 'login_bloc.dart';

@immutable


 class LogInState  extends Equatable{
  // enum from enum file
  StatusGeneralEnum? status;
   final Exception? exception;

   LogInState({
     this.exception,
     this.status = StatusGeneralEnum.initial,
   });

   @override
   List<Object?> get props => [status,exception];

   LogInState copyWith({
     Exception? exception,
     StatusGeneralEnum? status,

   }) {
     return LogInState(
       status:status ?? this.status,
       exception: exception ?? this.exception,
     );
   }

 }



class LogInSuccusfulState  extends LogInState {

  String uId;

  LogInSuccusfulState(this.uId);

}
