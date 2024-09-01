part of 'phone_bloc.dart';

@immutable

class PhoneEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class PhoneSendNumberEvent extends PhoneEvent {

  BuildContext context;
  String phoneNumber;

  PhoneSendNumberEvent({
    required this.phoneNumber,
    required this.context,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [phoneNumber, context];


}

class VerificationOTPEvent extends PhoneEvent {
  String otpSMS;
  BuildContext context;


  VerificationOTPEvent({
    required this.otpSMS,required this.context,
  });



  @override
  // TODO: implement props
  List<Object?> get props => [otpSMS];
}

