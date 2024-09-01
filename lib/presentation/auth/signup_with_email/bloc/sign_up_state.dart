part of 'sign_up_bloc.dart';

@immutable


 class SignUpState  extends Equatable{
  // enum from enum file
  StatusGeneralEnum? status;
   final Exception? exception;

   SignUpState({
     this.exception,
     this.status = StatusGeneralEnum.initial,
   });

   @override
   List<Object?> get props => [status,exception];

   SignUpState copyWith({
     Exception? exception,
     StatusGeneralEnum? status,

   }) {
     return SignUpState(
       status:status ?? this.status,
       exception: exception ?? this.exception,
     );
   }

 }
class SignUpSuccusfulState  extends SignUpState {

  String uId;

  SignUpSuccusfulState(this.uId);

}