part of 'phone_bloc.dart';

@immutable
 class PhoneState extends Equatable {

  @override
  List<Object?> get props => throw UnimplementedError();
}

class PhoneGoToVerivState extends PhoneState {

  PhoneGoToVerivState();
}
class PhoneNumberState extends PhoneState {
  String? messege;
  StatusGeneralEnum? status;
   Exception? exception;

  PhoneNumberState({
    this.exception, this.messege,
    this.status = StatusGeneralEnum.initial,
  });

  @override
  List<Object?> get props => [status,exception ,messege];

  PhoneNumberState copyWith({
    Exception? exception,
    StatusGeneralEnum? status,
    String? messege

  }) {
    return PhoneNumberState(
      status:status ?? this.status,
      exception: exception ?? this.exception,
      messege: messege ?? this.messege,

    );
  }


}
class OtpSuccessState extends PhoneState {
  String? uid;
  OtpSuccessState({this.uid});
}
class OtpState extends PhoneState {
  StatusGeneralEnum? status;
  final Exception? exception;

  OtpState({
    this.exception,
    this.status = StatusGeneralEnum.initial,
  });

  @override
  List<Object?> get props => [status,exception];

  OtpState copyWith({
    Exception? exception,
    StatusGeneralEnum? status,

  }) {
    return OtpState(
      status:status ?? this.status,
      exception: exception ?? this.exception,
    );
  }

}
